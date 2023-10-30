import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:food_frenzy/services/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

double distanceBetween = 0;
List<int> preferredRestaurantDistance = [];
List<int> preferredRestaurant = [];
List<int> combinedPref = [];

Map<String, dynamic>? theChosenRestaurant; // Use dynamic to allow mixed types

final List<Map<String, dynamic>> restaurantOptions = [
  {"name": "Mang Inasal - Remolador St.", "gmap":"r1Y69B3pSDHQvwto6", "lat":9.646012431631261, "long":123.8538016423286, "imagePath": "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Mang_Inasal.svg/2560px-Mang_Inasal.svg.png", "price":166, "type":"any", "menu":["https://www.manginasal.com/wp-content/uploads/2019/05/MI-PM1Paa-2019.png", "https://cloud-cube.s3.amazonaws.com/ck20q033epu8/public/uploads/MI_PechoLarge.png", "https://cloud-cube.s3.amazonaws.com/ck20q033epu8/public/uploads/1pc-Chicken-Inasal_450x275px_1595225654-min.png", "https://cloud-cube.s3.amazonaws.com/ck20q033epu8/public/uploads/MI-TSM1-Product-shot-EYE-LEVEL_FA.png", "https://cloud-cube.s3.amazonaws.com/ck20q033epu8/public/uploads/MI-TSM2-updated.png"]},
  {"name": "Mang Inasal - ICM", "gmap":"yDdm7uFXPCXHMb496", "lat":9.655514832950358, "long":123.86941278465721, "imagePath": "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Mang_Inasal.svg/2560px-Mang_Inasal.svg.png", "price":103, "type":"any", "menu":["https://cloud-cube.s3.amazonaws.com/ck20q033epu8/public/uploads/fiesta-meal-2.png", "https://cloud-cube.s3.amazonaws.com/ck20q033epu8/public/uploads/halo-halo-updated.png", "https://cloud-cube.s3.amazonaws.com/ck20q033epu8%2Fpublic%2Fuploads%2FCDL-Small.png", "https://www.manginasal.com/wp-content/uploads/2019/05/MI-PalabokSolo-2019.png", "https://cloud-cube.s3.amazonaws.com/ck20q033epu8/public/uploads/mi-bbq.png"]},
  {"name": "Greenwich - Alturas", "gmap":"tSB9ji7Ux4b6oTFw8", "lat":9.646186954550252, "long":123.86241907116431, "imagePath": "https://static.wikia.nocookie.net/logopedia/images/1/17/Home_logo2.gif/revision/latest/scale-to-width-down/200?cb=20130902103629", "price":403, "type":"any", "menu":["https://order.greenwich.com.ph/images/products/customization/overload-meal-d.webp", "https://order.greenwich.com.ph/images/products/customization/overload-meal-e.webp", "https://order.greenwich.com.ph/images/products/customization/pizza-value-meal-b-thumbnail.webp", "https://order.greenwich.com.ph/images/products/customization/12-overload-double-double-deal-thumbnail.webp", "https://order.greenwich.com.ph/images/products/customization/9-overload-trio-deal-thumbnail.webp"]},
  {"name": "Greenwich - ICM", "gmap":"BZE6bw36tHVjWuDt5", "lat":9.655900881290604, "long":123.8697045147061, "imagePath": "https://static.wikia.nocookie.net/logopedia/images/1/17/Home_logo2.gif/revision/latest/scale-to-width-down/200?cb=20130902103630", "price":361, "type":"any", "menu":["https://order.greenwich.com.ph/images/products/customization/12-overload-double-double-deal-thumbnail.webp", "https://order.greenwich.com.ph/images/products/customization/hawaiian-overload-lift.webp", "https://order.greenwich.com.ph/images/products/customization/hawaiian-overload-lift.webp", "https://order.greenwich.com.ph/images/products/customization/all-in-overload-lift.webp", "https://order.greenwich.com.ph/images/products/customization/all-in-overload-lift.webp"]},
  {"name": "Chowking - Alturas mall", "gmap":"MG73W15x3KXKn7Xn7", "lat":9.643507908445763, "long":123.85568730707465, "imagePath": "https://seeklogo.com/images/C/chowking-logo-1BBE8D8007-seeklogo.com.png", "price":114, "type":"any", "menu":["https://www.pinasgifts.com/image/cache/data/chowking/beef%20chao%20fan%20with%20siomai-500x500.jpg", "https://nas-public.sharetreats.ph/nas/goods/G00000004091/G00000004091_1.png", "https://www.pinasgifts.com/image/cache/data/132/862-500x500.png", "https://takeout.ph/uploads/restaurant/resto_1610605513.png", "https://balikbayan.com/wp-content/uploads/2021/08/1pc.-Chinese-Style-Fried-Chicken.png"]},
  {"name": "Chowking - Alta Citta mall", "gmap":"HXDjAGovyf34a4j36", "lat":9.641653479849248, "long":123.85568389999999, "imagePath": "https://seeklogo.com/images/C/chowking-logo-1BBE8D8007-seeklogo.com.png", "price":678, "type":"any", "menu":["https://images.deliveryhero.io/image/fd-ph/Products/31877680.jpg?width=%s", "https://ph-test-11.slatic.net/p/c3c96918059d8fe499656c82f45d4187.jpg", "https://ph-test-11.slatic.net/p/829512a91df426c238ea7da675d58d4e.jpg", "https://balikbayan.com/wp-content/uploads/2021/08/6pc.-Chinese-Style-Fried-Chicken.png", "https://takeout.ph/uploads/restaurant/resto_1610606763.png"]},
  {"name": "Chowking - ICM", "gmap":"inagMnxpXZ8k2AjXA", "lat":9.641716943559766, "long":123.85568389999999, "imagePath": "https://seeklogo.com/images/C/chowking-logo-1BBE8D8007-seeklogo.com.png", "price":114, "type":"any", "menu":["https://www.pinasgifts.com/image/cache/data/chowking/beef%20chao%20fan%20with%20siomai-500x500.jpg", "https://nas-public.sharetreats.ph/nas/goods/G00000004091/G00000004091_1.png", "https://www.pinasgifts.com/image/cache/data/132/862-500x500.png", "https://takeout.ph/uploads/restaurant/resto_1610605513.png", "https://balikbayan.com/wp-content/uploads/2021/08/1pc.-Chinese-Style-Fried-Chicken.png"]},
  {"name": "Kenny Rogers Roasters - ICM", "gmap":"ZcGySrxqZP8Q1LTv9", "lat":9.654656195416102, "long":123.86890548465719, "imagePath": "https://media-cdn.tripadvisor.com/media/photo-s/22/ed/80/0d/great-burgers-and-pizza.jpg", "price":240, "type":"any", "menu":["https://pinoycupidgifts.com/wp-content/uploads/2022/06/Kani-and-Mango-Salad.--600x600.jpg", "https://media.pickaroo.com/media/thumb/variant_photos/2021/10/25/gDVDe9XcE2SjDJ4We8nwzR_watermark_400.jpg", "https://pinoycupidgifts.com/wp-content/uploads/2022/06/Kennys-Solo-A-Roasted-Chicken.png", "https://pinoycupidgifts.com/wp-content/uploads/2022/06/Kennys-Corn-Muffin-Box-of-6-e1655731620737.png", "https://media.pickaroo.com/media/thumb/variant_photos/2021/10/25/EGX4L8H2UNoZ7tvFpknEy7_watermark_400.jpg"]},
  {"name": "Ribschack- Alturas mall", "gmap":"Yh3HFMXRmb7GmuNs7", "lat":9.643422410534528, "long":123.85613867116429, "imagePath": "https://contents.smsupermalls.com/data/uploads/2020/07/RIBSHACK_GRILL.png", "price":148, "type":"pork", "menu":["https://media-cdn.tripadvisor.com/media/photo-s/16/98/75/71/20190211-132633-largejpg.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBX37Hve3vFSeGJnV_5-boXkSeFMG1qLYVXJrTHBuELeFGy_PLnvY2UKyQjSSUxh_49c8&usqp=CAU", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4RRd0pm85qjg_UGMWW0wG2QmpR5yi47pfKg&usqp=CAU", "https://bacolodfoodhunters.files.wordpress.com/2016/04/ribshack-1.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJWS1Csa-zHZjlahuXiT0gwPzjzRW78uUvTDFyR1Hu8vwRzt0vxxFrcIld3FtTC2uwFtE&usqp=CAU"]},
  {"name": "Pizza Hut Bohol", "gmap":"tn5osQvVN4ZnR2cJ6", "lat":9.642480165705177, "long":123.85559915952129, "imagePath": "https://cdn.freebiesupply.com/logos/large/2x/pizza-hut-logo-png-transparent.png", "price":474, "type":"any", "menu": ["https://www.cebuflorist.com/images/products/large_3625_02a.jpg", "https://images.deliveryhero.io/image/fd-ph/Products/24238109.jpg?width=%s", "https://media-cdn.tripadvisor.com/media/photo-s/05/8a/c7/d9/pizza-hut.jpg", "https://balikbayan.com/wp-content/uploads/2021/12/SUPER-SUPREME.png", "https://www.pinasgifts.com/image/cache/data/128/217-500x500.png"]},
  {"name": "Jollibee", "gmap":"n8rci4s8gnoP9P4a7", "lat":9.65188891633622, "long":123.85212744721713, "imagePath": "https://i.pinimg.com/originals/87/d1/66/87d166c686ccca056ebcafba8ceae13f.jpg", "price":147, "type":"any", "menu": ["https://queen.jollibee.com.ph/2023/05/1-PC-CJOY-W-FRIES-SOLO.png", "https://queen.jollibee.com.ph/2022/02/1pc-Breakfast-Chickenjoy-w-Jolly-Spaghetti-Solo-1.png", "https://queen.jollibee.com.ph/2022/01/2pc-Chickenjoy-Solo.png", "https://pinoycupidgifts.com/wp-content/uploads/2022/08/1pc-Chickenjoy-with-Drink-by-Jollibee-600x450.jpg", "https://queen.jollibee.com.ph/2022/05/1pc-Chickenjoy-with-Burger-Steak-Solo.webp"]},
  {"name": "Jollibee New Calceta", "gmap":"sZXYMEfHd1J81Fna6", "lat":9.65385019977128, "long":123.85566089325468, "imagePath": "https://i.pinimg.com/originals/87/d1/66/87d166c686ccca056ebcafba8ceae13f.jpg", "price":147, "type":"any", "menu": ["https://queen.jollibee.com.ph/2023/05/1-PC-CJOY-W-FRIES-SOLO.png", "https://queen.jollibee.com.ph/2022/02/1pc-Breakfast-Chickenjoy-w-Jolly-Spaghetti-Solo-1.png", "https://queen.jollibee.com.ph/2022/01/2pc-Chickenjoy-Solo.png", "https://pinoycupidgifts.com/wp-content/uploads/2022/08/1pc-Chickenjoy-with-Drink-by-Jollibee-600x450.jpg", "https://queen.jollibee.com.ph/2022/05/1pc-Chickenjoy-with-Burger-Steak-Solo.webp"]},
  {"name": "Jollibee Alta Cita", "gmap":"5UkDG6zL5jrNk6DdA", "lat":9.64177702033381, "long":123.85564550372187, "imagePath": "https://i.pinimg.com/originals/87/d1/66/87d166c686ccca056ebcafba8ceae13f.jpg", "price":147, "type":"any", "menu": ["https://queen.jollibee.com.ph/2023/05/1-PC-CJOY-W-FRIES-SOLO.png", "https://queen.jollibee.com.ph/2022/02/1pc-Breakfast-Chickenjoy-w-Jolly-Spaghetti-Solo-1.png", "https://queen.jollibee.com.ph/2022/01/2pc-Chickenjoy-Solo.png", "https://pinoycupidgifts.com/wp-content/uploads/2022/08/1pc-Chickenjoy-with-Drink-by-Jollibee-600x450.jpg", "https://queen.jollibee.com.ph/2022/05/1pc-Chickenjoy-with-Burger-Steak-Solo.webp"]},
  {"name": "Jollibee Island City Mall", "gmap":"FJMCww1cktYnPsZs8", "lat":9.655414460289753, "long":123.86940632362567, "imagePath": "https://i.pinimg.com/originals/87/d1/66/87d166c686ccca056ebcafba8ceae13f.jpg", "price":147, "type":"any", "menu": ["https://queen.jollibee.com.ph/2023/05/1-PC-CJOY-W-FRIES-SOLO.png", "https://queen.jollibee.com.ph/2022/02/1pc-Breakfast-Chickenjoy-w-Jolly-Spaghetti-Solo-1.png", "https://queen.jollibee.com.ph/2022/01/2pc-Chickenjoy-Solo.png", "https://pinoycupidgifts.com/wp-content/uploads/2022/08/1pc-Chickenjoy-with-Drink-by-Jollibee-600x450.jpg", "https://queen.jollibee.com.ph/2022/05/1pc-Chickenjoy-with-Burger-Steak-Solo.webp"]},
  {"name": "Jollibee Panglao", "gmap":"syrpLDDqss4hXBi8A", "lat":9.551783492836444, "long":123.77193914054031, "imagePath": "https://i.pinimg.com/originals/87/d1/66/87d166c686ccca056ebcafba8ceae13f.jpg", "price":147, "type":"any", "menu": ["https://queen.jollibee.com.ph/2023/05/1-PC-CJOY-W-FRIES-SOLO.png", "https://queen.jollibee.com.ph/2022/02/1pc-Breakfast-Chickenjoy-w-Jolly-Spaghetti-Solo-1.png", "https://queen.jollibee.com.ph/2022/01/2pc-Chickenjoy-Solo.png", "https://pinoycupidgifts.com/wp-content/uploads/2022/08/1pc-Chickenjoy-with-Drink-by-Jollibee-600x450.jpg", "https://queen.jollibee.com.ph/2022/05/1pc-Chickenjoy-with-Burger-Steak-Solo.webp"]},
  {"name": "KFC Island City Mall", "gmap":"gMEsACzywEPEN4RV6", "lat":9.656065002302947, "long":123.86973127288127, "imagePath": "https://i.pinimg.com/564x/63/87/0b/63870bd0e559ac46f54c78647218d9a2.jpg", "price":344, "type":"chicken", "menu": ["https://www.kfc.com.ph/Content/OnlineOrderingImages/Menu/Items/CHICKSPAG170CBO.png", "https://www.kfc.com.ph/Content/OnlineOrderingImages/Menu/Items/KRISPY.png", "https://www.kfc.com.ph/Content/OnlineOrderingImages/Menu/Items/KRISPYCBO.png", "https://www.kfc.com.ph/Content/OnlineOrderingImages/Menu/Items/KLSFLMCBO.png", "https://www.kfc.com.ph/Content/OnlineOrderingImages/Menu/Items/BUCK10.png"]},
  {"name": "McDonald's Tagbilaran", "gmap":"PSJZwRk4VeE2t7RQ7", "lat":9.66172423110906, "long":123.86729739262313, "imagePath": "https://i.pinimg.com/564x/85/6b/62/856b623156b0c17206cbb8116c6af248.jpg", "price":368, "type":"any", "menu": ["https://www.mcdonaldsmenuph.com/wp-content/uploads/2023/09/Quarter-Pounder-w_-Cheese-Meal.jpg", "https://www.mcdonaldsmenuph.com/wp-content/uploads/2023/09/Double-Quarter-Pounder-w_-Cheese-Meal.jpg", "https://www.mcdonaldsmenuph.com/wp-content/uploads/2023/09/Snack-Burger-McShare.jpg", "https://www.mcdonaldsmenuph.com/wp-content/uploads/2023/09/BFF-Fries-N-McFloat-Combo.jpg", "https://www.mcdonaldsmenuph.com/wp-content/uploads/2023/09/McShare-Bundle-for-3.jpg"]},
  {"name": "McDonald's", "gmap":"7XsaEzNhfyHxp3QS6", "lat":9.648862771811618, "long":123.85665438685137, "imagePath": "https://i.pinimg.com/564x/85/6b/62/856b623156b0c17206cbb8116c6af248.jpg", "price":368, "type":"any", "menu": ["https://www.mcdonaldsmenuph.com/wp-content/uploads/2023/09/Quarter-Pounder-w_-Cheese-Meal.jpg", "https://www.mcdonaldsmenuph.com/wp-content/uploads/2023/09/Double-Quarter-Pounder-w_-Cheese-Meal.jpg", "https://www.mcdonaldsmenuph.com/wp-content/uploads/2023/09/Snack-Burger-McShare.jpg", "https://www.mcdonaldsmenuph.com/wp-content/uploads/2023/09/BFF-Fries-N-McFloat-Combo.jpg", "https://www.mcdonaldsmenuph.com/wp-content/uploads/2023/09/McShare-Bundle-for-3.jpg"]},
  {"name": "McDonald's Tubigon", "gmap":"FwK6FMsMGS7UkWXq6", "lat":9.959544017511314, "long":123.96125150217615, "imagePath": "https://i.pinimg.com/564x/85/6b/62/856b623156b0c17206cbb8116c6af248.jpg", "price":368, "type":"any", "menu": ["https://www.mcdonaldsmenuph.com/wp-content/uploads/2023/09/Quarter-Pounder-w_-Cheese-Meal.jpg", "https://www.mcdonaldsmenuph.com/wp-content/uploads/2023/09/Double-Quarter-Pounder-w_-Cheese-Meal.jpg", "https://www.mcdonaldsmenuph.com/wp-content/uploads/2023/09/Snack-Burger-McShare.jpg", "https://www.mcdonaldsmenuph.com/wp-content/uploads/2023/09/BFF-Fries-N-McFloat-Combo.jpg", "https://www.mcdonaldsmenuph.com/wp-content/uploads/2023/09/McShare-Bundle-for-3.jpg"]},
  {"name": "McDonald's Panglao", "gmap":"cEjhoiSVR2bSLd9aA", "lat":9.560425417326716, "long":123.77002691048847, "imagePath": "https://i.pinimg.com/564x/85/6b/62/856b623156b0c17206cbb8116c6af248.jpg", "price":368, "type":"any", "menu": ["https://www.mcdonaldsmenuph.com/wp-content/uploads/2023/09/Quarter-Pounder-w_-Cheese-Meal.jpg", "https://www.mcdonaldsmenuph.com/wp-content/uploads/2023/09/Double-Quarter-Pounder-w_-Cheese-Meal.jpg", "https://www.mcdonaldsmenuph.com/wp-content/uploads/2023/09/Snack-Burger-McShare.jpg", "https://www.mcdonaldsmenuph.com/wp-content/uploads/2023/09/BFF-Fries-N-McFloat-Combo.jpg", "https://www.mcdonaldsmenuph.com/wp-content/uploads/2023/09/McShare-Bundle-for-3.jpg"]},
  {"name": "McDonald's Jagna", "gmap":"3CLfTBbS5Ud97VTE6", "lat":9.65872650643313, "long":124.36689169262313, "imagePath": "https://i.pinimg.com/564x/85/6b/62/856b623156b0c17206cbb8116c6af248.jpg", "price":368, "type":"any", "menu": ["https://www.mcdonaldsmenuph.com/wp-content/uploads/2023/09/Quarter-Pounder-w_-Cheese-Meal.jpg", "https://www.mcdonaldsmenuph.com/wp-content/uploads/2023/09/Double-Quarter-Pounder-w_-Cheese-Meal.jpg", "https://www.mcdonaldsmenuph.com/wp-content/uploads/2023/09/Snack-Burger-McShare.jpg", "https://www.mcdonaldsmenuph.com/wp-content/uploads/2023/09/BFF-Fries-N-McFloat-Combo.jpg", "https://www.mcdonaldsmenuph.com/wp-content/uploads/2023/09/McShare-Bundle-for-3.jpg"]},
  {"name": "Gerarda's Place", "gmap":"9hM3H6FP5EcCgZhv7", "lat":9.655586893208211, "long":123.85581668614664, "imagePath": "https://gerardasbohol.com/wp-content/uploads/2020/12/cropped-GerardasFinalLogo-Full-Color-2.png", "price":399, "type":"any", "menu":["https://gerardasbohol.com/wp-content/uploads/2022/02/2227625A-765F-4D01-BA31-6552F44FBC61-300x300.jpg", "https://gerardasbohol.com/wp-content/uploads/2022/02/08893545-0DFB-4E33-A112-CF337C767350-300x300.jpg", "https://gerardasbohol.com/wp-content/uploads/2022/02/54B9DED2-5D54-4988-85C6-395E780E02B4-300x300.jpg", "https://gerardasbohol.com/wp-content/uploads/2020/04/458006D1-8D62-4591-A7C0-BBC7E8DF7BC6-300x300.png", "https://gerardasbohol.com/wp-content/uploads/2021/05/B409D725-5E7D-48B1-B025-680C9E1F0C04-300x300.jpg"]},
  {"name": "Gerarda's Place- CPG", "gmap":"C6pfUjeqgbtor4bt7", "lat":9.65555677572, "long":123.855701533, "imagePath": "https://gerardasbohol.com/wp-content/uploads/2020/12/cropped-GerardasFinalLogo-Full-Color-2.png", "price":399, "type":"any", "menu":["https://gerardasbohol.com/wp-content/uploads/2022/02/2227625A-765F-4D01-BA31-6552F44FBC61-300x300.jpg", "https://gerardasbohol.com/wp-content/uploads/2022/02/08893545-0DFB-4E33-A112-CF337C767350-300x300.jpg", "https://gerardasbohol.com/wp-content/uploads/2022/02/54B9DED2-5D54-4988-85C6-395E780E02B4-300x300.jpg", "https://gerardasbohol.com/wp-content/uploads/2020/04/458006D1-8D62-4591-A7C0-BBC7E8DF7BC6-300x300.png", "https://gerardasbohol.com/wp-content/uploads/2021/05/B409D725-5E7D-48B1-B025-680C9E1F0C04-300x300.jpg"]},
  {"name": "Payag Restaurant- Main", "gmap":"q4y9JFGfvWQYu5kk8", "lat":9.63973622452712, "long":123.8580639306837, "imagePath": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrp5hULYvz3f9GQNbvLqmwnSYZ_j0LAcg2JfI1iDNOFs15adjeAnMZW3HjVWaKp22DGw0&usqp=CAU", "price":189, "type":"any", "menu": ["https://images.deliveryhero.io/image/fd-ph/Products/24735833.jpg?width=%s", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi-48hPDF9F9-2E-5TI3IKuxEmP8q2y8XO7JONzxqJ5CxBQYejs7t6T9ilO7VTiyAFnLE&usqp=CAU", "https://islifearecipe.net/wp-content/uploads/2019/04/fullsizeoutput_e125.jpeg", "https://4.bp.blogspot.com/_5jdHff5wHh8/TGnEuP_o7fI/AAAAAAAABAA/hqsw7VVdsnA/s1600/20100814_1.JPG", "https://images.deliveryhero.io/image/fd-ph/Products/24735834.jpg?width=%s"]},
  {"name": "Payag Restaurant- ICM mall", "gmap":"8zfPmCo7himm2UHb8", "lat":9.655376071881841, "long":123.86969368650638, "imagePath": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrp5hULYvz3f9GQNbvLqmwnSYZ_j0LAcg2JfI1iDNOFs15adjeAnMZW3HjVWaKp22DGw0&usqp=CAU", "price":189, "type":"any", "menu": ["https://images.deliveryhero.io/image/fd-ph/Products/24735833.jpg?width=%s, https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi-48hPDF9F9-2E-5TI3IKuxEmP8q2y8XO7JONzxqJ5CxBQYejs7t6T9ilO7VTiyAFnLE&usqp=CAU, https://islifearecipe.net/wp-content/uploads/2019/04/fullsizeoutput_e125.jpeg", "https://4.bp.blogspot.com/_5jdHff5wHh8/TGnEuP_o7fI/AAAAAAAABAA/hqsw7VVdsnA/s1600/20100814_1.JPG", "https://images.deliveryhero.io/image/fd-ph/Products/24735834.jpg?width=%s"]},
  {"name": "Payag Restaurant- BQ mall", "gmap":"yYxZiz6PNMBUsPR68", "lat":9.642374452143565, "long":123.85556644177298, "imagePath": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrp5hULYvz3f9GQNbvLqmwnSYZ_j0LAcg2JfI1iDNOFs15adjeAnMZW3HjVWaKp22DGw0&usqp=CAU", "price":189, "type":"any", "menu": ["https://images.deliveryhero.io/image/fd-ph/Products/24735833.jpg?width=%s", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi-48hPDF9F9-2E-5TI3IKuxEmP8q2y8XO7JONzxqJ5CxBQYejs7t6T9ilO7VTiyAFnLE&usqp=CAU", "https://islifearecipe.net/wp-content/uploads/2019/04/fullsizeoutput_e125.jpeg", "https://4.bp.blogspot.com/_5jdHff5wHh8/TGnEuP_o7fI/AAAAAAAABAA/hqsw7VVdsnA/s1600/20100814_1.JPG", "https://images.deliveryhero.io/image/fd-ph/Products/24735834.jpg?width=%s"]},
  {"name": "Payag Restaurant- Alturas mall", "gmap":"yXhLGA5i1L9S5GmGA", "lat":9.64354026982494, "long":123.85601927116453, "imagePath": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrp5hULYvz3f9GQNbvLqmwnSYZ_j0LAcg2JfI1iDNOFs15adjeAnMZW3HjVWaKp22DGw0&usqp=CAU", "price":189, "type":"any", "menu": ["https://images.deliveryhero.io/image/fd-ph/Products/24735833.jpg?width=%s", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi-48hPDF9F9-2E-5TI3IKuxEmP8q2y8XO7JONzxqJ5CxBQYejs7t6T9ilO7VTiyAFnLE&usqp=CAU", "https://islifearecipe.net/wp-content/uploads/2019/04/fullsizeoutput_e125.jpeg", "https://4.bp.blogspot.com/_5jdHff5wHh8/TGnEuP_o7fI/AAAAAAAABAA/hqsw7VVdsnA/s1600/20100814_1.JPG", "https://images.deliveryhero.io/image/fd-ph/Products/24735834.jpg?width=%s"]},
  {"name": "Payag Restaurant- Panglao", "gmap":"oeqXFd5BtAL7bni76", "lat":9.551741952173092, "long":123.77234434232906, "imagePath": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrp5hULYvz3f9GQNbvLqmwnSYZ_j0LAcg2JfI1iDNOFs15adjeAnMZW3HjVWaKp22DGw0&usqp=CAU", "price":189, "type":"any", "menu": ["https://images.deliveryhero.io/image/fd-ph/Products/24735833.jpg?width=%s", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi-48hPDF9F9-2E-5TI3IKuxEmP8q2y8XO7JONzxqJ5CxBQYejs7t6T9ilO7VTiyAFnLE&usqp=CAU", "https://islifearecipe.net/wp-content/uploads/2019/04/fullsizeoutput_e125.jpeg", "https://4.bp.blogspot.com/_5jdHff5wHh8/TGnEuP_o7fI/AAAAAAAABAA/hqsw7VVdsnA/s1600/20100814_1.JPG", "https://images.deliveryhero.io/image/fd-ph/Products/24735834.jpg?width=%s"]},
  {"name": "Gerry's Grill - BQ Mall", "gmap":"xoLVQpBAbGtKuF619", "lat":9.64222196589549, "long":123.85520761534185, "imagePath": "https://jaggerhotel.files.wordpress.com/2011/09/garry.jpg?w=300", "price":376, "type":"any", "menu": ["https://www.pinasgifts.com/image/cache/data/12-04-2017/sizzling%20sisig%20gerrys-500x500.jpg", "https://pinoycupidgifts.com/wp-content/uploads/2021/03/Gerrys-Lumpiang-Shanghai.jpeg", "https://www.pinasgifts.com/image/cache/data/12-06-2017/Pancit%20Bihon-500x500.jpg", "https://www.pinasgifts.com/image/cache/data/12-06-2017/spcial%20pancit%20canton-500x500.jpg", "https://www.pinasgifts.com/image/cache/data/12-03-2017/dinakdakan-500x500.jpg"]},
  {"name": "Gerry's Grill - Panglao", "gmap":"ntGEJgEVZfyShGLx8", "lat":9.557684183941419, "long":123.7734060851563, "imagePath": "https://jaggerhotel.files.wordpress.com/2011/09/garry.jpg?w=300", "price":376, "type":"any", "menu": ["https://www.pinasgifts.com/image/cache/data/12-04-2017/sizzling%20sisig%20gerrys-500x500.jpg", "https://pinoycupidgifts.com/wp-content/uploads/2021/03/Gerrys-Lumpiang-Shanghai.jpeg", "https://www.pinasgifts.com/image/cache/data/12-06-2017/Pancit%20Bihon-500x500.jpg", "https://www.pinasgifts.com/image/cache/data/12-06-2017/spcial%20pancit%20canton-500x500.jpg", "https://www.pinasgifts.com/image/cache/data/12-03-2017/dinakdakan-500x500.jpg"]},
  {"name": "The Prawn Farm Grill & Seafoods- ICM", "gmap":"dU5CQF6yCE2aoZnf6", "lat":9.657120713400166, "long":123.87010094246085, "imagePath": "https://media-cdn.tripadvisor.com/media/photo-s/15/5e/fd/5a/prawn-farm-restaurant.jpg", "price":346, "type":"any", "menu":["https://scontent.fmnl17-5.fna.fbcdn.net/v/t1.6435-9/107706873_604420093515309_94103992603184222_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=dd63ad&_nc_eui2=AeEBVI-stANbCfg-XhtoapoKcL3xNja_0VJwvfE2Nr_RUkz6gSbzzZ_8sG_7qVkIs7E7-XXd3jO4RTQVuc9m9RFD&_nc_ohc=gl1pbXMdNwoAX-tQLzc&_nc_ht=scontent.fmnl17-5.fna&oh=00_AfB_uXpn0ce7Dt7aeOGSBXVHiEKhz50zYPo_Stl44RPVVg&oe=655F37D5", "https://scontent.fmnl17-3.fna.fbcdn.net/v/t1.6435-9/104720660_592181591405826_7689256284575707543_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=4dc865&_nc_eui2=AeHqlohGB48JwlIcxtwGbzPZFxM8VR44q50XEzxVHjirnb9Q8IQO2BwsOe-nPbgsptgv_niWcS2PG-XuzwRKkd68&_nc_ohc=dyee7rDaw_sAX8ZyX9L&_nc_ht=scontent.fmnl17-3.fna&oh=00_AfB-Q4Mq9p-M1ATN7cEKjwDQ13bdhmWJk-oP8je1fEBXDQ&oe=655F3C8C", "https://scontent.fmnl17-2.fna.fbcdn.net/v/t1.6435-9/104633291_592181568072495_3638274232831618179_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=4dc865&_nc_eui2=AeEsz-b231kTPeowAABYzwVwYzjaOfoEgKhjONo5-gSAqMqBMKWuf-Km38ECenL2jxh6Wg-MjYy94V4kogVl3zcd&_nc_ohc=zdYmJbf0IwgAX_FJydH&_nc_ht=scontent.fmnl17-2.fna&oh=00_AfAhbQ0i4iWBYPR-luxqEmWbJZJX8lzYPSbcrkNNlMGt5Q&oe=655F2B53", "https://scontent.fmnl17-1.fna.fbcdn.net/v/t1.6435-9/104338756_592181708072481_1559712053296838700_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=4dc865&_nc_eui2=AeHVhLg6d6EK3H6YY_pvk94w5qvi9781amnmq-L3vzVqaUlT2gUJPRlWrPL1zZeOy_tUX6_eWl0-Eqpc8yIbdoFV&_nc_ohc=KY8gP_W5SV0AX9KxKNG&_nc_ht=scontent.fmnl17-1.fna&oh=00_AfCKlOq0EoTceIlSOMXVcf60fxNwOOlZB8q6bXFiwYx61w&oe=655F1CD7", "https://scontent.fmnl17-5.fna.fbcdn.net/v/t1.6435-9/105185972_592181654739153_5104852023877276070_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=4dc865&_nc_eui2=AeFAALcOdNCvElYUH5G0egRLf8PbcW5Ow-d_w9txbk7D5yMXnFuLefRPWZxApOKk-YoXStiAZ9Clv8wG5FDHUgiR&_nc_ohc=Y2kXCULbnxIAX8_rBcs&_nc_ht=scontent.fmnl17-5.fna&oh=00_AfDi9e7V-0xkcT6Sh7ueJeg4FzzPsTDGSwFVTTaJ9g31DA&oe=655F2D1A"]},
  {"name": "The Prawn Farm Grill & Seafoods- Alta Citta", "gmap":"6bxcJtzUkz3TBFJY7", "lat":9.64158648906804, "long":123.85520415767091, "imagePath": "https://media-cdn.tripadvisor.com/media/photo-s/15/5e/fd/5a/prawn-farm-restaurant.jpg", "price":346, "type":"any", "menu":["https://scontent.fmnl17-5.fna.fbcdn.net/v/t1.6435-9/107706873_604420093515309_94103992603184222_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=dd63ad&_nc_eui2=AeEBVI-stANbCfg-XhtoapoKcL3xNja_0VJwvfE2Nr_RUkz6gSbzzZ_8sG_7qVkIs7E7-XXd3jO4RTQVuc9m9RFD&_nc_ohc=gl1pbXMdNwoAX-tQLzc&_nc_ht=scontent.fmnl17-5.fna&oh=00_AfB_uXpn0ce7Dt7aeOGSBXVHiEKhz50zYPo_Stl44RPVVg&oe=655F37D5", "https://scontent.fmnl17-3.fna.fbcdn.net/v/t1.6435-9/104720660_592181591405826_7689256284575707543_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=4dc865&_nc_eui2=AeHqlohGB48JwlIcxtwGbzPZFxM8VR44q50XEzxVHjirnb9Q8IQO2BwsOe-nPbgsptgv_niWcS2PG-XuzwRKkd68&_nc_ohc=dyee7rDaw_sAX8ZyX9L&_nc_ht=scontent.fmnl17-3.fna&oh=00_AfB-Q4Mq9p-M1ATN7cEKjwDQ13bdhmWJk-oP8je1fEBXDQ&oe=655F3C8C", "https://scontent.fmnl17-2.fna.fbcdn.net/v/t1.6435-9/104633291_592181568072495_3638274232831618179_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=4dc865&_nc_eui2=AeEsz-b231kTPeowAABYzwVwYzjaOfoEgKhjONo5-gSAqMqBMKWuf-Km38ECenL2jxh6Wg-MjYy94V4kogVl3zcd&_nc_ohc=zdYmJbf0IwgAX_FJydH&_nc_ht=scontent.fmnl17-2.fna&oh=00_AfAhbQ0i4iWBYPR-luxqEmWbJZJX8lzYPSbcrkNNlMGt5Q&oe=655F2B53", "https://scontent.fmnl17-1.fna.fbcdn.net/v/t1.6435-9/104338756_592181708072481_1559712053296838700_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=4dc865&_nc_eui2=AeHVhLg6d6EK3H6YY_pvk94w5qvi9781amnmq-L3vzVqaUlT2gUJPRlWrPL1zZeOy_tUX6_eWl0-Eqpc8yIbdoFV&_nc_ohc=KY8gP_W5SV0AX9KxKNG&_nc_ht=scontent.fmnl17-1.fna&oh=00_AfCKlOq0EoTceIlSOMXVcf60fxNwOOlZB8q6bXFiwYx61w&oe=655F1CD7", "https://scontent.fmnl17-5.fna.fbcdn.net/v/t1.6435-9/105185972_592181654739153_5104852023877276070_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=4dc865&_nc_eui2=AeFAALcOdNCvElYUH5G0egRLf8PbcW5Ow-d_w9txbk7D5yMXnFuLefRPWZxApOKk-YoXStiAZ9Clv8wG5FDHUgiR&_nc_ohc=Y2kXCULbnxIAX8_rBcs&_nc_ht=scontent.fmnl17-5.fna&oh=00_AfDi9e7V-0xkcT6Sh7ueJeg4FzzPsTDGSwFVTTaJ9g31DA&oe=655F2D1A"]},
  {"name": "The Prawn Farm Grill & Seafoods- Panglao", "gmap":"bBiYPzJfQuuDbEQz8", "lat":9.563068005007157, "long":123.79311791534182, "imagePath": "https://media-cdn.tripadvisor.com/media/photo-s/15/5e/fd/5a/prawn-farm-restaurant.jpg", "price":346, "type":"any", "menu":["https://scontent.fmnl17-5.fna.fbcdn.net/v/t1.6435-9/107706873_604420093515309_94103992603184222_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=dd63ad&_nc_eui2=AeEBVI-stANbCfg-XhtoapoKcL3xNja_0VJwvfE2Nr_RUkz6gSbzzZ_8sG_7qVkIs7E7-XXd3jO4RTQVuc9m9RFD&_nc_ohc=gl1pbXMdNwoAX-tQLzc&_nc_ht=scontent.fmnl17-5.fna&oh=00_AfB_uXpn0ce7Dt7aeOGSBXVHiEKhz50zYPo_Stl44RPVVg&oe=655F37D5", "https://scontent.fmnl17-3.fna.fbcdn.net/v/t1.6435-9/104720660_592181591405826_7689256284575707543_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=4dc865&_nc_eui2=AeHqlohGB48JwlIcxtwGbzPZFxM8VR44q50XEzxVHjirnb9Q8IQO2BwsOe-nPbgsptgv_niWcS2PG-XuzwRKkd68&_nc_ohc=dyee7rDaw_sAX8ZyX9L&_nc_ht=scontent.fmnl17-3.fna&oh=00_AfB-Q4Mq9p-M1ATN7cEKjwDQ13bdhmWJk-oP8je1fEBXDQ&oe=655F3C8C", "https://scontent.fmnl17-2.fna.fbcdn.net/v/t1.6435-9/104633291_592181568072495_3638274232831618179_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=4dc865&_nc_eui2=AeEsz-b231kTPeowAABYzwVwYzjaOfoEgKhjONo5-gSAqMqBMKWuf-Km38ECenL2jxh6Wg-MjYy94V4kogVl3zcd&_nc_ohc=zdYmJbf0IwgAX_FJydH&_nc_ht=scontent.fmnl17-2.fna&oh=00_AfAhbQ0i4iWBYPR-luxqEmWbJZJX8lzYPSbcrkNNlMGt5Q&oe=655F2B53", "https://scontent.fmnl17-1.fna.fbcdn.net/v/t1.6435-9/104338756_592181708072481_1559712053296838700_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=4dc865&_nc_eui2=AeHVhLg6d6EK3H6YY_pvk94w5qvi9781amnmq-L3vzVqaUlT2gUJPRlWrPL1zZeOy_tUX6_eWl0-Eqpc8yIbdoFV&_nc_ohc=KY8gP_W5SV0AX9KxKNG&_nc_ht=scontent.fmnl17-1.fna&oh=00_AfCKlOq0EoTceIlSOMXVcf60fxNwOOlZB8q6bXFiwYx61w&oe=655F1CD7", "https://scontent.fmnl17-5.fna.fbcdn.net/v/t1.6435-9/105185972_592181654739153_5104852023877276070_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=4dc865&_nc_eui2=AeFAALcOdNCvElYUH5G0egRLf8PbcW5Ow-d_w9txbk7D5yMXnFuLefRPWZxApOKk-YoXStiAZ9Clv8wG5FDHUgiR&_nc_ohc=Y2kXCULbnxIAX8_rBcs&_nc_ht=scontent.fmnl17-5.fna&oh=00_AfDi9e7V-0xkcT6Sh7ueJeg4FzzPsTDGSwFVTTaJ9g31DA&oe=655F2D1A"]},
  {"name": "Lantaw Native Restaurant", "gmap":"bprvwYMpLbxCDevo7", "lat":9.634459905335484, "long":123.86539947790888, "imagePath": "https://ik.imagekit.io/pagesgroup/wp-content/uploads/2019/10/Lantaw_Logo_Yellow.png", "price":28, "type":"pork", "menu":["https://rondoesthings.files.wordpress.com/2014/12/lantaw2.jpg"]},
  {"name": "Paeng's Fried Chicken", "gmap":"LVr393ak4diJTLvXA", "lat":9.65000401229932, "long":123.85349035588621, "imagePath": "https://media-cdn.tripadvisor.com/media/photo-p/0e/86/a9/9c/make-your-fried-chicken.jpg", "price":162, "type":"chicken", "menu":["https://bohollocal.ph/cdn/shop/products/Paeng_sFriedChicken_960x.jpg?v=1587869875", "https://bohollocal.ph/cdn/shop/products/Paeng_sFriedChicken2_1_600x.jpg?v=1588261039", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRltIPk3jzEURVwtXSC1qp-axVqwlOPLzhdgx3i-ZJ69usbr6SIpVmzDzzRDxLBGAJRdPg&usqp=CAU"]},
  {"name": "The Original Paeng's", "gmap":"WQf2gKsap5gLnoFu8", "lat":9.645730867482293, "long":123.85344744054034, "imagePath": "https://media-cdn.tripadvisor.com/media/photo-p/0e/86/a9/9c/make-your-fried-chicken.jpg", "price":162, "type":"chicken", "menu":["https://bohollocal.ph/cdn/shop/products/Paeng_sFriedChicken_960x.jpg?v=1587869875", "https://bohollocal.ph/cdn/shop/products/Paeng_sFriedChicken2_1_600x.jpg?v=1588261039", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRltIPk3jzEURVwtXSC1qp-axVqwlOPLzhdgx3i-ZJ69usbr6SIpVmzDzzRDxLBGAJRdPg&usqp=CAU"]},
  {"name": "Paeng’s Fried Chicken, Lechon Manok and Liempo - CPG PARK/WISDOM BRANCH", "gmap":"H7o4Tg1rUotiAubC9", "lat":9.661638537842977, "long":123.8581252132384, "imagePath": "https://media-cdn.tripadvisor.com/media/photo-p/0e/86/a9/9c/make-your-fried-chicken.jpg", "price":162, "type":"chicken", "menu":["https://bohollocal.ph/cdn/shop/products/Paeng_sFriedChicken_960x.jpg?v=1587869875", "https://bohollocal.ph/cdn/shop/products/Paeng_sFriedChicken2_1_600x.jpg?v=1588261039", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRltIPk3jzEURVwtXSC1qp-axVqwlOPLzhdgx3i-ZJ69usbr6SIpVmzDzzRDxLBGAJRdPg&usqp=CAU"]},
  {"name": "Paeng’s Fried Chicken", "gmap":"cVhxLTg2PGjDTNY19", "lat":9.693579447896193, "long":123.8632845558862, "imagePath": "https://media-cdn.tripadvisor.com/media/photo-p/0e/86/a9/9c/make-your-fried-chicken.jpg", "price":162, "type":"chicken", "menu":["https://bohollocal.ph/cdn/shop/products/Paeng_sFriedChicken_960x.jpg?v=1587869875", "https://bohollocal.ph/cdn/shop/products/Paeng_sFriedChicken2_1_600x.jpg?v=1588261039", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRltIPk3jzEURVwtXSC1qp-axVqwlOPLzhdgx3i-ZJ69usbr6SIpVmzDzzRDxLBGAJRdPg&usqp=CAU"]}
];

void generateRandomRestaurant() {
  final random = Random();
  if (combinedPref.isNotEmpty){
    final randomIndex = random.nextInt(combinedPref.length);
    theChosenRestaurant = restaurantOptions[combinedPref[randomIndex]];
  }
  else if (preferredRestaurant.isNotEmpty){
    final randomIndex = random.nextInt(preferredRestaurant.length);
    theChosenRestaurant = restaurantOptions[preferredRestaurant[randomIndex]];
  }
  else if (preferredRestaurantDistance.isNotEmpty){
    final randomIndex = random.nextInt(preferredRestaurant.length);
    theChosenRestaurant = restaurantOptions[preferredRestaurantDistance[randomIndex]];
  }
  else {
    final randomIndex = random.nextInt(restaurantOptions.length);
    theChosenRestaurant = restaurantOptions[randomIndex];
  }
  if(kDebugMode) print(theChosenRestaurant);
  calculateChosenRestaurantDistance(theChosenRestaurant?['lat'], theChosenRestaurant?['long']);
}

Future<void> generatePreferredRestaurant() async {
  int priceMatch = 0;
  List<int> preferred = [];
  final prefs = await SharedPreferences.getInstance();
  double? price = prefs.getDouble('Price_preference');
  for (int i = 0; i < restaurantOptions.length; i++) {
    final restaurant = restaurantOptions[i];
    //allPrice.add(restaurant['price']);
    if(restaurant['price'] <= price) {
      if(price! <= 100) { // affordable
        priceMatch++;
        preferred.add(i);
      }
      else if(price > 100 && price <= 300 ) { // medium
        if (restaurant['price'] > 100) {
          priceMatch++;
          preferred.add(i);
        }
      }
      else { // expensive
        if(restaurant['price'] > 300) {
          priceMatch++;
          preferred.add(i);
        }
      }
    }
  }
  preferredRestaurant = preferred;
  if(preferredRestaurant.isNotEmpty && preferredRestaurantDistance.isNotEmpty){
    combinedPref = findCommonElements(preferredRestaurant, preferredRestaurantDistance);
  }
  if (kDebugMode) {
    print('preferred price: $price');
    print('price matched: $priceMatch');
    print(preferredRestaurant);
    //print(allPrice);
  }
}

Future<void> generateRestaurantDistance() async {
  final prefs = await SharedPreferences.getInstance();
  double? prefDistance = prefs.getDouble('Distance_preference');
  if (kDebugMode) {
    print('preferred distance: $prefDistance');
  }
  List<int> d = [];
  for (int i = 0; i < restaurantOptions.length; i++){
    final restaurant = restaurantOptions[i];
    if(calculateDistance(currentLocation!, restaurant['lat'], restaurant['long']) <= prefDistance!) d.add(i);
  }
  preferredRestaurantDistance = d;
  if(preferredRestaurant.isNotEmpty && preferredRestaurantDistance.isNotEmpty) {
    combinedPref =
        findCommonElements(preferredRestaurant, preferredRestaurantDistance);
  }
  if (kDebugMode) {
    print(d);
  }
}


List<int> findCommonElements(List<int> a, List<int> b) {
  List<int> x = [];
  int i = 0; // Index for list a
  int j = 0; // Index for list b

  while (i < a.length && j < b.length) {
    if (a[i] == b[j]) {
      x.add(a[i]);
      i++;
      j++;
    } else if (a[i] < b[j]) {
      i++;
    } else {
      j++;
    }
  }

  return x;
}








// void main() {
//   generateRandomRestaurant();
//
//   if (theChosenRestaurant != null) {
//     final restaurantJson = json.encode({
//       "theChosenRestaurant": theChosenRestaurant,
//       "restaurantOptions": restaurantOptions,
//     });
//
//     if (kDebugMode) {
//       print(restaurantJson);
//     }
//
//     // Decoding the JSON string back to Dart objects
//     final decodedData = json.decode(restaurantJson);
//
//     final decodedTheChosenRestaurant = decodedData["theChosenRestaurant"];
//     final decodedRestaurantOptions = List<Map<String, dynamic>>.from(decodedData["restaurantOptions"]);
//
//     if (kDebugMode) {
//       print("Decoded theChosenRestaurant: $decodedTheChosenRestaurant");
//     }
//     if (kDebugMode) {
//       print("Decoded restaurantOptions: $decodedRestaurantOptions");
//     }
//   } else {
//     if (kDebugMode) {
//       print("No restaurant chosen.");
//     }
//   }
// }

// To implement get the json data from github hago
// // filename for the data to be saved in app data
// const filename = 'restaurant_data.json';
//
// Future<String> getLocalFilePath(String filename) async {
//   final directory = await getApplicationDocumentsDirectory();
//   return File('${directory.path}/$filename').path;
// }
//
// Future<void> saveJsonToFile(Map<String, dynamic> jsonData, String filename) async {
//   final filePath = await getLocalFilePath(filename);
//   final file = File(filePath);
//   await file.writeAsString(json.encode(jsonData));
// }
//
// Future<Map<String, dynamic>> readJsonFromFile(String filename) async {
//   final filePath = await getLocalFilePath(filename);
//   final file = File(filePath);
//   if (await file.exists()) {
//     final contents = await file.readAsString();
//     return json.decode(contents);
//   } else {
//     throw Exception('File not found: $filePath');
//   }
// }
//
// void main() async {
//
//   try {
//     final jsonData = await readJsonFromFile(filename);
//     // Use the JSON data as needed.
//     if (kDebugMode) {
//       print('JSON data loaded from $filename');
//     }
//     if (kDebugMode) {
//       print('Data: $jsonData');
//     }
//   } catch (e) {
//     if (kDebugMode) {
//       print('Error: $e');
//     }
//   }
// }
