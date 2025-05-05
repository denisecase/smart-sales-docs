# smart-sales-docs

In Module 2, we wrote a simple, centralized data_prep.py to get started.
In real projects, this often evolves into modular per-table scripts to better manage complexity and focus.
We'll see an example of that kind of evolution. 

In Module 2, we had one file: `scripts/data_prep.py`.

In Module 3, we now use one file per data table:
- `scripts/data_prep/prepare_customers.py`
- `scripts/data_prep/prepare_products.py`
- `scripts/data_prep/prepare_sales.py`

### Why?

As data projects grow, it becomes easier to:
- Focus on one dataset at a time
- Avoid breaking other code when cleaning changes
- Test and debug more easily
- Let different team members work on different files

We move the old `data_prep.py` in an `archive/` folder so you can compare and reuse as needed.

## Continuing Project Work

We don't need to create our .venv as we should already have it. 
If not, go back to Module 1 and 2 make sure those steps are completed. 
Now, we just follow our regular workflow. If we find we need additional external packages, we can always re-run the install from requirements.txt command as needed. In general, we:

1. Pull any recent changes from GitHub.
2. Activate the `.venv`.
3. Run `scripts/data_prep.py`.


## Mac/Linux Commands

Open your smart sales repository in VS Code. 
Open a terminal in the root project folder. 
Activate your .venv and run each file. 

```shell
source .venv/bin/activate
python3 scripts/data_prep/prepare_customers.py
python3 scripts/data_prep/prepare_products.py
python3 scripts/data_prep/prepare_sales.py
```

## Windows PowerShell Commands

Open your smart sales repository in VS Code. 
Open a PowerShell terminal in the root project folder. 
Activate your .venv and run each file. 

```shell
.venv\Scripts\activate
py scripts/data_prep/prepare_customers.py
py scripts/data_prep/prepare_products.py
py scripts/data_prep/prepare_sales.py
```

## After Making Progress

Once you’ve verified the scripts ran successfully, 
git add, commit, and push changes to your GitHub repository.

```shell
git add .
git commit -m "ran initial data_prep.py"
git push -u origin main
```

For best results, git add-commit-push frequently after making any useful progress. 


-----

## Complete all Data Preparation

For this step, use pandas (and optionally, a shared DataScrubber class if you like) to clean and prepare each of the raw data files. 

Cleaning is a critical task. 

Continue until you think you have good data in all the prepared files. 


## Resources

- [pro-analytics-01](https://github.com/denisecase/pro-analytics-01)
- And the repos from earlier modules.