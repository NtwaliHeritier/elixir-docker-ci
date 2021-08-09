FROM elixir:1.12.2-alpine
RUN mix do local.hex --force, local.rebar --force && mix archive.install hex phx_new 1.5.10 --force && apk add inotify-tools
RUN apk add --no-cache nodejs npm
WORKDIR /app
COPY mix.exs mix.lock ./
RUN mix do deps.get, deps.compile
COPY . .
RUN cd ./assets && npm install && cd ..
EXPOSE 4000