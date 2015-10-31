# import_to_mongo
Creates collections in mongo database by reading a json file

Imports data in mongodb by reading json file.

Example
Json file contents
=============================================================================================
{
  'continents':[
    {'name': 'Asia},
    {'name': 'North America'},
    {'name': 'South America'},
    {'name': 'Europe'},
    {'name': 'Africa'},
    {'name': 'Antartica'},
    {'name': 'Australia'},
  ],
  
  'countries':[
    {'name': 'India},
    {'name': 'USA'},
    {'name': 'Italy'},
    {'name': 'Poland'},
    {'name': 'France'},
    {'name': 'Turkey'},
    {'name': 'Seychelles'},
  ]
}
====================================================================================================================

Steps
1] Open the script
Enter the collections names in the below array
COLLECTIONS = %w[continents countries]
Save and close the script
2] Execute the script
./main -f <file_path> -d <db_name>

After executing below collecions along with data shall be created in the <db_name>
1] contients
2] Countries

Thats all
