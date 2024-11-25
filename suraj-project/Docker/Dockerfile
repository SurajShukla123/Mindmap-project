# Base and dependencies installation
FROM python:3.9-slim as builder

WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends gcc libpq-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --upgrade pip && pip wheel --no-cache-dir --no-deps --wheel-dir /wheels -r requirements.txt

# Final runtime image
FROM python:3.9-slim

WORKDIR /app

COPY --from=builder /wheels /wheels
COPY --from=builder /app/requirements.txt .

RUN pip install --no-cache /wheels/*

# Copy application code
COPY . .

# Healthcheck
HEALTHCHECK CMD curl --fail http://localhost:8000/ || exit 1

# Run server
CMD ["gunicorn", "-b", "0.0.0.0:8000", "DjangoWebApp.wsgi:application"]