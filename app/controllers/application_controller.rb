class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :all_author, :all_authors_options


  protected

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Get all authors
  def all_authors
    Author.all
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Generate author array for options
  def all_authors_options
    all_authors.map{|a| [a.name, a.id] }
  end
end
