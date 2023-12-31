# Imagen base
FROM python:3.11-alpine

# Establece el directorio de trabajo
WORKDIR /code

# Establece variables de entorno
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Instala dependencias
RUN apk add --no-cache gcc musl-dev linux-headers

# Copia el archivo requirements.txt
COPY requirements.txt /code/

# Instala dependencias desde requirements.txt
RUN pip install -r requirements.txt

# Copia el archivo app.py
COPY app.py /code/

# Comando de arranque
CMD ["flask", "run"]
