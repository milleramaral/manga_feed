desc 'run drop, create, migrate, seed'

task :reset do
  puts 'Droping database...'
  system('rake db:drop')

  puts 'Creating...'
  system('rake db:create')

  puts 'Migrating...'
  system('rake db:migrate')

  puts 'Seeding...'
  system('rake db:seed')

  puts 'Done!'
end
