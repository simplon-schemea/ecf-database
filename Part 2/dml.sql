-- PART 2: DML

DO
$$
    DECLARE
        john   uuid;
    BEGIN
        SELECT id FROM developers WHERE firstname = 'John' AND lastname = 'DOE' INTO john;

        UPDATE developers SET tech_lead_id = john WHERE firstname = 'Alex' AND lastname = 'ROSS';
        UPDATE developers SET tech_lead_id = john WHERE firstname = 'New' AND lastname = 'BIE';
    END;
$$;