module Coop
  class Repository
    attr_reader :scheduled_months

    def initialize
      current_month = Date.current.month
      @scheduled_months = [current_month + 1, current_month + 3, current_month + 5]
    end

    def get_answer(code:)
      questions[code]
    end

    def get_user(code:)
      code
    end

    def auth_user
      SecureRandom.hex
    end

    def scheduled_months_for(user:)
      @scheduled_months
    end

    def schedule(user:, date:)
      month = date.month
      @scheduled_months = (scheduled_months << month).uniq
    end

    private

    def questions
      {
        shift: 'Nous vous demandons de faire 1 shift de 2h par mois.',
        location: 'Le magasin se trouve au 65 Boulevard de Charonne, dans le 11e arrondissement à Paris.',
        opening: 'Nous sommes ouverts de 8h à 18h, tous les jours.'
      }
    end
  end
end
