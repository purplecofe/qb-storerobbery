Config = {}

Config.minEarn = 100
Config.maxEarn = 450
Config.RegisterEarnings = math.random(Config.minEarn, Config.maxEarn)
Config.MinimumStoreRobberyPolice = 0
Config.resetTime = (60 * 1000) * 30
Config.tickInterval = 1000

Config.Registers = { 
    -- Balls LTD
    [1] = {vector3(-47.24,-1757.65, 29.53), robbed = false, time = 0, safeKey = 1, camId = 4},
    [2] = {vector3(-48.58,-1759.21, 29.59), robbed = false, time = 0, safeKey = 1, camId = 4},
    [3] = {vector3(-1486.26,-378.0,  40.16), robbed = false, time = 0, safeKey = 2, camId = 5},
    [4] = {vector3(-1222.03,-908.32, 12.32), robbed = false, time = 0, safeKey = 3, camId = 6},
    [5] = {vector3(-706.08, -915.42, 19.21), robbed = false, time = 0, safeKey = 4, camId = 7},
    [6] = {vector3(-706.16, -913.5, 19.21), robbed = false, time = 0, safeKey = 4, camId = 7},
    [7] = {vector3( 24.47, -1344.99, 29.49), robbed = false, time = 0, safeKey = 5, camId = 8},
    [8] = {vector3(24.45, -1347.37, 29.49), robbed = false, time = 0, safeKey = 5, camId = 8},
    [9] = {vector3(1134.15, -982.53, 46.41), robbed = false, time = 0, safeKey = 6, camId = 9},
    [10] = {vector3(1165.05, -324.49, 69.2), robbed = false, time = 0, safeKey = 7, camId = 10},
    [11] = {vector3(1164.7, -322.58, 69.2), robbed = false, time = 0, safeKey = 7, camId = 10},
    [12] = {vector3(373.14, 328.62, 103.56), robbed = false, time = 0, safeKey = 8, camId = 11},
    [13] = {vector3(372.57, 326.42, 103.56), robbed = false, time = 0, safeKey = 8, camId = 11},
    [14] = {vector3(-1818.9, 792.9, 138.08), robbed = false, time = 0, safeKey = 9, camId = 12},
    [15] = {vector3(-1820.17, 794.28, 138.08), robbed = false, time = 0, safeKey = 9, camId = 12},
    [16] = {vector3(-2966.46, 390.89, 15.04), robbed = false, time = 0, safeKey = 10, camId = 13},
    [17] = {vector3(-3041.14, 583.87, 7.9), robbed = false, time = 0, safeKey = 11, camId = 14},
    [18] = {vector3(-3038.92, 584.5, 7.9), robbed = false, time = 0, safeKey = 11, camId = 14},
    [19] = {vector3(-3244.56, 1000.14, 12.83), robbed = false, time = 0, safeKey = 12, camId = 15},
    [20] = {vector3(-3242.24, 999.98, 12.83), robbed = false, time = 0, safeKey = 12, camId = 15},
    [21] = {vector3(549.42, 2669.06, 42.15), robbed = false, time = 0, safeKey = 13, camId = 16},
    [22] = {vector3(549.05, 2671.39, 42.15), robbed = false, time = 0, safeKey = 13, camId = 16},
    [23] = {vector3(1165.9, 2710.81, 38.15), robbed = false, time = 0, safeKey = 14, camId = 17},
    [24] = {vector3(2676.02, 3280.52, 55.24), robbed = false, time = 0, safeKey = 15, camId = 18},
    [25] = {vector3(2678.07, 3279.39, 55.24), robbed = false, time = 0, safeKey = 15, camId = 18},
    [26] = {vector3(1958.96, 3741.98, 32.34), robbed = false, time = 0, safeKey = 16, camId = 19},
    [27] = {vector3(1960.13, 3740.0, 32.34), robbed = false, time = 0, safeKey = 16, camId = 19},
    [28] = {vector3(1728.86, 6417.26, 35.03), robbed = false, time = 0, safeKey = 17, camId = 20},
    [29] = {vector3(1727.85, 6415.14, 35.03), robbed = false, time = 0, safeKey = 17, camId = 20},
    [30] = {vector3(-161.07, 6321.23, 31.5), robbed = false, time = 0, safeKey = 18, camId = 27},
    [31] = {vector3(160.52, 6641.74, 31.6), robbed = false, time = 0, safeKey = 19, camId = 28},
    [32] = {vector3(162.16, 6643.22, 31.6), robbed = false, time = 0, safeKey = 19, camId = 29},
}

