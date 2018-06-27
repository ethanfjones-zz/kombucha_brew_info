BEGIN TRANSACTION;


PRAGMA foreign_keys = ON 

CREATE TABLE IF NOT EXISTS fermentation(
  batch_id INTEGER PRIMARY KEY NOT NULL, 
  initial_ph REAL,
  intial_temp REAL, 
  SCOBY_id INTEGER,
  start_liquid_amount REAL, 
  misc_notes VARCHAR);



CREATE TABLE IF NOT EXISTS batch_info(
  batch_id INTEGER PRIMARY KEY NOT NULL, 
  intial_batch_date datetime, 
  final_batch_date datetime,
  FOREIGN KEY (batch_id) REFERENCES fermentation(batch_id)
    ON DELETE RESTRICT ON UPDATE RESTRICT);


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
  ON DELETE RESTRICT ON UPDATE RESTRICT);



CREATE TABLE IF NOT EXISTS tea_info(
  tea_id INTEGER PRIMARY KEY NOT NULL, 
  tea_name text,  
  tea_description text,
  purchased_from text,
  organic text,
  FOREIGN KEY (tea_id) REFERENCES tea_brew_info(tea_id)
  ON DELETE RESTRICT ON UPDATE RESTRICT);


CREATE TABLE IF NOT EXISTS SCOBY_info(
  SCOBY_id INTEGER PRIMARY KEY NOT NULL, 
  SCOBY_description text,
  SCOBY_source text,
  FOREIGN KEY (SCOBY_id) REFERENCES fermentation(SCOBY_id)); 



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
  FOREIGN KEY (batch_id) REFERENCES fermentation(batch_id));

CREATE TABLE IF NOT EXISTS post_fermentation (
  batch_id INTEGER PRIMARY KEY,
  flavorings text, 
  second_fermentation_length REAL, 
  taste_notes text, 
  FOREIGN KEY (batch_id) REFERENCES fermentation(batch_id);

COMMIT;
