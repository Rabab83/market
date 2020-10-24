import 'package:firebase_helpers/firebase_helpers.dart';

class NewBrand {
  final String name;
  final String email;
  final String id;

  NewBrand({this.name, this.email, this.id});

  NewBrand.fromMap(Map<String, dynamic> data, String id)
      : name = data["name"],
        email = data['email'],
        id = id;

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
    };
  }
}

//*************************************************************************//
//*************************************************************************//
           //Task Class
class TaskModel  {
  // final String aBid;
  final String name;
  final String description;
  final DateTime taskDate;
  final String id;

  TaskModel({
    // this.aBid,
    this.name,
    this.description,
    this.taskDate,
    this.id,
  }) ;



  factory TaskModel.fromTask( Map<String, dynamic> data,String id) {
    return TaskModel(
      name: data['name'],
      description: data['description'],
      taskDate: data['task_date'].toDate(),
      id: id,
    );
  }
  //         //convert snapshot into TaskModel
  factory TaskModel.fromDS(String id, Map<String, dynamic> data) {
    return TaskModel(
      id: id,
      name: data['name'],
      description: data['description'],
      taskDate: data['task_date'].toDate(),
    );
  }

  Map<String, dynamic> toTask() {
    return {
      "name": name,
      "description": description,
      "task_date": taskDate,
    };
  }
}

//***************************************************************************//
//***************************************************************************//
//AccountBreif Class

class AccountBreif {
  final String name;
  final String industry;
  String marketLocation3;
  String cAnalysis4;
  String company5;
  String companySell6;
  String varyFromCompetitors7;
  String uniqueBrand;
  String competitiveAdvantage8;
  String branduniqe9;
  String mybusinssdobetter10;
  String mybusinssdoworse11;
  String viewmybusiness12;
  String suddenlygained13;
  String hadtocutmybudget14;
  String year1goalsforcompany15;
  String year3goalsforcompany16;
  String year5goalsforcompany17;
  String customers18;
  String theidealcustomers19;
  String sortsofproducts20;
  String age21;
  String producthavegoodreviews22;
  String producthavebadareviews23;
  String producthavenoreviews24;
  String websiteurl25;
  String behaveonmywebsite26;
  String visitmostoften27;
  String findingmysite28;
  String audiencegrowing29;
  String repeatpurchases30;
  String repeatpurchasesmodel31;
  String mosteffective32;
  String trendsincustomerpurchases33;
  String carefulresearch34;
  String motivatesmycustomers35;
  String getmoreinformation36;
  String channelsofcommunication37;
  String customerfeedback38;
  String mostcommoncustomer39;
  String mostcommonpraise40;
  String findmostinteresting41;
  String findleastinteresting42;
  String tellmycustomers43;
  String valssystemcategory44;
  String competitors45;
  String directcopetitors46;
  String establishedcompetitors47;
  String emergingcometitors48;
  String competitorsoffer49;
  String mycompetitorsbiggest50;
  String mycompetitorsweaknesses51;
  String competitorsusingtogain52;
  String aredoingthaticannot53;
  String mybusinesscando54;
  String audiencesmycompetitors55;
  String sortofcompetitorsproducing56;
  String soicalmediacompetitorshave57;
  String swotanalysis58;
  String strengh59;
  String advantagesdowehave60;
  String toolsdowehave61;
  String differentiatorswillhelpus62;
  String peopleandtime63;
  String leverageouraudience64;
  String weaknesses65;
  String improvementscouldwemake66;
  String notgoingsowell67;
  String foctorsmaysucktime68;
  String techlimitationsmyprevent69;
  String opportunities70;
  String contentisntourcopetition71;
  String competitorssharing72;
  String trendscapitalizeupon73;
  String resultswith10ofwork74;
  String threats75;
  String marketmarketinggoal76;
  String competitorsisalsodoing77;
  String competitorscuttrntlydoing78;
  String desiredmarketingchannel79;
  String channeltoutilize80;
  String channelcurrentlyusing81;
  String channeladdtostrategy82;
  String channelputtingonpause83;
  String digitalcompetitoranalysis84;
  String audiencetrafficperchannel85;
  String bestperformingchannel86;
  String qualifycompetitorbytheiraudience87;
  String analyzecompetitorseoeffort88;
  String discovertheirsuccessfulkeywords89;
  String getanideaofconsumorbehavior90;
  String getmarketingideasfromtheirrecentidea91;
  String trackonlinementions92;
  String determinewhichplatfroms93;
  String seeiftheiraudiencehasincreased94;
  String learnwhattypeofcontent95;
  String seeifthereisanythingnew96;
  String highlightyourownopportunities97;
  String determinethebrandimage98;
  String currentdigitalchannelanalysis99;
  final String aBid;

