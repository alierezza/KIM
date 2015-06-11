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
        [{:content => "- Hubungi 031 - 999 9999 jika ada yang kurang jelas", :size => 8}],
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
  end
end
