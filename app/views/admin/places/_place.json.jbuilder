json.extract! place, :id, :city_id, :name, :expires_at, :address, :description, :phone, :email, :latitude, :longitude, :deleted_at, :created_at, :updated_at
json.url place_url(place, format: :json)
