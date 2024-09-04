import csv
from datetime import datetime

# Function to convert date string from '17-JUN-03' to '2003-06-17'
def convert_date(date_str):
    # Define a mapping of month abbreviations to their numeric equivalents
    month_mapping = {
        'JAN': '01', 'FEB': '02', 'MAR': '03', 'APR': '04',
        'MAY': '05', 'JUN': '06', 'JUL': '07', 'AUG': '08',
        'SEP': '09', 'OCT': '10', 'NOV': '11', 'DEC': '12'
    }
    # Parse the date string using datetime.strptime
    date_obj = datetime.strptime(date_str, '%d-%b-%y')
    # Format the date object in 'YYYY-MM-DD' format
    formatted_date = date_obj.strftime('%Y-%m-%d')
    return formatted_date

# Input and output file paths
input_file = 'staffs_data.csv'
output_file = 'output.csv'

# Read input CSV and write converted data to output CSV
with open(input_file, 'r', newline='') as infile, open(output_file, 'w', newline='') as outfile:
    reader = csv.reader(infile)
    writer = csv.writer(outfile)
    
    # Write header to output file
    header = next(reader)  # Read the header from input
    writer.writerow(header)  # Write header to output
    
    # Process each row
    for row in reader:
        # Assuming the date is in the fourth column (index 3)
        date_str = row[3]
        # Convert date format
        converted_date = convert_date(date_str)
        # Update the row with converted date
        row[3] = converted_date
        # Write the updated row to output file
        writer.writerow(row)

