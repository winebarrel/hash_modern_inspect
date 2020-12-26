describe HashModernInspect do
  let(:hash) do
    {
      foo: ['FOO', {baz: 100}],
      bar: {zoo: 200},
      'xxx-yyy': :val,
      'hoge'=>'piyo'
    }
  end

  let(:args) { [] }

  subject { hash.send(described_class, *args) }

  describe :modern_inspect do
    it { is_expected.to eq '{foo: ["FOO", {baz: 100}], bar: {zoo: 200}, "xxx-yyy": :val, "hoge"=>"piyo"}' }

    context 'when space_inside_hash is true' do
      let(:args) { [{space_inside_hash: true}] }
      it { is_expected.to eq '{ foo: ["FOO", { baz: 100 }], bar: { zoo: 200 }, "xxx-yyy": :val, "hoge"=>"piyo" }' }
    end
  end

  describe :modern_inspect_without_brace do
    context 'when not empty' do
      it { is_expected.to eq 'foo: ["FOO", {baz: 100}], bar: {zoo: 200}, "xxx-yyy": :val, "hoge"=>"piyo"' }
    end

    context 'when empty' do
      let(:hash) { {} }
      it { is_expected.to eq '{}' }
    end

    context 'when allow empty' do
      let(:hash) { {} }
      let(:args) { [{allow_empty: true}] }
      it { is_expected.to be_empty }
    end

    context 'when space_inside_hash is true' do
      let(:args) { [{space_inside_hash: true}] }
      it { is_expected.to eq 'foo: ["FOO", { baz: 100 }], bar: { zoo: 200 }, "xxx-yyy": :val, "hoge"=>"piyo"' }
    end
  end
end
