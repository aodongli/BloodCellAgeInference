All data comes from The MIMIC II Clinical Database (Public Subset) (https://physionet.org/physiobank/database/mimic2cdb-ps/).

There are 61 samples with unique id. 

All the identifiers are stored in the file: 
    sample_list.txt

Data of interest:
    All the data with glucose measurements

The measurement related to glucose:
    glucose-id-dict.txt // name and id pair
    glucose_id.txt // only id

Softwares:
    crawler.py // crawls the data in .txt format
    preproc.py // preprocesses the original data and stores the only related measurements
    reader.py // returns an object of whole data, each entry in the object is a list of list with [sample_id, timestamp, id, value] as entries; reader.py depends on the file sample_list.txt

NOTE: the glucoses measured by id=811 is generally lower than the ones measured by id=807(fingerstick). (Please refer to glucose-id-dict.txt for detailed translation.)