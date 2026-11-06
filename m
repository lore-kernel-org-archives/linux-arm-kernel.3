Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A699C606A339
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 07:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bRn/x3u9;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GuoCXnb0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XPLdKckuK4LoU+Clb/slqQOCEV/7kgdg9uLqEaUgxyA=; b=bRn/x3u9bNP+RYsbxMCasuMnqX
	dM6Y6PHShM7Qo+1B3e3QHGwLF+N8cd7Xq4VG68AKw3Ue2mZtWaC2OmwGDTzxCQv0jvqt3f2SHolll
	bSOYv4d0aehsKBArTf7ijlNM1IGzvudRaobn13UaIKaaJDhGione7fcXgH7nXrgzLT3yVeKqqlqvF
	rpwbyONkS+6VAmJEFH+l6uNOw6TewzLisElMcfUfGqCY4XqAzQosbeMPoDR0Vk7ShLmKkZw6ckMWn
	0IoB5tYUxVkEsen70jQY0bSPWr+MrDJnce0ErUyYoWzWgyIVk7TXZEeN8Ftkm2UmO7ArFQ2qZNucr
	UBNs3J/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEST-0000000BSqa-1ZSo;
	Fri, 06 Nov 2026 07:33:57 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPESN-0000000BSp3-327r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 07:33:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793950432; x=1825486432;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=T3UhbenzwARgyKC/nrEb2yw5JMdmtTPqhj3gtR0v5hQ=;
  b=GuoCXnb0LMXJUkX+We9M/m4RqPG4VyUzVgfmgSGoScE7Y7MWtACNwaiq
   r3DrXwHF4zbl1RVRyEcIOz3x/Hvl55E4PD3KKd5wuKHCd766MYu2uVuHe
   4155rqsIvHMQD3OYbeZqSzH0X8eVsMoaZRlwkyMdZriRwFGrkkj7VYOCI
   SFbzdLsTstRfHvkntNRbEqy1J7md9V09t1reYM4wULqS+WbthX+kTz86B
   CPhCiJ/2GqhjF2YKvgbHDfIKMry6OdMDZ5NR7uamt7TvHnrRv0OQHovmv
   ZApKQ8mUT+uXiCx/kzsf5cMrDx/kDdwGOspH3ttz0R68nDNlZw8l+16ao
   w==;
