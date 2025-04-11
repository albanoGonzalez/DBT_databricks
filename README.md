Welcome to your new dbt project!

### Set up Databricks
Use your existing account or create one with the free trial.
Create your own worskpace in Databricks and upload your files, here you can take your files from Azure SQL or just upload the csv for this test.
In the SQL Editor run the queries to verify the tables and the values.
Grant all privileges to the users

### Connect Databricks with DBT
There are two ways to do it:
    1. the first one is through Partner Connect from Databricks, this one will provide you the way to create your own account.
    2. Create your proper DBT Cloud account and build the databricks connections yourself.


### Set up DBT CLOUD
Use your existing account or create one with the free trial (14 days).
In your profile, link your github account to save your progress.
Add the databricks connection, to do it go to Connections in your profile and configure the hostname, server, catalog, schema and token (to get the token you must go to your databricks account, in the right side, click in your profile and create a new token)
Create the new project and also create a new environment


### Time to work on your proyect
Create a new branch to commit your changes
You can split up your project in different folders but first of all create your models from the data sources.
Sources: create a yml file under a sources: key 

### Commands

dbt run --> Executes the SQL models defined in your dbt project and materializes them in the data warehouse (as tables, views, or incremental models).
dbt test --> Runs the tests defined in your project to validate data quality and integrity. These can be generic tests (e.g., unique, not_null) or custom SQL-based tests.
dbt docs generate --> Generates documentation for your dbt project, including metadata about models, sources, and a lineage graph that shows dependencies between models.
dbt run --select dim_customer --> Runs a specific model (dim_customer) and its dependencies (if any). This is useful for testing or updating only one part of your pipeline.
dbt test --select dim_customer --> Runs only the tests associated with the specified model (dim_customer). This is helpful for validating changes made to a specific model without running all tests.
dbt freshness -->
dbt build --> Combines multiple steps (dbt run, dbt test, dbt snapshot, and dbt seed) into a single execution. It follows the order of the Directed Acyclic Graph (DAG) of your project and is ideal for production workflows.

