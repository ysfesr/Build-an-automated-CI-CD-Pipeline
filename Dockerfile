FROM python:3.8-slim

ENV APP_HOME /app
WORKDIR $APP_HOME

COPY requirements.txt .
RUN pip install -r requirements.txt && pip install gunicorn==20.0.4

COPY . .

ENV PORT 8080

ENV PYTHONUNBUFFERED TRUE

CMD exec gunicorn --bind 0.0.0.0:$PORT --workers 1 --threads 8 --timeout 0 todolist.wsgi:application