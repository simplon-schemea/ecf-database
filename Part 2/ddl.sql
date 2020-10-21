-- PART 2: DDL

ALTER TABLE developers
    ADD tech_lead_id uuid REFERENCES developers (id);
