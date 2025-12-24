class WelcomeController < ApplicationController
  def search
  end

  def song


       o = [('a'..'z'),('A'..'Z'),(0..9)].map{|i| i.to_a}.flatten
       string = (0...8).map{ o[rand(o.length)] }.join
           
       # settings
       # create new instance
       browser = Watir::Browser.new(:firefox)
       browser.goto    "songbpm.com"
       query=params[:q]
       
       # login
       browser.text_field(:name => "query").set query
       browser.button(:id => "search-button").click
       bpm=""
       key=""
       mode=""
       time=""
       composer=""
       browser.a(:class => "hover:bg-foreground/5 flex flex-col items-start justify-start space-y-2 p-3 sm:flex-row sm:items-center sm:p-6").click
       p browser.div(class: "lg:prose-xl mx-auto p-8 leading-6").inner_html
       title=browser.h1.inner_html
    
       browser.div(class: "lg:prose-xl mx-auto p-8 leading-6").inner_html.split(".").each do |h|
       hey = Nokogiri::HTML(h).css("span").map(&:text)
       hi = Nokogiri::HTML(h).css("a").map(&:text)
       p hi
       p h
       if h.include?("song by") and composer == ""
       
       composer = hi[0]
       end
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
       browser.close
       @newscore=Newscore.new(composer: composer, title: title, time_signature: time, key_signature: key+" "+mode, metronomemark: bpm)
       @newscore.save
       @fragment=Fragment.new(clef: "g", nuance: "mf", caractere: "moderato", title: title, time_signature: time, key_signature: key+" "+mode, tempo: bpm)
       if @fragment.save
          redirect_to @fragment
       end

  end
end
