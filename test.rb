require "rubygems"
require "adhearsion"
require "adhearsion/voip/asterisk/manager_interface"
require "csv"

include Adhearsion::VoIP::Asterisk::Manager

def dial(csv)
    CSV.foreach(csv, :row_sep => :auto) do |row|
      
       asterisk = ManagerInterface.connect :host => '127.0.0.1', :events => true, :username => 'ahn_ami',   :password => 'jackson'
       row.each do |a|
          #asterisk.send_action_asynchronously("originate", headers ={:channel => "SIP/"+"#{a}"+"@switchvox", :context => "internal", :priority => "1", :extension => "160", :async => "true", :application => "playback", :data => "vm-toforward"})
          asterisk.introduce("SIP/08132241903@switchvox", "SIP/"+"#{a}"+"@switchvox",  opts = {:context => "internal", :priority => "1", :async => "true", :a => "vm-toforward"})
       end
    end

end
dial("a.csv")
