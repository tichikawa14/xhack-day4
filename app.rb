# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'dotenv/load'

get '/' do
  @message = []
  connect = PG.connect(
    host: ENV['DATABASE_HOST'],
    user: ENV['DATABASE_USER'],
    password: ENV['DATABASE_PASSWORD'],
    dbname: ENV['DATABASE_NAME'],
    port: ENV['DATABASE_PORT']
  )

  @data = connect.exec('SELECT * FROM test')
  connect.finish
  erb :index
end
