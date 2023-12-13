import os
import sys
import rdflib
from rdflib import Graph

# Check if the path to the directory is provided
if len(sys.argv) != 2:
    print("Usage: python make-models.py <directory_path>")
    sys.exit(1)

# Get directory name from command line argument
directory = sys.argv[1]

# Check if the provided directory exists
if not os.path.isdir(directory):
    print(f"The provided directory does not exist: {directory}")
    sys.exit(1)

# Function to convert ttl files to json-ld
def convert_ttl_to_jsonld(file_path):
    # Initialize the graph
    g = Graph()
    # Parse the ttl file
    g.parse(file_path, format='turtle')
    # Convert the file name to json-ld format
    jsonld_file_path = file_path.rsplit('.', 1)[0] + '.jsonld'
    # Serialize the graph into json-ld
    g.serialize(destination=jsonld_file_path, format='json-ld', indent=4)
    print(f"Converted {file_path} to {jsonld_file_path}")

# Walk through the directory
for root, dirs, files in os.walk(directory):
    for file in files:
        if file.endswith('.ttl'):
            # Construct the full file path
            file_path = os.path.join(root, file)
            # Convert the file
            convert_ttl_to_jsonld(file_path)
