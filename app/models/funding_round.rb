class FundingRound
    attr_reader :startup, :venture_capitalist, :investment # because there's a custom writer class for investment
    attr_accessor :type
    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type.to_s
        if investment.to_f >= 0.0
            @investment = investment
        end

        self.class.all << self

    end

    def investment=(investment)
        if investment.to_f >= 0.0
            @investment = investment
        end
    end

    def self.all
        @@all
    end

end
