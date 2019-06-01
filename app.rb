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

  @data = connect.exec('SELECT * FROM board_contents')
  connect.finish
  erb :index
end

post '/comments' do
  connect = PG.connect(
    host: ENV['DATABASE_HOST'],
    user: ENV['DATABASE_USER'],
    password: ENV['DATABASE_PASSWORD'],
    dbname: ENV['DATABASE_NAME'],
    port: ENV['DATABASE_PORT']
  )

  @name = params['name']
  @comment = params['comment']

  sql = "INSERT INTO board_contents (name, commnet) VALUES ('#{@name}', '#{@comment}');"
  @data = connect.exec(sql)

  redirect '/'
end
