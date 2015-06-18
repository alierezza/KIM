class CreateLkps < ActiveRecord::Migration
  def change
    create_table :lkps do |t|
        t.references :user

    	t.datetime :tanggal_kejadian
    	t.string :jam_kejadian
    	t.string :lokasi_kejadian
    	t.string :bentuk_kejadian #radio button. ada 6 pilihan
    	t.text :kronologis
    	t.text :sebab_kecelakaan
    	t.string :korban
    	t.string :kerugian_materi
    	t.string :gangguan_operasi
    	t.text :upaya_penanggulangan
    	t.text :saran_pencegahan

      t.timestamps null: false
    end
  end
end
