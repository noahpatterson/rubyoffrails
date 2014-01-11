#!/usr/bin/env ruby
require "./austin-data"
measurements = ImportsData.new.import
WeatherChart.new.create_to_file("austin.html", measurements)
STDOUT.write "Create austin.html"
STDOUT.write "\n"
STDOUT.flush
exit 0