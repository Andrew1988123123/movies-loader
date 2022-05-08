FROM python:3.7.3
LABEL MAINTAINER = Andrew

WORKDIR /app 

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY movies.json main.py ./

CMD python main.py