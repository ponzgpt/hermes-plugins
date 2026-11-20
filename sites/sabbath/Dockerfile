# Built from the repo root: docker build -f sites/sabbath/Dockerfile .
FROM nginx:1.30-alpine
COPY snippets/ /etc/nginx/snippets/
COPY sites/sabbath/nginx.conf /etc/nginx/conf.d/default.conf
COPY sites/sabbath/index.html sites/sabbath/robots.txt sites/sabbath/banner.png sites/sabbath/page.png /srv/site/
EXPOSE 80
