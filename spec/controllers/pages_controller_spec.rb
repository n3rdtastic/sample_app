require 'spec_helper'

describe PagesController do
  render_views

  describe "GET 'home'" do
    # test that the page exists
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    
    # test that the title is correct
    it "should have the right title" do
      get 'home'
      response.should have_selector("title",
        :content => "Ruby on Rails Tutorial Sample App | Home")
    end
  end

  describe "GET 'contact'" do
    # test that the page exists
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
    
    # test that the title is correct
    it "should have the right title" do
      get 'contact'
      response.should have_selector("title",
        :content => "Ruby on Rails Tutorial Sample App | Contact")
    end
  end
  
  describe "GET 'about'" do
    # test that the page exists
    it "should be successful" do
      get 'about'
      response.should be_success
    end
    
    # test that the title is correct
    it "should have the right title" do
      get 'about'
      response.should have_selector("title",
        :content => "Ruby on Rails Tutorial Sample App | About")
    end
  end
  
  # Test the Help page
  describe "GET 'help'" do
    # test that the page exists
    it "should be successful" do
      get 'help'
      response.should be_success
    end
    
    # test that the title is correct
    it "should have the right title" do
      get 'help'
      response.should have_selector("title",
        :content => "Ruby on Rails Tutorial Sample App | Help")
    end
  end # end of Help page tests

end
