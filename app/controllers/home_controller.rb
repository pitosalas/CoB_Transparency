class HomeController < ApplicationController
    def home

        #@gj = GeoJson.new(Sensor.all)
        #@sa = GeoJson.new(@sa.to_points)
        @sensors = Sensor.all
        @study_areas = StudyArea.all
        
        render 'home/index'
    end

    def get_studyArea
        @study_areas = StudyArea
        render json: @study_areas.as_json
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


