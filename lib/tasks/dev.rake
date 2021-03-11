namespace :dev do

  DEFAULT_PASSWORD = 123456
  
  desc "TODO"
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Drop DB') { %x(rails db:drop) }
      show_spinner('Create DB') { %x(rails db:create) }
      show_spinner('Migrate DB') { %x(rails db:migrate) }
      show_spinner('Cadastrando o administrador padrão') { %x(rails dev:add_default_admin) }
      show_spinner('Cadastrando o usuário padrão') { %x(rails dev:add_default_user) }
    else
      puts "You aren't on development environment"
    end
  end

  desc "Adiciona o administrador padrão"
  task add_default_admin: :environment do
    Admin.create!(
      email: 'admin@admin.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Adiciona o usuário padrão"
  task add_default_user: :environment do
    User.create!(
      email: 'user@user.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  private

  def show_spinner(msg_start, msg_end = 'OK')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}...")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
