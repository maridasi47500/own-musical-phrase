#!/usr/bin/ruby
require 'rubygems'
require 'watir'
require "nokogiri"

o = [('a'..'z'),('A'..'Z'),(0..9)].map{|i| i.to_a}.flatten
string = (0...8).map{ o[rand(o.length)] }.join
    
# settings
# create new instance
browser = Watir::Browser.new(:firefox)
browser.goto    "songbpm.com"
query='vivaldi violin concerto a minor op. 3 no. 6 presto'

# login
browser.text_field(:name => "query").set query
browser.button(:id => "search-button").click
bpm=""
key=""
mode=""
time=""
browser.a(:class => "hover:bg-foreground/5 flex flex-col items-start justify-start space-y-2 p-3 sm:flex-row sm:items-center sm:p-6").click
p browser.div(class: "lg:prose-xl mx-auto p-8 leading-6").inner_html
browser.div(class: "lg:prose-xl mx-auto p-8 leading-6").inner_html.split(".").each do |h|
hey = Nokogiri::HTML(h).css("span").map(&:text)
if h.include?("BPM") and bpm == ""
bpm = hey[-1]
elsif h.include?("key") and h.include?("mode") and key == "" and mode == ""
key = hey[-2]
mode = hey[-1]
elsif h.include?("time signature") and time == ""
time = hey[-1]
end
Nokogiri::HTML(h).css("span").each do |g|
p g.text
end
end

