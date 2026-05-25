FROM python:3.14-alpine AS builder

ENV PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1

RUN apk add --no-cache gcc g++ musl-dev
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt .
RUN pip install -r requirements.txt


FROM python:3.14-alpine

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PATH="/opt/venv/bin:$PATH"

COPY --from=builder /opt/venv /opt/venv

RUN addgroup -S mkdocs && adduser -S -G mkdocs mkdocs
WORKDIR /mkdocs
USER mkdocs
EXPOSE 8000
ENTRYPOINT ["mkdocs"]
CMD ["serve", "-a", "0.0.0.0:8000"]
