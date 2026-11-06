Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9622606A338
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 07:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wgn94xIg;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eKKymtkN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GsVvaNwS7N3QwUXv4BYYZVODcIwLAWZzT0RIF5lLU2A=; b=wgn94xIgS5hrjUXXFFne0zFfBY
	3oDs2EbrNkQ/SN567JYV9d6OdOpMHjNLXmxkThFWFz0HfAXcjgMZtY/Ny9hy5WitpmaT4W6GamKWw
	8hwcUvZNFBjulvOzX8IxVecodE/IMbrTcx0hpYOZoDThp9Wy704S7v3HP3E03ceyHS6ziqhz/gDz4
	fv+mfjO/qvOq/tKIdP+IuLy7l+cNV+cfvnF4AbB2EKys6VbIBLG9HpHpXZ7/OkvwFZO49FOz7qEyj
	8uKrQ9kc4bl7sopLdzu/ApOCGigZk+Ycb6hPkPiqH2lfXVIL61Ji4g9e/qRUJCk2ykPdFUKmIfpJ4
	Uu1YPOiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEJE-0000000BRMK-0ZFP;
	Fri, 06 Nov 2026 07:24:24 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEJA-0000000BRKt-3Zmc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 07:24:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793949861; x=1825485861;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TauPnZSbcKKGxHh8ctAMNqEqmW6jwhiFx3Q6MbbsISc=;
  b=eKKymtkN7eIYRL0qDfTusfY1ILpSUxz25eaBAJZOqp5wP+EgZJyA6WxN
   T8TAnTEaa2ISJL4/UEuYNbpcjMnaeLZeJ+Qwpq2TfEjHXrx3B6oAWNnyU
   w0lzoifjRM1CK3KZJ1IPhZ3JSktan4Y3Ka4qAdrrQnIWfoJQd12KsKV6G
   05lMiy8sWyOSDG69r6fqNYdSdcW5puhCzBi8F2VgU0xtB6z6wjuTIWeCR
   aCC/YZsyiyuN0HMPZqIp5udl0v5j4Yxr9t6Ehq09tbs1jj5nasSpoGll8
   p/zCnc312XiIBU9pHdF3TB/FfXfQ1fJsNERGAICQkxyMnSvmzwX5dHskg
   w==;
