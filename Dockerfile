# استخدام نسخة خفيفة ومستقرة من بايثون
FROM python:3.11-slim

# تحديث النظام وتثبيت بعض الحزم الأساسية التي قد يحتاجها dbt للعمل بسلاسة
RUN apt-get update -y && \
    apt-get install --no-install-recommends -y -q \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /usr/app/dbt_databricks_project

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir dbt-databricks

CMD ["dbt", "--version"]