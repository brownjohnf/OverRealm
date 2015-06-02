namespace :got do
  desc "Put in some demo data"
  task :seed => :environment do
    Place.delete_all
    [{
      slug: 'winterfell',
      name: 'Winterfell',
    },{
      slug: 'pentos',
      name: 'Pentos',
    },{
      slug: 'casterly-rock',
      name: 'Casterly Rock',
    },{
      slug: 'kings-landing',
      name: "King's Landing",
    },{
      slug: 'dragonstone',
      name: "Dragonstone",
    }].each do |place|
      Place.find_by(slug: place[:slug]) ||
      Place.create!(place)
    end

    Character.delete_all
    [{
      slug: 'eddard-stark',
      name: 'Eddard Stark',
      house: 'Stark',
    },{
      slug: 'sansa-stark',
      name: 'Sansa Stark',
      house: 'Stark',
    },{
      slug: 'jaime-lannister',
      name: 'Jaime Lannister',
      house: 'Lannister',
    },{
      slug: 'illyn-payne',
      name: "Illyn Payne",
      house: 'Payne',
    },{
      slug: 'illyrio-mopatis',
      name: "Illyrio Mopatis",
    },{
      slug: 'danaerys-targaryen',
      name: "Danaerys Targaryen",
      house: 'Targaryen',
    },{
      slug: 'visaerys-targaryen',
      name: "Visaerys Targaryen",
      house: 'Targaryen',
    },{
      slug: 'rhaegar-targaryen',
      name: "Rhaegar Targaryen",
      house: 'Targaryen',
    }].each do |item|
      Character.find_by(slug: item[:slug]) ||
      Character.create!(item)
    end

    [
      %w{eddard-stark winterfell},
      %w{sansa-stark winterfell},
      %w{jaime-lannister casterly-rock},
      %w{illyn-payne kings-landing},
      %w{illyrio-mopatis pentos},
      %w{danaerys-targaryen dragonstone},
      %w{visaerys-targaryen kings-landing},
      %w{rhaegar-targaryen dragonstone},
    ].each do |item|
      c = Character.find_by(slug: item[0])
      c.born_in = Place.find_by(slug: item[1])
      c.save
    end
  end
end
