FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { "a1#{Faker::Internet.password(min_length: 6)}" }
    password_confirmation { password }
    lastname_kanji        { '佐藤サトウさとう' }
    firstname_kanji       { '太郎タロウたろう' }
    lastname_katakana     { 'サトウ' }
    firstname_katakana    { 'タロウ' }
    birth_date            { Faker::Date.birthday(min_age: 5, max_age: 95) }
  end
end
