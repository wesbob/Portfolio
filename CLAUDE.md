# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a portfolio repository showcasing data analysis and BI projects. It contains two main projects:

### Hamalytics (Power BI)
A multi-source analytics dashboard with DAX modeling. Contains dashboard screenshots and DAX troubleshooting notes (see `Issue_YearBleed.md` for DAX filter context issues).

### Healthcare Analytics (PostgreSQL + Python + Power BI)
A healthcare appointment analytics system with:
- **Star schema data warehouse** in PostgreSQL with dimension tables (`dim_patients`, `dim_clinics`, `dim_date`, `dim_time`) and a central fact table (`fact_appointments`)
- **Python data generator** (`python_scripts/dataGenerator.py`) that creates synthetic appointment data with realistic no-show patterns based on lead time, insurance type, distance, and age
- **SQL queries** for analysis

## Database Schema

The healthcare analytics project uses a star schema design:

**Dimensions:**
- `dim_patients`: Patient demographics, insurance type, chronic conditions, distance to clinic
- `dim_clinics`: Clinic master data, specialties
- `dim_date`: Calendar table (date_key format: YYYYMMDD as INT)
- `dim_time`: Time dimension in 30-minute intervals (time_key format: HHMM as INT)

**Fact Table:**
- `fact_appointments`: Appointment events with surrogate keys to dimensions, status flags (`is_no_show`, `is_cancelled`, `is_completed`), and metrics

**Staging:**
- `staging.*` tables for CSV imports before transformation

## Key Files

- `healthcare-analytics/queries/createDimensions.sql` - Dimension table DDL
- `healthcare-analytics/queries/createFactTable.sql` - Fact table DDL
- `healthcare-analytics/queries/createHelperFunctions.sql` - Functions to populate date/time dimensions
- `healthcare-analytics/queries/createStaging.sql` - Staging table DDL
- `healthcare-analytics/sql/templates.sql` - Complete schema with analytical views

## Running the Python Data Generator

```bash
cd healthcare-analytics/python_scripts
python dataGenerator.py
```

Outputs: `clinics.csv`, `patients.csv`, `appointments.csv` in the current directory.
