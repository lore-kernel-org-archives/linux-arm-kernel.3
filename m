Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414FCC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 16:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/OMJGJUxSk8u3iEYTxR+1Jtywi7Ewv+YoS50Y1KgyM=; b=XVeX6WJRxZvNOwfgjlohrDINsh
	KMYEmd1o0GhfVsoWgyVi3j8J6VJPt9zzM/+tbUYSWDAY7XxpTbtEGw7QyGYDzme4B/zyMwnKZMmlP
	VB/ZiAzDt9x3aI7+OO7TVgNqpUhy0PXo+GmDBSfa7pWprcs23KwcTWlikzj3iCbe0PibwK42N1j95
	uMs4GtQg+W3Qv1d7FacNNU4cL2beVmdxCG/JQsPux9KIHHIG8+54bQPQesmq8JElJ0xamKceVN/Yz
	FDh1rBro/nvtrgkHIOS/3s8BHyqmKyZdLasmphKf/FYpLh1G8PfICADiasg9rj638f2414aHYpGgK
	JD2u35JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfi8j-00000003xHw-17sq;
	Wed, 05 Feb 2025 16:20:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhyw-00000003v6X-2Q80;
	Wed, 05 Feb 2025 16:10:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=b/OMJGJUxSk8u3iEYTxR+1Jtywi7Ewv+YoS50Y1KgyM=; b=M/pnH7sp6x4oRMSv2YIHpErTiG
	4sfblSrrm5U97ILiIKpYLcTbHiqOaE99JXRJbr5RcejZXF7DBLWkquykohtqZAR+1EJ5ad9ombFQN
	BV0xsS9mPGImanCa25spSamF/hWtiKqBH9Vk4Oe0kfNNG0l+vdy1bEiZf0dzjC1fQXwJrJ28ZIRj3
	wGcKavTMwKhQSnFwfvOCiEhn5pjJuTte3/AGUwdBdbPqZIglDobAaMQsY394qB6dMRnUJpQiJu4d+
	ppmhQBrVNJtN5fXwpFo1gQeGeFRZUsiDPnvokvUm2f26fowdMxbBUh+iA4h7QmSMLrigNt+aYvJIR
	5qg1Gp0Q==;
