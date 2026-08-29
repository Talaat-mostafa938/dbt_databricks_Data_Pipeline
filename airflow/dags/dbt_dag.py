from airflow import DAG
from airflow.operators.bash import BashOperator

from datetime import datetime , timedelta

default_args = {
    'owner':'airflow',
    'depends_on_past':False,
    'retries':2,
    'retry_delay':timedelta(minutes=5)
}

with DAG (
    dag_id='dbt_dag',
    default_args=default_args,
    schedule='@daily',
    start_date=datetime(2024,6,1),
    catchup=False,
    tags=['dbt', 'databricks', 'airflow']
) as dag:
    
    DBT_DIR = "/usr/app/dbt_databricks_project"
    DBT_CONTAINER = "dbt-container"

    dbt_run = BashOperator(
        task_id='dbt_run',
        bash_command=(
            f"docker exec {DBT_CONTAINER} sh -c 'set -e; cd {DBT_DIR} && "
            f"dbt run --project-dir {DBT_DIR} --profiles-dir {DBT_DIR}'"
        ),
    )

    dbt_test = BashOperator(
        task_id='dbt_test',
        bash_command=(
            f"docker exec {DBT_CONTAINER} sh -c 'set -e; cd {DBT_DIR} && "
            f"dbt test --project-dir {DBT_DIR} --profiles-dir {DBT_DIR}'"
        ),
    )
    
    
    dbt_run >> dbt_test