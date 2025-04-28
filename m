Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0A2C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 18:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvuGodlBkvUXgtEyzyJMgQuF/jmGPlK65HA2bK2CS24=; b=nGKDgdIPqcpo6gf2tvVKB8Xxbg
	NagB4140M/vK6NWj19ecUq5YM7ffjXRIA4e7YH0Mxxsre77MnuF4KJgg8P/ppLWtDclUYAnby20ia
	4PVlBbf5dkLekMEuvmI8T1nVEr8k6m6F5mkaxSql4Ed3jA2ilI04JpN/zATG84vC7mvWla71m3d/f
	xLZHj52NW8QtbgpClP3u+ga5drmOy6hXLvMxorBms0bnj04IOFGSnWrUnW8GItmqgNd18v1oVqLHk
	S6+RKZgCs5ptk29zgpGGNEXVBth1oTwqn3sIJtDUFdsz7k+tpOVNV3GzzfeEIB24Yp3yPA6ShCdji
	S2Mljdrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9SwG-00000007B3x-3ovZ;
	Mon, 28 Apr 2025 18:10:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9SuF-00000007ArC-02zh
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Apr 2025 18:08:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TvuGodlBkvUXgtEyzyJMgQuF/jmGPlK65HA2bK2CS24=; b=dsuyDXDPc/NhTl/p0K/uCKTtzG
	mOAJlYRQYEMm6pQJycl44R5ZodZpP8KV5lLZ1zerWqSdg9i0fUkR5YqinlMWgBwTWaeu7p3oAbGeV
	RkVajHl3jVLHmAesD9S/lzZlz5gqQoc6QUZukAuegcV+zK1E4GPNtoRbpgPeXJ65eDwIhiFfAKYtH
	aJ0m2GgzAi2+AJz+YFzhFcraSqrHfFhBoX031idAGhInk0PbOQZETPfHx2rFoJBZr032gyT4Zyff0
	pgYHDuCtEyl0myJWijxaLxn1l7kHA8B146cyDx6Oapvy6AGOWhGHex48OQpd0aZ03WqMz/qL4ZWOL
	vwqzIEeQ==;
