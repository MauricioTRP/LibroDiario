FactoryBot.define do
  factory :company do
    name { 'Horus' }
    formal_name { 'Kenny eirl' }
    rut { '16491800-9' }
    contact_info do
      {
        "email" => "kenny@horus.cl",
        "phone_1"=>"986547854",
        "phone_2"=>"56985214951"
      }
    end
    address do
      {
        "street_adress" => "neptuno 315",
        "city" => "Lo prado",
        "state" => "Santiago",
        "ZIP" => "13091098"
      }
    end
  end
end
