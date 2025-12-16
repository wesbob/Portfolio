import pandas as pd
from sqlalchemy import create_engine

# Connection string format: 'postgresql://username:password@host:port/database_name'
database_url = 'postgresql://postgres:3431@127.0.0.1:5432/healthcare_analytics'
engine = create_engine(database_url)

# Read data directly into a pandas DataFrame
df = pd.read_sql_query("SELECT * FROM dim_clinics", con=engine)
df1 = pd.read_sql_query("SELECT * FROM vw_monthly_no_show_rates", con=engine)
df1 = df1.sort_values(by='clinic_name', ascending=False)
df1 = df1.sort_values(by='no_shows', ascending=False)

#ClinicTest
print('\nOur Clinics Names Are:\n---------------------------')
for theClinicCities in df.values.tolist():
    print(theClinicCities[2])
print("\n")

print('Top 5 No Show Rates by Clinic:\n-------------------------------')
for theNoShowRates in df1.values.tolist()[0:5]:
    print(f"{theNoShowRates[0]:<30}{theNoShowRates[4]:>5} No Shows")
print("\n")

