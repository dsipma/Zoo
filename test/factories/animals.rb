# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :animal do
    type "MyString"
    value 1
    info "MyText"
    predator_id 1
    prey_id 1
    size 1
  end
end