Received: from mail-mw2nam10on20630.outbound.protection.outlook.com ([2a01:111:f403:2412::630] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9SuB-0000000Cwzo-2cxl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 18:08:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aoNZLDDKLtatNhHS8A8md68FfqvY7qjqLvBeGn93DO1XhJpqOC43Y1MlY/C56yzB5un5yrsvCodToXoVP9rfhGHwKpzh6IvcgQO9mDkkr60KHjboaHUviuUFYghsmarg9M0V1uD6+r2pB/jZwbnynuipMdRLeSlANaHhpEUc6hMw4sHnIm73UGsOhRrZIMdRhpGfsLDxlJmfB7lcw02G/v9TGbPBl3nqXy2lu4d8xh2/agWezMpqK/zinzJoX61Bidip1kPb5KJX4ZgUys58HP+SRa/V1c9is0txXntQp0FFsmUuCFu2pWpDfEuYNqGWVEAStB09lGk8xiFCzqxZ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvuGodlBkvUXgtEyzyJMgQuF/jmGPlK65HA2bK2CS24=;
 b=MT9/nCIcBiANT8o//YC4jtw066v72FeAy2bWoDregqHoeeaEQdr8j3zUAk7w+sPYlHo09IYrwM557pmbCCP/q8hwDANk16yLkFRp8X/OHsUyFBmE8JdrfHC9qZG7xLoF49ayg4njhJ3UeTBRjOONiuyADW3US0FfJH1HjHk8t2t5WdBy5+0gJkn2OMdaCTSNud1jm/auhGWblq3qdsQ0MdI0sf8YGRi4juuQmSTXz9UfyvkqeZpmq6Q1QN8tGTz9LjAautjO11WtHa7i+aTJ/JNyQ746HMWxUB9uIu60G1qycrlTlU//13GyZKpWUKfdKDSfpM2/G8N+aV+00gfiww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvuGodlBkvUXgtEyzyJMgQuF/jmGPlK65HA2bK2CS24=;
 b=YVI45f6KHNe6D1Gn76U8TOPKI7lrrJNwp3XE9VPkQAh46YUcYQ2pC3SPVXkanFEU9a4XPHdZv/KHJxd2+W0KMlccmPDYRX4FEF6PjvpCiTvqUwhbGHA6t166mykZJqeGNpc16AA0J1ZpqHhP4jRsMhZ54l8RoAEEz4VIyuOp6bWe0f7/lXflwRdCqRSAhABJULEvpKGYhD56eRXRoUqUuFlnN4M4qT64IvvUwxkJ02xV/TOXrAvYwvh8guoCv0WHwq2kdyFf6xmEWy53EfzmUyWLYBF/JTaTWVyZcgA8/OL62JfaZ24NHWMLVduWW7MJ1bUh424zTtUD++HrYNfYxg==
Received: from CH2PR11CA0002.namprd11.prod.outlook.com (2603:10b6:610:54::12)
 by MW6PR12MB8705.namprd12.prod.outlook.com (2603:10b6:303:24c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Mon, 28 Apr
 2025 18:08:25 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:54:cafe::80) by CH2PR11CA0002.outlook.office365.com
 (2603:10b6:610:54::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Mon,
 28 Apr 2025 18:08:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 18:08:24 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 28 Apr
 2025 11:08:09 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 11:08:09 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Mon, 28 Apr 2025 11:08:07 -0700
Date: Mon, 28 Apr 2025 11:08:05 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Baolu Lu <baolu.lu@linux.intel.com>, "Tian, Kevin" <kevin.tian@intel.com>
CC: "jgg@nvidia.com" <jgg@nvidia.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"will@kernel.org" <will@kernel.org>, "bagasdotme@gmail.com"
	<bagasdotme@gmail.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
	"joro@8bytes.org" <joro@8bytes.org>, "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>, "vdumpa@nvidia.com" <vdumpa@nvidia.com>,
	"jonathanh@nvidia.com" <jonathanh@nvidia.com>, "shuah@kernel.org"
	<shuah@kernel.org>, "jsnitsel@redhat.com" <jsnitsel@redhat.com>,
	"nathan@kernel.org" <nathan@kernel.org>, "peterz@infradead.org"
	<peterz@infradead.org>, "Liu, Yi L" <yi.l.liu@intel.com>,
	"mshavit@google.com" <mshavit@google.com>, "praan@google.com"
	<praan@google.com>, "zhangzekun11@huawei.com" <zhangzekun11@huawei.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>, "mochs@nvidia.com" <mochs@nvidia.com>,
	"alok.a.tiwari@oracle.com" <alok.a.tiwari@oracle.com>, "vasant.hegde@amd.com"
	<vasant.hegde@amd.com>
Subject: Re: [PATCH v2 01/22] iommufd/viommu: Add driver-allocated vDEVICE
 support
Message-ID: <aA/EBa1wQgUQgLKj@Asurada-Nvidia>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <14781558dbc291e515b5e249535e3c08290a6792.1745646960.git.nicolinc@nvidia.com>
 <ee9d46f2-5953-4ca4-adac-c3e35c9001a3@linux.intel.com>
 <BN9PR11MB52768ABB21EF05E8FF0BD2588C812@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BN9PR11MB52768ABB21EF05E8FF0BD2588C812@BN9PR11MB5276.namprd11.prod.outlook.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|MW6PR12MB8705:EE_
X-MS-Office365-Filtering-Correlation-Id: 8868ae68-3d91-4e4a-1892-08dd867fab25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hw5gZ7ZAssVFBgYYGV1j8TztOIrTMeGNuXynz48s6IMmh/Phi1ls3BiZVoLR?=
 =?us-ascii?Q?aB5+w42Qf57xJlFHOWMYxJMcyg5WOmxAxmAnOempjtSS/BwLH397bwczTK7h?=
 =?us-ascii?Q?m5ON/N0QxgP3V6LNMbm5fUsSyZ8KuDO8Q7g6JwzV2tpEVRrQGT0mVTfIVuTV?=
 =?us-ascii?Q?9ris+yCMSBzX3hwABkFphzrK+jUDJd1NdLJ2TTrQf/lp8YYUoI466P8HsWE5?=
 =?us-ascii?Q?7fBzEFtjiU85H787f7C7AhZbbDxksUdz6334jY264MRlH/yEAGHHUZHtUUKt?=
 =?us-ascii?Q?5bVAI6GY15ZjBrQgEWbCd3HWjOvBKzTzeCuofhmjWJ0kl1FmqPmdhSLGUXIN?=
 =?us-ascii?Q?vXRhtT8/uM1AjCy6XA6IFqOzO43UMwMnRRpMklOGAv6EVbP2px/cBZq9CRy8?=
 =?us-ascii?Q?JG4NDlDq6xj6E/9SuYFMOanymt7WaeiR2q+/blUjyIFAQ2kzNG5GcN/VNCPD?=
 =?us-ascii?Q?52O9BgoPN48tXWlwYWcoV2KtqKWD5fOpWyquwe/Dc55vw0tZ0WynG+4VnXPc?=
 =?us-ascii?Q?7+dDbWx6QklEZ413Vyi39lK8HZ83B5W8ZXtRcJwIf+W6uSSUiy6mTH21CSyS?=
 =?us-ascii?Q?h1jqm85qd4eDadBsqj7ACjwCW/0w73skDh4t2nwnU/LAW6R4ExzMMiarV0cw?=
 =?us-ascii?Q?6AOcnhnrusokFRo+KqfOqgJmW0rDxveL94d35n+hDRLi60VUS8GoQBmY7PcF?=
 =?us-ascii?Q?yWxsi/mMqk/XlB3UNXptWnE8JxuvOLWTOCj8F31YFuefSC8yRjS8qIeHcg3j?=
 =?us-ascii?Q?c2zexS5ln66cwOXI7b/+KTOpjp5i2+dVMdipr6nZZRraf6MxH0z9Q+MXWAzD?=
 =?us-ascii?Q?M2cBXivMG0bvZqt5uRIwgV8RP2qfZ2VqIJV+80T6pCNVaLReLoeiuBH82waf?=
 =?us-ascii?Q?rQkJVX8hKO4QAfe+cThUrSNISPhAAmP0Sn+wK/cMfdjLBVX+uM59abfor10e?=
 =?us-ascii?Q?/3Nn+pqg7GCSyppk72/URm7FKymopjElet5bEA7PtlNF4BUcafZ3/+43dYgi?=
 =?us-ascii?Q?s9fQiSsszBk0VJMWrs5lYPnWJ2FjFmeVV3snsnq5GoGyLeHMdiQhd7N3WY3N?=
 =?us-ascii?Q?iNQYF8BR8IOhD7ZGKND9nD3XVUflR990fZLQBHEyndz/uJJlgBJuNWhYxFoO?=
 =?us-ascii?Q?/avhkJfXMJXkDLPPVH3+/5wum1Fj13x7Ugliw/YuzL2wiPJZASsgTVpYiIj2?=
 =?us-ascii?Q?1udKM+QtT74sQe1kFt8w0pYhyVKxSO5qMNEONVnTxcywnl+BI9/fLqYfIDMj?=
 =?us-ascii?Q?qnc1axNCISjEVQCLJDqNRY18l7wnlaMvpjjxKWRy6CL5LxRzX0rDZKGm71zz?=
 =?us-ascii?Q?D/xoIB3Z8JHgxlRcGjLP4tCNIvjCFt728KCcEJlk86rESCVzq7OsF/m8kKQw?=
 =?us-ascii?Q?b23eeca5p9OMhsi0vQHdTWdfFDOyhJkcxSNojvLjMjJLfCQNqGSzVt7Yz0vk?=
 =?us-ascii?Q?yJxijbFooDz8q/xCnbO6yrlCuIi6KHHHk23NL+pXDAkFkIxGKSGSFY9EwiMd?=
 =?us-ascii?Q?m83LYJPfkfw3XqeAPv8CAC5YpZcxNQv2aiQmJb2eR/EtsoIwOCHlgLhB0A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 18:08:24.5326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8868ae68-3d91-4e4a-1892-08dd867fab25
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8705
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_190835_942305_A85A388A 
X-CRM114-Status: GOOD (  18.94  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Apr 28, 2025 at 12:41:33AM +0000, Tian, Kevin wrote:
> > From: Baolu Lu <baolu.lu@linux.intel.com>
> > Sent: Sunday, April 27, 2025 2:24 PM
> > 
> > On 4/26/25 13:57, Nicolin Chen wrote:
> > > @@ -120,6 +128,13 @@ struct iommufd_viommu {
> > >    *                    array->entry_num to report the number of handled requests.
> > >    *                    The data structure of the array entry must be defined in
> > >    *                    include/uapi/linux/iommufd.h
> > > + * @vdevice_alloc: Allocate a vDEVICE object and init its driver-level
> > structure
> > > + *                 or HW procedure. Note that the core-level structure is filled
> > > + *                 by the iommufd core after calling this op. @virt_id carries a
> > > + *                 per-vIOMMU virtual ID for the driver to initialize its HW.
> > 
> > I'm wondering whether the 'per-vIOMMU virtual ID' is intended to be
> > generic for other features that might require a vdevice. I'm also not
> > sure where this virtual ID originates when I read it here. Could it
> 
> for PCI it's the virtual BDF in the guest PCI topology, hence provided
> by the VMM when calling @vdevice_alloc:

The "virtual ID" here can, but not necessarily always, be BDF.

Jason had remarks when we added the ioctl:
https://lore.kernel.org/linux-iommu/20241004114147.GF1365916@nvidia.com/

And uAPI kdoc (include/uapi/linux/iommufd.h) has its description:
/**
 * struct iommu_vdevice_alloc - ioctl(IOMMU_VDEVICE_ALLOC)
 ...
 * @virt_id: Virtual device ID per vIOMMU, e.g. vSID of ARM SMMUv3, vDeviceID
 *           of AMD IOMMU, and vRID of a nested Intel VT-d to a Context Table

So, yes, here we are just forwarding that from the ioctl to viommu
op. Perhaps I should add a line here:
 * @vdevice_alloc: Allocate a vDEVICE object and init its driver-level
 *                 or HW procedure. Note that the core-level structure is filled
 *                 by the iommufd core after calling this op. @virt_id carries a
 *                 per-vIOMMU virtual ID (refer to struct iommu_vdevice_alloc in
 *                 include/uapi/linux/iommufd.h) for the driver to initialize its
 *                 HW for an attached physical device.

Thanks
Nicolin

