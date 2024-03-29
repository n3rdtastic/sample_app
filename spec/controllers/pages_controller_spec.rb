require 'spec_helper'

describe PagesController do
  render_views

  # create a @base_title variable for use in the tests
  before(:each) do
    @base_title = "Ruby on Rails Tutorial Sample App"
  end
  
  describe "GET 'home'" do
    
    describe "when not signed in" do
      before(:each) do
        get :home
      end
      
      # test that the page exists
      it "should be successful" do
        response.should be_success
      end
      
      # test that the title is correct
      it "should have the right title" do
        response.should have_selector("title",
          :content => @base_title + " | Home")
      end
    end # not signed in
    
    describe "when signed in" do
    
      before(:each) do
        @user = test_sign_in(Factory(:user))
        other_user = Factory(:user, :email => Factory.next(:email))
        other_user.follow!(@user)
      end
      
      it "should have the right follower/following counts" do
        get :home
        response.should have_selector("a", :href => following_user_path(@user),
                                           :content => "0 following")
        response.should have_selector("a", :href => followers_user_path(@user),
                                           :content => "1 follower")
      end
    end # signed in
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
        :content => @base_title + " | Contact")
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
        :content => @base_title + " | About")
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
        :content => @base_title + " | Help")
    end
  end # end of Help page tests

end
