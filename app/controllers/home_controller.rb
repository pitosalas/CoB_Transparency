class HomeController < ApplicationController
    def home
        @sensors = Sensor.all
        render 'home/index'
    end
end
