require_relative 'contact'
require 'sinatra'

get '/' do
  @title = "About"
  erb :index
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end

 get '/about' do
  redirect to ('/')
end

get '/contacts/:id' do
  # params[:id] contains the id from the URL
  @contacts = Contact.find_by({id: params[:id].to_i})
  erb :show_contacts
end
  # instructions for how to handle requests to this route will go here
  get '/contacts/:id' do
    @contact = Contact.find_by(id: params[:id].to_i)
    if @contact
      erb :show_contact
    else
      raise Sinatra::NotFound
    end
  end
  
after do
  ActiveRecord::Base.connection.close
end
