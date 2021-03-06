# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
    - User has many Carts, Carts have many line items, and Games have many line items
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    - Cart belongs to user, And line items belong to both game and cart
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    - Cart has many games through line items, and games have many carts through line items
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    - Cart and games have the many to many relationship through line items
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
    - The user selects the quantity on the line item
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    - There are user creation validations for uniquiness and presence.
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    - Several scope methods on the game model to search for certain game genres.
- [x] Include signup (how e.g. Devise)
    - Made through the sessions controller
- [x] Include login (how e.g. Devise)
    - Made through the sessions controller
- [x] Include logout (how e.g. Devise)
    - Made through the sessions controller
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
    - Used omniauth and omniauth-github to signin/login through github
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
    - cart view is nested under the user route (users/:user_id/carts/:cart_id)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
    - The ability to add a new game is through the admin/games/new route
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
