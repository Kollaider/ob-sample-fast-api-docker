# Используем официальный образ Python
FROM python:3.10-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем requirements.txt и устанавливаем зависимости
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копируем остальные файлы
COPY . .

# Открываем порт 80
EXPOSE 80

# Устанавливаем переменные окружения (правильный формат)
ENV NAME=ob-sample-fast-api-docker

# Указываем maintainer (альтернатива LABEL)
LABEL maintainer="itskmyoo <itskmyoo@gmail.com>"

# Запускаем сервер
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]