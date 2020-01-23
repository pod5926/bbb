FactoryBot.define do
    factory :book do
        name { 'テスト' }
        comment { 'Rspec&Capybara&FactoryBotを準備する' }
        user
    end
end