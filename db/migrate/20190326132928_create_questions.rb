class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :code, null: false
      t.string :answer, null: false
    end

    Question.create(code: 'opening', answer: 'Nous sommes ouverts de 8h à 18h, tous les jours.')
    Question.create(code: 'shift', answer: 'Nous vous demandons de faire 3 shifts de 2h par mois.')
    Question.create(code: 'location', answer: 'Le magasin se trouve au 65 Boulevard de Charonne, dans le 11e arrondissement à Paris.')
  end
end