Received: from mail-mw2nam10on20629.outbound.protection.outlook.com ([2a01:111:f403:2412::629] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhys-0000000Ggwn-3eNZ;
	Wed, 05 Feb 2025 16:10:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UXozDJyukWsR07JysWK15TGiiBloEg0rLlHBgCciz8SljpIycU0p5NigaRoPQCY2vGchrCcP4EM7zrFQeZHjqy9hiWnhogxEJ00xd66i9R2aIy7gUhIG6LXtVOKvzK6s6L4gWOjxoBWgdPVfcRUzpU0MXljyKxlobW3yGZ7LIbIAIb9SEDja73S8K420Qv1WLhOCfqtFKqJvvbJA7J0poKIL6z849yvBsAeBhFemIUAyPlsfigKaJ2VuwbLhJfW1+U0tihnk89bdDUPCtnA8wleyIcux8FBtAJWP65I5eXJmOJ1IByHON5a6/2NVZWoN9kUXZfC6z0UP45VEkPAa8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/OMJGJUxSk8u3iEYTxR+1Jtywi7Ewv+YoS50Y1KgyM=;
 b=deCYzcKj4M9oR7ELMtRpulWURI+0kcTsMSwoSmNhD/xqaXuRq1vzqBlGsypgSbUEX4MTWjeJXdY5gVFaKS0D5ZRs+phoYVWCpm8SAgMJ/D40sdsI97clR5+TMT9eJCvJ7Jc+Teu7Wy2AsU9Fzn7V67f0hUvmv/5HwchtI8rW9KamaAGtg0kEhpCfKpkVK6+h82bp7WtYKHS4igSGiCMO79gjp0Vl3qd7yXRhFQUNol2Ymw6YeC6h5Mr/19seDMVwPrrEVMvXycz6MIjuN5hjP53HQwmfTuZDii79YYQJoxNzgStb95F04AUWTuAHKCCwPnY4SBKaijEniQvsY91YcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/OMJGJUxSk8u3iEYTxR+1Jtywi7Ewv+YoS50Y1KgyM=;
 b=d+yQoJl1mpTG6SOuMMVuv6S+Lreyex7i9Da+Mi/3pWf0gIzz/rEkj04+1dp5ShSLubbEgauBXPIkEYpTm/HBjJdepuq6oguk8E0B5MtVsrQ3puIl9QAjtY/znbASIz0v2WDU4jWnvC2rbzpBi0obdyLgtGAmk0z0vvbGAJ524TPsJ0DSqs3Ar+Q8KtTP+di6MRpFr1ckKR0ODfjNwmqPlMPsncZ9poaWiu4t9Ix68sUMnrc2B1YCgJFARQ7LWnP4XormRI+IU2uEJSPtoBl0DY2KguYLKFbvN3SuiD+TWF4jBC5+YZ1lsyA+usULrZzpavlJCP5IATu261FTtbwQXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by BL1PR12MB5803.namprd12.prod.outlook.com (2603:10b6:208:393::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Wed, 5 Feb
 2025 16:10:18 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 16:10:18 +0000
Date: Wed, 5 Feb 2025 12:10:17 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Lu Baolu <baolu.lu@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Hector Martin <marcan@marcan.st>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel@sholland.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
	Joerg Roedel <jroedel@suse.de>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	David Rientjes <rientjes@google.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 18/19] iommu: Update various drivers to pass in lg2sz
 instead of order to iommu pages
Message-ID: <20250205161017.GB2960738@nvidia.com>
References: <18-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>
 <23d4c47e-a00c-4f15-ab42-303bd2aca032@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23d4c47e-a00c-4f15-ab42-303bd2aca032@arm.com>
X-ClientProxiedBy: BL1PR13CA0446.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::31) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|BL1PR12MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bbbb457-cdd8-4c81-b56f-08dd45ff9585
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r7fHqp4hsv7vgohXizcPRATjFiqK/Jnmca163JLU8mGtW/CEmpfggF4+OoJm?=
 =?us-ascii?Q?vPFCmdwuqXVbkVLDJAcYP6uaDnLNgVb6PvRgROD0HPzWAtdaIOXX9MJenn3S?=
 =?us-ascii?Q?0MDDes5n+2J1ntQZJeA4yRqrQhDrLX9rmMOdzsIykrDsPXvAMS1xz1A5CO5e?=
 =?us-ascii?Q?BhqLWAKt3Li0tnZLVol9y7jsv7eSB6coSpWUPBKBH3K7+t9XNv3brTzIbs56?=
 =?us-ascii?Q?fvWZC+T8pvzWLzd2tIlcIqNZV1dG7awIhUteyfJoSnE+UjUFu2zNG3WvwNaA?=
 =?us-ascii?Q?vXrlnTfqRHb2hhwznR5AivElCeKPOQEuN5NXOCphwOlQTOWrBt1s2DasYwrC?=
 =?us-ascii?Q?Wmspy5/8a3uEDD3g608kBwsZtirJlxrhlR2avf+Lg9pldHu7tsQjFDNlBV19?=
 =?us-ascii?Q?yCAX4EFJQfIpCJSlUpCSak17KvBZQIvyWQthEpiHgS3jO74ZvOvMbHHvC3eD?=
 =?us-ascii?Q?78bGQUFr1727kJVU+YenBFkKfs/hpypFAW9mtToxgVUlnTPxlG9oC0gWvxIB?=
 =?us-ascii?Q?xE03KmK+UluqLy8FATKNZR9Lo0ogKYNznu2nyQ8sk7UZ17NC3Homm9ukHFKa?=
 =?us-ascii?Q?WC6PPLzN8x3yPyrQbiRrwOxfUshzMgEdviRBCbEvAHdGLD4o7Yx0xrRer6uf?=
 =?us-ascii?Q?lIU01M8gEMbwmCYmAs8D/E+Sew5PeV+vgFD3Skuf/jlxBs9KaVH+Dh5kX4Tl?=
 =?us-ascii?Q?w4uptk/17Wh3K5cYqUuv9B5as6VgOSzFnchbnYT6UgNOAKCi5DkCHI2kS8OJ?=
 =?us-ascii?Q?NfaJq9a4u4bJcbR0goBLd0+mRlihATaUmGQ5mqcF5jAPvzJ/csYJADO7ZNHx?=
 =?us-ascii?Q?9z8E4zq8+uA0oXNwzF5dzRfSNR0xk+ePRdW7NVaTWAhPGpVrYdLuPc6KvTYa?=
 =?us-ascii?Q?FIiYJrQkCPSveG325DrY/8mNVSerLpUDaK70X+Utok9b2/J29gURFoA/8m9X?=
 =?us-ascii?Q?ZIjzXc+9opfZuo1wKs4R7sqDsXIiAqdAZn8qZS3Q1JLLM1mB3+ZXXwX8mEil?=
 =?us-ascii?Q?dJL6XCROCNc0x+kKopQMZsr9+d0UBnqwaOorARM2yN1t/q3MQ4+Go3Jr7Aoi?=
 =?us-ascii?Q?P/O8cbt7hlCZry8XYwLZLvVmqaRl2ixhrQkxpiY8a1iaL5YfZflN0AQzkVzF?=
 =?us-ascii?Q?bnbx7y5bJA+9K7BDs4uBRHsGuHWjjnFPn9LUqIi7hxg81OXp2Ir6RyOUSRs+?=
 =?us-ascii?Q?0gjEff7QBUGLOuNTsSjhyJnJ5MpGNiCRpCSAyTL+vAHxcWe392BDvUgfphDw?=
 =?us-ascii?Q?L3MH2gr6Gj5Fth1TRGlM+O10cFR3wPmdZP+rPbWsp1wTrrZbGmkIo0Ve3Lva?=
 =?us-ascii?Q?1MM0IW+bTE7YSB4HGAGRBSJu2YFEcU9F2q0YTSoXk9LmQkV9y37S65GsEn6u?=
 =?us-ascii?Q?7k4R2vLe+LnH9bOTTJ+4HTVpRCx3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AQD8lHf0TnnoxfzihS7WsHeL0vRGr/Rmgt16eLkCAQl8MLxOP5cJ/wDheUXj?=
 =?us-ascii?Q?L6elLlLVghlP3gFMqXfXBbUIRFKeYFt6pVT9sO+u1WIFTaI2yiX6qkRNozPd?=
 =?us-ascii?Q?sEG9ZLvLkXqySPDb+EIJx6Qq4yEMD10i6HFh0WQ9Kc5RMP+FLIMNG4lFad2y?=
 =?us-ascii?Q?Xtl7BAjw9snL3OFqG7SKtwK0dP0unP2uZff1RFyjNxUnfSEOD6Oqkl7T7IZH?=
 =?us-ascii?Q?PpNkGTEdqeBUTM/x1HJlETj4u7FeZ1o7axCUlQnr9G5k5VxLClvjKN+2hz30?=
 =?us-ascii?Q?eRVd5HTIJiA3YdVpATP+bvOsx9jQ0DrcQX74iDP6lKC53QeH/IT8PrXciuiv?=
 =?us-ascii?Q?BgYpoELIKAVfnEuy0LQRkacRGGNha74tRgr7KOs43bxhV4spU0FIN0L92nRW?=
 =?us-ascii?Q?m06AZV7GV+Xt7+Mzf3q31AKbAbxr1wO53ghehWEl40Oomk2rqWhjF56zgnr1?=
 =?us-ascii?Q?rvbKOTKO+SaKtK9/m0SbObUvN+mP7IgJ1zpk4HFO1hcP4T4o5IzYlgNDcVvR?=
 =?us-ascii?Q?esHOpe13/r3N3sgcQqUEOaxnMA74ii52KXYQWjitd3nXmU9m4K8OtC+mrtO6?=
 =?us-ascii?Q?wcP6cKoWmCeTnRqf2yh9zsqBjUWFOu0HiHJ7k2QJjIHyC5/h7t4GJgdI8UA2?=
 =?us-ascii?Q?5IOIIoIBVFvJpTe4YZT/gAs0EiU+kdTWth2eYY3bxzMlZsfZ0NJTuG2TTK/a?=
 =?us-ascii?Q?YmFSMT+Etfl8uEClX2IV/vGiq0uX0l0JcyThF4WojLWhHStOqLoC6jxOv14N?=
 =?us-ascii?Q?d44xUI/0nRYK3pzEHuJxhmf+FXEjxyCEJFcfBCExfdf3VAK/rYOjEMafQ1RC?=
 =?us-ascii?Q?TMB5OtXQlI/+DJstPezs76bbxIKAclQ4oaV3tnKiF/TJlvFG9Pfp74rf3RR0?=
 =?us-ascii?Q?XIoN5VKBwcQWlrei62/qGgj/032nBbTzfRXf0Mrf/uvotA7oPfgeijPcOhqP?=
 =?us-ascii?Q?4Y/4MpLRiYmRHhkJ4YnQH9kkZj0fadoa2fiVM36KqDl/Gs3M8zLNHbdgmooc?=
 =?us-ascii?Q?KoCOu4MLndQ5mvmlT7NjPRvEaPGRCmkDt9ZA/P0BZT4ypdw3AI/Gf+3kOO+e?=
 =?us-ascii?Q?B9CPnmciTMEsXtY7spqkW8Vbhhhw2fotSdf2oAXQQvQk8shZ9+fgrFezTwWx?=
 =?us-ascii?Q?1DPB0kRWY2uj2PyjyhVYrIqJLYhIT1MntVmLdNryXdr4tVISKAOd21uzZ6TO?=
 =?us-ascii?Q?WttHzvh5IDAp74XR3j/4ZpKR6bUzvXEtav0laPYGa+mtySb9jCDPqEMjoGHv?=
 =?us-ascii?Q?FgY+UBQZAog/geH4wxKjJIv//MrdB/zL295+dhT4xuXAD8VahJ68prBPBjSk?=
 =?us-ascii?Q?8J1R6wLdzyfltqCLTIMYVne1stL+7d+HZJnpuEldvve85Xqn2Y9d/9goTYl+?=
 =?us-ascii?Q?VHLob6r68zfBwoafN+DdRxRe7VIBa4YMPXEd+iE4u7qlCC/+5wzIA+ltj2E6?=
 =?us-ascii?Q?1yRFURYjcxgQcHY0aw+gyjsswvScXhnciqZ9Me6SMdLO33FGmkeypPrSNXFh?=
 =?us-ascii?Q?7m5dMugwp5sqMYHqyZ2rPTwh8PPk6EKKN+sSIxeX/HKtVQmheD8EkfYLfIjJ?=
 =?us-ascii?Q?Fwu7y2/Q+2//jyiZtzo=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bbbb457-cdd8-4c81-b56f-08dd45ff9585
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 16:10:18.5860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21qidtMarIgWnp8EBfNVOnl1yMidhRr3LOm7t0HU5YM6P0QHT8RYxsqhkuJHf9jK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5803
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_161027_114502_AA523F7D 
X-CRM114-Status: GOOD (  21.70  )
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

