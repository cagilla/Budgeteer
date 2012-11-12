class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  before_filter :link_return
  
  # FROM: http://ethilien.net/archives/better-redirects-in-rails/

	def redirect_to_index(msg = nil)
	  flash[:notice] = msg if msg
	  redirect_to :action => 'index'
	end
	def flash_redirect(msg, *params)
	  flash[:notice] = msg
	  redirect_to(*params)
	end

    # redirect somewhere that will eventually return back to here
	def redirect_away(*params)
	  session[:original_uri] = request.request_uri
	  redirect_to(*params)
	end

	# returns the person to either the original url from a redirect_away or to a default url
	def redirect_back(*params)
	  uri = session[:original_uri]
	  session[:original_uri] = nil
	  if uri
	    redirect_to uri
	  else
	    redirect_to(*params)
	  end
	end

private

	# handles storing return links in the session
	def link_return
	  if params[:return_uri]
	    session[:original_uri] = params[:return_uri]
	  end
	end

end
