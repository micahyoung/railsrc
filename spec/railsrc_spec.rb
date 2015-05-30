require 'tmpdir'

describe 'railsrc' do
  it 'generates a new app' do
    Dir.mktmpdir do |dir|
      rails_dir = "#{dir}/foo"
      railsrc_path = File.join(File.dirname(__FILE__), "../railsrc")

      expect(system(<<-SH)).to eql true
        rails new "#{rails_dir}" --rc=#{railsrc_path} --database=sqlite3
        cd "#{rails_dir}"
        bundle install
        rails g controller Bar index
        rails g model Baz name:string
        rake db:migrate
        rspec spec/controllers/bar_controller_spec.rb \
              spec/models/baz_spec.rb
      SH
    end
  end
end
