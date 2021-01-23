

ActiveAdmin.register_page "Dashboard" do
  
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }
  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "All Games" do
          ul do
            Game.all.map do |game|
              li link_to(game.name, admin_game_path(game))
            end
          end
        end
      end
      column do
        panel "Game Action" do
          link_to "Create new game",  new_admin_game_path
        end
      end
      
    end
  end # content
end
