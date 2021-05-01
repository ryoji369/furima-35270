FactoryBot.define do
    factory :user do
      nickname              {'jirou'}
      email                 {'test@example'}
      password              {'000000'}
      password_confirmation {password}
      last_name             {'tarou'}
      first_name            {'yamada'}
      last_name_kana        {'タロウ'}
      first_name_kana       {'ヤマダ'}
      birthday              {'1982-05-10'}
    end
  end