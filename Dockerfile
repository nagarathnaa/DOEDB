FROM nginx
RUN rm /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY flaskappfordoe.conf /etc/nginx/conf.d/