X-CSE-ConnectionGUID: lFM+rjsYR/68ic3QIwwWMQ==
X-CSE-MsgGUID: Op1L8sLeSPqSdS571hCLwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2637404"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2637404"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 23:33:51 -0800
X-CSE-ConnectionGUID: 2LaxGVqlTVii8ptSSFpm4Q==
X-CSE-MsgGUID: PTFyaqmUSdKatR7UiKheNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7327100"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 23:33:51 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 23:33:48 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 23:33:48 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 23:33:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q/QgiHO+/wRKw/dNhpbDi77aQaLVVXgFjXEP1BcGNbebb2/N/W4Jx73wCw6fTDCxWqdWbB1e9aC1N8ixBsoy/JHi0THYrcp8nxghzAZK/Va7LeegZTNEkXvezl+tSQzA7QUn12zrkcIGTCSiTb2TYf73NMYdwnGNmSgg6Miw8/uQFkjBP5mmnK70Mlt/CJkwHWFgwa4O/qWSViYx9M2VxSYqu2PINUTJju7+vkc8B4E0Kd2us90WacF0XXtqGF5u3fjThsXFPBgFOnGShDoB+4ZIFuhBmw93Px6aRAyTYemD86wRsUrVBHYhy8jVMNW5EollMyV/58cQ9OdcKg6IHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPLdKckuK4LoU+Clb/slqQOCEV/7kgdg9uLqEaUgxyA=;
 b=fjMOIuKwvU+z9Rb2H2PQ36ftJhR3JHgcnS+7r99+e0YH+EbJkZwTsUPJM4uaAskxU9UrN6WNYlyAyqGOIqgUfclFdm3HCNXLAGriDjd+AvUFhkXRD6ZgaOT82usBjSUxhw8oSHnRSVbPaKs/A6vj8Pqj/sDosfPD9opyvzwAUIIRlnGqB7W1y3WD+9MBIt4WDN8Hj/rSR5BmpaE8PFN+AFZxwUSy5JMnJDnKzyDeyzKUCnNEdGM1Yea739r2hfGlBt4pv4ewudkdouCq/+azDmmoxfZUrfCRWpCLEBTtyBbAKu/6owPwYHc2Y7deKGEWU5wIoDOvMpOcERcyJVbh1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA2PR11MB4844.namprd11.prod.outlook.com (2603:10b6:806:f9::6)
 by DS3PR11MB9793.namprd11.prod.outlook.com (2603:10b6:8:363::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Fri, 6 Nov 2026
 07:33:46 +0000
Received: from SA2PR11MB4844.namprd11.prod.outlook.com
 ([fe80::61e5:7b38:b8a4:1abb]) by SA2PR11MB4844.namprd11.prod.outlook.com
 ([fe80::61e5:7b38:b8a4:1abb%7]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 07:33:45 +0000
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
Subject: RE: [PATCH v8 10/15] PCI/TSM: Add vIOMMU-bound device contexts
Thread-Topic: [PATCH v8 10/15] PCI/TSM: Add vIOMMU-bound device contexts
Thread-Index: AQHdbHgvdFiMFJDcckWfy1+0Dtm1V7cgptCA
Date: Fri, 6 Nov 2026 07:33:45 +0000
Message-ID: <SA2PR11MB4844957D715CDA1CC614E8C38C762@SA2PR11MB4844.namprd11.prod.outlook.com>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-11-aneesh.kumar@kernel.org>
In-Reply-To: <20261104161632.3547423-11-aneesh.kumar@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA2PR11MB4844:EE_|DS3PR11MB9793:EE_
x-ms-office365-filtering-correlation-id: e61ebf07-adb9-4cff-3797-08df3bd84a83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|22082099003|18002099003|38070700021|4143699003|11063799006|261026140227099003|261022105027099003|261028144727099003|56012099006|261013131602099003|261026121527099003|261022075727099003|261009223027099003|10067099003;
x-microsoft-antispam-message-info: gzW8znjmmFUJ3mMfwkLr5zgUJX/4yjYdN2m30pELUxC1e5joDFD3e562Fg/dyGXXCYomPFw0HGh70eFA5cmVmMPu/8W2knzTV3d3N4AuBV31ZK/kELL5DUgu1gb63+sKWLb8mxHkpgU2BbQXdt2eVl+/8jAdt/89pT2JwSlzAByL7JBOOwETCRS2aHfMSV7u2lVZdlyk+UIPX/IGnmeXK1//HK3KJqqJLQtb/qCTxtLpHqMHAZnS6j7PTQrz/FrsI5GbpncDSRJ8+KVskdXhRuxb26kyvBkL2GGq3EBp6EX6KqzUWQEfaOxzfsDIsl0hc3UxX2Fty/CGUGzpYs0YLXCtEEDx5GPznNbpCNh4DZDgipI5nc3FihiGmYHa9AoXoCfebMhACLWxdx5EfiA687MQ1t/0ezwIL0dXOKFl93dH5Fq7ozAviIiDzEqSeXlXYJJlb1VczL8Jgnv56mVUPGpzSG9SPcZZ2si7jWfa7ITSWZxltXG9O+Phu8UL+OeDkIfHHfU7HlbfNp7872Na4r8VR5EOse3P9udZyBaFcGbrstVtsVhTLO969eRyeBfV+4HIoYblpoDHimU8452IlOSQ3JHLHUTADMS0rzAbLIsgdn3Y9CeJNAACTN35OfRWgQqiWpZnst2uVUtdwvjOvHWNgDStd01gxAf/zjLvkJwVUEAmY1kZqwKlsNg+XmRqBQV25SwbeL3wFVHQ5B+lW327Oo6hVs7GHq9pR7ha7Qc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4844.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(22082099003)(18002099003)(38070700021)(4143699003)(11063799006)(261026140227099003)(261022105027099003)(261028144727099003)(56012099006)(261013131602099003)(261026121527099003)(261022075727099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PzCXBwcPsmibBa9R4z9DO/j38OKwCPyiwzM53iYlupXAQ71rW1svqXbPddvV?=
 =?us-ascii?Q?jVklNl4KVFXn4llCNmfXtKhb3y0RQ1qvT20igNzNw3vqhvxcsICQn+P4wnmL?=
 =?us-ascii?Q?qBieVOQN71kEjVjkLZYaD6egiUgJYM40p8aWkYBWgE1q8nfPtegzKLzbkhvP?=
 =?us-ascii?Q?0AthpbBn6ABgCE2X6M6vcf23ZG9w4vg1anXIdn0+3nXvxPt4EYqMQ6407nU6?=
 =?us-ascii?Q?Az60TEM8/WH3BVwG5VBGNctczjM5bkdNbbvQ3yzNzsDgxB6Plb/HMSRISu8O?=
 =?us-ascii?Q?N874enY2Dk2TR7xKUUw3nDsmTxbKRGdyl82I1XSvGS+G9woQa9aOX7frD130?=
 =?us-ascii?Q?iF9pfRcGlB1xpDAqJCB2EY9YeAiZFSOCGlEVK03DOgeK5UdedgknYAzvC+GE?=
 =?us-ascii?Q?aFdHLv8cOYi9L55aEyaF/e8cPt6ejP2pSddFmZdsHElO9ePG83qG8Guk/sat?=
 =?us-ascii?Q?WdF+Pqe/dRMiFVUGsdWTxDwVsNNi7ueyKM6J7ClRgISriMEyG4pbsS3YbiAR?=
 =?us-ascii?Q?UHMeop4zfUqmDY9rsHyQu1lKXGF8fyK6csX4LXOg5vTr8TSzAkaPVNSca+sL?=
 =?us-ascii?Q?N474xIgiMjOpmUCJavdwCRr7+q8gVLQCIRVoZKfqoAwvs2x8kC/Mm1dTN1jl?=
 =?us-ascii?Q?jAcpEKkj1zD/TI+imHBqQbCHEntHHjM3bZvQFDZwyGZmtVsA9+4C55mS+B7e?=
 =?us-ascii?Q?9FgBr8QE1AyxhonyqEn5TMEThthDCvmsyvguoooQWGhluC/rj/PV2+qEClSm?=
 =?us-ascii?Q?xApvtqv0t1knwR1rPvSrbTkzydxIhUCSvRMffAAy2m81cBfUi62CL2FFLS+c?=
 =?us-ascii?Q?NtI8eP+J9fBkdoLdU/Foj3HLG65BHMPWpt/TvTnJHKfJNZ8VkaAwZjpSXAG3?=
 =?us-ascii?Q?rwXEF5ifl5EfrGOTH36ZHKfXKdCF6JdPdhXLFlYCN8hndUrfjddFi3Q72f9R?=
 =?us-ascii?Q?aur78fem7DrsVB2Irsc2cq8A/9Uzl5N4JyiqtIDF5eQFMlKm5fd9VtVL5zZ+?=
 =?us-ascii?Q?qSwBFCYJ0hCQWQPBU5CNiJpo5uK4c+ibb6YU0m834BP3Ea+A4mLiSUMNgul9?=
 =?us-ascii?Q?DRRhEmN6eHaXNGJ2gB8AWHYmvHI3MFFLetFN7U5A76QC5wO1aqegZpC+qbM2?=
 =?us-ascii?Q?11DE6OJGfccNCWmnmNwBtfS9lDRI3+p/MoS9IlznKN3QRN7XINh6YOjdZ+9u?=
 =?us-ascii?Q?9Nde4hkHxucTMnTnNyFxYznNOPVLX/xl0rbakZIbiYrY/l3TYlQsIYb5oTsY?=
 =?us-ascii?Q?PcFH/zLeqPU32Jgqbm2Id1JI4XLzbs7SCaGCeq9jfAdcGKtmNtrMkrgBf190?=
 =?us-ascii?Q?MUoLPT6j2fbiyeM0t/HQdbY02flumvVcvpI2zWpfM75mflXTgyNBa7brC1Wl?=
 =?us-ascii?Q?COYXAlPFHGW9YF3Az7f8yBMyt6QKTrxA32R5E/gxeK9MROw3p+86B9J4hI0A?=
 =?us-ascii?Q?VBW2lqizrMWMOlLzHrahUx8+CbASMAxP1p1pmKOUKtfGBCScskFizTfmVFqe?=
 =?us-ascii?Q?NRIj8wOUDXlV4NCLP3vP+vEgzu8PSnJj7w9BKx4ieWM+w9jKlkh1R3CMNFXd?=
 =?us-ascii?Q?6SNmEdUEniT7uUZkQNMfpQjqM9Z6+rlSPWXTMLqdkbHMhK/HIltDgO5A2iTb?=
 =?us-ascii?Q?F/nkRRsqU9Ak0HGoNQV5TRQWZ6SXl6D5AdY7E7OKLNkt25vNWli2Ws4sg2lp?=
 =?us-ascii?Q?T+mF5jgxXOQZzUxlubOiYTZMq+IQGKBg4CqrPiyPV3HbZnsn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: paRMr01/mii0aJKMQgzxzn3yzcfCDwUt4kZW35g/mg4s1ZJjJ+4u+5F+6lrcn6JtTCWPyjXRMONzcksw5suKczB7fbdM9CkyrUOtedLI86vMIoCZGYVNJPZxMw9jSYziV86zS+Hv5deZ7FGb/pjKthoJfqSn/oYedSxTkcCsncq2RgQDXqzPSRe0Wja1r7gGJyOHrsbSKHJWQXte0vmcQX6vwpY9XAgkF7DJnOdg75hWB2/XH28lHBLNtye/cztOWGmbT3tcEkC3bUwZ+L58Kq6kWlPsv3TQ2MtWnkHewsy2ILYOFmAqz6ldH8JzWO0Lm58FBAK1BDdXbjlYNV4sDQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4844.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e61ebf07-adb9-4cff-3797-08df3bd84a83
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2026 07:33:45.7911
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oDsGdSZN5D40U8qq+ALebkVCm5JyYX0Jg250tfmg3f4Ters7qk2nGO0i6V+iatyh0HTiuiwfni+XHrkmI9GRYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9793
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_233351_799597_1F2E4D80 
X-CRM114-Status: GOOD (  18.25  )
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

> From: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> Sent: Thursday, November 5, 2026 12:16 AM
>=20
> An IOMMUFD vDEVICE represents a physical device within a virtual IOMMU
> (vIOMMU) for a guest. It must use the same TEE Security Manager as its
> vIOMMU. Pinning the vIOMMU backend keeps its tsm_dev registered, but
> does not preserve the connection between the physical function 0 (PF0)
> PCI device and that TSM.
>=20
> Add a per-vDEVICE PCI TSM context. Verify that the PCI device and the
> vIOMMU use the same tsm_dev, and account active contexts on PF0. Reject
> disconnect with -EBUSY until all dependent vDEVICEs release their
> contexts.

We really don't need so many vIOMMU/vDEVICE notations here,
especially in following code/comments. It's just about a tsm context
which holds the pf0 from disconnected. Then let's describe/code it
from that angle.

> +struct pci_tsm_context *pci_tsm_context_get(struct pci_dev *pdev,
> +					    struct tsm_dev *viommu_tsm_dev)

could clarify that each get returns a new context even on a same device.

s/viommu_tsm_dev/tsm_dev/. It's just a parameter to be matched against.

>  {
> -	struct pci_tsm_pf0 *tsm_pf0;
> -	struct pci_tdi *tdi;
> -
> -	if (!kvm)
> -		return -EINVAL;
> +	struct pci_tsm_context *context;
> +	struct pci_tsm_pf0 *pf0;
>=20
>  	guard(rwsem_read)(&pci_tsm_rwsem);
> +	if (!pdev->tsm || !is_link_tsm(pdev->tsm->tsm_dev))
> +		return ERR_PTR(-EOPNOTSUPP);
> +	/*
> +	 * The vdevice can use a different PCI function from VIOMMU_ALLOC.
> The
> +	 * module pin keeps the vIOMMU's TSM registered, but does not
> freeze this
> +	 * function's link. Match its current TSM before pinning the link below=
.
> +	 */

this is the example needing a rewrite...

> +	if (pdev->tsm->tsm_dev !=3D viommu_tsm_dev)
> +		return ERR_PTR(-EXDEV);
>=20
> -	if (!pdev->tsm)
> -		return -EINVAL;
> +	pf0 =3D to_pci_tsm_pf0(pdev->tsm);
> +	if (!pf0)
> +		return ERR_PTR(-ENXIO);

No need to check the return error as other places do?

