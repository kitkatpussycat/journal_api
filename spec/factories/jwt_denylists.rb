FactoryBot.define do
  factory :jwt_denylist do
    jti { "MyString" }
    exp { "2022-02-13 23:42:35" }
  end
end
