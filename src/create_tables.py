from sqlalchemy import create_engine
import pandas as pd
import os
engine = create_engine('postgresql+psycopg2://postgres:153524@localhost/olist')

path = "data/"
file_list = os.listdir(path)
file = average_order_approval.sql

for file in file_list:
    table_name = file.split(".")[0]
    file_to_read = os.path.join('data', file)
    df = pd.read_csv(file_to_read)
    df.to_sql(name=table_name, con=engine, schema="olist", if_exists='replace')







