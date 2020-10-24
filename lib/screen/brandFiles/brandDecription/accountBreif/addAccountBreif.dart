import 'package:flutter/material.dart';
import 'package:marketApp/model/classes.dart';
import 'package:marketApp/services/crudFunctions.dart';

// Form to add Account Breif to new Brands
//viewBrandDescription navigate to this form

class AddAccountBreifPage extends StatefulWidget {
  final AccountBreif accountBreif;
  final String aBid;
  const AddAccountBreifPage({Key key, this.accountBreif,this.aBid}) : super(key: key);
  @override
  _AddAccountBreifPageState createState() => _AddAccountBreifPageState();
}

class _AddAccountBreifPageState extends State<AddAccountBreifPage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _nameController;
  TextEditingController _industryController;
  FocusNode _industryNode;
  TextEditingController _marketLocation3;
  TextEditingController _cAnalysis4;
  TextEditingController _company5;
  TextEditingController _companySell6;
  TextEditingController _varyFromCompetitors7;
  TextEditingController _uniqueBrand;
  TextEditingController _competitiveAdvantage8;
  TextEditingController _branduniqe9;
  TextEditingController _mybusinssdobetter10;
  TextEditingController _mybusinssdoworse11;
  TextEditingController _viewmybusiness12;
  TextEditingController _suddenlygained13;
  TextEditingController _hadtocutmybudget14;
  TextEditingController _year1goalsforcompany15;
  TextEditingController _year3goalsforcompany16;
  TextEditingController _year5goalsforcompany17;
  TextEditingController _customers18;
  TextEditingController _theidealcustomers19;
  TextEditingController _sortsofproducts20;
  TextEditingController _age21;
  TextEditingController _producthavegoodreviews22;
  TextEditingController _producthavebadareviews23;
  TextEditingController _producthavenoreviews24;
  TextEditingController _websiteurl25;
  TextEditingController _behaveonmywebsite26;
  TextEditingController _visitmostoften27;
  TextEditingController _findingmysite28;
  TextEditingController _audiencegrowing29;
  TextEditingController _repeatpurchases30;
  TextEditingController _repeatpurchasesmodel31;
  TextEditingController _mosteffective32;
  TextEditingController _trendsincustomerpurchases33;
  TextEditingController _carefulresearch34;
  TextEditingController _motivatesmycustomers35;
  TextEditingController _getmoreinformation36;
  TextEditingController _channelsofcommunication37;
  TextEditingController _customerfeedback38;
  TextEditingController _mostcommoncustomer39;
  TextEditingController _mostcommonpraise40;
  TextEditingController _findmostinteresting41;
  TextEditingController _findleastinteresting42;
  TextEditingController _tellmycustomers43;
  TextEditingController _valssystemcategory44;
  TextEditingController _competitors45;
  TextEditingController _directcopetitors46;
  TextEditingController _establishedcompetitors47;
  TextEditingController _emergingcometitors48;
  TextEditingController _competitorsoffer49;
  TextEditingController _mycompetitorsbiggest50;
  TextEditingController _mycompetitorsweaknesses51;
  TextEditingController _competitorsusingtogain52;
  TextEditingController _aredoingthaticannot53;
  TextEditingController _mybusinesscando54;
  TextEditingController _audiencesmycompetitors55;
  TextEditingController _sortofcompetitorsproducing56;
  TextEditingController _soicalmediacompetitorshave57;
  TextEditingController _swotanalysis58;
  TextEditingController _strengh59;
  TextEditingController _advantagesdowehave60;
  TextEditingController _toolsdowehave61;
  TextEditingController _differentiatorswillhelpus62;
  TextEditingController _peopleandtime63;
  TextEditingController _leverageouraudience64;
  TextEditingController _weaknesses65;
  TextEditingController _improvementscouldwemake66;
  TextEditingController _notgoingsowell67;
  TextEditingController _foctorsmaysucktime68;
  TextEditingController _techlimitationsmyprevent69;
  TextEditingController _opportunities70;
  TextEditingController _contentisntourcopetition71;
  TextEditingController _competitorssharing72;
  TextEditingController _trendscapitalizeupon73;
  TextEditingController _resultswith10ofwork74;
  TextEditingController _threats75;
  TextEditingController _marketmarketinggoal76;
  TextEditingController _competitorsisalsodoing77;
  TextEditingController _competitorscuttrntlydoing78;
  TextEditingController _desiredmarketingchannel79;
  TextEditingController _channeltoutilize80;
  TextEditingController _channelcurrentlyusing81;
  TextEditingController _channeladdtostrategy82;
  TextEditingController _channelputtingonpause83;
  TextEditingController _digitalcompetitoranalysis84;
  TextEditingController _audiencetrafficperchannel85;
  TextEditingController _bestperformingchannel86;
  TextEditingController _qualifycompetitorbytheiraudience87;
  TextEditingController _analyzecompetitorseoeffort88;
  TextEditingController _discovertheirsuccessfulkeywords89;
  TextEditingController _getanideaofconsumorbehavior90;
  TextEditingController _getmarketingideasfromtheirrecentidea91;
  TextEditingController _trackonlinementions92;
  TextEditingController _determinewhichplatfroms93;
  TextEditingController _seeiftheiraudiencehasincreased94;
  TextEditingController _learnwhattypeofcontent95;
  TextEditingController _seeifthereisanythingnew96;
  TextEditingController _highlightyourownopportunities97;
  TextEditingController _determinethebrandimage98;
  TextEditingController _currentdigitalchannelanalysis99;

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: isEditMote ? widget.accountBreif.name : '');
    _industryController = TextEditingController(
        text: isEditMote ? widget.accountBreif.industry : '');
    // _industryNode = FocusNode();
    _marketLocation3 = TextEditingController(
        text: isEditMote ? widget.accountBreif.marketLocation3 : "");
    _cAnalysis4 = TextEditingController(
        text: isEditMote ? widget.accountBreif.cAnalysis4 : "");
    _company5 = TextEditingController(
        text: isEditMote ? widget.accountBreif.company5 : "");
    _companySell6 = TextEditingController(
        text: isEditMote ? widget.accountBreif.companySell6 : '');
    _varyFromCompetitors7 = TextEditingController(
        text: isEditMote ? widget.accountBreif.varyFromCompetitors7 : '');
    _uniqueBrand = TextEditingController(
        text: isEditMote ? widget.accountBreif.uniqueBrand : '');
    _competitiveAdvantage8 = TextEditingController(
        text: isEditMote ? widget.accountBreif.competitiveAdvantage8 : '');
    _branduniqe9 = TextEditingController(
        text: isEditMote ? widget.accountBreif.branduniqe9 : '');
    _mybusinssdobetter10 = TextEditingController(
        text: isEditMote ? widget.accountBreif.mybusinssdobetter10 : '');
    _mybusinssdoworse11 = TextEditingController(
        text: isEditMote ? widget.accountBreif.mybusinssdoworse11 : '');
    _viewmybusiness12 = TextEditingController(
        text: isEditMote ? widget.accountBreif.viewmybusiness12 : '');
    _suddenlygained13 = TextEditingController(
        text: isEditMote ? widget.accountBreif.suddenlygained13 : '');
    _hadtocutmybudget14 = TextEditingController(
        text: isEditMote ? widget.accountBreif.hadtocutmybudget14 : '');
    _year1goalsforcompany15 = TextEditingController(
        text: isEditMote ? widget.accountBreif.year1goalsforcompany15 : '');
    _year3goalsforcompany16 = TextEditingController(
        text: isEditMote ? widget.accountBreif.year3goalsforcompany16 : '');
    _year5goalsforcompany17 = TextEditingController(
        text: isEditMote ? widget.accountBreif.year5goalsforcompany17 : '');
    _customers18 = TextEditingController(
        text: isEditMote ? widget.accountBreif.customers18 : '');
    _theidealcustomers19 = TextEditingController(
        text: isEditMote ? widget.accountBreif.theidealcustomers19 : '');
    _sortsofproducts20 = TextEditingController(
        text: isEditMote ? widget.accountBreif.sortsofproducts20 : '');
    _age21 = TextEditingController(
        text: isEditMote ? widget.accountBreif.age21 : '');
    _producthavegoodreviews22 = TextEditingController(
        text: isEditMote ? widget.accountBreif.producthavegoodreviews22 : '');
    _producthavebadareviews23 = TextEditingController(
        text: isEditMote ? widget.accountBreif.producthavebadareviews23 : '');
    _producthavenoreviews24 = TextEditingController(
        text: isEditMote ? widget.accountBreif.producthavenoreviews24 : '');
    _websiteurl25 = TextEditingController(
        text: isEditMote ? widget.accountBreif.websiteurl25 : '');
    _behaveonmywebsite26 = TextEditingController(
        text: isEditMote ? widget.accountBreif.behaveonmywebsite26 : '');
    _visitmostoften27 = TextEditingController(
        text: isEditMote ? widget.accountBreif.visitmostoften27 : '');
    _findingmysite28 = TextEditingController(
        text: isEditMote ? widget.accountBreif.findingmysite28 : '');
    _audiencegrowing29 = TextEditingController(
        text: isEditMote ? widget.accountBreif.audiencegrowing29 : '');
    _repeatpurchases30 = TextEditingController(
        text: isEditMote ? widget.accountBreif.repeatpurchases30 : '');
    _repeatpurchasesmodel31 = TextEditingController(
        text: isEditMote ? widget.accountBreif.repeatpurchasesmodel31 : '');
    _mosteffective32 = TextEditingController(
        text: isEditMote ? widget.accountBreif.mosteffective32 : '');
    _trendsincustomerpurchases33 = TextEditingController(
        text:
            isEditMote ? widget.accountBreif.trendsincustomerpurchases33 : '');
    _carefulresearch34 = TextEditingController(
        text: isEditMote ? widget.accountBreif.carefulresearch34 : '');
    _motivatesmycustomers35 = TextEditingController(
        text: isEditMote ? widget.accountBreif.motivatesmycustomers35 : '');
    _getmoreinformation36 = TextEditingController(
        text: isEditMote ? widget.accountBreif.getmoreinformation36 : '');
    _channelsofcommunication37 = TextEditingController(
        text: isEditMote ? widget.accountBreif.channelsofcommunication37 : '');
    _customerfeedback38 = TextEditingController(
        text: isEditMote ? widget.accountBreif.customerfeedback38 : '');
    _mostcommoncustomer39 = TextEditingController(
        text: isEditMote ? widget.accountBreif.mostcommoncustomer39 : '');
    _mostcommonpraise40 = TextEditingController(
        text: isEditMote ? widget.accountBreif.mostcommonpraise40 : '');
    _findmostinteresting41 = TextEditingController(
        text: isEditMote ? widget.accountBreif.findmostinteresting41 : '');
    _findleastinteresting42 = TextEditingController(
        text: isEditMote ? widget.accountBreif.findleastinteresting42 : '');
    _tellmycustomers43 = TextEditingController(
        text: isEditMote ? widget.accountBreif.tellmycustomers43 : '');
    _valssystemcategory44 = TextEditingController(
        text: isEditMote ? widget.accountBreif.valssystemcategory44 : '');
    _competitors45 = TextEditingController(
        text: isEditMote ? widget.accountBreif.competitors45 : '');
    _directcopetitors46 = TextEditingController(
        text: isEditMote ? widget.accountBreif.directcopetitors46 : '');
    _establishedcompetitors47 = TextEditingController(
        text: isEditMote ? widget.accountBreif.establishedcompetitors47 : '');
    _emergingcometitors48 = TextEditingController(
        text: isEditMote ? widget.accountBreif.emergingcometitors48 : '');
    _competitorsoffer49 = TextEditingController(
        text: isEditMote ? widget.accountBreif.competitorsoffer49 : '');
    _mycompetitorsbiggest50 = TextEditingController(
        text: isEditMote ? widget.accountBreif.mycompetitorsbiggest50 : '');
    _mycompetitorsweaknesses51 = TextEditingController(
        text: isEditMote ? widget.accountBreif.mycompetitorsweaknesses51 : '');
    _competitorsusingtogain52 = TextEditingController(
        text: isEditMote ? widget.accountBreif.competitorsusingtogain52 : '');
    _aredoingthaticannot53 = TextEditingController(
        text: isEditMote ? widget.accountBreif.aredoingthaticannot53 : '');
    _mybusinesscando54 = TextEditingController(
        text: isEditMote ? widget.accountBreif.mybusinesscando54 : '');
    _audiencesmycompetitors55 = TextEditingController(
        text: isEditMote ? widget.accountBreif.audiencesmycompetitors55 : '');
    _sortofcompetitorsproducing56 = TextEditingController(
        text:
            isEditMote ? widget.accountBreif.sortofcompetitorsproducing56 : '');
    _soicalmediacompetitorshave57 = TextEditingController(
        text:
            isEditMote ? widget.accountBreif.soicalmediacompetitorshave57 : '');
    _swotanalysis58 = TextEditingController(
        text: isEditMote ? widget.accountBreif.swotanalysis58 : '');
    _strengh59 = TextEditingController(
        text: isEditMote ? widget.accountBreif.strengh59 : '');
    _advantagesdowehave60 = TextEditingController(
        text: isEditMote ? widget.accountBreif.advantagesdowehave60 : '');
    _toolsdowehave61 = TextEditingController(
        text: isEditMote ? widget.accountBreif.toolsdowehave61 : '');
    _differentiatorswillhelpus62 = TextEditingController(
        text:
            isEditMote ? widget.accountBreif.differentiatorswillhelpus62 : '');
    _peopleandtime63 = TextEditingController(
        text: isEditMote ? widget.accountBreif.peopleandtime63 : '');
    _leverageouraudience64 = TextEditingController(
        text: isEditMote ? widget.accountBreif.leverageouraudience64 : '');
    _weaknesses65 = TextEditingController(
        text: isEditMote ? widget.accountBreif.weaknesses65 : '');
    _improvementscouldwemake66 = TextEditingController(
        text: isEditMote ? widget.accountBreif.improvementscouldwemake66 : '');
    _notgoingsowell67 = TextEditingController(
        text: isEditMote ? widget.accountBreif.notgoingsowell67 : '');
    _foctorsmaysucktime68 = TextEditingController(
        text: isEditMote ? widget.accountBreif.foctorsmaysucktime68 : '');
    _techlimitationsmyprevent69 = TextEditingController(
        text: isEditMote ? widget.accountBreif.techlimitationsmyprevent69 : '');
    _opportunities70 = TextEditingController(
        text: isEditMote ? widget.accountBreif.opportunities70 : '');
    _contentisntourcopetition71 = TextEditingController(
        text: isEditMote ? widget.accountBreif.contentisntourcopetition71 : '');
    _competitorssharing72 = TextEditingController(
        text: isEditMote ? widget.accountBreif.competitorssharing72 : '');
    _trendscapitalizeupon73 = TextEditingController(
        text: isEditMote ? widget.accountBreif.trendscapitalizeupon73 : '');
    _resultswith10ofwork74 = TextEditingController(
        text: isEditMote ? widget.accountBreif.resultswith10ofwork74 : '');
    _threats75 = TextEditingController(
        text: isEditMote ? widget.accountBreif.threats75 : '');
    _marketmarketinggoal76 = TextEditingController(
        text: isEditMote ? widget.accountBreif.marketmarketinggoal76 : '');
    _competitorsisalsodoing77 = TextEditingController(
        text: isEditMote ? widget.accountBreif.competitorsisalsodoing77 : '');
    _competitorscuttrntlydoing78 = TextEditingController(
        text:
            isEditMote ? widget.accountBreif.competitorscuttrntlydoing78 : '');
    _desiredmarketingchannel79 = TextEditingController(
        text: isEditMote ? widget.accountBreif.desiredmarketingchannel79 : '');
    _channeltoutilize80 = TextEditingController(
        text: isEditMote ? widget.accountBreif.channeltoutilize80 : '');
    _channelcurrentlyusing81 = TextEditingController(
        text: isEditMote ? widget.accountBreif.channelcurrentlyusing81 : '');
    _channeladdtostrategy82 = TextEditingController(
        text: isEditMote ? widget.accountBreif.channeladdtostrategy82 : '');
    _channelputtingonpause83 = TextEditingController(
        text: isEditMote ? widget.accountBreif.channelputtingonpause83 : '');
    _digitalcompetitoranalysis84 = TextEditingController(
        text:
            isEditMote ? widget.accountBreif.digitalcompetitoranalysis84 : '');
    _audiencetrafficperchannel85 = TextEditingController(
        text:
            isEditMote ? widget.accountBreif.audiencetrafficperchannel85 : '');
    _bestperformingchannel86 = TextEditingController(
        text: isEditMote ? widget.accountBreif.bestperformingchannel86 : '');
    _qualifycompetitorbytheiraudience87 = TextEditingController(
        text: isEditMote
            ? widget.accountBreif.qualifycompetitorbytheiraudience87
            : '');
    _analyzecompetitorseoeffort88 = TextEditingController(
        text:
            isEditMote ? widget.accountBreif.analyzecompetitorseoeffort88 : '');
    _discovertheirsuccessfulkeywords89 = TextEditingController(
        text: isEditMote
            ? widget.accountBreif.discovertheirsuccessfulkeywords89
            : '');
    _getanideaofconsumorbehavior90 = TextEditingController(
        text: isEditMote
            ? widget.accountBreif.getanideaofconsumorbehavior90
            : '');
    _getmarketingideasfromtheirrecentidea91 = TextEditingController(
        text: isEditMote
            ? widget.accountBreif.getmarketingideasfromtheirrecentidea91
            : '');
    _trackonlinementions92 = TextEditingController(
        text: isEditMote ? widget.accountBreif.trackonlinementions92 : '');
    _determinewhichplatfroms93 = TextEditingController(
        text: isEditMote ? widget.accountBreif.determinewhichplatfroms93 : '');
    _seeiftheiraudiencehasincreased94 = TextEditingController(
        text: isEditMote
            ? widget.accountBreif.seeiftheiraudiencehasincreased94
            : '');
    _learnwhattypeofcontent95 = TextEditingController(
        text: isEditMote ? widget.accountBreif.learnwhattypeofcontent95 : '');
    _seeifthereisanythingnew96 = TextEditingController(
        text: isEditMote ? widget.accountBreif.seeifthereisanythingnew96 : '');
    _highlightyourownopportunities97 = TextEditingController(
        text: isEditMote
            ? widget.accountBreif.highlightyourownopportunities97
            : '');
    _determinethebrandimage98 = TextEditingController(
        text: isEditMote ? widget.accountBreif.determinethebrandimage98 : '');
    _currentdigitalchannelanalysis99 = TextEditingController(
        text: isEditMote
            ? widget.accountBreif.currentdigitalchannelanalysis99
            : '');
    
  }

  get isEditMote => widget.accountBreif != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMote ? 'Edit Account Breif' : 'Add Account Breif'),
        // title: Text( 'Add Account Breif'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // TextFormField(
              //   textInputAction: TextInputAction.next,
              //   onEditingComplete: () {
              //     FocusScope.of(context).requestFocus(_industryNode);
              //   },
              //   controller: _nameController,
              //   validator: (value) {
              //     if (value == null || value.isEmpty)
              //       return "Name cannot be empty";
              //     return null;
              //   },
              //   decoration: InputDecoration(
              //     labelText: "name",
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              // const SizedBox(height: 10.0),
              // TextFormField(
              //   focusNode: _industryNode,
              //   controller: _industryController,
              //   validator: (value) {
              //     if (value == null || value.isEmpty)
              //       return "Industry cannot be empty";
              //     return null;
              //   },
              //   maxLines: 2,
              //   decoration: InputDecoration(
              //     labelText: "Industry",
              //     border: OutlineInputBorder(),
              //   ),
              // ),               
              const SizedBox(height: 20.0),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text(isEditMote ? "Update" : "Save"),
                // child: Text( "Save"),
                onPressed: () async {
                  if (_key.currentState.validate()) {
                    try {
                      if (isEditMote) {
                        AccountBreif acccountBreif = AccountBreif(
                          industry: _industryController.text.trim(),
                          name: _nameController.text.trim(),
                          aBid: widget.aBid,
                        );
                        await NewAccountBreifDB().updateAccountBreif(acccountBreif);
                      } else {
                        AccountBreif acccountBreif = AccountBreif(
                          industry: _industryController.text.trim(),
                          name: _nameController.text.trim(),
                          aBid: widget.aBid
                        );
                        await NewAccountBreifDB().updateAccountBreif(acccountBreif);
                        Navigator.pop(context);
                      }
                      
                    } catch (e) {
                      print(e);
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
