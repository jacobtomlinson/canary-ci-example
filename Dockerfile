FROM python

COPY app.py /app.py

RUN pip install fastapi uvicorn[standard]

CMD python /app.py
