require 'rails_helper'

describe 'check visit db' do

    before { @visit = Visit.new(ip: "0.0.0.0", browser: "Linux",browser_version:"123",os_name:"Linux",os_version:"121",devise:"Mobile") }

    subject { @visit }

    it { should respond_to(:ip) }
    it { should respond_to(:browser) }
    it { should respond_to(:browser_version) }
    it { should respond_to(:os_name) }
    it { should respond_to(:os_version) }
    it { should respond_to(:devise) }

  end
