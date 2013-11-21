
FactoryGirl.define do
  factory :user do
    first_name "foo"
    last_name "bar"
    sequence(:email) { |n| "abc@example.com" }
    password "foobar"
    password_confirmation "foobar"
  end
end