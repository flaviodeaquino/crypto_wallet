namespace :dev do
  desc "Configura o ambiente de desenvolvimento."
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando o banco de dados ...") { %x(rails db:drop) }
      show_spinner("Criando o banco de dados ...") { %x(rails db:create) }
      show_spinner("Migrando as tabelas para o banco de dados ...") { %x(rails db:migrate) }
      show_spinner("Preenchendo o banco de dados ...") { %x(rails db:seed) }
    else
      puts "A aplicação não está em ambiente de desenvolvimento."
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
