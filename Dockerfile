FROM nginx
RUN rm /etc/nginx/conf.d/default.conf
COPY flaskappfordoe.conf /etc/nginx/conf.d/
