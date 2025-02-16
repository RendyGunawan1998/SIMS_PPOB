import '../../core.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool visible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeViewModel>(context, listen: false).fetchHomeData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 18),
          child: Image.asset(AssetsHelper.imgLogo),
        ),
        title: textInter('SIMS PPOB', Colors.black, FontWeight.bold, 16),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Image.asset(AssetsHelper.imgPPSmall),
          )
        ],
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Consumer<HomeViewModel>(
              builder: (context, homeViewModel, child) {
                if (homeViewModel.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                if (homeViewModel.errorMessage != null) {
                  return Center(child: Text(homeViewModel.errorMessage!));
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textInter(
                        'Selamat datang,', Colors.black87, FontWeight.w500, 15),
                    hbox(2),
                    textInter(
                        '${homeViewModel.user?.firstName ?? '-'} ${homeViewModel.user?.lastName ?? "-"}',
                        Colors.black,
                        FontWeight.bold,
                        18),
                    hbox(20),
                    containerBalance(
                        visible == false
                            ? '*****'
                            : oCcy.format(double.tryParse(
                                homeViewModel.balance.toString())),
                        visible, () {
                      setState(() {
                        visible = !visible;
                      });
                    }),
                    hbox(20),
                    gridMenu(),
                    hbox(20),
                    textInter('Temukan promo menarik', Colors.black,
                        FontWeight.w500, 14),
                    hbox(20),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: itemsBanner.length,
                        itemBuilder: (BuildContext context, int i) => Padding(
                          padding: EdgeInsets.only(left: 6, right: 6),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.asset(
                              itemsBanner[i]['img'],
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
