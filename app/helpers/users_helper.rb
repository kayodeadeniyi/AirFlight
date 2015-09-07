module UsersHelper
  def sign_in_provider
    {
        facebook: {name: "Facebook", class: "blue darken-3", icon_class: "fa-facebook"},
        google_oauth2: {name: "Google", class: "red darken-4", icon_class: "fa-google-plus"}
    }
  end
end
