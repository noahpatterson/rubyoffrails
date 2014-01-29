#!/usr/bin/env ruby
 require 'rubygems'
 require 'bundler'
 require 'sass/plugin/rack'
require './theweb'

Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack



run TheWeb