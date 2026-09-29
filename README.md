# 🎬 Netflix Data Analytics Pipeline — dbt + Snowflake + AWS S3

End-to-end **Analytics Engineering** project that ingests raw MovieLens (Netflix-style) data from **AWS S3** into **Snowflake**, then transforms it into clean, tested, analytics-ready models using **dbt**.

This project demonstrates a modern ELT architecture commonly used in data engineering / analytics engineering roles.

---

## 🏗️ Architecture

```
AWS S3 (Raw CSV files)
        │
        ▼
Snowflake External Stage + RAW tables
        │
        ▼
dbt Staging Models (cleaned & typed)
        │
        ▼
dbt Dimension + Fact Models
        │
        ▼
dbt Mart Models (analytics-ready)
```

---

## 🛠️ Tech Stack

| Layer              | Technology                  |
|--------------------|-----------------------------|
| Cloud Storage      | AWS S3                      |
| Data Warehouse     | Snowflake                   |
| Transformation     | dbt (dbt-snowflake)         |
| Language           | SQL + Jinja                 |
| Version Control    | Git / GitHub                |

---

## 📁 Project Structure

```
netflix-data-analytics-dbt/
├── netflix/                          # dbt project root
│   ├── models/
│   │   ├── staging/                  # Cleaned source views
│   │   │   ├── source_movies.sql
│   │   │   ├── source_ratings.sql
│   │   │   ├── source_tags.sql
│   │   │   ├── source_genome_scores.sql
│   │   │   ├── source_genome_tags.sql
│   │   │   └── source_links.sql
│   │   ├── dim/                      # Dimension tables
│   │   │   ├── dim_movies.sql
│   │   │   ├── dim_users.sql
│   │   │   ├── dim_genome_tags.sql
│   │   │   └── dim_movies_with_tags.sql
│   │   ├── fact/                     # Fact tables
│   │   │   ├── fct_ratings.sql
│   │   │   └── fct_genome_scores.sql
│   │   ├── mart/                     # Analytics marts
│   │   │   └── mart_movie_releases.sql
│   │   ├── sources.yml               # Source definitions
│   │   └── schema.yml                # Tests & documentation
│   ├── macros/
│   ├── seeds/
│   ├── snapshots/
│   ├── tests/
│   ├── dbt_project.yml
│   └── packages.yml
├── commands.sql                      # Setup commands
├── instructions.sql                  # Snowflake + S3 setup script
└── README.md
```

---

## 🔄 Pipeline Overview

1. **Ingestion**
   - Raw CSV files (`movies.csv`, `ratings.csv`, `tags.csv`, `genome-scores.csv`, `genome-tags.csv`, `links.csv`) stored in an **AWS S3 bucket**.
   - Snowflake **external stage** created pointing to the S3 bucket.
   - Data loaded into Snowflake `RAW` schema tables using `COPY INTO`.

2. **Transformation (dbt)**
   - **Staging layer**: Clean column names, cast data types, and standardize raw tables.
   - **Dimension layer**: Build reusable dimension tables (`dim_movies`, `dim_users`, `dim_genome_tags`, etc.).
   - **Fact layer**: Build fact tables (`fct_ratings`, `fct_genome_scores`).
   - **Mart layer**: Create business-facing analytics models (e.g. `mart_movie_releases`).

3. **Data Quality**
   - `not_null` and `unique` tests on primary keys
   - Relationship tests between fact and dimension tables
   - Schema documentation via `schema.yml`

---

## 🚀 How to Run This Project

### Prerequisites
- Snowflake account
- AWS S3 bucket with the MovieLens CSV files
- Python + virtual environment
- dbt-snowflake

### 1. Snowflake Setup
Run the SQL in `instructions.sql` to:
- Create role, user, warehouse, database & schema
- Create external stage linked to your S3 bucket
- Load all raw tables

### 2. Local Setup
```bash
# Create & activate virtual environment
python -m venv venv
# Windows
venv\Scripts\activate
# macOS / Linux
source venv/bin/activate

# Install dbt
pip install dbt-snowflake==1.9.0

# Create profiles directory (if not exists)
mkdir ~/.dbt          # macOS/Linux
# or
mkdir %userprofile%\.dbt   # Windows
```

### 3. Configure `~/.dbt/profiles.yml`
```yaml
netflix:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: <your-account>
      user: dbt
      password: <your-password>
      role: TRANSFORM
      database: MOVIELENS
      warehouse: COMPUTE_WH
      schema: RAW
      threads: 4
```

### 4. Run the dbt Project
```bash
cd netflix
dbt deps          # install packages
dbt run           # build all models
dbt test          # run data tests
dbt docs generate
dbt docs serve    # view interactive documentation
```

---

## 📊 Models Summary

| Layer     | Models                                      | Materialization |
|-----------|---------------------------------------------|-----------------|
| Staging   | source_movies, source_ratings, source_tags, source_genome_*, source_links | View |
| Dimension | dim_movies, dim_users, dim_genome_tags, dim_movies_with_tags | Table |
| Fact      | fct_ratings, fct_genome_scores              | Table |
| Mart      | mart_movie_releases                         | Table |

---

## ✅ Key Skills Demonstrated

- Modern ELT architecture (S3 → Snowflake → dbt)
- Snowflake external stages & `COPY INTO`
- dbt best practices (staging → intermediate → marts)
- Dimension & Fact modeling
- Data quality testing with dbt
- Source freshness & documentation
- Infrastructure-as-code mindset for analytics

---

## About Me

Built by **[Muhammad Shaaf](https://github.com/MuhammadShaaf)** as part of an Analytics Engineering portfolio.

Related project: [SQL Server Data Warehouse Project](https://github.com/MuhammadShaaf/SQL-Data-Warehouse-Project)

---

## 📄 License

MIT License
