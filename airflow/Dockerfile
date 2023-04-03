ARG build_for=linux/arm64

FROM --platform=$build_for apache/airflow:2.5.2-python3.10  as base

ARG dbt_postgres_ref=dbt-core@v1.4.5
ARG AIRFLOW_HOME=/opt/airflow

USER root
RUN apt-get update \
  && apt-get dist-upgrade -y \
  && apt-get install -y --no-install-recommends \
    git \
    ssh-client \
    software-properties-common \
    make \
    build-essential \
    ca-certificates \
    libpq-dev \
  && apt-get clean \
  && rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/* \
  && mkdir /mnt/dbt-model-profiles

# Env vars
ENV PYTHONIOENCODING=utf-8
ENV LANG=C.UTF-8


# Update python
USER airflow
RUN python -m pip install --upgrade pip setuptools wheel --no-cache-dir \
    && python -m pip install --no-cache-dir dbt-core==1.4.5

# Set docker basics
WORKDIR /usr/app/dbt/
VOLUME /usr/app


RUN  python -m pip install --no-cache-dir "git+https://github.com/dbt-labs/${dbt_postgres_ref}#egg=dbt-postgres&subdirectory=plugins/postgres" 
