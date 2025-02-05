-- Налаштування паку анімацій
local packName = "C1" -- Змініть на назву паку, який ви хочете використовувати
local animationPack = {
    C1 = {
        Run = 616163682,
        Walk = 616168032,
        Jump = 116936326516985,
        Idle = {656117400, 656118341, 886742569},
        Fall = 18537367238,
        Swim = 99384245425157,
        SwimIdle = 18537387180,
        Climb = 18537363391
    },
    Bold = {
        Run = 16738337225,
        Walk = 16738340646,
        Jump = 16738336650,
        Idle = {16738333868, 16738334710},
        Fall = 16738333171,
        Swim = 16738339158,
        SwimIdle = 16738339817,
        Climb = 16738332169
    },
    Adidas = {
        Run = 18537384940,
        Walk = 18537392113,
        Jump = 18537380791,
        Idle = {18537376492, 18537371272},
        Fall = 18537367238,
        Swim = 18537389531,
        SwimIdle = 18537387180,
        Climb = 18537363391
    },
    NoBoundaries = {
        Run = 18747070484,
        Walk = 18747074203,
        Jump = 18747069148,
        Idle = {18747067405, 18747063918},
        Fall = 18747062535,
        Swim = 18747073181,
        SwimIdle = 18747071682,
        Climb = 18747060903
    },
    Wicked = {
        Run = 72301599441680,
        Walk = 92072849924640,
        Jump = 104325245285198,
        Idle = {118832222982049, 76049494037641},
        Fall = 121152442762481,
        Swim = 99384245425157,
        SwimIdle = 113199415118199,
        Climb = 131326830509784
    },
    Catwalk = {
        Run = 81024476153754,
        Walk = 109168724482748,
        Jump = 116936326516985,
        Idle = {133806214992291, 94970088341563},
        Fall = 92294537340807,
        Swim = 134591743181628,
        SwimIdle = 98854111361360,
        Climb = 119377220967554
    },
    NFL = {
        Run = 110358958299415,
        Walk = 110358958299415,
        Jump = 119846112151352,
        Idle = {92080889861410, 74451233229259},
        Fall = 129773241321032,
        Swim = 132697394189921,
        SwimIdle = 79090109939093,
        Climb = 134630013742019
    },
    Astronaut = {
        Run = 891636393,
        Walk = 891636393,
        Jump = 891627522,
        Idle = {891621366, 891633237, 1047759695},
        Fall = 891617961,
        Swim = 891639666,
        SwimIdle = 891663592,
        Climb = 891609353
    },
    Bubbly = {
        Run = 910025107,
        Walk = 910034870,
        Jump = 910016857,
        Idle = {910004836, 910009958, 1018536639},
        Fall = 910001910,
        Swim = 910028158,
        SwimIdle = 910030921,
        Climb = 909997997
    },
    Cartoony = {
        Run = 742638842,
        Walk = 742640026,
        Jump = 742637942,
        Idle = {742637544, 742638445, 885477856},
        Fall = 742637151,
        Swim = 742639220,
        SwimIdle = 742639812,
        Climb = 742636889
    },
    Elder = {
        Run = 845386501,
        Walk = 845403856,
        Jump = 845398858,
        Idle = {845397899, 845400520, 901160519},
        Fall = 845396048,
        Swim = 845401742,
        SwimIdle = 845403127,
        Climb = 845392038
    },
    Knight = {
        Run = 657564596,
        Walk = 657552124,
        Jump = 658409194,
        Idle = {657595757, 657568135, 885499184},
        Fall = 657600338,
        Swim = 657560551,
        SwimIdle = 657557095,
        Climb = 658360781
    },
    Levitation = {
        Run = 616010382,
        Walk = 616013216,
        Jump = 616008936,
        Idle = {616006778, 616008087, 886862142},
        Fall = 616005863,
        Swim = 616011509,
        SwimIdle = 616012453,
        Climb = 616003713
    },
    Mage = {
        Run = 707861613,
        Walk = 707897309,
        Jump = 707853694,
        Idle = {707742142, 707855907, 885508740},
        Fall = 707829716,
        Swim = 707876443,
        SwimIdle = 707894699,
        Climb = 707826056
    },
    Ninja = {
        Run = 656118852,
        Walk = 656121766,
        Jump = 656117878,
        Idle = {656117400, 656118341, 886742569},
        Fall = 656115606,
        Swim = 656119721,
        SwimIdle = 656121397,
        Climb = 656114359
    },
    Pirate = {
        Run = 750783738,
        Walk = 750785693,
        Jump = 750782230,
        Idle = {750781874, 750782770, 885515365},
        Fall = 750780242,
        Swim = 750784579,
        SwimIdle = 750785176,
        Climb = 750779899
    },
    Robot = {
        Run = 616091570,
        Walk = 616095330,
        Jump = 616090535,
        Idle = {616088211, 616089559, 885531463},
        Fall = 616087089,
        Swim = 616092998,
        SwimIdle = 616094091,
        Climb = 616086039
    },
    Rthro = {
        Run = 2510198475,
        Walk = 2510202577,
        Jump = 2510197830,
        Idle = {2510197257, 2510196951, 3711062489},
        Fall = 2510195892,
        Swim = 2510199791,
        SwimIdle = 2510201162,
        Climb = 2510192778
    },
    Stylish = {
        Run = 616140816,
        Walk = 616146177,
        Jump = 616139451,
        Idle = {616136790, 616138447, 886888594},
        Fall = 616134815,
        Swim = 616143378,
        SwimIdle = 616144772,
        Climb = 616133594
    },
    Superhero = {
        Run = 616117076,
        Walk = 616122287,
        Jump = 616115533,
        Idle = {616111295, 616113536, 885535855},
        Fall = 616108001,
        Swim = 616119360,
        SwimIdle = 616120861,
        Climb = 616104706
    },
    Toy = {
        Run = 782842708,
        Walk = 782843345,
        Jump = 782847020,
        Idle = {782841498, 782845736, 980952228},
        Fall = 782846423,
        Swim = 782844582,
        SwimIdle = 782845186,
        Climb = 782843869
    },
    Vampire = {
        Run = 1083462077,
        Walk = 1083473930,
        Jump = 1083455352,
        Idle = {1083445855, 1083450166, 1088037547},
        Fall = 1083443587,
        Swim = 1083464683,
        SwimIdle = 1083467779,
        Climb = 1083439238
    },
    Werewolf = {
        Run = 1083216690,
        Walk = 1083178339,
        Jump = 1083218792,
        Idle = {1083195517, 1083214717, 1099492820},
        Fall = 1083189019,
        Swim = 1083222527,
        SwimIdle = 1083225406,
        Climb = 1083182000
    },
    Zombie = {
        Run = 616163682,
        Walk = 616168032,
        Jump = 616161997,
        Idle = {616158929, 616160636, 885545458},
        Fall = 616157476,
        Swim = 616165109,
        SwimIdle = 616166655,
        Climb = 616156119
    }
}

-- Функція для завантаження анімацій
local function loadAnimations(packName)
    local pack = animationPack[packName]
    if not pack then
        warn("Пак анімацій не знайдено: " .. packName)
        return
    end

    local Animate = game.Players.LocalPlayer.Character.Animate

    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=" .. pack.Run
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=" .. pack.Walk
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=" .. pack.Jump
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=" .. pack.Idle[1]
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=" .. pack.Idle[2]
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=" .. pack.Fall
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=" .. pack.Climb
	Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=" .. pack.Swim
	Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=" .. pack.SwimIdle

    game.Players.LocalPlayer.Character.Humanoid.Jump = true
end

-- Введіть назву паку анімацій, який ви хочете завантажити

loadAnimations(packName)