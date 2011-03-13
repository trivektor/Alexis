require 'factory_girl'

Factory.define :user do |user|
  user.first_name 'First'
  user.last_name 'Last'
  user.email 'test@email.com'
  user.username 'username'
  user.password 'password'
end

Factory.define :user_with_profile do |user|
  user.first_name 'First'
  user.last_name 'Last'
  user.email 'test@email.com'
  user.password 'password'
  
  user.association :profile, :factory => :profile
end

Factory.define :profile do |profile|
end