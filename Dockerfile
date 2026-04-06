FROM nginx:1.27-alpine

# Serve this static site with Nginx
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*

# Copy the full project into the Nginx web root
COPY . .

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
