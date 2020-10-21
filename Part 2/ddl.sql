-- PART 2: DDL

CREATE TABLE tech_lead
(
    tech_lead_id uuid,
    developer_id uuid UNIQUE,
    PRIMARY KEY (tech_lead_id, developer_id),
    FOREIGN KEY (tech_lead_id) REFERENCES developer (id),
    FOREIGN KEY (developer_id) REFERENCES developer (id)
);
