# It works fine on python:3.9
# FROM python:3.9
# It fails on this image:
FROM nvidia/cuda:11.3.1-cudnn8-devel-ubuntu20.04
RUN apt update
RUN apt install -y python3-dev python3-venv python3-pip curl git

ENV POETRY_HOME=/etc/poetry
RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="$POETRY_HOME/bin:$PATH"
COPY pyproject.toml .
COPY poetry.lock .
RUN poetry config virtualenvs.create false
RUN poetry install