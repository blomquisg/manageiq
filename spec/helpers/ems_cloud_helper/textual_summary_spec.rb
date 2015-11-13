require "spec_helper"

describe EmsCloudHelper do
  context "#textual_instances and #textual_images" do
    def role_allows(_)
      true
    end

    before do
      @ems = FactoryGirl.create(:ems_openstack, :zone => FactoryGirl.build(:zone))
      controller.stub(:restful?).and_return(true)
      controller.stub(:controller_name).and_return("ems_cloud")
    end

    it "sets restful path for instances in summary for restful controllers" do
      FactoryGirl.create(:vm_openstack, :ems_id => @ems.id)

      expect(textual_instances[:link]).to eq("/ems_cloud/#{@ems.id}?display=instances")
    end

    it "sets restful path for images in summary for restful controllers" do
      FactoryGirl.create(:template_cloud, :ems_id => @ems.id)

      expect(textual_images[:link]).to eq("/ems_cloud/#{@ems.id}?display=images")
    end
  end
end