  AccountBreif(
      {this.name,
      this.industry,
      this.marketLocation3,
      this.cAnalysis4,
      this.company5,
      this.companySell6,
      this.varyFromCompetitors7,
      this.uniqueBrand,
      this.competitiveAdvantage8,
      this.branduniqe9,
      this.mybusinssdobetter10,
      this.mybusinssdoworse11,
      this.viewmybusiness12,
      this.suddenlygained13,
      this.hadtocutmybudget14,
      this.year1goalsforcompany15,
      this.year3goalsforcompany16,
      this.year5goalsforcompany17,
      this.customers18,
      this.theidealcustomers19,
      this.sortsofproducts20,
      this.age21,
      this.producthavegoodreviews22,
      this.producthavebadareviews23,
      this.producthavenoreviews24,
      this.websiteurl25,
      this.behaveonmywebsite26,
      this.visitmostoften27,
      this.findingmysite28,
      this.audiencegrowing29,
      this.repeatpurchases30,
      this.repeatpurchasesmodel31,
      this.mosteffective32,
      this.trendsincustomerpurchases33,
      this.carefulresearch34,
      this.motivatesmycustomers35,
      this.getmoreinformation36,
      this.channelsofcommunication37,
      this.customerfeedback38,
      this.mostcommoncustomer39,
      this.mostcommonpraise40,
      this.findmostinteresting41,
      this.findleastinteresting42,
      this.tellmycustomers43,
      this.valssystemcategory44,
      this.competitors45,
      this.directcopetitors46,
      this.establishedcompetitors47,
      this.emergingcometitors48,
      this.competitorsoffer49,
      this.mycompetitorsbiggest50,
      this.mycompetitorsweaknesses51,
      this.competitorsusingtogain52,
      this.aredoingthaticannot53,
      this.mybusinesscando54,
      this.audiencesmycompetitors55,
      this.sortofcompetitorsproducing56,
      this.soicalmediacompetitorshave57,
      this.swotanalysis58,
      this.strengh59,
      this.advantagesdowehave60,
      this.toolsdowehave61,
      this.differentiatorswillhelpus62,
      this.peopleandtime63,
      this.leverageouraudience64,
      this.weaknesses65,
      this.improvementscouldwemake66,
      this.notgoingsowell67,
      this.foctorsmaysucktime68,
      this.techlimitationsmyprevent69,
      this.opportunities70,
      this.contentisntourcopetition71,
      this.competitorssharing72,
      this.trendscapitalizeupon73,
      this.resultswith10ofwork74,
      this.threats75,
      this.marketmarketinggoal76,
      this.competitorsisalsodoing77,
      this.competitorscuttrntlydoing78,
      this.desiredmarketingchannel79,
      this.channeltoutilize80,
      this.channelcurrentlyusing81,
      this.channeladdtostrategy82,
      this.channelputtingonpause83,
      this.digitalcompetitoranalysis84,
      this.audiencetrafficperchannel85,
      this.bestperformingchannel86,
      this.qualifycompetitorbytheiraudience87,
      this.analyzecompetitorseoeffort88,
      this.discovertheirsuccessfulkeywords89,
      this.getanideaofconsumorbehavior90,
      this.getmarketingideasfromtheirrecentidea91,
      this.trackonlinementions92,
      this.determinewhichplatfroms93,
      this.seeiftheiraudiencehasincreased94,
      this.learnwhattypeofcontent95,
      this.seeifthereisanythingnew96,
      this.highlightyourownopportunities97,
      this.determinethebrandimage98,
      this.currentdigitalchannelanalysis99,
      this.aBid});

