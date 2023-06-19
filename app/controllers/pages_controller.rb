class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @products = Product.all.limit(4)
    @popular_categories = [
      { name: "Anniversary gifts",
        img_url: "https://i.etsystatic.com/11486790/r/il/09528c/2809353368/il_340x270.2809353368_l0rq.jpg" },
      { name: "Gifts for him",
        img_url: "https://i.etsystatic.com/6731346/r/il/3c0196/1890785052/il_340x270.1890785052_ediz.jpg" },
      { name: "Gifts for her",
        img_url: "https://i.etsystatic.com/15999839/r/il/5edb06/2984633165/il_340x270.2984633165_3t0u.jpg" },
      { name: "Personalized Gift Ideas",
        img_url: "https://i.etsystatic.com/15999839/r/il/4814a0/2508301243/il_340x270.2508301243_7ldf.jpg" },
      { name: "Wedding Gifts",
        img_url: "https://i.etsystatic.com/32559223/r/il/be6d85/4259856607/il_340x270.4259856607_stkz.jpg" }
    ]
    @circles = [
      { name: "mother day gifts for grandma",
        img_url: "https://i.etsystatic.com/9268581/c/1517/1517/396/0/il/75d5be/5023825343/il_300x300.5023825343_gyzo.jpg" },
      { name: "personalized gifts",
        img_url: "https://i.etsystatic.com/30047677/c/1592/1592/558/278/il/a9e96e/4294393458/il_300x300.4294393458_33qq.jpg" },
      { name: "birthstone jewelry",
        img_url: "https://i.etsystatic.com/12238424/r/il/db933c/962153874/il_300x300.962153874_fqq8.jpg" },
      { name: "father day gifts",
        img_url: "https://i.etsystatic.com/28136279/c/1713/1713/388/0/il/751233/3608842600/il_300x300.3608842600_99bi.jpg" },
      { name: "children day gifts",
        img_url: "https://i.etsystatic.com/20762234/r/il/754b57/3492972113/il_300x300.3492972113_e1bu.jpg" }
    ]
  end
end
