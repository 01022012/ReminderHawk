Factory.sequence :company_name do |n|
  "Company#{n}"
end

Factory.sequence :subdomain do |n|
  "ww#{n}"
end

Factory.sequence :email do |n|
  "person#{n}@example.com"
end

Factory.define :company do |c|
  c.subdomain {Factory.next(:subdomain)}
  c.name {Factory.next(:company_name)}
end

Factory.define :user do |u|
  u.email { Factory.next(:email)}
  u.password 'password'
  u.password_confirmation 'password'
  u.companies {|a| [a.association(:company)]} 
end