  // Get Data from firebase
  AccountBreif.fromAccountBreif(Map<String, dynamic> data, String aBid)
      : name = data["name"],
        industry = data['industry'],
        marketLocation3 = data['marketLocation3'],
        cAnalysis4 = data['cAnalysis4'],
        company5 = data['company5'],
        companySell6 = data['companySell6'],
        varyFromCompetitors7 = data['varyFromCompetitors7'],
        uniqueBrand = data['uniqueBrand'],
        competitiveAdvantage8 = data['competitiveAdvantage8'],
        branduniqe9 = data['branduniqe9'],
        mybusinssdobetter10 = data['mybusinssdobetter10'],
        mybusinssdoworse11 = data['mybusinssdoworse11'],
        viewmybusiness12 = data['viewmybusiness12'],
        suddenlygained13 = data['suddenlygained13'],
        hadtocutmybudget14 = data['hadtocutmybudget14'],
        year1goalsforcompany15 = data['year1goalsforcompany15'],
        year3goalsforcompany16 = data['year3goalsforcompany16'],
        year5goalsforcompany17 = data['year5goalsforcompany17'],
        customers18 = data['customers18'],
        theidealcustomers19 = data['theidealcustomers19'],
        sortsofproducts20 = data['sortsofproducts20'],
        age21 = data['age21'],
        producthavegoodreviews22 = data['producthavegoodreviews22'],
        producthavebadareviews23 = data['producthavebadareviews23'],
        producthavenoreviews24 = data['producthavenoreviews24'],
        websiteurl25 = data['websiteurl25'],
        behaveonmywebsite26 = data['behaveonmywebsite26'],
        visitmostoften27 = data['visitmostoften27'],
        findingmysite28 = data['findingmysite28'],
        audiencegrowing29 = data['audiencegrowing29'],
        repeatpurchases30 = data['repeatpurchases30'],
        repeatpurchasesmodel31 = data['repeatpurchasesmodel31'],
        mosteffective32 = data['mosteffective32'],
        trendsincustomerpurchases33 = data['trendsincustomerpurchases33'],
        carefulresearch34 = data['carefulresearch34'],
        motivatesmycustomers35 = data['motivatesmycustomers35'],
        getmoreinformation36 = data['getmoreinformation36'],
        channelsofcommunication37 = data['channelsofcommunication37'],
        customerfeedback38 = data['customerfeedback38'],
        mostcommoncustomer39 = data['mostcommoncustomer39'],
        mostcommonpraise40 = data['mostcommonpraise40'],
        findmostinteresting41 = data['findmostinteresting41'],
        findleastinteresting42 = data['findleastinteresting42'],
        tellmycustomers43 = data['tellmycustomers43'],
        valssystemcategory44 = data['valssystemcategory44'],
        competitors45 = data['competitors45'],
        directcopetitors46 = data['directcopetitors46'],
        establishedcompetitors47 = data['establishedcompetitors47'],
        emergingcometitors48 = data['emergingcometitors48'],
        competitorsoffer49 = data['competitorsoffer49'],
        mycompetitorsbiggest50 = data['mycompetitorsbiggest50'],
        mycompetitorsweaknesses51 = data['mycompetitorsweaknesses51'],
        competitorsusingtogain52 = data['competitorsusingtogain52'],
        aredoingthaticannot53 = data['aredoingthaticannot53'],
        mybusinesscando54 = data['mybusinesscando54'],
        audiencesmycompetitors55 = data['audiencesmycompetitors55'],
        sortofcompetitorsproducing56 = data['sortofcompetitorsproducing56'],
        soicalmediacompetitorshave57 = data['soicalmediacompetitorshave57'],
        swotanalysis58 = data['swotanalysis58'],
        strengh59 = data['strengh59'],
        advantagesdowehave60 = data['advantagesdowehave60'],
        toolsdowehave61 = data['toolsdowehave61'],
        differentiatorswillhelpus62 = data['differentiatorswillhelpus62'],
        peopleandtime63 = data['peopleandtime63'],
        leverageouraudience64 = data['leverageouraudience64'],
        weaknesses65 = data['weaknesses65'],
        improvementscouldwemake66 = data['improvementscouldwemake66'],
        notgoingsowell67 = data['notgoingsowell67'],
        foctorsmaysucktime68 = data['foctorsmaysucktime68'],
        techlimitationsmyprevent69 = data['techlimitationsmyprevent69'],
        opportunities70 = data['opportunities70'],
        contentisntourcopetition71 = data['contentisntourcopetition71'],
        competitorssharing72 = data['competitorssharing72'],
        trendscapitalizeupon73 = data['trendscapitalizeupon73'],
        resultswith10ofwork74 = data['resultswith10ofwork74'],
        threats75 = data['threats75'],
        marketmarketinggoal76 = data['marketmarketinggoal76'],
        competitorsisalsodoing77 = data['competitorsisalsodoing77'],
        competitorscuttrntlydoing78 = data['competitorscuttrntlydoing78'],
        desiredmarketingchannel79 = data['desiredmarketingchannel79'],
        channeltoutilize80 = data['channeltoutilize80'],
        channelcurrentlyusing81 = data['channelcurrentlyusing81'],
        channeladdtostrategy82 = data['channeladdtostrategy82'],
        channelputtingonpause83 = data['channelputtingonpause83'],
        digitalcompetitoranalysis84 = data['digitalcompetitoranalysis84'],
        audiencetrafficperchannel85 = data['audiencetrafficperchannel85'],
        bestperformingchannel86 = data['bestperformingchannel86'],
        qualifycompetitorbytheiraudience87 =
            data['qualifycompetitorbytheiraudience87'],
        analyzecompetitorseoeffort88 = data['analyzecompetitorseoeffort88'],
        discovertheirsuccessfulkeywords89 =
            data['discovertheirsuccessfulkeywords89'],
        getanideaofconsumorbehavior90 = data['getanideaofconsumorbehavior90'],
        getmarketingideasfromtheirrecentidea91 =
            data['getmarketingideasfromtheirrecentidea91'],
        trackonlinementions92 = data['trackonlinementions92'],
        determinewhichplatfroms93 = data['determinewhichplatfroms93'],
        seeiftheiraudiencehasincreased94 =
            data['seeiftheiraudiencehasincreased94'],
        learnwhattypeofcontent95 = data['learnwhattypeofcontent95'],
        seeifthereisanythingnew96 = data['seeifthereisanythingnew96'],
        highlightyourownopportunities97 =
            data['highlightyourownopportunities97'],
        determinethebrandimage98 = data['determinethebrandimage98'],
        currentdigitalchannelanalysis99 =
            data['currentdigitalchannelanalysis99'],
        aBid = aBid;

