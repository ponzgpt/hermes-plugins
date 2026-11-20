# Built from the repo root: docker build -f sites/psychopomp/Dockerfile .
FROM nginx:1.30-alpine
COPY snippets/ /etc/nginx/snippets/
COPY sites/psychopomp/nginx.conf /etc/nginx/conf.d/default.conf
COPY sites/psychopomp/index.html sites/psychopomp/robots.txt sites/psychopomp/banner.png sites/psychopomp/page.png /srv/site/
EXPOSE 80
