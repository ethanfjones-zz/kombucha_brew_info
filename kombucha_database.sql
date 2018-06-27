BEGIN TRANSACTION;

pragma foreign_keys = ON

#Create table relating to time of intial time and final time
CREATE TABLE IF NOT EXISTS batch_info(
  batch_id INTEGER PRIMARY KEY NOT NULL, 
  intial_batch_date datetime, 
  final_batch_date datetime)
        FOREIGN KEY (batch_id) REFERENCES fermentation(batch_id)
          ON DELETE RESTRICT ON UPDATE RESTRICT
);


# Create table relating to fermentation
CREATE TABLE IF NOT EXISTS fermentation(
  batch_id INTEGER PRIMARY KEY NOT NULL, 
  initial_ph REAL,
  intial_temp REAL, 
  SCOBY_id INTEGER,
  start_liquid_amount REAL, 
  misc_notes VARCHAR
);

# Create table relating to brewing of sweet tea
CREATE TABLE IF NOT EXISTS tea_brew_info(
  batch_id INTEGER PRIMARY KEY NOT NULL, 
  intial_h20_amount REAL, 
  h2o_temp_before  REAL,
  h2o_temp_after  REAL,
  tea_amount REAL,
  tea_weight REAL,
  tea_id INTEGER, 
  sugar_amount REAL, 
  sugar_weight REAL,
  steep_time REAL, 
  cold_h2o_amount REAL,  
      FOREIGN KEY (batch_id) REFERENCES fermentation(batch_id) 
        ON DELETE RESTRICT ON UPDATE RESTRICT
);


# Create table relating to info about tea
CREATE TABLE IF NOT EXISTS tea_info(
  tea_id INTEGER PRIMARY KEY NOT NULL, 
  tea_name text,  
  tea_description text,
  purchase_from text,
  organic text,

      FOREIGN KEY (tea_id) REFERENCES tea_brew_info(tea_id) 
);

# Create table relating to SCOBY info
CREATE TABLE IF NOT EXISTS SCOBY_info(
  SCOBY_id INTEGER PRIMARY KEY NOT NULL, 
  SCOBY_description text,
  SCOBY_source text,
      FOREIGN KEY (SCOBY_id) REFERENCES fermentation(SCOBY_id)
); 


# CREATE table relating to temp day by day
CREATE TABLE IF NOT EXISTS daily_temperatures( 
  batch_id INTEGER NOT NULL, 
  day_1_morning REAL,
  day_1_evening REAL,
  day_2_morning REAL,
  day_2_evening REAL, 
  day_3_morning REAL,
  day_3_evening REAL,
  day_4_morning REAL,
  day_4_evening REAL,
  day_5_morning REAL,
  day_5_evening REAL, 
  day_6_morning REAL,
  day_6_evening REAL,
  day_7_morning REAL,
  day_7_evening REAL,
  day_8_morning REAL,
  day_8_evening REAL, 
  day_9_morning REAL,
  day_9_evening REAL,
  day_10_morning REAL,
  day_10_evening REAL,
  day_11_morning REAL,
  day_11_evening REAL, 
  day_12_morning REAL,
  day_12_evening REAL,
  day_14 REAL,
  day_15 REAL, 
  misc_notes text, 
      FOREIGN KEY (batch_id) REFERENCES fermentation(batch_id)
);

# Create trigger to warn that temp is too low
CREATE TRIGGER IF NOT EXISTS temp_low
  AFTER INSERT
  ON daily_temperatures
  FOR EACH STATEMENT
  WHEN new.day_1_morning <= 75,
  new.day_1_evening <= 75,
  new.day_2_morning <= 75,
  new.day_2_evening <= 75, 
  new.day_3_morning <= 75,
  new.day_3_evening <= 75,
  new.day_4_morning <= 75,
  new.day_4_evening <= 75,
  new.day_5_morning <= 75,
  new.day_5_evening <= 75, 
  new.day_6_morning <= 75,
  new.day_6_evening <= 75,
  new.day_7_morning <= 75,
  new.day_7_evening <= 75,
  new.day_8_morning <= 75,
  new.day_8_evening <= 75, 
  new.day_9_morning <= 75,
  new.day_9_evening <= 75,
  new.day_10_morning <= 75,
  new.day_10_evening <= 75,
  new.day_11_morning <= 75,
  new.day_11_evening <= 75, 
  new.day_12_morning <= 75,
  new.day_12_evening <= 75,
  new.day_14 <= 75,
  new.day_15 <= 75
BEGIN
  "Temperature is low";
END;

# Create trigger to warn that temp is too high
CREATE TRIGGER IF NOT EXISTS temp_low
  AFTER INSERT
  ON daily_temperatures
  FOR EACH STATEMENT
  WHEN new.day_1_morning <= 85,
  new.day_1_evening <= 85,
  new.day_2_morning <= 85,
  new.day_2_evening <= 85, 
  new.day_3_morning <= 85,
  new.day_3_evening <= 85,
  new.day_4_morning <= 85,
  new.day_4_evening <= 85,
  new.day_5_morning <= 85,
  new.day_5_evening <= 85, 
  new.day_6_morning <= 85,
  new.day_6_evening <= 85,
  new.day_7_morning <= 85,
  new.day_7_evening <= 85,
  new.day_8_morning <= 85,
  new.day_8_evening <= 85, 
  new.day_9_morning <= 85,
  new.day_9_evening <= 85,
  new.day_10_morning <= 85,
  new.day_10_evening <= 85,
  new.day_11_morning <= 85,
  new.day_11_evening <= 85, 
  new.day_12_morning <= 85,
  new.day_12_evening <= 85,
  new.day_14 <= 85,
  new.day_15 <= 85
BEGIN
  "Temperature is high";
END;


# Create table realting to post fermentation and flavoring process
CREATE TABLE IF NOT EXISTS post_fermentation (
  batch_id INTEGER PRIMARY KEY,
  flavorings text, 
  second_fermentation_length REAL, 
  taste_notes text, 
      FOREIGN KEY (batch_id) REFERENCES fermentation(batch_id)
  )

COMMIT:
