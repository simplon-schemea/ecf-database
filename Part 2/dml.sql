-- PART 2: DML

DO
$$
    DECLARE
        john   uuid;
        alex   uuid;
        newbie uuid;
    BEGIN
        SELECT id FROM developer WHERE firstname = 'John' AND lastname = 'DOE' INTO john;
        SELECT id FROM developer WHERE firstname = 'Alex' AND lastname = 'ROSS' INTO alex;
        SELECT id FROM developer WHERE firstname = 'New' AND lastname = 'BIE' INTO newbie;

        INSERT INTO tech_lead(tech_lead_id, developer_id) VALUES (john, alex);
        INSERT INTO tech_lead(tech_lead_id, developer_id) VALUES (john, newbie);
    END;
$$;