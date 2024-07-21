FactoryBot.define do
  factory :wine do
    name { 'Default Wine Name' }
    age { 5 }
    vineyard { 'Default Vineyard' }
    region { 'Default Region' }
    grape_variety { 'Default Grape Variety' }
    alcohol_content { 13.5 }
    description { 'Default Description' }
  end
end