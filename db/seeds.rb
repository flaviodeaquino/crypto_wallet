# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cadastrando as moedas no banco de dados..."

Coin.create!(
    description: "Bitcoin",
    acronym: "BTC",
    url_image: "https://w7.pngwing.com/pngs/450/133/png-transparent-bitcoin-cryptocurrency-virtual-currency-decal-blockchain-info-bitcoin-text-trademark-logo.png"
)

Coin.create!(
    description: "Ethereum",
    acronym: "ETH",
    url_image: "https://w7.pngwing.com/pngs/368/176/png-transparent-ethereum-cryptocurrency-blockchain-bitcoin-logo-bitcoin-angle-triangle-logo-thumbnail.png"
)

Coin.create!(
    description: "Dash",
    acronym: "DASH",
    url_image: "https://w7.pngwing.com/pngs/9/37/png-transparent-dash-dashcoin-crypto-currency-and-coin-icon.png"
)

Coin.create!(
    description: "Dogecoin",
    acronym: "DOGE",
    url_image: "https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/dogecoin-doge-icon.png"
)

puts "Moedas cadastradas no banco de dados..."
