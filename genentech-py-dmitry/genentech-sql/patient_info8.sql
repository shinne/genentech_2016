SELECT patient_id, COUNT(DISTINCT surgical_practitioner_id) AS patient_id_diff_surgical_practitioner_count
FROM surgical_head
GROUP BY patient_id;