  // Update & Send Data to  firebase
  Map<String, dynamic> toAccountBreif() {
    return {
      "name": name,
      "industry": industry,
      "marketLocation3 ": marketLocation3,
      "cAnalysis4": cAnalysis4,
      "company5": company5,
      "companySell6": companySell6,
      "varyFromCompetitors7": varyFromCompetitors7,
      "uniqueBrand": uniqueBrand,
      "competitiveAdvantage8": competitiveAdvantage8,
      "branduniqe9": branduniqe9,
      "mybusinssdobetter10": mybusinssdobetter10,
      "mybusinssdoworse11": mybusinssdoworse11,
      "viewmybusiness12": viewmybusiness12,
      "suddenlygained13": suddenlygained13,
      "hadtocutmybudget14": hadtocutmybudget14,
      "year1goalsforcompany15": year1goalsforcompany15,
      "year3goalsforcompany16": year3goalsforcompany16,
      "year5goalsforcompany17": year5goalsforcompany17,
      "customers18": customers18,
      "theidealcustomers19": theidealcustomers19,
      "sortsofproducts20": sortsofproducts20,
      "age21": age21,
      "producthavegoodreviews22": producthavegoodreviews22,
      "producthavebadareviews23": producthavebadareviews23,
      "producthavenoreviews24": producthavenoreviews24,
      "websiteurl25": websiteurl25,
      "behaveonmywebsite26": behaveonmywebsite26,
      "visitmostoften27": visitmostoften27,
      "findingmysite28": findingmysite28,
      "audiencegrowing29": audiencegrowing29,
      "repeatpurchases30": repeatpurchases30,
      "repeatpurchasesmodel31": repeatpurchasesmodel31,
      "mosteffective32": mosteffective32,
      "trendsincustomerpurchases33": trendsincustomerpurchases33,
      "carefulresearch34": carefulresearch34,
      "motivatesmycustomers35": motivatesmycustomers35,
      "getmoreinformation36": getmoreinformation36,
      "channelsofcommunication37": channelsofcommunication37,
      "customerfeedback38": customerfeedback38,
      "mostcommoncustomer39": mostcommoncustomer39,
      "mostcommonpraise40": mostcommonpraise40,
      "findmostinteresting42": findmostinteresting41,
      "findleastinteresting42": findleastinteresting42,
      "tellmycustomers43": tellmycustomers43,
      "valssystemcategory44": valssystemcategory44,
      "competitors45": competitors45,
      "directcopetitors46": directcopetitors46,
      "establishedcompetitors47": establishedcompetitors47,
      "emergingcometitors48": emergingcometitors48,
      "competitorsoffer49": competitorsoffer49,
      "mycompetitorsbiggest50": mycompetitorsbiggest50,
      "mycompetitorsweaknesses51": mycompetitorsweaknesses51,
      "competitorsusingtogain52": competitorsusingtogain52,
      "aredoingthaticannot53": aredoingthaticannot53,
      "mybusinesscando54 ": mybusinesscando54,
      "audiencesmycompetitors55": audiencesmycompetitors55,
      "sortofcompetitorsproducing56": sortofcompetitorsproducing56,
      "soicalmediacompetitorshave57": soicalmediacompetitorshave57,
      "swotanalysis58": swotanalysis58,
      "strengh59": strengh59,
      "advantagesdowehave60": advantagesdowehave60,
      "toolsdowehave61": toolsdowehave61,
      "differentiatorswillhelpus62": differentiatorswillhelpus62,
      "peopleandtime63": peopleandtime63,
      "leverageouraudience64": leverageouraudience64,
      "weaknesses65": weaknesses65,
      "improvementscouldwemake66": improvementscouldwemake66,
      "notgoingsowell67": notgoingsowell67,
      "foctorsmaysucktime68": foctorsmaysucktime68,
      "techlimitationsmyprevent69": techlimitationsmyprevent69,
      "opportunities70": opportunities70,
      "contentisntourcopetition71": contentisntourcopetition71,
      "competitorssharing72 ": competitorssharing72,
      "trendscapitalizeupon73 ": trendscapitalizeupon73,
      "resultswith10ofwork74 ": resultswith10ofwork74,
      "threats75": threats75,
      "marketmarketinggoal76 ": marketmarketinggoal76,
      "competitorsisalsodoing77": competitorsisalsodoing77,
      "competitorscuttrntlydoing78": competitorscuttrntlydoing78,
      "desiredmarketingchannel79": desiredmarketingchannel79,
      "channeltoutilize80": channeltoutilize80,
      "channelcurrentlyusing81": channelcurrentlyusing81,
      "channeladdtostrategy82": channeladdtostrategy82,
      "channelputtingonpause83": channelputtingonpause83,
      "digitalcompetitoranalysis84": digitalcompetitoranalysis84,
      "audiencetrafficperchannel85": audiencetrafficperchannel85,
      "bestperformingchannel86": bestperformingchannel86,
      "qualifycompetitorbytheiraudience87": qualifycompetitorbytheiraudience87,
      "analyzecompetitorseoeffort88": analyzecompetitorseoeffort88,
      "discovertheirsuccessfulkeywords89": discovertheirsuccessfulkeywords89,
      "getanideaofconsumorbehavior90": getanideaofconsumorbehavior90,
      "getmarketingideasfromtheirrecentidea91":
          getmarketingideasfromtheirrecentidea91,
      "trackonlinementions92": trackonlinementions92,
      "determinewhichplatfroms93": determinewhichplatfroms93,
      "seeiftheiraudiencehasincreased94": seeiftheiraudiencehasincreased94,
      "learnwhattypeofcontent95": learnwhattypeofcontent95,
      "seeifthereisanythingnew96": seeifthereisanythingnew96,
      " highlightyourownopportunities97": highlightyourownopportunities97,
      "determinethebrandimage98": determinethebrandimage98,
      "currentdigitalchannelanalysis99": currentdigitalchannelanalysis99,
    };
  }

