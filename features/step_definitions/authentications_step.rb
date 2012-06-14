Given /^a gamer visits the signin page$/ do
  visit signin_path
end

When /^he submits invalid signin information$/ do
  click_button "Sign in"
end

Then /^he should see an error message$/ do
  page.should have_selector('div.alert.alert-error')
end

Given /^the gamer has an account$/ do
  @gamer = Gamer.create(name: "Example Gamer", email: "gamer@example.com",
                      password: "foobar", password_confirmation: "foobar")
end

When /^the gamer submits valid signin information$/ do
  fill_in "Email",    with: @gamer.email
  fill_in "Password", with: @gamer.password 
  click_button "Sign in"
end

Then /^he should see his profile page$/ do
  page.should have_selector('title', text: @gamer.name)
end

Then /^he should see a signout link$/ do
  page.should have_link('Sign out', href: signout_path)
end

