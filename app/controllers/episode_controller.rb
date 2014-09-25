class EpisodeController < ApplicationController
  include YyHelper
  def index

    link = params[:link]
    link_url ="http://www.yayaxz.com"+link

    @ep = Hash.new
    @ep['dls'] = Array.new
    @ep['now'] = current_time
    parse_episode_page(@ep,link_url)
    # puts @ep
    return @ep


  end
end
