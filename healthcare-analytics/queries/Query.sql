SELECT p.chronic_conditions,
       COUNT(p.patient_id) AS total_patients,
       ROUND(100.0 * COUNT(p.patient_id) / SUM(COUNT(p.patient_id)) OVER (), 0) AS percentage,
       clinic_rank.top_clinic
FROM dim_patients p
LEFT JOIN (
    -- Find the top clinic for each chronic condition group
    SELECT DISTINCT ON (dp.chronic_conditions)
           dp.chronic_conditions,
           c.clinic_name AS top_clinic
    FROM fact_appointments fa
    JOIN dim_patients dp ON fa.patient_key = dp.patient_key
    JOIN dim_clinics c ON fa.clinic_key = c.clinic_key
    GROUP BY dp.chronic_conditions, c.clinic_name
    ORDER BY dp.chronic_conditions, COUNT(*) DESC
) clinic_rank ON p.chronic_conditions = clinic_rank.chronic_conditions
GROUP BY p.chronic_conditions, clinic_rank.top_clinic
ORDER BY percentage DESC;



