import nfl_data_py as nfl
import pandas as pd

# Pull play-by-play data for recent seasons
# This takes a minute - it's downloading a lot of data
print("Pulling play-by-play data for 2022-2024...")
pbp = nfl.import_pbp_data([2022, 2023, 2024])

print(f"Total plays: {len(pbp):,}")
print(f"Columns: {len(pbp.columns)}")

# Filter to Vikings games (home or away)
vikings = pbp[(pbp['home_team'] == 'MIN') | (pbp['away_team'] == 'MIN')]
print(f"Vikings plays: {len(vikings):,}")

keyColumns = [
    'game_id', 'play_id', 'play_type', 'desc', 'yards_gained', 'posteam', 'down', 'ydstogo', 'yardline_100',
    'fourth_down_converted', 'fourth_down_failed', 'posteam', 'score_differential', 'epa'
]
# Filter to just 4th down plays
fourthDowns = vikings[vikings['down'] == 4]
print(f"Vikings 4th down plays: {len(fourthDowns):,}")

# Print sample row
print("\n--- Sample row ---")
print(fourthDowns[keyColumns].head(1).to_string())

# Save to csv
output_path = 'vikings_pbp_2022_2024.csv'
vikings.to_csv(output_path, index=False)