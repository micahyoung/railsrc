require 'tmpdir'

describe 'railsrc' do
  it 'generates a new app' do
    Dir.mktmpdir do |dir|
      rails_dir = "#{dir}/foo"
      railsrc_path = File.join(File.dirname(__FILE__), "../railsrc")

      expect(system(<<-SH)).to eql true
        rails new "#{rails_dir}" --rc=#{railsrc_path} --template=#{railsrc_path} --database=sqlite3 --skip-spring --skip-bundle
        cd "#{rails_dir}"
        rails g model Bar name:string
        rails g controller Bars index
        rake db:migrate
        rspec spec/models/bar_spec.rb \
              spec/controllers/bars_controller_spec.rb
      SH
    end
  end
end
