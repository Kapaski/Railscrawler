class YyController < ApplicationController
  include YyHelper
  def show
    self.index
  end

  def index

    @ep = Hash.new
    @ep['rooturl'] =  "http://www.yayaxz.com/"
    @ep['dls'] = Array.new
    @ep['now'] = current_time
    parse_first_page(@ep,@ep['rooturl'])
    # puts @ep
    return @ep

  end

end #yy_controler class

