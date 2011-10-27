require 'spec_helper'

describe "LayoutLinks" do
  
  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end
  
  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Contact")
  end
  
  it "should have an About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end
  
  it "should have a Help page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => "Help")
  end
  
  it "should have a Sign up page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Sign up")
  end
  
  it "should have the right links on the layout" do
    visit root_path # links under test are on all pages so just pick one to test
    
    # test the "About" link
    click_link "About"
    response.should have_selector('title', :content => "About")
    
    # test the "Help" link
    click_link "Help"
    response.should have_selector('title', :content => "Help")
    
    # test the "Contact" link
    click_link "Contact"
    response.should have_selector('title', :content => "Contact")
    
    # test the "Home" link
    click_link "Home"
    response.should have_selector('title', :content => "Home")
    
    # test the "Sign up now!" link
    click_link "Sign up now!"
    response.should have_selector('title', :content => "Sign up")
  end # end "should have the right links on the layout"
end
