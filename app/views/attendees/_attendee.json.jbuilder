json.extract! attendee, :id, :name, :phone_number, :email, :created_at, :updated_at
json.url attendee_url(attendee, format: :json)
