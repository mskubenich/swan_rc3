class Admin::StatisticsController < AdminController


  def index
      @devices = Visit.order('devise').group_by{|v| v.devise }.map{|k, v| [(k), v.size] }
      gon.devices = @devices
    end
  end