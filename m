Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371AD606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 07:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3pr0vsko;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cWatg0lb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ACsVNoLlR3+/MQ6WvbSmoh5iyhRE7pLOg4USzwX5KZI=; b=3pr0vsko0FY2T2wCzi1UfK8gCG
	DyBzQk9CZr/Au+otq9iZV5Gxkz4GB+xZujRfQuH+iP2uMiYbxG3Y8a0jUr+Job5oOIkDjd9iNpZNv
	eTOY/zUHAENrJaDKvy8Vi8Kkd35sgHOEwSoiKwIscrLRuUGHOYFJWNsXNOxWEZah29BeHfS+fHCa7
	o4atYs9y5sle/1Ma6MX54+vmTzUOqk1c1VLtOGSCMljvDxsNHCv1iJVVsEkJ4C0S04+EFSbTfLwo9
	N3wTfaUcK6D5RbmOAQKpbTw8qbYkLuSdpPGAV+qi80bRhb5Q0Ot/B44OcqLfbNAnWVSpryoZ4b42B
	Qs/Nh7Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPECr-0000000BQb5-3mQA;
	Fri, 06 Nov 2026 07:17:49 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPECp-0000000BQak-39Ud
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 07:17:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793949468; x=1825485468;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ACsVNoLlR3+/MQ6WvbSmoh5iyhRE7pLOg4USzwX5KZI=;
  b=cWatg0lbfJ6Y2QyopFqddYITkjmiXFvHOvp7EZTl75WiVJPtF1Ea4dFC
   /CRRZ+gSMaRMNKQONfa4ONK0MV9OrFL96ST4bk0YWQzPEpdWzy3E2IG3C
   GEG+HsrbMiZTwavO+WuzcsfAmJwkfLOg8y8gLnUhiILWFMD++XmRRmpWA
   aTWxgWRJSRE/7EGmyw0fZllrg9sYEH9RRgxihRZUS/h53auGe2eBQ0Vow
   JjYe1jN8MsaJYX0cvnN0a/9qbKZUMy1V5T4Z04jGeSewM004JmV9rNO+D
   wlbwKdbqWWO8391DWEUIXYWsx35UCl4xbGcNjKSo/qSyDgmACqjwnfivG
   g==;
