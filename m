Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB92D44C7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 16:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GpVlhf4mkQ0zn8hl0ZnPM/5AmNTQ2DEaCa1MD/F4cFY=; b=TWDTxlakAV7/Lk7nu0DHMRJOWm
	HCfikl6vjKhCEs1Evf5oRgVdymcyIdOeZSN0p/fVw4lpvsb83VLz4b3OPHK+1WrTitH4gBUYIopiV
	dsC0mbmE9V4CXxxtb0TrhhkWQ9uA8Odb6B/BrBlpGrzbFZVBxSX/aFgdsZVwxDuUQJVLvsZ6wAbPR
	neeaITTCffrbNeJ7rrIIKVxsKygqBIAR5Io4a92FQ9JN1S3cSIrPGOH5wMagjsPLeAQG74ksKHDmH
	KhyIrpC408NFBl4CSeGX3Jq5v5Ya5kFAOYWOBxLZFms3k+hC4BRNEJ86GPkjJaH7ex6SJuLtxx1y9
	DvzUUYEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQK6-0000000CkEh-0noH;
	Thu, 15 Jan 2026 16:35:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQJk-0000000CjnR-1nxJ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Jan 2026 16:35:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GpVlhf4mkQ0zn8hl0ZnPM/5AmNTQ2DEaCa1MD/F4cFY=; b=CARHTSQIf9lCn+vdK10d4iFiKw
	0n7mmqSMknce+6njAcISM0TwMviSosFMzFwrbG8YN43SXp87/TUHaiv2tN4sbQnUUL/0h0aCWekVa
	qFQAZ0AhblQ7lwAY5BZGGz2z7wGS80/vhTjWhHhwdck60XtUJPp+bPDFaht22woY4hB2XXbNS+jNN
	fMpeIEFRS1P/cDFXposOkqVipeMK13KA9/jXKlB9dCJdEz96dP+tQ0+mfUvRncAXrsBjuEx5teXiB
	uW+qjCuLJY9+PNJybYw4shvJSIgbpITQJQhVQjnoigUrBgYnEMQNDt0YhQxb14gOz7bFhY7sz07Wh
	f9y42Arw==;
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQJc-000000079ee-2FjB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 16:35:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iz6zF1ebrtnCsOVJHXjfqmoqzE5NgIrfrfrVwjBAd9PhGpPnFzApt6+tjo9NAZSfevBLPbjuGdNkUa7soOWbySWsSvqmSDJgy7drlBnP805eWqbzSgQna8kScyC+2Qg/1s3+jtWTIAn9JihgNM2nKM3HIQ0LBm6wOrjTwiAnaOoBv4dpr3x8Z2ZwxNQPBDBBDA6V6jrHuTgl+mInaiyb382Iu0x/TI04Ig2Wx6jmOBO0ZZQVGsTI/hW4oCcccZ6tzlE8DA+HGkNCdn1vApPh9GCMDoY6o8cPOlf3dsRC4M3gwx8ySom/KvWCrJDxiy8G1g5N5K3xA+HKP5xKK4s19g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GpVlhf4mkQ0zn8hl0ZnPM/5AmNTQ2DEaCa1MD/F4cFY=;
 b=C0bjIuXq3Nk4bBJWx/q8QuOUGZMGTrBk8E1INorDKA1QXZhiUtPatSWzrMQp0qwRwYTNUk5WedUe0vJjqewVkUri8ZPlSNUFu5msGZXXPb7H5w0cY+eW+Gu3/rnBysZ4LMWIOEOHitGHicHvHCF999KvFF86jxX0rvQ/3l5DK2KCRUjc/Dwc6xOr4teOSRfyeVdXpAASg7XYgTgiKfzAYrfw8CP+6KQWYRRPN5kou8RES3688fUz0FQ+PBPfX8j2GG1WbvZRjyfdvO/ctUaDzngWQ8YMvqNynOmiJVCcSN0UApcpVWfLk3Ld7UYKIPE6YI5BGn9YSVjl6XrrmAq87g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GpVlhf4mkQ0zn8hl0ZnPM/5AmNTQ2DEaCa1MD/F4cFY=;
 b=sRUV8HtsGWLtevvXsBi/pjlCYTTwX84PSj5X9WYYE8U8T9vOXWR4Ti53EBFK1cr80ywbx3inPY1XvKRZnapseiW2omcebIfBIBVmiVXSAnyQcYlaQGF6RiM3hrOciOMeXP+oStb6KUJsH2v8DnowkyExUE4GdR4kXyEbsgLzlzfCRqygutbw+YYSds8xwcvm2S5pLIXqPJMTZwfLQFv1YrRRmsiqQAhT2CR5ngebAK/3DqL1Zo0ENXa7tjJ8JK1fkIKCDl+CHfXVrsS30iDvwg81YVYOik0qSPVOXyNpKnJzCzCGGDnZwhX8nio+X9h5mP5oMf4JH3XBYR6ItBa2Vg==
