class BackgroundImageSerializer
  include FastJsonapi::ObjectSerializer
  set_id {nil}
  attribute :image, :credit
end
