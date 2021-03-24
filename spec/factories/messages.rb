FactoryBot.define do
  factory :message do
    content { 'Hello, how are you?' }
    user { nil }
  end
end
