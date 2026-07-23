CREATE TABLE role (
    id UUID NOT NULL,
    name VARCHAR(30) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE permission (
    id UUID NOT NULL,
    module VARCHAR(20) NOT NULL,
    action VARCHAR(10) NOT NULL CHECK (action IN ('CREATE', 'READ', 'UPDATE', 'DELETE')),
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT UQ_module_action 
        UNIQUE (module, action)
);

CREATE TABLE role_permission (
    role_id UUID NOT NULL,
    permission_id UUID NOT NULL,
    PRIMARY KEY (role_id, permission_id),
    CONSTRAINT FK_role_TO_role_permission 
        FOREIGN KEY (role_id) REFERENCES role (id),
    CONSTRAINT FK_permission_TO_role_permission 
        FOREIGN KEY (permission_id) REFERENCES permission (id),
    CONSTRAINT UQ_role_permission
        UNIQUE (role_id, permission_id)
);

CREATE TABLE user_account (
    id UUID NOT NULL,
    role_id UUID NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(75) NOT NULL,
    status VARCHAR(10) NOT NULL CHECK (status IN ('ACTIVE', 'SUSPENDED', 'INACTIVE')),
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_role_TO_user_account 
        FOREIGN KEY (role_id) REFERENCES role (id)
);

CREATE TABLE user_profile (
    id UUID NOT NULL,
    user_account_id UUID NOT NULL UNIQUE,
    cui VARCHAR(13) NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    avatar VARCHAR(45) UNIQUE,
    phone_number VARCHAR(8) UNIQUE,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_user_account_TO_user_profile 
        FOREIGN KEY (user_account_id) REFERENCES user_account (id)
);

CREATE TABLE dms (
    id UUID NOT NULL,
    name VARCHAR(50) NOT NULL UNIQUE,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE riss (
    id UUID NOT NULL,
    dms_id UUID NOT NULL,
    name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_dms_TO_riss 
        FOREIGN KEY (dms_id) REFERENCES dms (id),
    CONSTRAINT UQ_dms_name
        UNIQUE (dms_id, name)
);

CREATE TABLE community (
    id UUID NOT NULL,
    riss_id UUID NOT NULL,
    name VARCHAR(50) NOT NULL,
    territory SMALLINT NOT NULL,
    sector CHAR NOT NULL,
    population BIGINT NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_riss_TO_community 
        FOREIGN KEY (riss_id) REFERENCES riss (id),
    CONSTRAINT UQ_riss_name_territory_sector
        UNIQUE (riss_id, name, territory, sector)
);

CREATE TABLE facility_type (
    id UUID NOT NULL,
    code VARCHAR(10) NOT NULL UNIQUE,
    name VARCHAR(25) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE plan_type (
    id UUID NOT NULL,
    code VARCHAR(10) NOT NULL UNIQUE,
    name VARCHAR(35) NOT NULL,
    description TEXT,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE property (
    id UUID NOT NULL,
    total_land_area NUMERIC(10, 2) NOT NULL,
    building_footprint NUMERIC(10, 2) NOT NULL,
    available_expansion_area NUMERIC(10, 2) NOT NULL,
    tenure VARCHAR(25) NOT NULL CHECK (tenure IN ('OWN', 'MUNICIPAL', 'COMMUNITY', 'PRIVATE')),
    status VARCHAR(15) NOT NULL CHECK (status IN ('REGISTERED', 'DONATED', 'ASSIGNED', 'ON-LOAN', 'LEASED')),
    notes TEXT,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE building_element (
    id UUID NOT NULL,
    name VARCHAR(50) NOT NULL UNIQUE,
    has_building_material BOOLEAN NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE building_material (
    id UUID NOT NULL,
    code VARCHAR(10) NOT NULL UNIQUE,
    name VARCHAR(35) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE property_component (
    id UUID NOT NULL,
    property_id UUID NOT NULL,
    building_element_id UUID NOT NULL,
    building_material_id UUID,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_property_TO_property_component 
        FOREIGN KEY (property_id) REFERENCES property (id),
    CONSTRAINT FK_building_element_TO_property_component 
        FOREIGN KEY (building_element_id) REFERENCES building_element (id),
    CONSTRAINT FK_building_material_TO_property_component 
        FOREIGN KEY (building_material_id) REFERENCES building_material (id),
    CONSTRAINT UQ_property_building_element
        UNIQUE (property_id, building_element_id)
);

CREATE TABLE health_facility (
    id UUID NOT NULL,
    community_id UUID NOT NULL,
    property_id UUID NOT NULL UNIQUE,
    facility_type_id UUID NOT NULL,
    location GEOGRAPHY(point, 4326),
    is_headquarters BOOLEAN NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('ACTIVE', 'UNDER-MAINTENANCE', 'INACTIVE')),
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_community_TO_health_facility 
        FOREIGN KEY (community_id) REFERENCES community (id),
    CONSTRAINT FK_property_TO_health_facility 
        FOREIGN KEY (property_id) REFERENCES property (id),
    CONSTRAINT FK_facility_type_TO_health_facility 
        FOREIGN KEY (facility_type_id) REFERENCES facility_type (id)
);

CREATE TABLE facility_picture (
    id UUID NOT NULL,
    health_facility_id UUID NOT NULL,
    file_name VARCHAR(45) NOT NULL UNIQUE,
    PRIMARY KEY (id),
    CONSTRAINT FK_health_facility_TO_facility_picture 
        FOREIGN KEY (health_facility_id) REFERENCES health_facility (id)
);

CREATE TABLE facility_plan (
    id UUID NOT NULL,
    plan_type_id UUID NOT NULL,
    health_facility_id UUID NOT NULL,
    file_name VARCHAR(45) NOT NULL,
    version SMALLINT,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_plan_type_TO_facility_plan 
        FOREIGN KEY (plan_type_id) REFERENCES plan_type (id),
    CONSTRAINT FK_health_facility_TO_facility_plan 
        FOREIGN KEY (health_facility_id) REFERENCES health_facility (id),
    CONSTRAINT UQ_plan_type_health_facility_version
        UNIQUE (plan_type_id, health_facility_id, version)
);

CREATE TABLE request (
    id UUID NOT NULL,
    health_facility_id UUID NOT NULL,
    requester_name VARCHAR(100) NOT NULL,
    requester_email VARCHAR(100) NOT NULL,
    requester_phone_number VARCHAR(8) NOT NULL,
    requester_official_position VARCHAR(50) NOT NULL,
    requester_functional_position VARCHAR(50) NOT NULL,
    rooms_to_expand SMALLINT NOT NULL,
    aproximate_cost NUMERIC(10, 2) NOT NULL,
    notes TEXT,
    status VARCHAR(15) NOT NULL CHECK (status IN ('TO-DO', 'IN-PROGRESS', 'DONE')),
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_health_facility_TO_request 
        FOREIGN KEY (health_facility_id) REFERENCES health_facility (id)
);

CREATE TABLE request_comment (
    id UUID NOT NULL,
    user_account_id UUID NOT NULL,
    request_id UUID NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_user_account_TO_request_comment 
        FOREIGN KEY (user_account_id) REFERENCES user_account (id),
    CONSTRAINT FK_request_TO_request_comment 
        FOREIGN KEY (request_id) REFERENCES request (id)
);

CREATE TABLE request_log (
    id UUID NOT NULL,
    user_account_id UUID NOT NULL,
    request_id UUID NOT NULL,
    description TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_user_account_TO_request_log 
        FOREIGN KEY (user_account_id) REFERENCES user_account (id),
    CONSTRAINT FK_request_TO_request_log 
        FOREIGN KEY (request_id) REFERENCES request (id)
);

CREATE TABLE request_detail (
    id UUID NOT NULL,
    request_id UUID NOT NULL,
    building_element_id UUID NOT NULL,
    building_material_id UUID,
    required_action VARCHAR(20) NOT NULL CHECK (required_action IN ('MAINTENANCE', 'REPLACEMENT')),
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_request_TO_request_detail 
        FOREIGN KEY (request_id) REFERENCES request (id),
    CONSTRAINT FK_building_element_TO_request_detail 
        FOREIGN KEY (building_element_id) REFERENCES building_element (id),
    CONSTRAINT FK_building_material_TO_request_detail 
        FOREIGN KEY (building_material_id) REFERENCES building_material (id)
);

CREATE TABLE request_detail_evidence (
    id UUID NOT NULL,
    request_detail_id UUID NOT NULL,
    file_name VARCHAR(45) NOT NULL UNIQUE,
    PRIMARY KEY (id),
    CONSTRAINT FK_request_detail_TO_request_detail_evidence 
        FOREIGN KEY (request_detail_id) REFERENCES request_detail (id)
);