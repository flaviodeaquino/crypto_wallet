namespace :dev do
  desc "Configura o ambiente de desenvolvimento."
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando o banco de dados ...") { %x(rails db:drop) }
      show_spinner("Criando o banco de dados ...") { %x(rails db:create) }
      show_spinner("Migrando as tabelas para o banco de dados ...") { %x(rails db:migrate) }
      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)
    else
      puts "A aplicação não está em ambiente de desenvolvimento."
    end
  end

  desc "Cadastra as moedas."
  task add_coins: :environment do
    show_spinner("Cadastrando moedas...") do
      coins = [
                  { 
                      description: "Bitcoin",
                      acronym: "BTC",
                      url_image: "https://w7.pngwing.com/pngs/450/133/png-transparent-bitcoin-cryptocurrency-virtual-currency-decal-blockchain-info-bitcoin-text-trademark-logo.png",
                      mining_type: MiningType.find_by(acronym: 'PoW')
                  },
      
                  { 
                      description: "Ethereum",
                      acronym: "ETH",
                      url_image: "https://w7.pngwing.com/pngs/368/176/png-transparent-ethereum-cryptocurrency-blockchain-bitcoin-logo-bitcoin-angle-triangle-logo-thumbnail.png",
                      mining_type: MiningType.all.sample
                  },

                  { 
                      description: "Dash",
                      acronym: "DASH",
                      url_image: "https://w7.pngwing.com/pngs/9/37/png-transparent-dash-dashcoin-crypto-currency-and-coin-icon.png",
                      mining_type: MiningType.all.sample
                  },

                  {
                    description: "Iota",
                      acronym: "IOT",
                      url_image: "https://res.coinpaper.com/coinpaper/iota_miota_logo_e08343d2e4.png",
                      mining_type: MiningType.all.sample
                  },

                  {
                    description: "ZCash",
                      acronym: "ZEC",
                      url_image: "https://cryptologos.cc/logos/zcash-zec-logo.png",
                      mining_type: MiningType.all.sample
                  },
                  { 
                      description: "Dogecoin",
                      acronym: "DOGE",
                      url_image: "https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/dogecoin-doge-icon.png",
                      mining_type: MiningType.all.sample
                  }
              ]
      
      coins.each do |coin|
          Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Cadastra os tipos de mineração."
  task add_mining_types: :environment do
    show_spinner("Cadastrando os tipos de mineração...") do
      mining_types = [
        {description: "Proof of Work", acronym: "PoW"},
        {description: "Proof of Stake", acronym: "PoS"},
        {description: "Proof of Capacity", acronym: "PoC"}
      ]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private
    def show_spinner(msg_start, msg_end = "Concluído com sucesso!")
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
      spinner.auto_spin
      yield
      spinner.success("(#{msg_end})")
    end

end