  // Initialize Data to null during creating new Brand
  Map<String, dynamic> initialAccountBreif() {
    return {
      "name": name,
      "industry": '',
      "marketLocation3 ": '',
      "cAnalysis4": '',
      "company5": '',
      "companySell6": '',
      "varyFromCompetitors7": '',
      "uniqueBrand": '',
      "competitiveAdvantage8": '',
      "branduniqe9": '',
      "mybusinssdobetter10": '',
      "mybusinssdoworse11": '',
      "viewmybusiness12": '',
      "suddenlygained13": '',
      "hadtocutmybudget14": '',
      "year1goalsforcompany15": '',
      "year3goalsforcompany16": '',
      "year5goalsforcompany17": '',
      "customers18": '',
      "theidealcustomers19": '',
      "sortsofproducts20": '',
      "age21": '',
      "producthavegoodreviews22": '',
      "producthavebadareviews23": '',
      "producthavenoreviews24": '',
      "websiteurl25": '',
      "behaveonmywebsite26": '',
      "visitmostoften27": '',
      "findingmysite28": '',
      "audiencegrowing29": '',
      "repeatpurchases30": '',
      "repeatpurchasesmodel31": '',
      "mosteffective32": '',
      "trendsincustomerpurchases33": '',
      "carefulresearch34": '',
      "motivatesmycustomers35": '',
      "getmoreinformation36": '',
      "channelsofcommunication37": '',
      "customerfeedback38": '',
      "mostcommoncustomer39": '',
      "mostcommonpraise40": '',
      "findmostinteresting42": '',
      "findleastinteresting42": '',
      "tellmycustomers43": '',
      "valssystemcategory44": '',
      "competitors45": '',
      "directcopetitors46": '',
      "establishedcompetitors47": '',
      "emergingcometitors48": '',
      "competitorsoffer49": '',
      "mycompetitorsbiggest50": '',
      "mycompetitorsweaknesses51": '',
      "competitorsusingtogain52": '',
      "aredoingthaticannot53": '',
      "mybusinesscando54 ": '',
      "audiencesmycompetitors55": '',
      "sortofcompetitorsproducing56": '',
      "soicalmediacompetitorshave57": '',
      "swotanalysis58": '',
      "strengh59": '',
      "advantagesdowehave60": '',
      "toolsdowehave61": '',
      "differentiatorswillhelpus62": '',
      "peopleandtime63": '',
      "leverageouraudience64": '',
      "weaknesses65": '',
      "improvementscouldwemake66": '',
      "notgoingsowell67": '',
      "foctorsmaysucktime68": '',
      "techlimitationsmyprevent69": '',
      "opportunities70": '',
      "contentisntourcopetition71": '',
      "competitorssharing72 ": '',
      "trendscapitalizeupon73 ": '',
      "resultswith10ofwork74 ": '',
      "threats75": '',
      "marketmarketinggoal76 ": '',
      "competitorsisalsodoing77": '',
      "competitorscuttrntlydoing78": '',
      "desiredmarketingchannel79": '',
      "channeltoutilize80": '',
      "channelcurrentlyusing81": '',
      "channeladdtostrategy82": '',
      "channelputtingonpause83": '',
      "digitalcompetitoranalysis84": '',
      "audiencetrafficperchannel85": '',
      "bestperformingchannel86": '',
      "qualifycompetitorbytheiraudience87": '',
      "analyzecompetitorseoeffort88": '',
      "discovertheirsuccessfulkeywords89": '',
      "getanideaofconsumorbehavior90": '',
      "getmarketingideasfromtheirrecentidea91": '',
      "trackonlinementions92": '',
      "determinewhichplatfroms93": '',
      "seeiftheiraudiencehasincreased94": '',
      "learnwhattypeofcontent95": '',
      "seeifthereisanythingnew96": '',
      " highlightyourownopportunities97": '',
      "determinethebrandimage98": '',
      "currentdigitalchannelanalysis99": '',
    };
  }
}
