module SalesHelper

    def active_sale?
        Sale.active.any?
        @sale = Sale.active.first
    end
    
end
