select sum(fact_appointments.duration_minutes / 60) as hours, dim_date.day_name from fact_appointments
left join dim_date on fact_appointments.appointment_date_key = dim_date.date_key
where is_completed is TRUE
GROUP BY day_name
order by hours desc
limit 7

-- SELECT
--     dd.day_name,
--     dt.hour,
--     dt.time_period,
--     COUNT(*) AS appointment_count,
--     SUM(CASE WHEN f.is_completed THEN 1 ELSE 0 END) AS completed_count,
--     ROUND(
--         100.0 * SUM(CASE WHEN f.is_completed THEN 1 ELSE 0 END) / COUNT(*),
--         2
--     ) AS completion_rate
-- FROM fact_appointments f
-- INNER JOIN dim_date dd ON f.appointment_date_key = dd.date_key
-- INNER JOIN dim_time dt ON f.appointment_time_key = dt.time_key
-- GROUP BY dd.day_name, dd.day_of_week, dt.hour, dt.time_period
-- ORDER BY dd.day_of_week, dt.hour;