class UserPagesController < ApplicationController
  def home

        #@gj = GeoJson.new(Sensor.all)
        #@sa = GeoJson.new(@sa.to_points)
        @sensors = Sensor.all
        @layerInfo = layerInfoBuilder
        render 'user_pages/home'
  end

  def help


  end

  def about
    render 'user_pages/about'
  end

  def contact
  end
  def layerInfoBuilder
    layers = [
        {"layerID" => "sensor_loc", "layerName" => "Clusters"},
        {"layerID" => "unclustered-point", "layerName" => "Sensors"},
        {"layerID" => "sensor_loc_count", "layerName" => "# of Sensors"},
        {"layerID" => "neighborhood_fill", "layerName" => "Boston Neighborhoods"},
        {"layerID" => "neighborhood_line", "layerName" => "Neighborhood Boundaries"}
    ]   
end
end
