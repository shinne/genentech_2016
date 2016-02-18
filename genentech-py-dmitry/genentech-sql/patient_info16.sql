SELECT patient_id, COUNT(DISTINCT prescription_practitioner_specialty_code) AS patient_id_diff_prescription_specialty_count
FROM prescription_feats
GROUP BY patient_id;