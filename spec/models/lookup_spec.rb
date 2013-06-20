require 'spec_helper'

# All of these should use mocks through the netid_interface and just
# check response

describe Lookup do
  context "#validate_netid" do
    it "returns true on valid netID"
    it "returns false on invalid netid"
  end

  context "#check_for_mysql" do
    it "checks for mysql"
  end

  context "#get_processes" do
    it "gets processes"
  end

  context "#check_for_localhome" do
    it "checks for localhome"
  end

  context "#check_webtype" do
    it "checks for webtype"
  end

  context "#check_quota" do
    it "checks quota"
  end
end
