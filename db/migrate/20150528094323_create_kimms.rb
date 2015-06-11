class CreateKimms < ActiveRecord::Migration
  def change
    create_table :kimms do |t|
      t.references :user

      t.string :jenis_sim #b1 atau b2
      t.datetime :masa_berlaku_sim
      t.datetime :masa_berlaku_stnk
      t.datetime :masa_berlaku_kir
      t.datetime :masa_berlaku_tera
      t.string :no_polisi
      t.string :tipe
      t.string :kapasitas
      t.boolean :admin_approval #jika di approve admin
      t.boolean :crew_approval #jika di approve crew
      t.string :message
      t.string :admin_approved_by
      t.string :crew_approved_by
      t.string :no_registrasi
      t.string :merek_kendaraan

      t.datetime :expired_date, :default=>nil

      t.timestamps null: false
    end
  end
end
