#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"
end

get '/about' do 
	erb :about
end

get '/visits' do 
	erb :visits
end

post '/visits' do 
	@user = params[:user_name]
	@phone = params[:user_phone]
	@date = params[:date_time]
	@barber = params[:barber]

	@f = File.open('./public/users.txt', 'a')
	@f.write "User: [#{@user}] -- Phone: [#{@phone}] -- Date time: [#{@date}] -- Barber: [#{@barber}]\n"
	@f.close

	@title = "Dear, #{@user}!"
	@message = " We'll wait you at #{@date}. Your barber - #{@barber}."

	erb :message
end

get '/contacts' do 
	erb :contacts
end

post '/contacts' do 
	@user_mail = params[:user_email]
	@user_msg = params[:user_message]

	@f = File.open('./public/contacts.txt', 'a')
	@f.write "User mail: [#{@user_mail}] -- Message: [#{@user_msg}]\n"
	@f.close

	erb :contacts
end