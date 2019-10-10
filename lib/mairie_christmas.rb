require 'nokogiri'
require 'open-uri'

def townhall_name_get
  townhall_name_array = []
  page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
  townhall_url = page.xpath('//*[@class = "lientxt"]')
  townhall_url.each { |name| townhall_name_array << name.text }
  townhall_name_array
end

def townhall_urls_get
  url_array = []
  page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
  townhall_url = page.xpath('//*[@class = "lientxt"]/@href')
  townhall_url.each { |url| url_array << url.text }
  url_array.map! { |url| url.slice(1..(url.size - 1)) }
  url_array
end

def townhall_email_get(array_url)
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/#{array_url}"))
  a = '/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]'
  page.xpath(a.to_s).text
end

def each_townhall_email_get
  email_array = []
  townhall_urls_get.each { |url| email_array << townhall_email_get(url) }
  email_array
end

def array_of_hashes
  array_of_hash = []
  hash_town_email = Hash[townhall_name_get.zip(each_townhall_email_get)]
  hash_town_email.each { |town, email| array_of_hash << "#{town} => #{email}" }
  array_of_hash
end

puts array_of_hashes
