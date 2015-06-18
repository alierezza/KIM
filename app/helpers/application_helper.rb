module ApplicationHelper

	class CetakPDF < Prawn::Document
		include ActionView::Helpers::AssetUrlHelper

    def print_pdf_registrasi(kim)
      font_size 9

      # image_dimensions = Paperclip::Geometry.from_file("pertamina.jpg")
      # img_height = image_dimensions[1].to_f / 50
      # img_width = image_dimensions[0].to_f / img_height

      # image logo, header pdf
      table([[
        {:content => ""}
      ]],:cell_style => {:height => 50,:inline_format => true, :margin => -1000, :borders => [], :background_color => "F20000"}, :width => bounds.width)

      perihal = make_table([
        [{:content => "", :borders => [] }],
        [{:content => "", :height => 7, :borders => []}],
        [{:content => "", :height => 7, :borders => []}],
        [{:content => "<b>PERIHAL NOMOR REGISTRASI</b>", :align => :center, :borders => []}]
      ],:cell_style => {:inline_format => true, :size => 11}, :width => bounds.width - 300)

      move_down 70
      table([[
        {:image => "#{Rails.root}/app/assets/images/pertamina.jpg", :image_height => 50},
        {:content => perihal}
      ]],:cell_style => {:inline_format => true, :padding_left=> 40, :borders => []}, :width => bounds.width)

      move_down 25
      table([
        [{:content => "PT. Pertamina (Persero)", :font_style => :bold, :size => 12},
        	{:content => "#{kim.user.nama.capitalize}", :font_style => :bold, :size => 12, :align => :right, :padding_right => 50}
        	],
        [{:content => "Domestic Gas Region V Depot LPG Tanjung Perak"},
        	{:content => "#{kim.user.alamat}", :align => :right, :padding_right => 50}
        	],
        [{:content => "Jl. Nilam Barat 37 Tanjung Perak Surabaya"},
        	{:content => "#{kim.user.telp}", :align => :right, :padding_right => 50}
        	],
        [{:content => "Telpon : 031 - 328 1556 / 1574"},
        	{:content => "#{kim.user.fax}", :align => :right, :padding_right => 50}
        	],
        [{:content => "Fax : 031 - 329 4215"}],
      ],:cell_style => {:inline_format => true, :padding_left => 50, :padding_top => 0,:padding_bottom => 2,:borders => []}, :width => bounds.width)

      move_down 40
      table([[
        {:content => "<font_size='14'>NOMOR REGISTRASI ANDA</font>"}
      ]],:cell_style => {:inline_format => true, :padding_left => 50, :borders => []}, :width => bounds.width)

      move_down 20
      table([[
        {:content => "#{kim.no_registrasi}", :font_style => :bold, :size => 25, :text_color => "F20000",:align => :center }
      ]],:cell_style => {:inline_format => true, :padding_left => 50, :borders => []}, :width => bounds.width)

      move_down 25
      table([
        [{:content => "Ketentuan", :font_style => :bold, :size => 10}],
        [{:content => "- Silahkan membawa print nomor registrasi ini ke crew LTMS di l. Nilam Barat 37 Tanjung Perak Surabaya untuk checklist kendaraan dan tindakan lebih lanjut", :size => 8}],
        [{:content => "- Jangan lupa membawa dokumen terkait apabila nanti terkait", :size => 8}],
        [{:content => "- Hubungi (031)- 328 1556 / 1574 jika ada yang kurang jelas", :size => 8}],
      ],:cell_style => {:inline_format => true, :padding_left => 50, :padding_top => 0, :padding_right => 50,:borders => []}, :width => bounds.width)

      move_down 50
      table([[
        {:content => "Terima Kasih telah Melakukan Pendaftaran KIM Melalui Web Terintegrasi LTMS Pertamina", :font_style => :bold, :size => 11, :align => :center }
      ]],:cell_style => {:inline_format => true, :padding => 0,:padding_right => 15, :borders => []}, :width => bounds.width)

      move_down 80
      table([[
      	{:content => ""},
      	{:content => ""},
      	{:content => ""},
      	{:content => ""},
      	{:content => ""},
      	{:content => ""},
        {:image => "#{Rails.root}/app/assets/images/pertamina.jpg", :image_height => 50, :padding_right => 50},
      ]],:cell_style => {:inline_format => true, :padding => 0, :borders => []}, :width => bounds.width)

      move_down 108
      table([[
        {:content => ""}
      ]],:cell_style => {:height => 50,:inline_format => true, :margin => -1000, :borders => [], :background_color => "F20000"}, :width => bounds.width)
    end

    def print_pdf(kim)
      footer_top = 748

      bounding_box([bounds.left, bounds.top], :width  => bounds.width, :height => bounds.height) do
        print_pdf_registrasi(kim)
      end
      # binding.pry
      render
    end

    def print_kim(kim)
      bounding_box([bounds.left, bounds.top], :width  => bounds.width, :height => bounds.height) do
        print_pdf_kim(kim)
      end
      # binding.pry
      render
    end

    def print_pdf_kim(kim)
      font_size 9

      move_down 194
      image "public/depan.png",:at => [0,498.2]

      data1 = make_cell(:content => kim.no_registrasi)
      data2 = make_cell(:content => kim.no_polisi)
      data3 = make_cell(:content => kim.tipe + " " + kim.kapasitas)
      data4 = make_cell(:content => kim.merek_kendaraan)
      if kim.tipe == "Truck"
        data5 = make_cell(:content => "LPG")
      elsif kim.tipe == "Skid Tank"
        data5 = make_cell(:content => "Musicool")
      end
      data6 = make_cell(:content => kim.user.nama)
      data7 = make_cell(:content => "<b><color rgb='D00000' >#{kim.expired_date.strftime('%d-%m-%Y')}</color></b>")

      table([ [data1],
              [data2],
              [data3],
              [data4],
              [data5],
              [data6],                                                                                                        
              [data7]],  :cell_style => {:inline_format => true, :border_color => "FFFFFF", :padding=>[4.8,0,0,40] }, :position => :center)

      move_down 3
      table([["#{kim.updated_at.strftime('%d-%m-%Y')}"]],  :cell_style => {:inline_format => true, :border_color => "FFFFFF",:padding=>[5.5,0,0,175] }, :position => :center )


      data = [[""]]
      data += [["<color rgb='FFFFFF'>.</color>"]] * 10
      table(data,:cell_style => {:inline_format => true, :border_width=>0, :padding=>[0,-10,20,0]}, :position=>:right)

      


      image "public/belakang.png",:at => [0,498.2]

      font_size 19
      move_down -65
      table([["<b><color rgb='D00000' >#{kim.expired_date.strftime('%d-%m-%Y')}</color></b>"]],:cell_style => {:inline_format => true,:border_width=>0, :padding=>[0,0,0,215] })


      font_size 10
      move_down -1
      table([["#{kim.masa_berlaku_kir.strftime('%d-%m-%Y')}", "#{kim.masa_berlaku_stnk.strftime('%d-%m-%Y')}", "#{kim.masa_berlaku_sim.strftime('%d-%m-%Y')}"]],:cell_style => {:border_width=>0, :padding=>[4,5,0,45] }, :position=>:center)
      if kim.masa_berlaku_kir_skid_tank != nil
        table([["Skid Tank: #{kim.masa_berlaku_kir_skid_tank.strftime('%d-%m-%Y')}"]],:cell_style=>{:padding=>[-2.6,0,0,25], :border_width=>0})
      end
    end
  end
end
