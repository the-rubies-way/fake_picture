# frozen_string_literal: true

RSpec.describe 'FakePicture::Base.download' do
  context 'URL building' do
    it 'builds correct URL for picsum service' do
      url = FakePicture::Base.send(:build_url, 200, 300, :picsum, nil, false)
      expect(url).to eq('https://picsum.photos/200/300')
    end

    it 'builds correct URL for picsum with grayscale' do
      url = FakePicture::Base.send(:build_url, 200, 300, :picsum, nil, true)
      expect(url).to eq('https://picsum.photos/200/300?grayscale')
    end

    it 'builds correct URL for loremflickr service' do
      url = FakePicture::Base.send(:build_url, 200, 300, :loremflickr, nil, false)
      expect(url).to eq('https://loremflickr.com/200/300/all')
    end

    it 'builds correct URL for loremflickr with grayscale' do
      url = FakePicture::Base.send(:build_url, 200, 300, :loremflickr, nil, true)
      expect(url).to eq('https://loremflickr.com/g/200/300/all')
    end

    it 'builds correct URL for loremflickr with query' do
      url = FakePicture::Base.send(:build_url, 200, 300, :loremflickr, 'nature', false)
      expect(url).to eq('https://loremflickr.com/200/300/nature')
    end

    it 'raises error for unsupported service' do
      expect do
        FakePicture::Base.send(:build_url, 200, 300, :unsupported, nil, false)
      end.to raise_error(ArgumentError, /Unsupported service/)
    end
  end

  context 'download method' do
    it 'responds to download' do
      expect(FakePicture::Base).to respond_to(:download)
    end
  end
end
