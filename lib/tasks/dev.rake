namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do

    puts 'Excluindo banco de dados...'
    %x(rails db:drop)
    puts 'Pronto!'

    puts 'Criando banco de dados...'
    %x(rails db:create)
    puts 'Pronto!'

    puts 'Migrando banco de dados...'
    %x(rails db:migrate)
    puts 'Pronto!'

    puts 'Cadastrando os tipos de contatos...'
    kinds = %w(Amigo Comercial Conhecido)
    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end
    puts 'Pronto!'

    puts 'Cadastrando os contatos...'
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end
    puts 'Pronto!'

    puts 'Cadastrando os telefones...'
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        Phone.create!(
          number: Faker::PhoneNumber.cell_phone,
          contact: contact
        )
      end
    end
    puts 'Pronto!'

    puts 'Cadastrando os endereços...'
    Contact.all.each do |contact|
     Address.create!(
      street: Faker::Address.street_address,
      city: Faker::Address.city,
      contact:contact
    )
    end
    puts 'Pronto!'

  end

end
