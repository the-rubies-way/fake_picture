# frozen_string_literal: true

RSpec.describe FakePicture::Blog do
  context 'methods' do
    context ':day_street' do
      let(:path_to_picture) { described_class.day_street }

      it 'has this method' do
        expect(described_class).to respond_to(:day_street)
      end

      it 'returns path to file' do
        expect(path_to_picture).to include('day_street')
      end
    end

    context ':day_street_file' do
      let(:file) { described_class.day_street_file }

      it 'has this method' do
        expect(described_class).to respond_to(:day_street_file)
      end

      it 'returns file' do
        expect(File.file?(file)).to be_truthy
        expect(File.exist?(file)).to be_truthy
        expect(File.readable?(file)).to be_truthy
        expect(File.basename(file)).to include('day_street')
      end
    end
  end
end