On Wed, Feb 05, 2025 at 03:47:03PM +0000, Robin Murphy wrote:
> On 2025-02-04 6:34 pm, Jason Gunthorpe wrote:
> > Convert most of the places calling get_order() as an argument to the
> > iommu-pages allocator into order_base_2() or the _sz flavour
> > instead. These places already have an exact size, there is no particular
> > reason to use order here.
> > 
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > ---
> [...]
> > @@ -826,7 +825,7 @@ void *__init iommu_alloc_4k_pages(struct amd_iommu *iommu, gfp_t gfp,
> >   				  size_t size)
> >   {
> >   	int order = get_order(size);
> > -	void *buf = iommu_alloc_pages(gfp, order);
> > +	void *buf = iommu_alloc_pages_lg2(gfp, order + PAGE_SHIFT);
> 
> This is a size, really - it's right there above.

I didn't want to make major surgery to this thing, but yes it
could be:

void *__init iommu_alloc_4k_pages(struct amd_iommu *iommu, gfp_t gfp,
				  size_t size)
{
	void *buf;

	size = PAGE_ALIGN(size);
	buf = iommu_alloc_pages_sz(gfp, size);
	if (buf &&
	    check_feature(FEATURE_SNP) &&
	    set_memory_4k((unsigned long)buf, size / PAGE_SIZE )) {
		iommu_free_page(buf);
		buf = NULL;
	}

	return buf;
}

> (although alloc_cwwb_sem() passing 1 looks highly suspicious - judging by
> other cmd_sem references that probably should be PAGE_SIZE...)

Indeed, amd folks?

> >   	if (buf &&
> >   	    check_feature(FEATURE_SNP) &&
> [...]
> > @@ -1702,8 +1701,10 @@ int dmar_enable_qi(struct intel_iommu *iommu)
> >   	 * Need two pages to accommodate 256 descriptors of 256 bits each
> >   	 * if the remapping hardware supports scalable mode translation.
> >   	 */
> > -	order = ecap_smts(iommu->ecap) ? 1 : 0;
> > -	desc = iommu_alloc_pages_node(iommu->node, GFP_ATOMIC, order);
> > +	desc = iommu_alloc_pages_node_lg2(iommu->node, GFP_ATOMIC,
> > +					  ecap_smts(iommu->ecap) ?
> > +						  order_base_2(SZ_8K) :
> > +						  order_base_2(SZ_4K));
> 
> These are also clearly sizes.

I didn't make a size wrapper version of the _node_ variation because
there are only three callers.

> I don't see any need to have the log2 stuff at all, I think we just
> switch iommu_alloc_pages{_node}() to take a size and keep things
> simple.

Ok it is easy to remove lg2 calls from the drivers, but I would keep
the internal function like this because most of the size callers have
constants and the order_base_2() will become a constexpr when
inlined. Only a few places are not like that.

Thanks,
Jason

