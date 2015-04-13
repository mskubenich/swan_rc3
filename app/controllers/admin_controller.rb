class AdminController < ApplicationController
  def statistics
    gon.browser_firefox =  Visit.where(browser: 'Firefox').count
    gon.browser_chrome =  Visit.where(browser: 'Chrome').count
    gon.browser_opera =  Visit.where(browser: 'Opera').count
    gon.browser_msie =  Visit.where(browser: 'MSIE').count
    gon.browser_safari =  Visit.where(browser: 'Safari').count
    gon.browser_chrome_categories = Visit.where(browser: 'Chrome').order('browser_version').group_by{|v| v.browser_version}.map{|k,v|('Chrome '+k)}
    gon.browser_chrome_versions = Visit.where(browser: 'Chrome').order('browser_version').group_by{|v| v.browser_version}.map{|k,v| v.count}
    gon.browser_firefox_categories = Visit.where(browser: 'Firefox').order('browser_version').group_by{|v| v.browser_version}.map{|k,v|('Firefox '+k)}
    gon.browser_firefox_versions = Visit.where(browser: 'Firefox').order('browser_version').group_by{|v| v.browser_version}.map{|k,v| v.count}
    gon.browser_opera_categories = Visit.where(browser: 'Opera').order('browser_version').group_by{|v| v.browser_version}.map{|k,v|('Opera '+ k)}
    gon.browser_opera_versions = Visit.where(browser: 'Opera').order('browser_version').group_by{|v| v.browser_version}.map{|k,v| v.count}
    gon.browser_safari_categories = Visit.where(browser: 'Safari').order('browser_version').group_by{|v| v.browser_version}.map{|k,v|('Safari '+ k)}
    gon.browser_safari_versions = Visit.where(browser: 'Safari').order('browser_version').group_by{|v| v.browser_version}.map{|k,v| v.count}
    gon.browser_msie_categories = Visit.where(browser: 'MSIE').order('browser_version').group_by{|v| v.browser_version}.map{|k,v|('MSIE '+k)}
    gon.browser_msie_versions = Visit.where(browser: 'MSIE').order('browser_version').group_by{|v| v.browser_version}.map{|k,v| v.count}
  end
end
