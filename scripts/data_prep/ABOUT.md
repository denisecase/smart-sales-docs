# scripts/data_prep

This folder contains Python scripts (one per table) needed to clean and preprocess your raw data. 

Each file reads a file from data/raw, cleans and pre-processes it, and writes a new, clean file to data/prepared. 

## Notes

We recommend naming the new file differently so the content is clear in the Python code. 

For example, raw data read from: `data/raw/customers_data.csv`

Is written to: `data/prepared/customers_prepared.csv`

After cleaning. 