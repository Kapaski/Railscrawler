require 'thread'
require 'nokogiri'
require 'open-uri'
module YyHelper
  def open_page yy_url
    #yy_url = "http://www.yayaxz.com/"
    frame = Nokogiri::HTML(open(yy_url),nil,'UTF-8')
  end

  def parse_first_page eplist, yy_url

    frame = open_page(yy_url)

    frame.css('.resource-list-box, .resource-list-box-pic')
      .css('a[href*="/resource"]').each{|n|

        dl = Hash.new
        dl['name'] = n.text
        dl['link1'] = n['href']
        eplist['dls'] << dl
    }

    return eplist

  end

  def parse_episode_page ep, link

  frame = open_page(link)

  r1 = frame.css('.resource-list-box')[0]
  ep['name'] = frame.css("title").text()
  r1.css('dd[data-format="MP4"]').css('.odd, .resource-item').each {|epi|
    detail = Hash.new
    detail['type'] = epi.css('a.type').text
    detail['name'] = epi.css('a')[1].text
    detail['link1'] = epi.css('span a[data-download-type="-1"]')[0]['thunderhref']
    detail['link2'] = epi.css('span a')[1]['href']
    detail['link3'] = epi.css('span a')[0]['href']

    ep['dls'] << detail
  }
  r1.css('dd[data-format="DVD"]').css('.odd, .resource-item').each {|epi|
    detail = Hash.new
    detail['type'] = epi.css('a.type').text
    detail['name'] = epi.css('a')[1].text
    detail['link1'] = epi.css('span a[data-download-type="-1"]')[0]['thunderhref']
    detail['link2'] = epi.css('span a')[1]['href']
    detail['link3'] = epi.css('span a')[0]['href']
    ep['dls'] << detail
  } if r1.css('dd[data-format="DVD"]')

  r1.css('dd[data-format="720P"]').css('.odd, .resource-item').each {|epi|
    detail = Hash.new
    detail['type'] = epi.css('a.type').text
    detail['name'] = epi.css('a')[1].text
    detail['link1'] = epi.css('span a[data-download-type="-1"]')[0]['thunderhref']
    detail['link2'] = epi.css('span a')[1]['href']
    detail['link3'] = epi.css('span a')[0]['href']
    ep['dls'] << detail
  } if r1.css('dd[data-format="720P"]')

  r1.css('dd[data-format="1080P"]').css('.odd, .resource-item').each {|epi|
    detail = Hash.new
    detail['type'] = epi.css('a.type').text
    detail['name'] = epi.css('a')[1].text
    detail['link1'] = epi.css('span a[data-download-type="-1"]')[0]['thunderhref']
    detail['link2'] = epi.css('span a')[1]['href']
    detail['link3'] = epi.css('span a')[0]['href']
    ep['dls'] << detail
  } if r1.css('dd[data-format="1080P"]')




  end
end
