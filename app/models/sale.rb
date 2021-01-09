class Sale < ActiveRecord::Base

    def finished?
        end_on < Date.current
    end

    def upcoming?
        starts_on > Date.current
    end

    def active?
        !upcoming? && !finished?
    end
end