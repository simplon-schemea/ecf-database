-- PART 2: REQUEST

SELECT lastname, firstname, count(*)
FROM tech_lead tl
         LEFT JOIN developer dev ON dev.id = tl.tech_lead_id
GROUP BY tech_lead_id, firstname, lastname;
