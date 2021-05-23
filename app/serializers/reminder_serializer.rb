class ReminderSerializer
  include FastJsonapi::ObjectSerializer
  # need to bring in attributes, allows to easily capture related list attributes.
  attributes :name, :description, :date, :time, :list_id, :list
end
