# Stage 1: Build the site with Jekyll
FROM ruby:3.2-alpine as builder

RUN apk add --no-cache build-base nodejs npm

WORKDIR /site

COPY . .

RUN bundle install
RUN bundle exec jekyll build

# Stage 2: Serve the site with Nginx
FROM nginx:alpine

COPY --from=builder /site/_site /usr/share/nginx/html

