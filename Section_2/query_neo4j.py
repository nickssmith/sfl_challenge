import pandas
from py2neo import Graph, NodeMatcher


username = "neo4j"
password = "test"
uri = "bolt://0.0.0.0:7687"

graph = Graph("bolt://localhost:7687", auth=("neo4j", "test"))

try:
    graph.run("Match () Return 1 Limit 1")
    print('ok')
except Exception:
    print('not ok')

matcher = NodeMatcher(graph)
a = matcher.match("username")
print(len(a))
for b in range(len(a) - 1):
    print(a.skip(b).first())

# TODO finish reset
print("done")
# Hi.__init__()
# Expand the cursor and construct the DataFrame
# df = pandas.DataFrame(list(cursor))

# print(df)
