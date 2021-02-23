FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = '1a' + Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    
    transient do
      person { Gimei.name }
    end
    first_name {person.first.kanji}
    last_name {person.last.kanji}
    first_name_ruby {person.first.katakana}
    last_name_ruby {person.last.katakana}
    birthday {Faker::Date.backward}
  end
end