-- PART 1: DDL

DROP SCHEMA IF EXISTS employees CASCADE;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;

CREATE SCHEMA employees;

SET SEARCH_PATH = employees, public;
ALTER USER CURRENT_USER SET SEARCH_PATH = employees, public;

CREATE TABLE developers
(
    id                 uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    firstname          varchar(100) NOT NULL,
    lastname           varchar(100) NOT NULL,
    birthday           date         NOT NULL,
    join_date          date         NOT NULL,
    matricule          varchar(40)  NOT NULL,
    enterprise_id      uuid         NOT NULL,
    main_technology_id uuid         NOT NULL,
    UNIQUE (firstname, lastname),
    UNIQUE (matricule)
);

CREATE SEQUENCE technology_code_sequence;

CREATE TABLE technologies
(
    id      uuid PRIMARY KEY     DEFAULT uuid_generate_v4(),
    code    varchar(15) NOT NULL DEFAULT concat('CD_', lpad(nextval('technology_code_sequence')::text, 3, '0')),
    name_en varchar(20) NOT NULL UNIQUE,
    name_fr varchar(20) NOT NULL UNIQUE,
    UNIQUE (code)
);

ALTER TABLE developers
    ADD FOREIGN KEY (main_technology_id) REFERENCES technologies (id);

CREATE TABLE developer_technology
(
    developer_id  uuid,
    technology_id uuid,
    PRIMARY KEY (developer_id, technology_id),
    FOREIGN KEY (developer_id) REFERENCES developers (id),
    FOREIGN KEY (technology_id) REFERENCES technologies (id)
);

CREATE TABLE enterprises
(
    id   uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    name varchar(10) UNIQUE NOT NULL
);

ALTER TABLE developers
    ADD FOREIGN KEY (enterprise_id) REFERENCES enterprises (id);


CREATE FUNCTION generate_matricule() RETURNS text
AS
$$
DECLARE
    id text DEFAULT uuid_generate_v4();
BEGIN
    RETURN concat('dev-', replace(id, '-', ''));
END;
$$ LANGUAGE plpgsql;
