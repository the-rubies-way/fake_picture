# frozen_string_literal: true

RSpec.describe FakePicture::Blog do
  context 'methods' do
    context ':preview' do
      let(:path_to_picture) { described_class.preview }

      it 'has this method' do
        expect(described_class).to respond_to(:preview)
      end

      it 'returns path to file' do
        expect(path_to_picture).to include('preview')
      end
    end

    context ':preview_file' do
      let(:file) { described_class.preview_file }

      it 'has this method' do
        expect(described_class).to respond_to(:preview_file)
      end

      it 'returns file' do
        expect(File.file?(file)).to be_truthy
        expect(File.exist?(file)).to be_truthy
        expect(File.readable?(file)).to be_truthy
        expect(File.basename(file)).to include('preview')
      end
    end
  end
end
