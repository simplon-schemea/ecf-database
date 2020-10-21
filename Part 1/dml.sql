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
        INSERT INTO technologies(code, name_fr, name_en) VALUES ('CD_CPP', 'C++', 'C++') RETURNING id INTO cpp;
        INSERT INTO technologies(code, name_fr, name_en) VALUES ('CD_ANGULAR', 'Angular', 'Angular') RETURNING id INTO angular;
        INSERT INTO technologies(code, name_fr, name_en) VALUES ('CD_REACT', 'React', 'React') RETURNING id INTO react;
        INSERT INTO technologies(code, name_fr, name_en) VALUES ('CD_JAVA', 'Java', 'Java') RETURNING id INTO java;
        INSERT INTO technologies(code, name_fr, name_en) VALUES ('CD_CSHARP', 'C#', 'C#') RETURNING id INTO csharp;


        -- DEV: JOHN DOE
        INSERT INTO developer(firstname, lastname, birthday, join_date, matricule, enterprise_id, main_technology_id)
            VALUES ('John', 'DOE', '1995-01-01', '2010-01-01', generate_matricule(), enterprise, cpp) RETURNING id INTO dev;

        INSERT INTO developer_technology(developer_id, technology_id) VALUES (dev, react);
        INSERT INTO developer_technology(developer_id, technology_id) VALUES (dev, angular);


        -- DEV: ALEX ROSS
        INSERT INTO developer(firstname, lastname, birthday, join_date, matricule, enterprise_id, main_technology_id)
            VALUES ('Alex', 'ROSS', '1995-01-01', '2010-01-01', generate_matricule(), enterprise, cpp) RETURNING id INTO dev;

        INSERT INTO developer_technology(developer_id, technology_id) VALUES (dev, java);
        INSERT INTO developer_technology(developer_id, technology_id) VALUES (dev, react);
        INSERT INTO developer_technology(developer_id, technology_id) VALUES (dev, csharp);


        -- DEV: NEW BIE
        INSERT INTO developer(firstname, lastname, birthday, join_date, matricule, enterprise_id, main_technology_id)
            VALUES ('New', 'BIE', '1995-01-01', '2010-01-01', generate_matricule(), enterprise, cpp);

    END;
$$;