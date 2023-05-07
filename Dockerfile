FROM rust:1.69.0 AS builder
WORKDIR /app/url_shortner_app
COPY ./src /app/url_shortner_app/src
COPY ./migration /app/url_shortner_app/migration
COPY ./entity /app/url_shortner_app/entity
COPY ./Cargo.lock /app/url_shortner_app
COPY ./Cargo.toml /app/url_shortner_app
RUN cargo build --release

FROM debian:bullseye-slim AS app
COPY --from=builder /app/url_shortner_app/target/release/url_shortner_app /usr/local/bin/url_shortner_app
EXPOSE 8080
CMD ["url_shortner_app"]