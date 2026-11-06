Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06F2606A328
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 07:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ya+qi02s;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EGsl+SMC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9LB1IZDbqOR8K+DtX2GZ5X4sg/qJ7NHiqj/TxK2kaiY=; b=ya+qi02sfnfoYavjYr5Cj2wX/o
	S6tVlcCgQX8Fq2kU37M3HIiptbDq4rCnU+NGH92vqVqWwhimrrKRnQeAPr3h0rbfPBfNGEyx/xEhx
	pHIaxZprhXLaxIxgCAnmuJOetLBwJPlWI/J2W1pa11ADIqQQ2Up+9AS5oiVWrZ5G0MyTfxN5acU4B
	dTYuEkPY7Rn1sK9BobASFFuXDIDywD5UK9Wt6+JDGqzAKrUiqo3CI8d5ehLgzBRI12avEi2yiZwnK
	JLW23lScIxRaxhpujvL3DBYhc0CysNDO787+TJQfxdRyfKzl3oS0zcI9u8mm3TSbF34TwU2ZJvY3i
	LZP6foXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPE0f-0000000BODz-4980;
	Fri, 06 Nov 2026 07:05:13 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPE0d-0000000BODa-3Nha
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 07:05:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793948711; x=1825484711;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9LB1IZDbqOR8K+DtX2GZ5X4sg/qJ7NHiqj/TxK2kaiY=;
  b=EGsl+SMCAGo2PH9yLw70XqVb36vJXxOkcxy5ieK4CxweuyscO+fDhWIA
   td44IehRh9UrDBlMEklqisMpzN5pQf+cgXWSNCE/GXbQqIkWIjm9WM52O
   WV9Dwo3sjJ5SICcH7AQHJXTAhxVr79pIRm5xb3NzD/LQJc/XtFwHUw7hz
   B4SY8JsR5wjyXLlvoeu5AQmEhMfpvMRH0VhPTdm542IF17chlhHjgOfvT
   Isk7c3e53FFBepDBUR7gYEH9EKd77sa0bwoKarZvqqUG26HiFTOC5yZRX
   EefajLGvp0ZUL26MwfJut4RKZhN+GiK8mmffBCuiDF4FERxzFkan2hE+v
   g==;
