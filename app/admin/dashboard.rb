ActiveAdmin.setup do |config|
  config.namespace :admin do |admin|
    admin.build_menu :utility_navigation do |menu|
      menu.add label: "ActiveAdmin.info", url: "http://www.activeadmin.info",
                                          html_options: { target: :blank }
      admin.add_current_user_to_menu  menu
      admin.add_logout_button_to_menu menu
    end
  end
end

ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    #Here is an example of a simple dashboard with columns and panels.
    
    columns do
      column do
        panel "Recent Posts" do
          ul do
            Game.all.map do |game|
              li link_to(game.name, admin_game_path(game))
            end
          end
        end
      end

      column do
        panel "New Game" do
          para link_to "Create new game",  new_admin_game_path
        end
      end
    end
  end # content
end
