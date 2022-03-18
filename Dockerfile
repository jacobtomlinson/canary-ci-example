FROM python

COPY app.py /app.py

RUN pip install fastapi uvicorn[standard]

EXPOSE 5000

CMD python /app.py
