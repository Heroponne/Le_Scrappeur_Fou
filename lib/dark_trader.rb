require 'nokogiri'
require 'open-uri'

def crypto_name_extract
  page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
  all_crypto_name = []
  a = '"currency-name-container link-secondary"'
  all_crypto_name_class = page.xpath("//*[@class = #{a}]")
  all_crypto_name_class.each { |crypto| all_crypto_name << crypto.text }
  all_crypto_name
end

def crypto_value_extract
  page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
  all_crypto_value = []
  all_crypto_value_class = page.xpath('//*[@class = "price"]')
  all_crypto_value_class.each { |crypto| all_crypto_value << crypto.text }
  all_crypto_value
end

def array_of_hashes
  array_of_hash = []
  hash_crypto = Hash[crypto_name_extract.zip(crypto_value_extract)]
  hash_crypto.each { |crypto, value| array_of_hash << "#{crypto} => #{value}" }
  array_of_hash
end

puts array_of_hashes
