-- PART 1: DML


DO
$$
    DECLARE
        cpp        uuid;
        angular    uuid;
        react      uuid;
        java       uuid;
        csharp     uuid;
        dev        uuid;
        enterprise uuid;

    BEGIN
        INSERT INTO enterprises(name) VALUES ('Lorem') RETURNING id INTO enterprise;

        -- TECHNOLOGIES
        INSERT INTO technologies(name_en, name_fr) VALUES ('C++', 'C++') RETURNING id INTO cpp;
        INSERT INTO technologies(name_en, name_fr) VALUES ('Angular', 'Angular') RETURNING id INTO angular;
        INSERT INTO technologies(name_en, name_fr) VALUES ('React', 'React') RETURNING id INTO react;
        INSERT INTO technologies(name_en, name_fr) VALUES ('Java', 'Java') RETURNING id INTO java;
        INSERT INTO technologies(name_en, name_fr) VALUES ('C#', 'C#') RETURNING id INTO csharp;


        -- DEV: JOHN DOE
        INSERT INTO developers(firstname, lastname, birthday, join_date, matricule, enterprise_id, main_technology_id)
            VALUES ('John', 'DOE', '1995-01-01', '2010-01-01', generate_matricule(), enterprise, cpp) RETURNING id INTO dev;

        INSERT INTO developer_technology(developer_id, technology_id) VALUES (dev, react);
        INSERT INTO developer_technology(developer_id, technology_id) VALUES (dev, angular);


        -- DEV: ALEX ROSS
        INSERT INTO developers(firstname, lastname, birthday, join_date, matricule, enterprise_id, main_technology_id)
            VALUES ('Alex', 'ROSS', '1995-01-01', '2010-01-01', generate_matricule(), enterprise, cpp) RETURNING id INTO dev;

        INSERT INTO developer_technology(developer_id, technology_id) VALUES (dev, java);
        INSERT INTO developer_technology(developer_id, technology_id) VALUES (dev, react);
        INSERT INTO developer_technology(developer_id, technology_id) VALUES (dev, csharp);


        -- DEV: NEW BIE
        INSERT INTO developers(firstname, lastname, birthday, join_date, matricule, enterprise_id, main_technology_id)
            VALUES ('New', 'BIE', '1995-01-01', '2010-01-01', generate_matricule(), enterprise, cpp);

    END;
$$;
