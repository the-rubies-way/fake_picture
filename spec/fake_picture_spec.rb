# frozen_string_literal: true

RSpec.describe FakePicture do
  it 'has a version number' do
    expect(FakePicture::VERSION).not_to be(nil)
  end

  describe described_class::Base do
    context 'methods' do
      context 'self.random_file' do
        it 'returns the path to random file, if path correct' do
          path_to_file = described_class.random_file("#{__dir__}/files/*")

          expect(path_to_file).not_to be_falsey
          expect(path_to_file).to match(/\w+/)
          expect(File.file?(path_to_file)).to be_truthy
          expect(File.exist?(path_to_file)).to be_truthy
          expect(File.readable?(path_to_file)).to be_truthy
        end

        it 'returns random file by extension, if the path correct' do
          path_to_file = described_class.random_file("#{__dir__}/files/*.doc")

          expect(path_to_file).not_to be_falsey
          expect(path_to_file).to include('.doc')
          expect(File.file?(path_to_file)).to be_truthy
          expect(File.exist?(path_to_file)).to be_truthy
          expect(File.readable?(path_to_file)).to be_truthy
        end
      end

      context 'self.initialize_fake_picture_methods' do
        context 'invalid parameters' do
          it 'returns error if pack folder not exists or empty' do
            expect do
              class TestClass < described_class
                initialize_fake_picture_methods(:test)
              end
            end.to raise_error(RuntimeError, 'Pack folder doesn\'t exist or empty')
          end

          it 'creates the methods' do
            expect(described_class).to receive(:check_pack_directory_readiness)
            class TestClass < described_class
              initialize_fake_picture_methods(:test, :test_2)
            end

            expect(TestClass).to respond_to(:test)
            expect(TestClass).to respond_to(:test_2)
          end
        end
      end
    end
  end
end
