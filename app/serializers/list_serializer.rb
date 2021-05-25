class ListSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :color, :reminders
end
