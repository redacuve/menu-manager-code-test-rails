@menus.each do |menu|
  json.set! menu.name do
    json.array!(menu.dish, :id, :name, :price)
  end
end