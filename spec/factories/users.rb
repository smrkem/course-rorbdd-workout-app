FactoryGirl.define do
  sequence :email do |n|
    "mail_#{n}@example.com"
  end

  factory :user do
      email { generate(:email) }
      password "testsecret"
      first_name "John"
      last_name "Smith"
  end
end
