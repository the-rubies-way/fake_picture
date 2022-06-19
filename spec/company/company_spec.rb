# frozen_string_literal: true

RSpec.describe FakePicture::Company do
  context 'methods' do
    context ':logo' do
      let(:path_to_picture) { described_class.logo }

      it 'has this method' do
        expect(described_class).to respond_to(:logo)
      end

      it 'returns path to file' do
        expect(path_to_picture).to include('logo')
      end
    end

    context 'self.file(:logo)' do
      let(:file) { described_class.file(:logo) }

      it 'has this method' do
        expect(described_class).to respond_to(:file)
      end

      it 'returns file' do
        expect(File.file?(file)).to be_truthy
        expect(File.exist?(file)).to be_truthy
        expect(File.readable?(file)).to be_truthy
        expect(File.basename(file)).to include('logo')
      end
    end
  end
end
