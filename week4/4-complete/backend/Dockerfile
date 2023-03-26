FROM python:3.10-slim-buster

WORKDIR /app

COPY . /app

# Install poetry
RUN pip install poetry
ENV PATH="/root/.local/bin:${PATH}"

# Install dependencies
RUN poetry install

EXPOSE 80

CMD ["poetry", "run", "python", "app.py"]
