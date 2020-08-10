class Startup
    attr_reader :name, :founder, :domain
    @@all = []

    def initialize(name, founder, domain)
        @name = name.to_s
        @founder = founder.to_s
        @domain = domain.to_s

        self.class.all << self
    end

    def self.all
        @@all
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.find_by_founder(name)
        self.all.find do |startup|
            startup.founder == name
        end
    end

    def self.domains
        self.all.map do |startup|
            startup.domain
        end
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def funding_rounds
        FundingRound.all.select do |funding_round|
            funding_round.startup == self
        end
    end

    def num_funding_rounds
        funding_rounds.length
    end

    def total_funds
        investments = funding_rounds.map do |funding_round|
            funding_round.investment
        end 

        investments.sum(0.0)
    end

    def investors
        all_investors = funding_rounds.map do |funding_round|
            funding_round.venture_capitalist
        end

        all_investors.uniq
    end

    def big_investors
        investors.select do |investor|
            VentureCapitalist.tres_commas_club.include?(investor)
        end
    end

end
