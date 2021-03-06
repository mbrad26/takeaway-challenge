require 'menu'

describe Menu do
  subject { described_class.new }

  let(:qty) { instance_of Integer }

  it { is_expected.to respond_to(:print_menu) }
  it { is_expected.to respond_to(:add_dish_to_menu).with(2).arguments }
  it { is_expected.to respond_to(:remove_dish_from_menu).with(1).arguments }

  it 'stores a menu of dishes and prices' do
    dishes = { 'Fish & Chips' => 4, 'Burger' => 3, 'Shawarma' => 5 }

    expect(subject.menu_list).to eq dishes
  end

  describe '#print_menu' do
    it 'returns the menu' do
      expect(subject.print_menu).to eq 'Fish & Chips £4, Burger £3, Shawarma £5'
    end
  end

  describe '#add_dish_to_menu' do
    it 'adds a new dish to menu' do
      expect { subject.add_dish_to_menu('Mititei', qty) }
      .to change { subject.menu_list }.to include({ 'Mititei' => qty })
    end

    context 'when a dish already exists' do
      it 'raises an error' do
        expect { subject.add_dish_to_menu('Burger', qty) }
        .to raise_error 'Burger already part of the menu!'
      end
    end
  end

  describe '#remove_dish_from_menu' do
    it 'removes a dish from menu' do
      subject.add_dish_to_menu('Mititei', qty)
      subject.remove_dish_from_menu('Mititei')

      expect(subject.menu_list.has_key? 'Mititei').to be_falsey
    end
  end
end
