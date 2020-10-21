-- PART 1: REQUEST

SELECT matricule, lastname, firstname, tech.name_fr
FROM developers dev
         LEFT JOIN developer_technology dt ON dev.id = dt.developer_id
         INNER JOIN technologies tech ON dev.main_technology_id = tech.id
WHERE dt.technology_id IS NULL;

SELECT matricule, lastname, firstname, count(*) AS learnt_tech
FROM developers dev
         INNER JOIN developer_technology dt ON dev.id = dt.developer_id
WHERE dt.technology_id != dev.main_technology_id
GROUP BY dev.id;

SELECT matricule, lastname, firstname, tech.name_en
FROM developer_technology l
         INNER JOIN developer_technology r ON l.technology_id = r.technology_id AND l.developer_id != r.developer_id
         INNER JOIN developers dev ON dev.id = l.developer_id
         INNER JOIN technologies tech ON dev.main_technology_id = tech.id;