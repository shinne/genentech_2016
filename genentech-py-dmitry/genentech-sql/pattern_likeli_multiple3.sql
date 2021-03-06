SELECT t3.patient_id, t4.feature_avg
INTO patient_likeli_table FROM
((SELECT patient_id, FEATURE_NAMES_COMMA_SEPARATED FROM FEATURE_TABLE_NAME) t3
INNER JOIN
(SELECT * FROM (SELECT T1_COMMA_SEPARATED,
                       ROUND(AVG(CAST(t2.is_screener AS float)), 2) AS feature_avg,
                       COUNT(t2.is_screener) AS feature_count
FROM
    ((SELECT patient_id, FEATURE_NAMES_COMMA_SEPARATED FROM FEATURE_TABLE_NAME) t1
     INNER JOIN
     (SELECT patient_id, is_screener FROM train_cv_indices OPTIONAL_CV_EXPRESSION) t2
     ON t1.patient_id = t2.patient_id)
GROUP BY T1_COMMA_SEPARATED)
WHERE feature_count>50) t4
ON T3_T4_CONDITION)
GROUP BY t3.patient_id, t4.feature_avg;

