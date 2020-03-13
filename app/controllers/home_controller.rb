class HomeController < ApplicationController
    def home

        #@gj = GeoJson.new(Sensor.all)
        #@sa = GeoJson.new(@sa.to_points)
        @sensors = Sensor.all
        @study_areas = StudyArea.all
        @points = Point.all
        @layerInfo = layerInfoBuilder
        render 'home/index'
    end

    def get_studyArea
        @study_areas = StudyArea
        render json: @study_areas.as_json
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

#app/lib/geo_json.rb PORO
#class GeoJson
 #   def initialize(points)
 #   end

#    def to_geo_json
#    end
#end

#maps.html.erb
#<%= @gj.to_geo_json %>

#class StudyArea
   # def to_points
    #    ... [Point, Point, Point]
    #end


