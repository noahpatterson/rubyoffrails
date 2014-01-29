#!/usr/bin/env ruby


require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'

configure { set :server, :puma }

class TheWeb < Sinatra::Base
  get '/' do
    #haml
    #slim
    
    erb :dashboard
  end

  get '/number' do
    @the_number = rand(3000)
    erb :number
  end
end

if __FILE__ == $0
  TheWeb.run!
end
