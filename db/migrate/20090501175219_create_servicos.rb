class CreateServicos < ActiveRecord::Migration
  def self.up
    create_table :servicos do |t|
      t.string :nome
      t.float :valor
      t.text :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :servicos
  end
end
