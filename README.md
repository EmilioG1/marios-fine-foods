# Mario's Fine Foods

#### A website created for an Italian plumber turned Fine Food grocer.

#### By Emilio Gonzales

## Technologies Used

* _Ruby_
* _Rails_
* _RSpec_
* _Pry_
* _Faker_
* _Shoulda Matchers_
* _HTMl/CSS/Bootstrap_
* _Devise_

## Description
_A website displaying the products sold at Mario's and the reviews submitted for each item._

## Setup/Installation Requirements
* _Clone this repository to your desktop_
* _Navigate to the top level of marios_fine_foods main branch and open in code editor_
* _to recreate the database run <code>psql marios_fine_foods < database_backup.sql_</code>
* _then run <code>createdb -T marios_fine_foods marios_fine_foods_test_</code>
* _run <code>bundle</code> in terminal to add gems_
* _run <code>rspec</code> in terminal to test code_
* _run <code>rails s</code> in terminal to test website_
* _to equip admin authorization:_
  >_go to rails console, enter_ <code>@user = User.first</code>
  ><br>_then_ <code>@user.admin = true</code>


## Known Bugs
* _Validation for content_body max characters prevents review seeding_

## License
[MIT](https://choosealicense.com/licenses/mit/)

## Contact Information
Copyright (c) _2022_ _Emilio Gonzales_