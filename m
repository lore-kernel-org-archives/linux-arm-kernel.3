Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A441606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 08:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P5GFO3lp;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IJCaiXRX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=D9DOpQgq+b701cWzO6KiL6SE7PKag/3HRAs92OaSpcY=; b=P5GFO3lp8CiDzKDRPk/K6+mjXf
	A/Xb6vznzIr1DR0R1CNWoiU9awYliCfYtYo7DoQh9C7Bfku927LUskT56DOhq5GH7C5cHA8VoXekI
	31B2oT70u829Nu08YrCtmou48QgSjTQlFnbJhF/8XnQzojRbZASW27qAABYGop/Gc3Qdf3zwwKU7V
	sBFqNMzi37ESHjPBz+JOXnbhgrGq1wTaHQJaxYq0FNeTUXyjAV55aFW0QnGHJ/X6+98n5PoZA52U6
	mvTE+NbYVX26eOqAXOgHmQNvz66qLuIVyi6z/ffqNztLmAXhXVICFZy81TSLVQ2bS+QQaNz70IVvg
	HO9A6H4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEyb-0000000BWQN-1Aok;
	Fri, 06 Nov 2026 08:07:09 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEyY-0000000BWQ0-0T5y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 08:07:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793952426; x=1825488426;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=E2N2c8q0M36Y5wfLFtg/+awSSJWRGzcXJEszu3drs7A=;
  b=IJCaiXRXmH73mbZO/5kaQOymbhATyuf6d8HuStmkFYpUhbYboQMKrNMR
   DnUAxK6WOPCXdEwt+FVQDAFP/wbvzCCAdAYvIrduN7yrGzbpKE3dxxSno
   ZTLmvnJnOcchOWPyhZK6WSmwhtz/4CrytS+KtVj8/620YqCXSblhOA9un
   wZQkBhdu07XI8yR6BB1QzBJE7SiwB4RFe1ic3wvyckUzSnx6yWjrnbhek
   NnG20XPHltkmlU3lp7m6iQkws2WctOM9X0HVepC0LmKw9wK6qTavLSRIr
   NWEYRrvklI0bcALpY5saGYGrH9EWzTe5KXIw7ugU7MekBnRNQPkL5ebYL
   g==;