Received: from BN9PR03CA0343.namprd03.prod.outlook.com (2603:10b6:408:f6::18)
 by IA1PR12MB6556.namprd12.prod.outlook.com (2603:10b6:208:3a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 15 Jan
 2026 16:35:09 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:f6:cafe::b8) by BN9PR03CA0343.outlook.office365.com
 (2603:10b6:408:f6::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Thu,
 15 Jan 2026 16:34:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 15 Jan 2026 16:35:09 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 08:34:46 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 08:34:46 -0800
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 15 Jan 2026 08:34:45 -0800
Date: Thu, 15 Jan 2026 08:34:43 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Will Deacon <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <skolothumtho@nvidia.com>,
	<praan@google.com>, <xueshuai@linux.alibaba.com>, <smostafa@google.com>
Subject: Re: [PATCH rc v5 1/4] iommu/arm-smmu-v3: Add update_safe bits to fix
 STE update sequence
Message-ID: <aWkXIyvmPiJoyRtf@Asurada-Nvidia>
References: <aWUY-f3kvM94z4qh@willie-the-truck>
 <20260112161010.GC812923@nvidia.com>
 <aWVETpwlx9Rhs8Kw@Asurada-Nvidia>
 <aWZfUNXEka3GBf9s@willie-the-truck>
 <20260113161253.GG812923@nvidia.com>
 <aWarF90zBqxD0Gef@Asurada-Nvidia>
 <20260113205112.GJ812923@nvidia.com>
 <20260115131151.GA1081267@nvidia.com>
 <aWkU4a1wj5jsWFev@Asurada-Nvidia>
 <20260115162919.GG961588@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260115162919.GG961588@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|IA1PR12MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e27909-df9a-4251-73b3-08de54540c72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SwkZTbnY1RuHBthNMdKJ3N6MJ1IOMOOvP8/uQydEykEiv6xBAIJcvSnIVj2y?=
 =?us-ascii?Q?gvvNd5aWIqXaF6Hl1pLBVXV1uy599rHEgRltHx88qxGrvdh1pwFqAqNPUB0C?=
 =?us-ascii?Q?cTWGRQ8eh8AuLodRSkGDmB5f6mjutI8KkIHAOLP+VTFxJ0TWQB1/4rIKJH56?=
 =?us-ascii?Q?54JTGay+9KdhyfbFi9dZ/JjQsKGkiv7uWeoUK9rHm2HKmnhVuTqj1Wttvs5L?=
 =?us-ascii?Q?UWmuqzWf2S3oHA41VSlCFzN/GYASA6m53k1HdgRIuJ2kiOZmKanag2Jelwub?=
 =?us-ascii?Q?WhcGnLxdhF+wUiB2JGlelEA23hmHUxhPh0gZ4wzkEI4UhZAwTLVanYhLuIpr?=
 =?us-ascii?Q?48Vc48mZxD8GGLRe19zD2Qr6FL9jK65GE40oE24JEqZJcyvm79rpk3LHk3Z4?=
 =?us-ascii?Q?V/7ZFXOtEzwKTf6Blf4zcOEyJo6MWTj8xzAjrmeQa2Q4oV/LEK/jU1qtDOMi?=
 =?us-ascii?Q?iAcnptl5fUMhpSTQ/0kgRVeGtrMCOavAHA2238llTrAOuWW9z9glAwXzvHlq?=
 =?us-ascii?Q?0UkKCJ8grjkL3MQ29KS9Smq/I9di4oTPofysjhgOMwk1onqCPoOs6XRG70u+?=
 =?us-ascii?Q?Bd5UTRjJLLKLVHwhuTD9lRnXvj4JkKW5tjojTZWYvLPIK8dXgg4SkwYzMBkm?=
 =?us-ascii?Q?ky9b3nBJoxl3AWe0e8ASy/1dM/j+1xuHhfIKfp1CIdouF+rq4ZAXlTf49bW2?=
 =?us-ascii?Q?Me99T9lq0tTSY2Zzp5QLzoZjkV7oXxm7UeR7BMQC1XMzIHMMq17eA8YE07qw?=
 =?us-ascii?Q?BgFMKwtfRh4vr/2yU2wZ3MCjF6sYG5kFHmQJ2HVLSmXZ/dUXI7+4TFykStvc?=
 =?us-ascii?Q?+Wxm+hYM6laPs8FoR3NZC1LXOsUbmScjtFb6FOmBdU9fgsHijjvCgYTmDWZR?=
 =?us-ascii?Q?qvZdsCKSLBcpng3piHOfKoMnO9LPVHiRLPxkI51VXnSe+gL6rBzkx73qCbqL?=
 =?us-ascii?Q?0F8c27QCtwcNBXew62J51C/FV6RZAoEvYDG+xgqTh2CWUXmC4MIekYQ9lV86?=
 =?us-ascii?Q?mGb6mhZaeg82zPVqNHJVBV8PVbUkeM/tJOBt7/GSvewdQ8GvJieyL3652QEI?=
 =?us-ascii?Q?2QiUky0SWomO7Zadq41UcRhpdB584fLFhb6Ib3vRmz8taGCn5hPjFEPPsYVJ?=
 =?us-ascii?Q?BREf5mOX/1EEdYmdn6vsGp3Uausvgv0BoKL1UF16NwMOcnOp++bTAzIjzXPM?=
 =?us-ascii?Q?ZlbxuyKAyz40Ad0Wmg6275SPnT5swAdUwFoRvuz9g3kflEGISZQL7LsOX7K/?=
 =?us-ascii?Q?6n9EED6tgPww8AAJg9m3Ducm7v9GbfEwCCimplK61wrAOsIgk9jlqT8OCvuf?=
 =?us-ascii?Q?yYzuBsI7OXXTersGh3dNztceiz8fZ9KrR8Bs0b7JLeMrYruVudW31KSnTPsG?=
 =?us-ascii?Q?88lFuoiBmNmoe8hAY5Gye9MlZtWgy/Le6zUNvj4Q7aK+es8p7ufaKE6EZzYg?=
 =?us-ascii?Q?54eATiL7tzjmKI9XmQkVDU/7NL/bUh74GNgQRnEfVVYK3PZt8/Y9xuvTTlmk?=
 =?us-ascii?Q?yrEiqW3sizxg3uZUle53zWHneZzBkzXer3ZqjPhMA/3tHO+5HVpBv0S3jSay?=
 =?us-ascii?Q?2H4hgRjPBTmOY3am9ZF4r/RZTyIgk0XIF29LkK6c6J9gMsyz1edHqwbEjtby?=
 =?us-ascii?Q?FnNKeoUWRXwrji7gvuQGikFG916hT9/lS10kvJl6X6dk5hDeJHWhR7WF05ol?=
 =?us-ascii?Q?YiA4jQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 16:35:09.4208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e27909-df9a-4251-73b3-08de54540c72
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6556
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_163520_718856_84E70561 
X-CRM114-Status: GOOD (  23.88  )
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

On Thu, Jan 15, 2026 at 12:29:19PM -0400, Jason Gunthorpe wrote:
> On Thu, Jan 15, 2026 at 08:25:05AM -0800, Nicolin Chen wrote:
> > On Thu, Jan 15, 2026 at 09:11:51AM -0400, Jason Gunthorpe wrote:
> > > On Tue, Jan 13, 2026 at 04:51:12PM -0400, Jason Gunthorpe wrote:
> > > > > -       safe_bits[1] |= cpu_to_le64(STRTAB_STE_1_EATS);
> > > > > +       if (!((cur[2] | target[2]) & cpu_to_le64(STRTAB_STE_2_S2S)))
> > > > > +               safe_bits[1] |= cpu_to_le64(
> > > > > +                       FIELD_PREP(STRTAB_STE_1_EATS, STRTAB_STE_1_EATS_TRANS));
> > > > > --------------------------------------------------------------------------
> > > > > 
> > > > > @will, does this look good to you? I can send a v7 with this.
> > > > 
> > > > That is an easy way to address Will's observation, makes sense to me.
> > > 
> > > Ah, but it looks like it can generate an errant view of a EATS that is
> > > neither old or new. Ie value 3, reserved.
> > > 
> > > I think you should just check if old or new has EATS bit 1 set:
> > > 
> > > if (!((cur[2] | target[2]) & cpu_to_le64(STRTAB_STE_2_S2S)) &&
> > >     !((cur[1] | target[1]) & cpu_to_le64(FIELD_PREP(STRTAB_STE_1_EATS, 2))))
> > > 
> > > Which the current driver never does..
> > 
> > The EATS field is completely controlled by the driver. So, we are
> > safe for now, right?
> > 
> > Should we add this when the driver has the actual support for the
> > split stage thing?
> 
> If we have figured it out now I would add it because it would be a big
> leap to think the next person will remember about this detail..
> 
> But yes, this and the S2S thing don't effect the driver as it is now,
> it is just doing work to help future people.

OK. Let's add that.

I will send the v7 by the end of the day. Hopefully, Will is okay
with all of these..

Thanks
Nicolin

