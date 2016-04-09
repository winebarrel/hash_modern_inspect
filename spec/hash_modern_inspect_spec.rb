describe HashModernInspect do
  let(:hash) do
    {
      foo: ['FOO', {baz: 100}],
      bar: {zoo: 200},
      'xxx-yyy': :val,
      "hoge"=>"piyo"
    }
  end

  context 'when dump modern format' do
    it do
      expect(hash.modern_inspect).to eq '{foo: ["FOO", {baz: 100}], bar: {zoo: 200}, "xxx-yyy": :val, "hoge"=>"piyo"}'
    end
  end

  context 'when dump without brace' do
    it do
      expect(hash.modern_inspect_without_brace).to eq 'foo: ["FOO", {baz: 100}], bar: {zoo: 200}, "xxx-yyy": :val, "hoge"=>"piyo"'
    end
  end
end
