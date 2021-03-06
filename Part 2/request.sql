-- PART 2: REQUEST

SELECT lead.lastname, lead.firstname, count(*) as tech_lead_of
FROM developers lead
         INNER JOIN developers dev ON lead.id = dev.tech_lead_id
GROUP BY lead.lastname, lead.firstname;