X-CSE-ConnectionGUID: 0CNRb0L8RCiHaItngrtZrw==
X-CSE-MsgGUID: WelR4dvtR2SGmCjM6DCH3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2672848"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2672848"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 23:17:46 -0800
X-CSE-ConnectionGUID: izx0KSnYT6mtqeGJOhsL/A==
X-CSE-MsgGUID: qhndFlijRUmLyc87bwGB+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7768779"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 23:17:46 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 23:17:45 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 23:17:45 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.36) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 23:17:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XwWpkKopWomSsn9Yfr/exX4PYCs+vN+gfY2LwjJqts6XIwrV7JYT/ulKRYdXQm0+buZK/iyMeYY7cLGZRquhlP8olZOf5rxHu/O/ujw5b4inzoy98P9jtp9w35UkXuWs8LTz1v8oI7+8GfmYCILvg4YHaZw/CIYXEwaXRFlZg35wquNFEL4mejuc02eHBNw6kF5cR8yPnuMp60EOBvLkFiAlvwziOV3/DcWkBq0TIYQBvTFdfyyOsAtdpLkmcgXMlYPvobV5y4y3VKTrX+9914mc3IkBc3qw3orMfy0MYzReNw2qY/6Zx0A9DbTHSPyX2FAVsZWYW8ajK1bDVOiG3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACsVNoLlR3+/MQ6WvbSmoh5iyhRE7pLOg4USzwX5KZI=;
 b=V+JoN25iUeaNyEE7/u2lfe7kBN/2J5iGCXL6yLQuI6/z88BzvlfoDGC+EbdEAPPj/Yh3s5gqKnAXktDvliLIqSulel2sn30Vrfh0jdbk/GDL3bGWpr1MWk+hp4tYL8jgOLfrcQG8w+dJNma/W127gWRco1stx1aD57GWNMAkcgYd5Z09GlvjhEujQ3fX05kRm17B/LwSFfQYJk5KVOeql2jEU1OG4+f5m6YlcWzHDsjAfQQfAbGoYIWp581C16dLPTpDm2KPcgq9OEvcjuHUpJVG2WTQAeyCeyxnC0bVOF6tXEodr8CLDmHbCasPuYmJ7kiy9wX6RCgLkFkAdOJ2sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB4835.namprd11.prod.outlook.com (2603:10b6:303:9e::22)
 by SA0PR11MB4669.namprd11.prod.outlook.com (2603:10b6:806:99::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 07:17:43 +0000
Received: from CO1PR11MB4835.namprd11.prod.outlook.com
 ([fe80::d051:d948:c209:9225]) by CO1PR11MB4835.namprd11.prod.outlook.com
 ([fe80::d051:d948:c209:9225%6]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 07:17:43 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>
CC: Alex Williamson <alex@shazbot.org>, Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, Joerg Roedel <joro@8bytes.org>, Jonathan Cameron
	<jic23@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Krishna Reddy
	<vdumpa@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Nicolin Chen
	<nicolinc@nvidia.com>, Robin Murphy <robin.murphy@arm.com>, Samuel Ortiz
	<sameo@rivosinc.com>, Shameer Kolothum
	<shameerali.kolothum.thodi@huawei.com>, Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Suzuki K Poulose
	<suzuki.poulose@arm.com>, Thierry Reding <thierry.reding@kernel.org>, "Vasant
 Hegde" <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>, Xu Yilun
	<yilun.xu@linux.intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH v8 07/15] iommufd/viommu: Keep a reference to the KVM file
Thread-Topic: [PATCH v8 07/15] iommufd/viommu: Keep a reference to the KVM
 file
Thread-Index: AQHdbHgXFlI83TRk0UaeKnC5EQbCgrcgpMWg
Date: Fri, 6 Nov 2026 07:17:42 +0000
Message-ID: <CO1PR11MB4835B59E82BDBA64417A1C4E8C762@CO1PR11MB4835.namprd11.prod.outlook.com>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-8-aneesh.kumar@kernel.org>
In-Reply-To: <20261104161632.3547423-8-aneesh.kumar@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB4835:EE_|SA0PR11MB4669:EE_
x-ms-office365-filtering-correlation-id: b8d9ca9f-9be9-4f36-40a3-08df3bd60c95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|38070700021|11063799006|4143699003|56012099006|261022105027099003|261021135927099003|261021123027099003|261026140227099003|261028144727099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 8qZh5H92EhFO5NWBptZQmRJc78oqoF1w3z1XLyrYmdceGMDx6aAOuqOup/NaiXqGs9cAm8uDdyQVi699GCHbuu6US83PWlzqW84N5GQ6e/NZNUZU7Z8yJ7DAAbYdUBFlYNaklibPgJMwy//BalA1Ri9WJz1VdOoKfibZHjLDnQDsBd6+Qe/rsHN99ziXMF4u5UXA6AHj5fo84cLvayNwuHg4E/Bi7P6G6k1geFTX7Y3egBCTIDDCt1nXXxTyrLu8IRXmhIwaJcngDqOszwsl5FQPTmhbTsNF6GlK4MrRMto8jhNchUBndKOVsfeCUazrhOGlBGe5CheISJq0XUgIGHSEfxeTWqYlKeOZDjF2ROmlIDlK247HoUUNSZAifEGWMjTuYH2OWsIwWF56fVEZquZ2bYrWgTYWDArZ2I3FO/5skOKoMGKikux7DUp26BJhEWMOzB9x5Z1iy9lLkBnu/1X7Q2A4wzToKIsoJkHFE3QVoslZpktt4PEv35UNustiwJLT97g47YqHHmnsg0IROSdJQui1pPV9L6qSkwxWvM+uvgyK44wv6CGSHtPcVfBMwceoCsq9f8BLBSF45DV49hOZmeW4poUgcFrXw07GUx216/4ObWWw4EVRXbHD8BeyhIjnnVhCElAOphq0EusiK6lwsuUODCfBOISztLqI8RTwENA0jf9r7h9PCucych8mY12ddLwguGLTvX6lpd4NHjhufQzQsTR99eXHplvabQ0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4835.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(38070700021)(11063799006)(4143699003)(56012099006)(261022105027099003)(261021135927099003)(261021123027099003)(261026140227099003)(261028144727099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WLjKATKr9iDgXB30gACaLWN/OVZkyg4tQpm0st6W4H7bETdjFMFmDGzsMmYO?=
 =?us-ascii?Q?eRsUM0NJ2ZZZ31t8B0Am8kCNiIcBoH51Tzkg6dvjsWOojYLVIC5ER1gU4ypd?=
 =?us-ascii?Q?wpKPTcNNOz64YlilBQ1mlIEfu9OmIFE02RbJ/8pKqjz370s8OO6oPCs9qceC?=
 =?us-ascii?Q?+W7p5xhC0NS/UrHBJPJ/+6zf9SoQ1RA2pbbBZwodO2AKsrRzbmjY7oHJ3ZBo?=
 =?us-ascii?Q?cymmup6zPnRHMlmP7e4RN+VbIeUlbUavXsU0S7BSMXMg3rpGbzuu/37W+CGB?=
 =?us-ascii?Q?Awa+1kSJ65+UwFSKywKXO5cR/2KGkm+gFMnZONw59ZtXqregJa3XC8h03ZMM?=
 =?us-ascii?Q?HFxsdTPgWn1Dyv8Y2RewPRuLCMfzpaiCjN79ZVyXIZJpi7296Lt21EEvQu6x?=
 =?us-ascii?Q?Vv8zLBgJcBZte40b8vHWrJGo7m2q/1CDlaphnK/rUlI1EhUXflWyIqhAAQeD?=
 =?us-ascii?Q?QU69vskoMLKGtj7FVnCE1WWXDXtzj46x5Wi9E/QPlP5o/RXrprutCevdJ569?=
 =?us-ascii?Q?Nrv6W+u82nYtGATSOMRqmzsaHRZ6qgkgjEQ0+OEuw6iduwecyTg2+7mfMSK6?=
 =?us-ascii?Q?LaLLWaCmUTQ9psifwXbw4AFv0kKXAQ84pWggzj779R9BdQHzmwUuJQuuDJpL?=
 =?us-ascii?Q?bKLvTPg+Sl6auiBIKACTkAYKhC+CJHljMy7FUYC+yPe7RKPznB1Qn4EqVH3f?=
 =?us-ascii?Q?0HW/xK3ywJdIb0W7Dq9KpDDfqpsF06+aFpfzsT3x/5oIqoFpbqyB4fSvBjYj?=
 =?us-ascii?Q?02NLgGTsy/Ugb1HC0AnYi6SCoyyJe38KtosuzEKxlOc2YtaJfBlEc2U/Gh+2?=
 =?us-ascii?Q?r7Vy21uC84StrYQ3hdZ11elLzRi1awdEus4jgATqdgmvW/z9VjgmIuZ0PT5w?=
 =?us-ascii?Q?Xsz1ppHTXc9D8Hd0BQVMVKOWC6rJaLKoYHhKVuOHnxYRrc2z/YmAJ8ysXI14?=
 =?us-ascii?Q?Cra59XmJB4mLbea2p6d6q+vSflYProuQB4KhFvVQRUO56eOqqbS+PJUEqOll?=
 =?us-ascii?Q?Z862LBDKg27VzTbWFO9VpeKIToeR7UdCBm0sCUctXjDE5nyToEchM4xQ5ELr?=
 =?us-ascii?Q?QZCnO3oOUFwqj9cmA9J1bzkx4q40YeHucFPaHbbRLvx/LqSLU+RUpYFw1K+m?=
 =?us-ascii?Q?bMt7GbUelUjODzYE+Qp1TZglHe58v7Tkr8csH5DQPYpmNtS2tOiw/S3gcbAx?=
 =?us-ascii?Q?jznqzvTA6weItdX2dPuXNnDqLNPwOh6HH/cB0VPY5dTN9KWdsMkCKddcRV3I?=
 =?us-ascii?Q?SJCPFYvwnwkdhhuQnzf/Aeuhy8qMIcGAYb5CvySrimmB3niYjk1cffuIz4Qe?=
 =?us-ascii?Q?GAnaDuBuvsqgWc1uYDVKFysc3f1uov3i9qq2RtFUCnCnS1MuazYn1vNVTT5a?=
 =?us-ascii?Q?9G6cPDie3Lju/7zj/OtfE44OA8sK6gPNxUOapGnDsv+0+vFe47lZ1Y0YSym0?=
 =?us-ascii?Q?4hSJubZp6SWWCY+BWfmHBVyeJ0yw39AWEPKixckGyWRTVD81BE/XsHiYWY33?=
 =?us-ascii?Q?1xwe+pi/ZfwXpP/NzPeamiMLkXk76Dv/wh/D4uJKovgjPaFqmOruA6xAWJr3?=
 =?us-ascii?Q?g/IIRzL3N8HaIcKWzxKJtpowz+VNCwtiYaMQFQNE64VZ2L2M0KdEhmnhTpKI?=
 =?us-ascii?Q?WUxGNi4t0v0w+rcctBnlY6Er6WHeHiEqRCdG/finGYL9sKFWvJtzkWDCkvpX?=
 =?us-ascii?Q?pfb3k37NkPeKVCLYGASieBGv2LbQmLbITvaWOJVSgqllNe8G?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: xbE6K2rO9vQW3G74cCWBOUtVj/CDRhpaXhjAGvX7yTDN+E9AzYcs1sjeo6arqGvUyj37TBFium9bBTMryPqGpPeh8s5xiXzpkgwiXGHZPRAloPfd7Kaddiu2tOR6aWzC9rChG3pOjEmkV8BmUyoqxjLxRCy+sbIc3tc7JfR64Vuf2OP8NdiKs6V4TruNG74HuPMTgG1K+1dtfNe3xRjtZ84DOXlIl5+nSE5mJdeX4BPgjx+OVYMLQqWJym2qqXm++8yuZ1vsMjLXvwpELQL8u4gL/jY5BVmBQ2ZThpvyqiQGK9FV+x9zO29fJRh+Rr00OPP2EY5+jxSmozX6907Jxg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4835.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8d9ca9f-9be9-4f36-40a3-08df3bd60c95
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2026 07:17:42.9381
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VRqz+OhCKGHpoP0/NVdNxNKnK5ukaEIDJsUasfGsOR/J+21fv+h/pyHH6BTfaz1b0lvze4eyWrq+C0lmVEdbzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4669
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_231747_804612_C6E5E951 
X-CRM114-Status: GOOD (  14.65  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> From: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> Sent: Thursday, November 5, 2026 12:16 AM
>=20
> From: Nicolin Chen <nicolinc@nvidia.com>
>=20
> The TSM vDevice operations need access to the KVM associated with the
> device's vIOMMU. Save the device's KVM file in the iommufd_viommu when
> the
> vIOMMU is allocated, and take a file reference so it remains valid for th=
e
> lifetime of the vIOMMU.
>=20
> Release the reference when the vIOMMU is destroyed.
>=20
> Reject vdevice allocation when the device's KVM association differs from
> the vIOMMU's, including when only one has a KVM association. Allow
> allocation when both associations are NULL.
>=20
> Based on an original patch by
> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>=20
> [nicolinc: hold kvm's users_count]
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> [aneesh.kumar: Switch to use kvm_file]
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Kevin Tian <kevin.tian@intel.com>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