X-CSE-ConnectionGUID: 8b12xrJtQi2u7g+KjI04pQ==
X-CSE-MsgGUID: nQ0EBq2tTlSu7lUoffiL5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2655499"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2655499"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 00:07:04 -0800
X-CSE-ConnectionGUID: Te4n6craQaqjbpsVlm2c4A==
X-CSE-MsgGUID: yEybgTkaQQyv6Y5QWzAATA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7107951"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 00:07:04 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 00:07:03 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 6 Nov 2026 00:07:03 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 00:07:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTf6dhRABCJF45Vjv9UOgayhCSOnCyRjN5qOkjhQFDuDHi/wn+0Ag9dmLZ3CHv7tITBGRZ24Zv8TqiZ3UJVcGKH0fVJkTobARWGlMKlYY+aczQLHgsaJx7sOCEj++RPXlOdsjok0mlYK/h8O3WQXyvo1lxl1WGO2KcT3SaUdcoszN3/fRvjetYhaeFpImjWPzb9WpGIGttRdZE6sw9OxHGyvwN+4Jwi9ieHC05bzRG7dEY27romZAkTrZaHX24ojvY1ZqlDCfeiqoszY1moxy8emgbAVrLFx+gPMBhISnh8Fdqp/hDve9pNJaFHP9OT93gfEYF/Uxa99i89RHuh8Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9DOpQgq+b701cWzO6KiL6SE7PKag/3HRAs92OaSpcY=;
 b=xDCx/riPVKEE8LqnXLtGusgcumaUVCU1Up7yuRMrhN5r4ydrUXdfKMmkphXwCam+rJmaw0W2PHfc8ooHQhwj/B78Tqvm0xd4elRUpusA7eDIwoKn7LO1SQ7zxSiW5/6RApCHkJ6noyc3fr5ZVMiBhVEwXkU8470LtTIFl0pBWDX24behqjVt/BGTtjv0PWd5srgRDe3jK3D8tOnouJx27E183/97v1DBuGf1yPO3Y5TSl+ooBQh3CdG74R4cM0V6B8yuo5Ei/7w9Pghpy25FPTAD53mXW56CNnZg8XeDoiePrWc3exS8Qbg8VbPeOGGAOE8LJrK0Au58QJgzGOTTPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB4835.namprd11.prod.outlook.com (2603:10b6:303:9e::22)
 by CH3PR11MB8139.namprd11.prod.outlook.com (2603:10b6:610:157::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 08:03:52 +0000
Received: from CO1PR11MB4835.namprd11.prod.outlook.com
 ([fe80::d051:d948:c209:9225]) by CO1PR11MB4835.namprd11.prod.outlook.com
 ([fe80::d051:d948:c209:9225%6]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 08:03:48 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@ziepe.ca>
CC: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>, Alex Williamson
	<alex@shazbot.org>, Alexey Kardashevskiy <aik@amd.com>, Bjorn Helgaas
	<bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, "Joerg
 Roedel" <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>, "Jonathan
 Hunter" <jonathanh@nvidia.com>, Krishna Reddy <vdumpa@nvidia.com>, "Lukas
 Wunner" <lukas@wunner.de>, Nicolin Chen <nicolinc@nvidia.com>, Robin Murphy
	<robin.murphy@arm.com>, Samuel Ortiz <sameo@rivosinc.com>, Shameer Kolothum
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
	<linux-tegra@vger.kernel.org>
Subject: RE: [PATCH v8 12/15] iommufd/viommu: Allow PCI TSM backends to
 provide vIOMMU operations
Thread-Topic: [PATCH v8 12/15] iommufd/viommu: Allow PCI TSM backends to
 provide vIOMMU operations
Thread-Index: AQHdbHg6xXjL5aZ9d0memJQCvEO+p7cejimAgAAX8wCAARO1AIAA9ejA
Date: Fri, 6 Nov 2026 08:03:48 +0000
Message-ID: <CO1PR11MB48352506BB91C461F25147098C762@CO1PR11MB4835.namprd11.prod.outlook.com>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
	<20261104161632.3547423-13-aneesh.kumar@kernel.org>
	<20261104152351.00002565@linux.microsoft.com>
	<20261105004934.GE3889730@ziepe.ca>
 <20261105091622.00004a9c@linux.microsoft.com>
In-Reply-To: <20261105091622.00004a9c@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB4835:EE_|CH3PR11MB8139:EE_
x-ms-office365-filtering-correlation-id: 52d8ed45-5dfd-4f1d-c042-08df3bdc7d38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|38070700021|11063799006|4143699003|56012099006|261022115727099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: CbTVXBm/6MSu0buyKDG2tZRXdReXSA323Fxi8//RXGlCN1pcnEbm78beR1Xp5mjrOKYDfAfUt8HAdqFEIHPe46+9iTw4SGZRMlZZqCLWsjzfVZqY1JY1KmbFErhWy7r1+Yw5/kcmFHRQa4ctDkGhn2UnLqKmTJQYXeVdumAkYMEkTsYP1FDtuhRfmCOIeSFHyb0zP1irIXF3T9tUkqirYKxnnm3EKlm3A1xWL7UpmCTYP5Vi7Pa9suVtzfP7qHHTnFo+vB0nPVlCALEv1eqvo7es6p9NcrbaHfa3Qxh9rrjPv6atDP/G2cXjIdyiSeWfqLH4rGo6QHQf+06XgUVGcpX1mPcBTfzlCeO6JN6jzDDJoexkH/fizioV/NEbNvGtmAQQKbOavWtNKvLvPGRTJTKCUqthkXK/T6d5bbmQkuLlWlsOwI+23xmrpWIA6bVJ0ds8JM4YJOEmwNHE+3OTLdj1Gi4eCH9I8G9hY+ifnsHP+pXWdoFRAQly/rWQeKO60/FbKR5WIhzsx1YSNar4o9vwi9+r1F/e+41NrRV6iP+dQtM+3UwM1Ll/7RJZndGvV1NBRb5HZmP3FUX5Hllz/7jbzvvQ1hz5uB6G9QaLnLqJodE0HA+wjVHsw7EtLYfkELHkOwFZBmSIAdk7TsYy0PfQap+1oFOIRmLz80r6oj/VQGQ6MdW510/xGXk46iLINuzs1pOcu4ssH6dp7C9cdrQLkE9woVhz+mAfIsndKTI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4835.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(38070700021)(11063799006)(4143699003)(56012099006)(261022115727099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1PSgDN8vEhh4i54hSu6Ym1pAETJmBWy5CD4sw9icuP+l4dmbP21F6v+he7Y5?=
 =?us-ascii?Q?EqQDfp4IlTklqLIPRFnwPKBe8pOp3ejOmoZC0WN+26wQVYZb+/HjVht4LCVM?=
 =?us-ascii?Q?5dxwfL+pzsRzJSKXz43Ppse1+QO9zXU0RZi5A+7DWWyz02BwsZKoRYjy4Jw8?=
 =?us-ascii?Q?tUqSjJnTiFk1fi89sDygTCw0UCkPV7o5JE9QCbdPUnnkGVFCN5VyNUbgoBVS?=
 =?us-ascii?Q?WId31DHZmeCZkBt9CvOT0X9GZh1/eeNPwP3QwYLEuWI8Cj05CVBcnZZjAENI?=
 =?us-ascii?Q?AN0Vnd+Fn7R4pM8sa1+Qs2PA/2oWnbNHYurv4X4gNPGZ4gAP4OFy//XpqQqN?=
 =?us-ascii?Q?sj3/tvn5d034W909ZN5fNcXzUh3qIlqCFxNACNxMbNK4xbJP0W4KBbJ3Xo3Q?=
 =?us-ascii?Q?jVZl0H/prLNXH+w2cO85x+2e8g0Nf2GOjcJ1WQjD1Pgxo5Rg1nnPoiJKrJ2D?=
 =?us-ascii?Q?2/BCKKhkfkqECrb0+P6T9/dg+IKCiV0d2fbfh6u1I1fi6iBDT+NBap1dI2gD?=
 =?us-ascii?Q?t8mbQsYkSK4+PiLyYCFQ7UHb9g3qZB0C06o4jyjP2yVX+Dlwcw0CC8HlpyHo?=
 =?us-ascii?Q?t4OKeBGJI520L2MfoNoGJOi9hRi6tRCLhvk4I9enAWvkZPAA6o/rkj/FpT9b?=
 =?us-ascii?Q?RO0hg/aEBhLkO3qX/qnFGDz40SU/6LDAOnRNN5rb9MaD0Wbco79yj/3boQuo?=
 =?us-ascii?Q?5YgNa6iQh63t0cZs28kZdT0a2kooZVD8mw1zumTY5PRLK/NFxmrHiIAHVpDa?=
 =?us-ascii?Q?ynLiww6/NdyWAHqn37FyrY1NwaSmv/ImR5ef4KmU2bKBZRzBVc8Bxj5F5KYg?=
 =?us-ascii?Q?7ol4926bvMkPy/pCFYxSSWf5BSqxw6ovlC0o80bJk5c1eT/AnBmvbSg+P5Mr?=
 =?us-ascii?Q?sLEvcuYMCzOrQfFlRfNfa1hYlmbEnYRq1TInMd/GOJUqHobpH/RlY1w0kEKN?=
 =?us-ascii?Q?9g0F7iFzWuppEVpgM+kShEMuz78KygiSZTPyfGCy3ycBX/jaAlduzK8xGa2f?=
 =?us-ascii?Q?S8up/SpRjattVDNrwkBhJuYa+l5jAVKXQeiP+1Z32eWjkp3r/tZUGIsYDxMB?=
 =?us-ascii?Q?3FCW5mB8RdFAVc2hJbYouVeoA+FnWmuyXJJ+lvGy3uqpeEdreTgXiwMdQGr6?=
 =?us-ascii?Q?7klBcr/om4GgC6t9jPiJAZ/KpGCk/RBShzrz80FK4Im//CpDODrFL0LdbfvM?=
 =?us-ascii?Q?FEoxP/g5SDBqkfIuPdbPMh5+QBkfluPPaXoompOgjF69+XqBeSW1sxs94M+S?=
 =?us-ascii?Q?eEAv6R7jXD3aCXjkcDMI98nWjX+LrZf+MxOkMl7te0bRKcnK5CTn6dCmz9Vq?=
 =?us-ascii?Q?E8lfU1uwLoJzVahK/djZXZXnQ7j+BB2WRqakAdAO1YYHe16XO+WHZTKVjRml?=
 =?us-ascii?Q?c8GZT667KiCaviiVukiwLCwuVnfhJZCfGVF+90kQ2pITB4Cnf68kye6Lgjup?=
 =?us-ascii?Q?HMgZiGmmxpP3Ue3kdWRpJOvzwJcYZzNhrPSlQuYrdJ6u3xizxASDpuHoXLgC?=
 =?us-ascii?Q?pyLYCPETfEw2wK4tl6jwka0q9vT20sPN6bo2lxt3ce5cX3iUK3vzwYCtS5RF?=
 =?us-ascii?Q?YAiQeFAFk0Tr9HNQG947ya5W+oGPbiA9ccM73watWeSg2QgipxMUOyOvgZi9?=
 =?us-ascii?Q?cJsNVssJ45AcLxf5M1nDB/aoKv58X4iIVb55ufioRn4np7GZazKT4HydkRsM?=
 =?us-ascii?Q?4XUtCn6gUtOilte2KXVt9oPgQ4EN+f+dTpbRpwKJQJxtIlLY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: wI6AukWpR4PozkuTJAUz2TXq40f1lWaVv7toZ88b2LfVbXebDalmOdvgpPD6y1xEpvqKvpQWGcMHLi4JDin8fyhl9viGHc+Ze5rbvjlS7qfVZPnxvlgZXRLeJK4EzIw0GEDoO0cV/p2sZgLxeJ1IgPt29BIQS2bkH2aXswdtFxNY6Ee9qycd0ShJKtL0MSbRe94RFu3wZOwoQLWDI0rhF4GqJZZL9igKqWsfaWTpZWJhLkxNbtB8cZShlRrvJF1a6xRkwOMtcsgp81/GbqCvL5fMWbZFbcXbrYbxuASkXwJC3zxmsgFCgXoudF6/xITPu21F1t47365QTzjScX79xA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4835.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52d8ed45-5dfd-4f1d-c042-08df3bdc7d38
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2026 08:03:48.9013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +9kX/P2yI/Yb03TQbu3pDWCkR5BO26pqyi5NQzY4zdkP9+15sQlP3CyTUNJ3D1SDLzzmT5tLNkicLega+55JjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8139
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_000706_241748_C200DEF7 
X-CRM114-Status: GOOD (  20.70  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> From: Jacob Pan <jacob.pan@linux.microsoft.com>
> Sent: Friday, November 6, 2026 1:16 AM
>=20
> Hi Jason,
>=20
> On Wed, 4 Nov 2026 20:49:34 -0400
> Jason Gunthorpe <jgg@ziepe.ca> wrote:
>=20
> > On Wed, Nov 04, 2026 at 03:23:51PM -0800, Jacob Pan wrote:
> >
> > > I am thinking MSHV/pKVM can register an assignment-only tsm_dev to
> > > leverage this? Could PCI/TSM support this role without
> > > device-security?
> >
> > It is certainly not what TSM was originally imagined for, but with our
> > new arrangement, yah maybe so?
> I will rebase on this set and send out patches for a detailed review.
>=20
> > TSM basically just becomes this weird overlay driver on the PCI device
> > that does stuff. Some of the stuff it might do:
> >  - Register an attestation subsystem device to do SPDM
> >  - Register to allow iommufd to create a viommu
> >  - Some status sysfs ?
> >  - ??
> >
> So we may expand pci tsm to have more than one role? currently it has
> one.
> int pci_tsm_register(struct tsm_dev *tsm_dev) {
> ...
> 	roles =3D is_link_tsm(tsm_dev) + is_devsec_tsm(tsm_dev) +
> 		is_assignment_tsm(tsm_dev);
> 	if (roles !=3D 1)
> 		return -EINVAL;

Not sure what'd be a proper name for this, but it sounds to me that
it tries to over-abstract something into tsm. The reused logic related
to assignment or viommu is relatively small, so the other option below
sounds better if it can work.

Or it may be the original provider framework that Aneesh proposed,
so tsm/MSHV/pKVM can each register its own backend...

