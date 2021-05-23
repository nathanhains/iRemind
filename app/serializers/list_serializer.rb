class ListSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :color
end
