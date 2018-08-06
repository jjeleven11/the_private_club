User.destroy_all

User.create(
  email: 'stephane@thp.fr',
  password: 'qwertyuiop',
  password_confirmation: 'qwertyuiop'
)

User.create(
  email: 'will@thp.fr',
  password: 'qwertyuiop',
  password_confirmation: 'qwertyuiop'
)
