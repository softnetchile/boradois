class CreateHospedes < ActiveRecord::Migration
  def self.up
    create_table :hospedes do |t|
      t.string :nome
      t.string :endereco
      t.date :nascimento
      t.string :pais
      t.string :sexo
      t.string :estCivil

      t.timestamps
    end
  end

  def self.down
    drop_table :hospedes
  end
end
