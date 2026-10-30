Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8755606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 07:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=205czNFT;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HxDp9LzV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6EoGtyip+WWxwLd3kKwHF+R8DhnOJym7GVJI9941rRI=; b=205czNFTr7KkYJXcluhfpwPt6o
	mt/gdjV8hqPLrMARmeH+ZcdLxUq+FaByolasXJVIdljvazDREvCpZPDRMQ2Z77/BtrBmKIJf3VExu
	IWTkEHQ+RMCBKt/MfE4/KmGBPqJRFd+1hd/Vbh1kTfvs5ebZEzxc/y2vc8qkeFgFLlLktchzwwuOX
	eHvyMriU9Vk40EOO5fjyBEfUU8NaPAMbRt2siw9tunV3ifALfpbhKKCzdV4LJQUbl2mRGLXnJW9RW
	AMp4R2sBknUCMhdryPNPD1jBwIhOcSI1EjFLrB8lOyW6mOorrYF4fAAPcWbcRXLD+SivJ627BLqja
	McU1Ic2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhRL-0000000B38n-2Qdd;
	Fri, 30 Oct 2026 07:54:19 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhRH-0000000B38B-3uUE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 07:54:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793346856; x=1824882856;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wplhCE3NDwkIJNFzHHGEwwiIj+j8UcAzUiZ7coTIxPM=;
  b=HxDp9LzVblA4v7+X6lZjebMi4jTPOhT99w3ymmqkIiEGSKAr/eOCBmcv
   kpdoaPtAb3abYiBcbI2Z8xe/csLINasvO4yGAP+Nvc2WxJjpbGSnsMF65
   jPMddergNgXR1jK3Z+DX4jKMoQGw+Pm2MjfRR2zOTCC2sa3XUDPgEG6Cd
   iDaD6e67F34h1ZssUH6ktTDVGNpNWJ8cNC0aWOFbmhu2rH2YMliTsgXe3
   YfcDzlLHyVVy9Kij0PXHXDMmTerDs3OxqC4kCdKECPlXA5OEd9HvFvuMY
   knStb3jNq7rpzaduZXg7kT/F4DtnvxGegej1s5LeBAAHTt7JInDPhb3Hx
   g==;
