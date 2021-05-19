FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nick_name             { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { 'abcd12' }
    password_confirmation { 'abcd12' }
    birthday              { '1930-02-01' }
    last_name             { person.first.kanji }
    first_name            { person.last.kanji }
    last_name_kana        { person.first.katakana }
    first_name_kana       { person.last.katakana }
  end
end
