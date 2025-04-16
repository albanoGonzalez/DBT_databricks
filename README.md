## 🚀 Project Overview

This project demonstrates how to:
- Set up a Databricks workspace and load your data.
- Connect Databricks with dbt Cloud.
- Organize, develop, and test your dbt models using best practices.

---

## 1. Set Up Databricks

1. **Create a Workspace:**  
   Use your existing Databricks account or sign up for a free trial.  
   Create a new workspace and upload your data files. You can extract data from Azure SQL or simply upload CSVs for testing.

2. **Verify Your Data:**  
   Use the SQL Editor to run queries and verify your tables and data values.

3. **Grant Privileges:**  
   Make sure to grant the necessary privileges (like SELECT) to the users or service principals (e.g., `DBT_CLOUD_USER`) that will access the data from dbt Cloud.

---

## 2. Connect Databricks with dbt

There are two main ways to connect dbt with Databricks:

- **Option 1: Partner Connect (Recommended for Simplicity)**
  - Use Databricks Partner Connect to quickly set up dbt Cloud integration.
  - This will guide you through creating a dbt Cloud account and connecting it to your Databricks workspace.

- **Option 2: Manual Setup**
  - Create your own dbt Cloud account (free 14-day trial available).
  - In dbt Cloud, add a new Databricks connection.  
    - Go to **Connections** in your profile.
    - Configure the hostname, HTTP path, catalog, schema, and access token.
    - To generate a Databricks access token, go to your Databricks workspace, click your user profile (top right), and create a new token.

---

## 3. Set Up Your dbt Cloud Project

- **Link GitHub:**  
  In your dbt Cloud profile, link your GitHub account to version-control your project.

- **Create a New Project & Environment:**  
  Set up a new dbt project and environment in dbt Cloud.

- **Configure the Databricks Connection:**  
  Add the Databricks connection details as described above.

---

## 4. Start Developing Your Project

- **Branching:**  
  Create a new branch for your work (recommended: use Git best practices).

- **Project Structure:**  
  Organize your project into folders:
  - `models/` for your dbt models (start by creating models from your data sources).
  - `sources/` for YAML source definitions.
  - `tests/` for generic or singular tests.
  - `macros/` for reusable SQL macros.
  - `snapshots/` for snapshotting slowly changing dimensions.

- **Best Practices:**  
  - Use the `ref` function to reference other models.
  - Define sources in YAML files.
  - Add tests for uniqueness and not null on primary keys.
  - Use views for lightweight models, tables for BI/reporting, and incremental models for large/fast-changing data.

---

## 5. Common dbt Commands

| Command                                | Description                                                                                           |
|-----------------------------------------|-------------------------------------------------------------------------------------------------------|
| `dbt run`                              | Executes all models and materializes them as tables/views/incremental models in your warehouse.       |
| `dbt test`                             | Runs all tests (generic and custom) to validate data quality and integrity.                           |
| `dbt docs generate`                    | Generates documentation and a lineage graph for your dbt project.                                     |
| `dbt run --select dim_customer`        | Runs only the `dim_customer` model (and its dependencies).                                            |
| `dbt test --select dim_customer`       | Runs only the tests associated with the `dim_customer` model.                                         |
| `dbt freshness`                        | Checks the freshness of your sources.                                                                 |
| `dbt build`                            | Runs `dbt run`, `dbt test`, `dbt snapshot`, and `dbt seed` in DAG order—ideal for production.         |
| `dbt deps`                             | Installs dependencies listed in `packages.yml`.                                                       |
| `dbt run-operation grant_select`       | Runs a macro, e.g., to grant SELECT privileges (requires macro definition).                           |