X-CSE-ConnectionGUID: GU3fznteQO6aG+AWHjkfyQ==
X-CSE-MsgGUID: xOLdTC1YSCOyj2fc0sBVAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2011427"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="2011427"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 00:54:15 -0700
X-CSE-ConnectionGUID: Ee4qYhYESOm9Fsa7BN+eOQ==
X-CSE-MsgGUID: BBqLoFsKQJKqFd7hYAoa8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5390513"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 00:54:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 00:54:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 00:54:13 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.29) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 00:54:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LTEyDxMR1CSgP24WZOIEyQ/r6kzaAxOhxDPi1eTzCbjGCrl7Hmdf0ZxHZt9qBQUP9lo3zZaakgBgd3FdUZT4907TW3tNF7pf82ZKJ8RuoxMrq0WB6G5zzRd7+5k9HNkLxHuvo9J+IaDDfhbV4dKu/MKdBiaWDf6nIr712/a4OAJkBsqayeZdbC4RjfMsbn4vVya0AybxjsG9tKGuWRZHKWX8k0Kii6SHXfPCEf3CnZXWNFKjK573YUaZG/Leol9t1i5FSviP43e8UrgUeKGJoHEcR2UpeVdXgss9i+ql6jIVcJDwJSd5GFVVEFoGrSe7C7GU2pGOShb6ttno17L1Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EoGtyip+WWxwLd3kKwHF+R8DhnOJym7GVJI9941rRI=;
 b=Qukf0kpIodXcbBPMMR0UlfBve3usKS0ZEljy20/H1tYtNvOrvOkrcLDlPpPtQvT/iX0XNnDcG/a36buDaNhEepglqKAi81j9iIsXxXWw7Ws36r/CBeKGTHaPSdjTmC/u3qY0VY9WelIAAaPhS8Cj1lBKgL1wzZeT3s/jRZlKAhljjZWsfeJ0FK26PUyuo8POAnkMXJSX7kfjIWOE9iI5OZFchYjhPD8t7aal0oyE+X4It1engzpJSVsMd1eiPUirgt2f530t+VUnOwxyn32VSlfRYzsJs4a4Up0BCO6vPKHBvS2KWfEWsOZBoQ+L5/JP1x9II3nig4ym0GzBkVmi2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB4835.namprd11.prod.outlook.com (2603:10b6:303:9e::22)
 by IA3PR11MB9206.namprd11.prod.outlook.com (2603:10b6:208:574::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Fri, 30 Oct
 2026 07:54:05 +0000
Received: from CO1PR11MB4835.namprd11.prod.outlook.com
 ([fe80::d051:d948:c209:9225]) by CO1PR11MB4835.namprd11.prod.outlook.com
 ([fe80::d051:d948:c209:9225%6]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 07:54:04 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Aneesh Kumar K.V <aneesh.kumar@kernel.org>, Jacob Pan
	<jacob.pan@linux.microsoft.com>
CC: "iommu@lists.linux.dev" <iommu@lists.linux.dev>, Alex Williamson
	<alex@shazbot.org>, Alexey Kardashevskiy <aik@amd.com>, Bjorn Helgaas
	<bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, "Jason
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
	<linux-tegra@vger.kernel.org>, "jacob.pan@linux.microsoft.com"
	<jacob.pan@linux.microsoft.com>
Subject: RE: [PATCH v7 08/16] iommufd/viommu: Keep a reference to the KVM file
Thread-Topic: [PATCH v7 08/16] iommufd/viommu: Keep a reference to the KVM
 file
Thread-Index: AQHdVup+WCo7z5uBzkSccRTJUCcMvbb9XZuAgBbRTACAAag7kA==
Date: Fri, 30 Oct 2026 07:54:04 +0000
Message-ID: <CO1PR11MB48351C4BD0BAD3BF6AFB2E0C8C6D2@CO1PR11MB4835.namprd11.prod.outlook.com>
References: <20261008055955.4014342-1-aneesh.kumar@kernel.org>
 <20261008055955.4014342-9-aneesh.kumar@kernel.org>
 <20261014105913.00001217@linux.microsoft.com> <yq5aecd9aupx.fsf@kernel.org>
In-Reply-To: <yq5aecd9aupx.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB4835:EE_|IA3PR11MB9206:EE_
x-ms-office365-filtering-correlation-id: 3c7d81f9-8102-4e77-bd78-08df365af82d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|23010399003|4143699003|261026140227099003|38070700021|11063799006|56012099006|261022075727099003|261022105027099003|261028144727099003|261009223027099003|261026121527099003|22082099003|10063799003|18002099003|10067099003;
x-microsoft-antispam-message-info: 7/hYxt0cWQCMCtNCGttCEE1u4PdRs7S/2MB/phIuZ8kIc372RRScikMP+S1t3N49yrNqvtuBEw5DLiTRLmq7HkaisKkkamGda8lb7dO3P7e1O7ykO35XE0zRiQbDF+RN9otQH9qWMWyobdaGjcYzFaUn0lcuwAaF34Qugwp+3nWRz2l85rqqkocxvIaSvaKkIpKYn58hlbBJQ2KO5blogZ0ZJz4Go07jd91aRRXxXKN/FyS1g4/nQtbdk2wIg5PIamxF8og+Kv0MkmUQ5zRvnSNsN5p0HKTeX7TJzY98eUrMrQhO+s4tJThKTUL3FgvyuI4LhbbGHbIQvvSky1yc3jn52svi4ZiPgQ1F4dt49R+DsXYuFvtNvSpBDmYuPv3X8k/6Xnxb/JmMIfnWz2Tb312OYob/KpU/1YlbpHTfP8wBoz88aXdlVB8cVGL/U9MQ2+HZv559U9JqcrQbYNmqGtEvQl6EBuG+8oCbslAL6162in6y+OPYtL+coxyxkr/oiMHiawGY4O3pMPYJivuD7Wh+FWUuSEqNu/OV023Wfhlor4TMk2bkf4JVuTnXLbf++p+Ua1KYmbHxIPjlyvrdYlnU46f6NrpCGpaTa6UUNd5mDCAJjdmCYAS8i/7EvsJ0o0ujq+HoSWsJJOrMvVB40yPELS4va8Vd5K+2vjxFKz3OUY8rHpoH9aDXT1XTjWN+EqvBbdKpAr/yr8SPJTY9qzzKrajzqWHg271a3zoclOg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4835.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(23010399003)(4143699003)(261026140227099003)(38070700021)(11063799006)(56012099006)(261022075727099003)(261022105027099003)(261028144727099003)(261009223027099003)(261026121527099003)(22082099003)(10063799003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8waQI0Td0a5J/qTHE25GLpnHSvqf6WEotZf3lnMFQPKouodqWZmcNajIXrZj?=
 =?us-ascii?Q?g8uKpc0SCvTA4yRqu6DhmFjswmitcKcSmwUDMxpk03YokxGn49v5JPhKbl55?=
 =?us-ascii?Q?a+/7JjAwRJ6rlMYaMXIZG1zTuJvXMsfI8xFqKb+f16Geu0NdoGbLy/eCGShR?=
 =?us-ascii?Q?iignmj96/mLZR7cu3/uxEhbAhK2E+TseheAgTEOgVDxex1+oZ0hj4OJyltfG?=
 =?us-ascii?Q?UI0FxAeKNqO3CnMKIG9ZjUj9bRxuaGG/lR2kQ2q/E0wdk9hUNwcQjNAbpWl6?=
 =?us-ascii?Q?jR7rhYgzE5jWszVJKTCSl+Js4n+z/j2xdMo91Ow+47TnkSye2nWoiHBzQrw+?=
 =?us-ascii?Q?joGwiVE7Xm4rkQV5E8tFUTWvvsH5I75/QBwQ3Wb5Q1w03tIHlwSuR4wPwK5y?=
 =?us-ascii?Q?bkKnyuxuM0H1JlAYknMp/aEULgyVSOHf+zVu+rDNsop5HKB2+sSH7/8mgQV3?=
 =?us-ascii?Q?3nIpWCJ0qoBBf9vmAhLZpupKfS7S16r6Cq5tmCLXM1/uoOPTonovgksT7hMX?=
 =?us-ascii?Q?U+3BDRrwoawYlk8uk4eMk+CWmf0ZZ01CB3W5Cg48DnBnm+M/fsPnYxY17vRl?=
 =?us-ascii?Q?b0GtmYexxcW2SidzPfm2fgnLDMPg5Zq9ao2m1KTe/OK4CQISOverE8D7Kk4L?=
 =?us-ascii?Q?TzpW8+4fXYBHB9D2+ktIQEfRaQYKYArhMhJkHok1Cd4cgA6I6uRhWZKt6rR8?=
 =?us-ascii?Q?NVLYaEQMrT7xnFxVPt9TjWjEanWqZeFps61xNmlRQR9PEYKf2Q1QrKbLszT+?=
 =?us-ascii?Q?3zc2Nco8tXImLWqFOHfz3kx/2EOaMEkMdBXGT5UfLDwMxmjevBv9SDNPqSBN?=
 =?us-ascii?Q?J/3W19SaCGTHMeqGqZ/QORgiZKR7tb/LabtSKzasIE/V/0L45oO2LULNslFo?=
 =?us-ascii?Q?Cc+JbbcAJRbdjZ7QHCnAICMm1DPXUcQWmfrQt6BAOtMrsEZ2GW6gaOTkj6rV?=
 =?us-ascii?Q?n44k4uwMN7NaED2M0h0DvOHyytBLqJeKTd83+cvES4GzyQxI83EU6jqQ7kbs?=
 =?us-ascii?Q?+iYgDXaM5il6pAsBhf3CsUO2W3OM9imo5BML5/hlEzRR4bh7IZ5GTdv1SJLs?=
 =?us-ascii?Q?Zjd4XgvJrhQSglEP/o/GkPR0Mg1WEg6H5gUjyTCLobuslt89mw5KqdYKld18?=
 =?us-ascii?Q?n1VEtANo0fRNlMGynU6n/RDt9TGMvGshQP4MQxfhGGtML2KCCwqA3RMDXhrX?=
 =?us-ascii?Q?n1H5zH5ofpAW5Sc2r96bH7JkxMXgQRxghw1ULidSJfXf03fJPFsBldseHyZF?=
 =?us-ascii?Q?+poa+d195c4hbJGAGmb3s+TP3IdSL70SpulCqcsqQXoTXI6eujmrOhYmMTIy?=
 =?us-ascii?Q?xAIkWAK5H3pWp1hJ9J6JMlogTzzvw3V/ZK3uzGQb33U1jUiFSHz8eLOOiP4I?=
 =?us-ascii?Q?+Q9tuLLi/Is71zmQbYL1aO+SzMSgOjGBISNzRtx9hdWSbitV6Nj+bhdYsnIL?=
 =?us-ascii?Q?5nmNaBiYC7xs0wNUwB8RB0+6IX4UJ78cpNYohkIkkPfYrtfyUALcWRW/2q+/?=
 =?us-ascii?Q?n3tPZI1k3pB6BFI1I63cGamO6mimIepDDU8fedLse7p6YwzoeCojH2i21K5p?=
 =?us-ascii?Q?z4JQPNIkHO8VG+2y9i/iahNhq9ChsZrY6i8OJ63gHJaXRdHxD6wX0NcaygoV?=
 =?us-ascii?Q?Xh1sC7IsHuXfEgRz0UiMpPFTLCfC3FjSVF5V3UjnpXWXEb/XcUv0Vn+9x5ii?=
 =?us-ascii?Q?yiIJaOYXIQRId5RoLHiihFx6WlrS3EUAns+txJyKrxqLi5Gh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jrX4JgWJNtTw7hcNg+0vBO2USLTbTUiycwk9Wo4llFP4S9Ht4Nnycy/v1t40DxLcwwLYu0TG4We5rr6/PwbRzaMIRrgEGRwEgAoE6BSrZChKkS0MQrnxtPDyFB52XQ2H8cH1l4ojf0OVHnABLpyOXg9tk6gXLpb+PmG4MZIPxQcGsMLOBem/v4c17vKjYUiVE+qLF/aXHORwSBYQO1mYRCuxhYmBn9um/Pk55A0p/enclYbjhSnOLStbfBZtS8OrpiLYf4rqC4KIzMDjitPhpE1/45FsK7O0awXrxX+zRTGd5t3Mi3ZWTb8/PLYpiHP1qYOodUJiPN89Xy1mDyyAOQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4835.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c7d81f9-8102-4e77-bd78-08df365af82d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2026 07:54:04.8451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DAqMO6KxE1OX2qbpJvjnGVtrx/duyh5qEBQqlWFG2BSPNlOeR9qwJ4MuCH18HnvVKtHexKz9o+gukoZCY2/5nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9206
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_005415_988554_DD51115F 
X-CRM114-Status: GOOD (  20.58  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
> Sent: Thursday, October 29, 2026 2:26 PM
>=20
> Jacob Pan <jacob.pan@linux.microsoft.com> writes:
>=20
> > Hi Aneesh,
> >
> > On Thu,  8 Oct 2026 11:29:47 +0530
> > "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:
> >
> >> @@ -82,6 +85,8 @@ int iommufd_viommu_alloc_ioctl(struct
> iommufd_ucmd
> >> *ucmd) }
> >>
> >>  	xa_init(&viommu->vdevs);
> >> +	if (idev->kvm_file)
> >> +		viommu->kvm_file =3D get_file(idev->kvm_file);
> > So kvm_file will persist inside viommu even when no more vdevice exists
> > under the viommu. In that case, don't we need to check idev->kvm_file
> > matches viommu->kvm_file during vdevice allocation?
> >
> > Otherwise, it appears possible to associate a device belonging to a
> > different KVM VM with the existing vIOMMU, no?
> >
>=20
> Agreed. I will add the below.
>=20
> modified    drivers/iommu/iommufd/viommu.c
> @@ -212,6 +212,11 @@ int iommufd_vdevice_alloc_ioctl(struct
> iommufd_ucmd *ucmd)
>  		goto out_put_viommu;
>  	}
>=20
> +	if (idev->kvm_file !=3D viommu->kvm_file) {
> +		rc =3D -EINVAL;
> +		goto out_put_idev;
> +	}
> +

IMHO this is required beyond the tsm usage.

Currently IOMMUFD doesn't prevent bound devices tied to different VMs, but
in concept a vIOMMU should not be shared by two VMs.

The uAPI header already says:

"
* Allocate a virtual IOMMU object, representing the underlying physical IOM=
MU's
 * virtualization support that is a security-isolated slice of the real IOM=
MU HW
 * that is unique to a specific VM.
"

But that uniqueness is not enforced so far, and your proposed change
can fix it.

Besides, it might be a good idea to return an error if idev->kvm_file is
NULL in iommufd_viommu_alloc_ioctl(). I don't think the viommu logic
is designed for native application...

