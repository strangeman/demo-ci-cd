FROM python:3 as pelican_builder

WORKDIR /app
COPY pelican_configs /app
RUN pip install -r requirements.txt

COPY pelican_content /app/content

RUN pelican content

##############################################
FROM nginx:stable-alpine

COPY docker/nginx/nginx.conf /etc/nginx/nginx.conf

COPY --from=pelican_builder /app/output /data