require 'spec_helper'

# All of these should use mocks through the netid_interface and just
# check response

describe Lookup do
  before do
    @request_object = Lookup.new("nikky")
  end
  context "#validate_netid" do
    it "returns true on valid netID" do
      @request_object.netid_interface.should_receive(:validate_netid?).and_return(true)
      @request_object.validate_netid.should be_true
    end
    it "returns false on invalid netid" do
      @request_object.netid_interface.should_receive(:validate_netid?).and_return(false)
      @request_object.validate_netid.should be_false
    end
  end

  context "#check_for_mysql" do
    it "returns hosts array" do
      @request_object.netid_interface.stub(:check_for_mysql_presence).and_return(true)
      @request_object.check_for_mysql.size.should eq 4
    end
    it "returns false if no MySQL" do
      @request_object.netid_interface.stub(:check_for_mysql_presence).and_return(false)
      @request_object.check_for_mysql.should be_false
    end
  end

  context "#get_processes" do
    it "gets processes"
  end

  context "#check_for_localhome" do
    it "returns a host if localhome" do
      @request_object.netid_interface.stub(:check_for_localhome).and_return("ovid02")
      @request_object.check_for_localhome.should eq "ovid02"
    end
    it "returns false if no localhome" do
      @request_object.netid_interface.stub(:check_for_localhome).and_return(false)
      @request_object.check_for_localhome.should be_false
    end
  end

  context "#check_webtype" do
    it "returns an array" do
      @request_object.netid_interface.stub(:check_webtype).and_return(%w(depts staff))
      @request_object.check_webtype.should eq %w(depts staff)
    end
  end

  context "#check_quota" do
    it "checks quota"
  end
end
