-- PART 2: REQUEST

SELECT DISTINCT dev.* from tech_lead tl LEFT JOIN developer dev ON dev.id = tl.tech_lead_id;
