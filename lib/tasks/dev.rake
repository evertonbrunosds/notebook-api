namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do

    puts 'Cadastrando os tipos de contatos...'
    kinds = %w(Amigo Comercial Conhecido)
    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end
    puts 'Pronto!'

    puts 'Cadastrando os contatos...'
    Kind.all.each do |kind|
      33.times do |i|
        Contact.create!(
          name: Faker::Name.name,
          email: Faker::Internet.email,
          birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
          kind_id: kind.id
        )
      end
    end
    puts 'Pronto!'

  end

end
