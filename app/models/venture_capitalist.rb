class VentureCapitalist
    attr_accessor :name, :total_worth
    @@all = []

    def initialize(name, total_worth)
        @name = name.to_s
        @total_worth = total_worth.to_f

        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select do |venture_capitalist|
            venture_capitalist.total_worth > 1000000000
        end
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end
    
    def funding_rounds
        FundingRound.all.select do |funding_rounds|
            funding_rounds.venture_capitalist == self
        end
    end

    def portfolio
        all_funded = funding_rounds.map do |funding_rounds|
            funding_rounds.startup
        end

        all_funded.uniq
    end

    def biggest_investment
        funding_rounds.max do |a, b|
            a.investment <=> b.investment
        end
    end

    def invested(domain)
        domain_rounds = funding_rounds.select do |funding_rounds|
            funding_rounds.startup.domain == domain
        end

        domain_investments = domain_rounds.map do |domain_round|
            domain_round.investment
        end

        domain_investments.sum(0.0)
    end

end
