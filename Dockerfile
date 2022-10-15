FROM svizor/zoomcamp-model:3.9.12-slim

RUN pip install pipenv

WORKDIR /app
COPY ["Pipfile", "Pipfile.lock", "./"]

RUN pipenv install --system --deploy

COPY ["churnService.py", "./"]

EXPOSE 9696

ENTRYPOINT ["waitress", "--bind=0.0.0.0:9696", "churnService:app"]