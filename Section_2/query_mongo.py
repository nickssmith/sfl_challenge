import pandas
import pymongo

username = "root"
password = "password"
addr = "localhost"
port = "27017"

mongo_uri = 'mongodb://{}:{}@{}:{}/'.format(username, password, addr, port)

conn = pymongo.MongoClient(mongo_uri)

db = conn['exdb']

coll = db['users']

# Make a query to the specific DB and Collection
cursor = db['users'].find()

# Expand the cursor and construct the DataFrame
df = pandas.DataFrame(list(cursor))

print(df)
