require 'rubygems'
require 'nokogiri'
require 'open-uri'

#--------------------------
#Methode pour reccupérer les prix des crypto
def get_crypto_price(x) 
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	
	prices = []

	page.xpath('//a[@class="price"]').each do |price|
		prices << price.text.gsub(' ','')
	end
	return prices[0..x] #attrape 100 prix
end

#--------------------------
#Methode pour reccupérer les noms des crypto
def get_crypto_name(x)
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	
	names = []

	page.xpath('//a[@class="currency-name-container"]').each do |name|
		names << name.text	
	end
	return names[0..x] #attrape 100 noms
	
end

#--------------------------
#démarage du programme
puts "combien de crypto voulez-vous afficher?"
 nb = gets.chomp.to_i  #Permet de transformer la string en nombre

#nb -= 1 pour afficher le bon nombre de resultat mais y'a plus de vanne

	h = Hash[get_crypto_name(nb).zip get_crypto_price(nb)] #reuni les prix et les noms

puts h
puts "je t'en ai mis une en plus, c'est cadeau!"
