module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "Ruby on Rails Tutorial Sample App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end # end if/else
  end # end title helper
  
  # Return the logo for the site
  def logo
    image_tag("logo.png", :alt => "Sample App", :class => "round")
  end #end logo helper
end # end module ApplicationHelper
