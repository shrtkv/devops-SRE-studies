FROM cgr.dev/chainguard/python:latest-dev
WORKDIR /app
COPY requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt
COPY app.py . 
COPY templates templates/
COPY static static/

ENTRYPOINT ["flask", "run", "--host=0.0.0.0"]
