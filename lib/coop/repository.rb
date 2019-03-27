module Coop
  class Repository
    def get_answer(code:)
      questions[code]
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
