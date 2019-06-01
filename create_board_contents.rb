# frozen_string_literal: true

require 'pg'
require 'dotenv/load'

connect = PG.connect(
  host: ENV['DATABASE_HOST'],
  user: ENV['DATABASE_USER'],
  password: ENV['DATABASE_PASSWORD'],
  dbname: ENV['DATABASE_NAME'],
  port: ENV['DATABASE_PORT']
)

# @data = connect.exec("CREATE TABLE board_contents (
#   id SERIAL,
#   name text,
#   comment text,
#   commented_at time_stamp,
#   PRIMALY KEY (id)
# ');")

@data = connect.exec("CREATE TABLE \"board_contents\" (
    \"id\" serial,
    \"name\" text,
    \"commnet\" text,
    \"commented_at\" timestamp,
    PRIMARY KEY (\"id\")
);")