X-CSE-ConnectionGUID: PUpvEBeVS4agQFcyGwxIUg==
X-CSE-MsgGUID: dfXSMr7qRsuz/+vkCtnSPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2636074"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2636074"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 23:24:20 -0800
X-CSE-ConnectionGUID: fB4HC0WiSDSjSo/OZ5y6lQ==
X-CSE-MsgGUID: 5Xj08iasRNSpCF88HoFJUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7253734"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 23:24:19 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 23:24:19 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 23:24:19 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 23:24:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1PCZGa24M4L52PBhGj6fZQ2NuTP8aNR9kCMxdA2JX2U99mDBkZPJI3SClx659M4MDvmIVvY+CsFsnN/VIN0klhup8BG+kagI+QXI2xUzFIpunyP/6GeNKVfkrQuudMjWXw/VkJwI/z2HXnZG/kdPvlbg0HKacpRo6HMPsLyg2OjwWLo0llAzYHPfZFwidWiyYaU5nPbxR/hiHcrGp56bymIJOu6mCk5nj9sShEAoHea70Sy0Kcb5+6Z5qN1Rrgqq1o4BlaEYwA7MIVfRR+lhhW2eHx+vAGCkUa8qlJhotcNBazrjYB6Uf+8wFcf9xP9act4PkfDhu8kTZXFagpxfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GsVvaNwS7N3QwUXv4BYYZVODcIwLAWZzT0RIF5lLU2A=;
 b=IhHq3gDebAQLR3LkDLAjsbryI2SDuv6nwXWB5OZY8HJkmb8BhSMnaEJmLNC0Z/bLXLqCisxubER5TLbXvEi994HBoPFCoJkbrW1sCc1OjJm83zwdDBbXz8Iu/wwaoHL6FKf4eTg22C7/P7jQRpoF15n9j6DLJJ/0fgCERwYyh+BrVI6QZ153X9jlb4ZzKkjb7blhbmz/MacuPC4BeURAjUK6FbKMnizzSZTeqa5IQMAyL4vJ4yxlna92bvXCM8PGu+ljwUnjh7j5flGk3gWMGHw3yB2ZncrpCar//vJHwoiNUqVu6hdm7YqZ5s3jVUsdL+173/c6iNBpe2Whl9qIcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA2PR11MB4844.namprd11.prod.outlook.com (2603:10b6:806:f9::6)
 by CH3PR11MB359463.namprd11.prod.outlook.com (2603:10b6:610:347::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 07:24:10 +0000
Received: from SA2PR11MB4844.namprd11.prod.outlook.com
 ([fe80::61e5:7b38:b8a4:1abb]) by SA2PR11MB4844.namprd11.prod.outlook.com
 ([fe80::61e5:7b38:b8a4:1abb%7]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 07:24:10 +0000
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
Subject: RE: [PATCH v8 08/15] iommufd: Add a vDEVICE operation ioctl framework
Thread-Topic: [PATCH v8 08/15] iommufd: Add a vDEVICE operation ioctl
 framework
Thread-Index: AQHdbHgfT+Dhvps6X0q+VQdBJAhigbcgpQMQ
Date: Fri, 6 Nov 2026 07:24:10 +0000
Message-ID: <SA2PR11MB48448A47798E60C34BFCDF9E8C762@SA2PR11MB4844.namprd11.prod.outlook.com>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-9-aneesh.kumar@kernel.org>
In-Reply-To: <20261104161632.3547423-9-aneesh.kumar@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA2PR11MB4844:EE_|CH3PR11MB359463:EE_
x-ms-office365-filtering-correlation-id: 79ac534c-0924-4579-3f92-08df3bd6f380
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|38070700021|11063799006|4143699003|56012099006|261009223027099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: wjTesfWGKXimNyTnxCeahnAYa1W5O9ekIqm80axFDFFjinSExG7uwkVcc8qfeV6BQXbCxX2RYmVDJ2Uc6K4xyZ48vVIbfxszVH5QI0FlXzAleJDw8CkL52RoPBJPLyX2/u10nFFbz/LDHYXT+JSGEoebqE4GNlw7qw0S2vHfP0xj/HwFEZuWrHYY3C9VHch9BchusoeCdVgovST27JesZELTpVmcpyowb5P6zM+stJoyFP8Cp6u70kQqvPaBk9B5l+JX4nWRK1Hvi4krSEjVuMdaJhfABNtw/AqBr4iyaWrDnX/zJFZvULJM/FRX8gbp+Sl9UxkxlBq/hTMTv/1egyNjIILyC0YmXtBkQrUT/hxzK3ve9mB0tZyuov/z3DO+h0uzctdRHugbYJmKy5o07aKyjhLE+exw9WEHbl6MuIoYisd5qrwp5V8zCnj4Ho9rAFIG3UWwhasmQf9JXmKaP2pAfi0/tMAVjEN1quJlu6GSYUF9lnP5/Farmajz8K7wuhF2qY9Ud/9Lh+iBOowa+7ylSQFlWnPNGiuWa10OQinVJSXl8vHNHhRQG3IvFd2NxC4C2LrL4HnTvpn5Qjjgd4wzNitvhuCorrl+n1d+7ENTZz4voICJYJnD3vX0CmVFqpVaSilrjV2UU4GHw+wPBth+Z1hhyKF4BqpLtXQHFhK6xB0aPAgijWH6pMDywNTqWWZ9mBzNBES0fPd/1+h1VlwZ0VZ0RXgCR163kVfJdLc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4844.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(38070700021)(11063799006)(4143699003)(56012099006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?l3JNG4E2XQBqi6BYby6ziJ9N8tuEFRGC960iM7pnFb4GSNVmmUVn1k6cVkrf?=
 =?us-ascii?Q?ScFMX5jNaPCTsS1LYWetg8g/Z8cdkbF/TlsCVgzidOX2pBr1XcnOfgMD0cmW?=
 =?us-ascii?Q?x9l7uPRbUWvPvXwQp9QvnL7fN7Xgbt4Z1G7S26/XvTndVpljBJAaK7DgO6Tv?=
 =?us-ascii?Q?njfBpIu4lGUhIduh7x3hCm/dTQcehA/N1DBI5GiNxcYWnUkGKQNQWu30I5oV?=
 =?us-ascii?Q?gi3B0mlIjqY97u5S/9TilH2lLwenH1zRyexkyFIwsI9d3Abp5LPT/3jJRJ+b?=
 =?us-ascii?Q?QLK91M4krHdo71cumXdTEXPE3YNTzQZBWJCe1SbiJyO2AeRFOWonbMGOHA5T?=
 =?us-ascii?Q?48cILDiAeqqaOQ0JctZRIiYyD9GpqYOE8RoA7F6wuOD3Xu56c+AynUk0Nlxc?=
 =?us-ascii?Q?b2qA9fpUJyRvh7l6/0Bu5u16AhyRCF4DBerlntR+//vPu13MAf5KFxZL8uwN?=
 =?us-ascii?Q?ht8h5pnG8MuEPcI0jFiVXtGsxLZ0+O+LKY0vsTn0f1Nz3xXYa1jEKOJ+dzBS?=
 =?us-ascii?Q?IcIecusOjwafNVtogaDJs1o3sctaYo7vkfHOspDgP4J8xOwPTPBIJj7XsR2G?=
 =?us-ascii?Q?XynsLRdgcP59SiTA14+ZX6PpoTigWU+y8WxWTNY8XWZXUwF9zGjS/0ssDXeT?=
 =?us-ascii?Q?LwkGx27jj7FDLe7SWVF9JukR7R3uWbZKfDyw5rqchVJ3kKYljfqmHxTXAjXl?=
 =?us-ascii?Q?9HKbbhi1Z0Tv1iAn8ads1i0HZTUWfUtA6VdrkJmJMfEbZhf+h7NlOHklbQaX?=
 =?us-ascii?Q?I2lUUPZ3GiHkQ+pWldTNaZgujSqZmqC99itYSpBee0Ys6zEuZVJK6bQP/n56?=
 =?us-ascii?Q?dPM0cRnRLmFCWAhJsX5JUkywubLoSgcIx7XYpf/gzdTB5ZhihqWJdDwQ1HYU?=
 =?us-ascii?Q?5NAYPjkZe2YQZYfWj5bkG5H6pnCvGwSAh7HWBfe9SJ4ldnqY9cjfzWbc+Sw1?=
 =?us-ascii?Q?16jg5FifFa9LwbWXDcNiZ4wKCDDT5iKE9sCvAwXgEMLvbeWP0W/VF3tOEvtY?=
 =?us-ascii?Q?4uaannfH0O7Ysdgb8N0nUVUk3R9TtTmsif7M1f3zEKEQm8YL9b9DTbDUWtNv?=
 =?us-ascii?Q?XnMPW0EfjRLlTX1ALcqerk/KJJbDYIbiQWrfX4eIUil5+Kpfoak9oBLG2+qG?=
 =?us-ascii?Q?W9WUVDFGCw5hSbZwyM6/pHFqA8H1ODCtWXA28o/9qzPS+Gv7njKqEIb+hBNe?=
 =?us-ascii?Q?otXfLAkoY4zKTEKeADkDudBe3W85/Vnp+D5HBDrk4O2+9N3NFRdxoJHQa8WC?=
 =?us-ascii?Q?bfrmkdtC74ihzaHFy+faV2OCa8wlP2katf02htPQvVQXRY8Upn1rSxNdQrhh?=
 =?us-ascii?Q?7O+xoiBAcjNjTgdmjOgW1Vkq2akp+pWOSHFHyWcxPE1N5oXY04/dHapsreni?=
 =?us-ascii?Q?2lWcSd38a5yyGAJktWLhlGtqcnXixu/wHQUBkKOKoAVdTnjd4M10DBQ5rMGS?=
 =?us-ascii?Q?wQoL3SJu2fGEGY+tNJh6NIS1A0r2jR38jUWSBhZqdq4dlSC8DTxTsoSlf2Fk?=
 =?us-ascii?Q?mUWIEsBP64irNsCyfag3Kwq4oX8q1OTb+xHSls43UET/cF2mkaeyDQLTP6cB?=
 =?us-ascii?Q?sKip3hOAzZCfW/rzxMGxQaRQVQeTcXBh6Rp5cKg/FTXzw5/vSVZqFr2xaJma?=
 =?us-ascii?Q?hdMskvfAkK0+tVdAa9ubGVRLKFCkueepBrBuOs+zPO/giT1S2pfifgJ3nZ2d?=
 =?us-ascii?Q?cEoC5pEU9orD2mYXOyQeUTNlK02unxg6o6dwhfUBGS3W4Ttv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TcjZDbiM/JM4ffvCgIxowGw06s7bssNbWUgDBXOIrnBqW4XcQ9zPbCGbTAs49cT9Ba4MIQqVBZZnWz4Qp4+onyWPfY3j6XbM9wGmr7l1RjuD0NcCvCqlYG1Y8V5KDJOXNsKL7mNiQfjNcqPRDQtmAXisjDTxGVniYK3rFX6pLRHgOL3ox1bggaYL5L87TU5fGDWaaKYd+I2X7SQEncfZ61jKQeTn8v5qB2fOJ8n/tJqIIRZRF7vv4hHiHtc20HDrdMFrht7cadY46Zfh2r2R7hZlKJ1RVtZE+q/XRlCRrAzODJ8HJfjkyx8l9wU7lhUipwa9UBb9M3egmICEUn4r3w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4844.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ac534c-0924-4579-3f92-08df3bd6f380
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2026 07:24:10.3844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PcX+UiUSj5LSAiFHhi1fmBEwOCrbeJBgQTsqSLT/LHCS7cKzJwe2h+DnMPZPTvbB5wj1Ajxx+J1O5+wLFeCIfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB359463
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_232420_933721_D0C380C6 
X-CRM114-Status: UNSURE (   9.26  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> From: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> Sent: Thursday, November 5, 2026 12:16 AM
>=20
> @@ -11,6 +11,7 @@ iommufd-y :=3D \
>  	viommu.o
>=20
>  iommufd-$(CONFIG_IOMMUFD_NOIOMMU) +=3D hwpt_noiommu.o
> +
>  iommufd-$(CONFIG_IOMMUFD_TEST) +=3D selftest.o

unnecessary blank line

> @@ -453,6 +453,7 @@ union ucmd_buffer {
>  	struct iommu_veventq_alloc veventq;
>  	struct iommu_vfio_ioas vfio_ioas;
>  	struct iommu_viommu_alloc viommu;
> +	struct iommu_vdevice_op vdevice_op;

in alphabetical order

> @@ -516,6 +517,8 @@ static const struct iommufd_ioctl_op
> iommufd_ioctl_ops[] =3D {
>  		 __reserved),
>  	IOCTL_OP(IOMMU_VIOMMU_ALLOC, iommufd_viommu_alloc_ioctl,
>  		 struct iommu_viommu_alloc, out_viommu_id),
> +	IOCTL_OP(IOMMU_VDEVICE_OP, iommufd_vdevice_op_ioctl,
> +		 struct iommu_vdevice_op, resp_uptr),

ditto