Config.Safes = {
    -- Balls LTD
    [1] = {coords = vector3(-43.84, -1748.07, 29.42), heading = 320, length = 0.7, width = 0.5, minZ = 28.5, maxZ = 29.5, robbed = false, cracked = false, opened = false, camId = 4}, 
    -- 小首爾
    [2] = {coords = vector3(-710.24, -904.17, 19.22), heading = 0, length = 0.7, width = 0.5, minZ = 18.22, maxZ = 19.22, robbed = false, cracked = false, opened = false, camId = 7},
    -- 純潔大道
    [3] = {coords = vector3(31.74, -1339.29, 29.5), heading = 320, length = 0.7, width = 0.5, minZ = 29.5, maxZ = 30.3, robbed = false, cracked = false, opened = false, camId = 8},
    -- 藍丘大道
    [4] = {coords = vector3(1126.75, -979.65, 45.42), heading = 98, length = 0.85, width = 0.5, minZ = 44.42, maxZ = 46, robbed = false, cracked = false, opened = false, camId = 9},
    -- 米羅公園
    [5] = {coords = vector3(1159.0, -314.15, 69.21), heading = 10, length = 0.7, width = 0.5, minZ = 68.21, maxZ = 69.21, robbed = false, cracked = false, opened = false, camId = 10},
    -- 克林頓大街
    [6] = {coords = vector3(381.52, 332.43, 103.57), heading = 345, length = 0.7, width = 0.5, minZ = 103.47, maxZ = 104.47, robbed = false, cracked = false, opened = false, camId = 11},
    -- 18號加油站
    [7] = {coords = vector3(-1829.59, 798.38, 138.19), heading = 43, length = 0.7, width = 0.5, minZ = 137.24, maxZ = 138.14, robbed = false, cracked = false, opened = false, camId = 12},
    -- 班漢峽谷
    [8] = {coords = vector3(-3048.79, 588.88, 7.91), heading = 288, length = 0.7, width = 0.2, minZ = 7.91, maxZ = 8.71, robbed = false, cracked = false, opened = false, camId = 14},
    -- 丘瑪墟
    [9] = {coords = vector3(-3249.63, 1007.81, 12.83), heading = 264, length = 0.7, width = 0.2, minZ = 12.83, maxZ = 13.63, robbed = false, cracked = false, opened = false, camId = 15},
    -- 和美尼
    [10] = {coords = vector3(543.02, 2662.44, 42.16), heading = 189, length = 0.7, width = 0.2, minZ = 42.16, maxZ = 42.96, robbed = false, cracked = false, opened = false, camId = 16},
    -- 塞諾拉
    [11] = {coords = vector3(2674.5, 3289.57, 55.24), heading = 242, length = 0.7, width = 0.2, minZ = 55.24, maxZ = 56.04, robbed = false, cracked = false, opened = false, camId = 18},
    -- 沙灘海岸
    [12] = {coords = vector3(1962.28, 3750.54, 32.34), heading = 211, length = 0.7, width = 0.2, minZ = 32.34, maxZ = 33.14, robbed = false, cracked = false, opened = false, camId = 19},
    -- 佩利托灣
    [13] = {coords = vector3(1737.82, 6419.24, 35.04), heading = 154, length = 0.7, width = 0.2, minZ = 35.04, maxZ = 35.84, robbed = false, cracked = false, opened = false, camId = 20},
    -- 佩利托灣
    [14] = {coords = vector3(171.26, 6642.23, 31.7), heading = 136, length = 0.7, width = 0.2, minZ = 31.7, maxZ = 32.5, robbed = false, cracked = false, opened = false, camId = 30},
    -- 巴諾米諾
    [15] = {coords = vector3(2549.47, 388.28, 108.62), heading = 87, length = 0.7, width = 0.2, minZ = 108.62, maxZ = 109.42, robbed = false, cracked = false, opened = false, camId = 30},
}

Config.MaleNoHandshoes = {
    [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [18] = true, [26] = true, [52] = true, [53] = true, [54] = true, [55] = true, [56] = true, [57] = true, [58] = true, [59] = true, [60] = true, [61] = true, [62] = true, [112] = true, [113] = true, [114] = true, [118] = true, [125] = true, [132] = true,
}
Config.FemaleNoHandshoes = {
    [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [19] = true, [59] = true, [60] = true, [61] = true, [62] = true, [63] = true, [64] = true, [65] = true, [66] = true, [67] = true, [68] = true, [69] = true, [70] = true, [71] = true, [129] = true, [130] = true, [131] = true, [135] = true, [142] = true, [149] = true, [153] = true, [157] = true, [161] = true, [165] = true,
}
