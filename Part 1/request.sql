-- PART 1: REQUEST

SELECT DISTINCT dev.*
FROM developer dev
WHERE dev.id NOT IN (
    SELECT developer_id
    FROM developer_technology dt
    WHERE dt.technology_id != dev.main_technology_id
);

SELECT dev.*
FROM developer dev
         INNER JOIN developer_technology dt ON dev.id = dt.developer_id
WHERE dt.technology_id != dev.main_technology_id
GROUP BY dev.id;

SELECT dev.*
FROM developer_technology l
         INNER JOIN developer_technology r ON l.technology_id = r.technology_id AND l.developer_id != r.developer_id
         INNER JOIN developer dev ON dev.id = l.developer_id;