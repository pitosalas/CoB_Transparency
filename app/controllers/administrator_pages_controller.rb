class AdministratorPagesController < ApplicationController
  def home

        #@gj = GeoJson.new(Sensor.all)
        #@sa = GeoJson.new(@sa.to_points)
        @sensors = Sensor.all
        @study_areas = StudyArea.all
        @layerInfo = layerInfoBuilder
        render 'administrator_pages/home'
  end

  def help


  end

  def about
    render 'administrator_pages/about'
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
