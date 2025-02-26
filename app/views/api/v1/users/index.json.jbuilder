json.array!(@users) do |user|
  json.call(user, :id, :email, :name)
end
