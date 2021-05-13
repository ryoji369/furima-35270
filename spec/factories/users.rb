FactoryBot.define do
    factory :user do
      nickname              {'jirou'}
      email                 {Faker::Internet.free_email}
      password              {'aaa000'}
      password_confirmation {password}
      last_name             {'太郎'}
      first_name            {'山田'}
      last_name_kana        {'タロウ'}
      first_name_kana       {'ヤマダ'}
      birthday              {'1982-05-10'}
    end
  end