X-CSE-ConnectionGUID: uStiB9P8TM6572YxgOAJQg==
X-CSE-MsgGUID: 6f9ST6evS8+HIm2GXr7I3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2780170"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2780170"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 23:04:29 -0800
X-CSE-ConnectionGUID: L++C+rslQ/WQFxYI6Rp8IQ==
X-CSE-MsgGUID: 22/lGefCQC6VOxL7KyJFTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7551352"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 23:04:29 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 23:04:29 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 23:04:29 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 23:04:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zTaImur7op15LkgycOYkswBiWRqY1Fv68f85I2UV7QuHcE2ritvICecVqj/q15WZG94qT4g4SzozFQQsFdJqzvlaADvVqi36TkI7bVeIbbL21rI39I3+1kogpIUaDMp9U4XiIzvLb7tUNykyyGQip7ekofY6Gy5VB4cw/gwJUuZfXIPAmvqx4IdeIAzdRU6BnCtcXKmXX0tfBTSri/diIOGNEAWGEK85LpIPxHJo1MRB9rCumWSZOeRB5uUlQBM1IShC0yDrg+VnnilOFWLemVf+2uIbirU2QYaymyOKhthdPKvCzLy0yqA7V6E8YG30rv2gceMrpNP0E7ctQOe/Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LB1IZDbqOR8K+DtX2GZ5X4sg/qJ7NHiqj/TxK2kaiY=;
 b=WeQadPrimVJBPSINOfoodX6iEDQnVMlwDzHBhX3KfwngLPsUWa4E/pNrigKhwEjEsbemuRhp0wEflUEBq/PWMlqEgTqfO0RlGWCpDPIhp5DgnbEcRIIu+7WTBHY5jAw1awFX/TiFrXlY17ZtmJp9tNW7cUwbvzq7Fyq3M1P0Nqz0qRnbNzCgAOrfTDnNFSXaIzHPdtpZ+gM9Rf/QPBA6bEZx3NBRBAgO9qsvfM5bORfDOnIV7+vv9FXWkyxPSxKSgo1i4XHl+hS8YSqO0cAtRQfc1Blkw1hKh4g08Qh8cz+e88/BMGHktL3Dx6fmgCRToUQuUleaXQ+rx/Tmt3Hbrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB4835.namprd11.prod.outlook.com (2603:10b6:303:9e::22)
 by DS0PR11MB7334.namprd11.prod.outlook.com (2603:10b6:8:11d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Fri, 6 Nov
 2026 07:04:26 +0000
Received: from CO1PR11MB4835.namprd11.prod.outlook.com
 ([fe80::d051:d948:c209:9225]) by CO1PR11MB4835.namprd11.prod.outlook.com
 ([fe80::d051:d948:c209:9225%6]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 07:04:25 +0000
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
	<linux-tegra@vger.kernel.org>
Subject: RE: [PATCH v8 02/15] virt: coco: tsm: Remove the device from lookup
 before PCI teardown
Thread-Topic: [PATCH v8 02/15] virt: coco: tsm: Remove the device from lookup
 before PCI teardown
Thread-Index: AQHdbHf99QBixGxn/kqVKnemFrPHc7cgoQSg
Date: Fri, 6 Nov 2026 07:04:25 +0000
Message-ID: <CO1PR11MB48355969750E4D2995609A588C762@CO1PR11MB4835.namprd11.prod.outlook.com>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-3-aneesh.kumar@kernel.org>
In-Reply-To: <20261104161632.3547423-3-aneesh.kumar@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB4835:EE_|DS0PR11MB7334:EE_
x-ms-office365-filtering-correlation-id: 19d3fda9-4912-4b4e-47eb-08df3bd4312c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|366016|1800799024|38070700021|261026140227099003|261026121527099003|56012099006|261021121427099003|11063799006|4143699003|261028144727099003|261022105027099003|10067099003|22082099003|261102123227099003|18002099003;
x-microsoft-antispam-message-info: 56A9bXxpKqvA7ZbnkA4hrUST5RP4ap5seQkRIo1knvoja9KIcLOLcXIxo1opIjJhjUzU1qQwVi/eG2hoWa731gF/z2viSs6fX0ONBxXgSNcJOGj0cTyna9l9l4tEuTj+6DBaH4r0Kyczb0qcZ8xRx3/wRTKf09qdsBHmgUG7pZkTV0JAVC6n0f5BLoZ94408v23AuOD9B6cZusL2Fvw3b/RFDH7lIEbQJar4xkwvoSKsJde4hzlYsQefbT+RI/e9EgeuK+aDKAK24HZ/8j3G119gRQlQvIEW5VS0gIXgPP6whxBvX5T16l/j0G9JA/AiZFyDGCDGebq3gY/TlWCQ9V4fwVPsDlthAV5OsJAQKgWox1P1vqgz/aFkAZZBn4PXRDkdG2Wjf0PaAx9q77ykZV1BIfR8MnRZPr7/ULh9DuFhW82dRSTuvmsAApEYhPp7rRZ3txwxPZta7YHuSdCKQAs+Mv+xFV9g+/rluREPr0sHcMhfCfnUNgLKezj8INGu9joJqabK3gknhXZGGNODzQLCmIWbZ6SxdBgtQs/EOPPgQq9jmwO5taGZkzmhCEu9NBZHKBj+o4Hh0dN8aiBHTnjoJWEZKFOZfRD8fzg/I8ngnwY0UPYHwUetomQA0P+pMjPBCPr/NYncloLFqAa0/gjhZyY1XpM48FrNjjsYb8EY2u4EJktZ5T0gSFKDCOOX+gJibbshfkNKuEe/SINj1389z+HWtYuDgSwbEEPGf9E=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4835.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(366016)(1800799024)(38070700021)(261026140227099003)(261026121527099003)(56012099006)(261021121427099003)(11063799006)(4143699003)(261028144727099003)(261022105027099003)(10067099003)(22082099003)(261102123227099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Zrq9ciMBZMEtM0XlMuyvjuK8mQAl5z9WfzOEo+M4rg/YhEFTFvd9GFfIj8YF?=
 =?us-ascii?Q?2c/l+6MxSQ7avJPyuxpvg2xIYd1kpIlOKutRlSaZM/2T52yqBxLMGVEdSjob?=
 =?us-ascii?Q?fTLizLuIM15O0tx16jCEU4h4B8eG+ZH+VQ8NIGqnJZZrtAjWbQvAH3UlSRK6?=
 =?us-ascii?Q?5TjOvs1bO1zW/FoO2HtGlcLGVT6UML5PyLu8wci9PFGsUCCDaID7GKtAD34w?=
 =?us-ascii?Q?oTN8qdPn61HuOZv3xXpYbiVIhZbYJcVGHd1I+3RJ7A7Wn71HHC+erDQVAbuA?=
 =?us-ascii?Q?tIjWzS5t5M81AsET+xPQqmokERy+mTVZrXNfKrojYy+kPurOFLFz/uWgaSLT?=
 =?us-ascii?Q?Wn521taLzSALxuECwJFq+zRKL5V01ehz35frg9IVO4goyCgyRpZw96IHVVT0?=
 =?us-ascii?Q?O8InxqxMgeofa8fxVpYH/fhhiDA6jGOa9pLYInn5qygdTdV/aVfzCAwyxMQm?=
 =?us-ascii?Q?3vPRRoZ/2OnNY0wzS8abrZMcpWN0kyymWdO9MtliKXHcylNI0fKLEBvcZqpf?=
 =?us-ascii?Q?KEzY0TAC+IjJEt6naiplyCpqeijGAHgCpvm8VfZkOZE2QfCtDm4QYwLG1COH?=
 =?us-ascii?Q?ST1sDbgyfzE9XkGrBvZZEfJYDwUMS55Qiz5K64R1tT6x47N/kxhUwncf/9os?=
 =?us-ascii?Q?kagOT91dyK9W9+BNnadEUzmOdSKbSCZcgviJQLd1B2un2q5botRRYyIADjHD?=
 =?us-ascii?Q?Ty6ebaKUEjh+EXgu1upgXmiFPu2c4gzABzA1hmp80K19olh8Lh6PO4MZe9MF?=
 =?us-ascii?Q?k2vNIm0g9lrIfHVIYpcJS+3xS0JFS0JujnVWCZXaAVCIrgDuJY/pX4nyo8Vf?=
 =?us-ascii?Q?t/nCTDcOhfLlq1sx95UxmS8NiunRreRDQ1ALxA0Cur3B9+qj1M3OHzNh+mK6?=
 =?us-ascii?Q?5BcWO1ShfX09j/nbIFrJivaBjlXA29u/J38nDXgPoEoIQ+IqFYhAp/1eDYEu?=
 =?us-ascii?Q?2J68owHgOllgZNXYsfXl6W6hd0pUorRdBO8XUqojuxKg7xezvPH5UTTjlSpx?=
 =?us-ascii?Q?hr3U6OsbPLSTM7e6WimyLMBMf2T2QpkIB6C0XpAIVTewctLPLaAGlZ/FCw3b?=
 =?us-ascii?Q?20OFZSKfF4vefbTkdC2pxg8qKV0d2YhS7qK0tsoeykcUHcwskE9sCV4gXEbX?=
 =?us-ascii?Q?H5TUrQGJiLjxj0WZ5IkImnfdEdWUBErnBk5ucbZIEzaR9Tc0NAE7LDz6TCHH?=
 =?us-ascii?Q?/BCr13NqzJ0eWwbGL+Rj1XvEx/UnI9V34uOllc7yLLVJGDlocMIfRyKwbQUu?=
 =?us-ascii?Q?5Y2KXSXRV024zgSh4kDhX3LX44R/0CM+wsMxNrJBZujSJhEPd8MfzwXTwCZW?=
 =?us-ascii?Q?hGcbVWlUeRwmdsB6+2qSlzl9F1kHeQFkOGK1jTFRmysfcyaBFqWn700a4Z5u?=
 =?us-ascii?Q?ppKWmtftx1mtrf8hO3wph1jLhxQz3gQmb5ryWhYUp98/jMhLFMiv2b5QcilT?=
 =?us-ascii?Q?O1gbpZfUIavIhSUaF2vLSRpslBh2CS7Wos1j86kKWUSA1Vv8WQeiQICEbb/1?=
 =?us-ascii?Q?JvZDYvRxSrz11hevVD8SSMoWxyPfHI8MqmdE3VYUWufvze+cP91XmiPUy/+h?=
 =?us-ascii?Q?lX/Rf8s/XSuElNiz5qx5+HLlet104D5mqHaFHv06hJ4BKxMZduBQe+zQnte4?=
 =?us-ascii?Q?thtAOd4VIrkN5nrwE1k/S9RM/VCWlXDAqU7UejH8hUhAXu4Qumr5lgYpan20?=
 =?us-ascii?Q?4hs9ldMIVHPcsLTCoroJGkrE4g2iwoUhhDJXL6z/4jJWpNp8Rsxbn4o+/QZk?=
 =?us-ascii?Q?kh7Jmtp5hA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: iv7vrocInDMqb3AR6VN6A9sj0mQJyXyCOITCCmyyy4njvpCfJzIEK03AKIzsGumn9sdkI+WXw03PeU/5eCJak++i7m2yFHJTUAfR5y21ygbXTVMT1NYaJMhmouBTuzkFhNNIo9rorN83fplTp/nhhM9TnIzxas1IKmjYaX2I3G+ninTn2PnPAePUmDqSdXSWgLiqzprSvbjYAb+LGVy3IdbpN+oiH4EOc2I8Ttx0R14RwE6Rt0XjPUlhaSmyxP1Qi0pC+11O9WXga/Url4w+iQMoKiTloPBiTYQwo9Ofwt+vbHycZhke11rwrOOD/9hNMCfMN3Ff4MjjHu7qOzg3yA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4835.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d3fda9-4912-4b4e-47eb-08df3bd4312c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2026 07:04:25.3399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hQoSNJpEgO6zrIA955I9//ce96vMR7Zv7mh3QKYm44fNYag6Ufx6/bQRJkt0Y8JDMN17EbgDjA/9uGmbeawnsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7334
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_230511_865610_3EAA077B 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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
> PCI connect looks up a TSM by ID under pci_tsm_rwsem. Previously,
> tsm_unregister() released that lock after tearing down PCI state while
> the TSM was still in the class lookup. A racing connect could then
> attach a new PCI context that the teardown would never see.
>=20
> Remove the device from the class lookup first, then take the PCI write
> lock to drain in-flight operations and destroy their contexts. Drop the
> device reference only after PCI teardown completes.
>=20
> Fixes: 3225f52cde56 ("PCI/TSM: Establish Secure Sessions and Link Encrypt=
ion")
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

btw this can be sent separately.

