class HomeController < ApplicationController
    def home
        @sensors = Sensor.all
        @study_areas = StudyArea.all
        render 'home/index'
    end
end
