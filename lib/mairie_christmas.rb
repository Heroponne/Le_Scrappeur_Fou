require 'nokogiri'
require 'open-uri'
require 'pry'

def get_townhall_name
  townhall_name_array = []
  page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
  townhall_url = page.xpath('//*[@class = "lientxt"]')
  townhall_url.each do |name|
  	townhall_name_array << name.text
  end
  townhall_name_array
end

def get_townhall_urls
  url_array = []
  page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
  townhall_url = page.xpath('//*[@class = "lientxt"]/@href')
  townhall_url.each do |url|
  	url_array << url.text
  end
  url_array.map! do |url|
  	url = url.slice(1..((url.size)-1))
  end
  url_array
end

def get_townhall_email(array_url)
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/#{array_url}"))
  townhall_email = page.xpath('/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]').text
 end

def get_each_townhall_email
  email_array = []
  get_townhall_urls.each do |url|
  	email_array << get_townhall_email(url)
  end
  email_array
end

puts  hash_townhall_email = Hash[get_townhall_name.zip(get_each_townhall_email)]




