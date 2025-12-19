Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCA9D78770
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 15:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJ2gbbrkkwyPv3FO6YmgW8iBGBioIUO0x4642mRaXFU=; b=dLivLANFcQQK5KG6K/Sxm3WrPR
	tTjDfrtIsUAeuSGvrwN2iP4pcPHPWLvN3mxneuE3AjiNPgG1tsCFEQqDAeN7p86JxOz4h/35oFBT3
	LxtbxSo9vJlXpcLon7V1TXvOpPGv4b/q83EDmEf2oGfYvtoiQVvFJJjWv0xnF4qq3vWhswYFI5H65
	veyQt09VREb2jKHE7YdZWBqlDxHs9NcsmBc9x+WobIIzYOQOqUqwSabHPFEaKB6r1go1eeWt+5Hct
	pTIQ8annvRE06qk1H4LSQU8FRBmmIDUBUg8Q3AouXSYXLg8Hd0YEH0vvqSk0+cZp8FLUg8LqCoUG8
	gPORM7Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcnt-0000000AXvJ-3Pt3;
	Fri, 19 Dec 2025 15:54:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcni-0000000AXip-41L3
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 19 Dec 2025 15:53:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XJ2gbbrkkwyPv3FO6YmgW8iBGBioIUO0x4642mRaXFU=; b=Jdk6yC7y1rjenkBoBW4PuWQrCm
	1EHCXP1gONK4hyimWlNp9AHtd+4JsPYUAk9qbRqUnbWyDpR40b2Awrobg0Uu6riH+ETmTf6Pv4Ii8
	MF48RvBqqwk2O629ly3CXvezwfqooIff6AdzBZNOHYHos4/fHH0SjdE/N3RsP5q55G+btU5o7J62p
	V2B7IWN85GZgqganJ6RVIdHTQ8fh5HeGA85X6AZ78DNoQyp2lJAfx2k219BfDIADqKlaiJaGdgSlv
	u8Fl2O0vjovgWl0G4fUH/elM5T7241XtvFWcRfMLgEw1HB+4Ds0U1H3EMHSMydHilTA525c48qwBZ
	5JA6mgyw==;
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbwD-0000000B9Xm-1aqy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 14:58:39 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DHJs1Er5u98tqZcyLyhzPiWcbV8Ihh8yrYX5Ug5n8LAzwjctXRyIoIGppSOOmT8ojuaj9FOYrhwIJhhv9jOw7FkSSBeMfLeuPsk72q3iV8qr6b98GJnIJKMOWvFdplyjJGQaRKxOja63voC96Lh5koIhjW/0Rag173URyCDe9CWdSu89X/rLKirc+CqfyRopLrt8ZPbwOvD+JHembXE3NM32CI5zT3FvwfTC33vFwt8IOQ9JtQukL3GpgB7XJcbjGfQGVz5LE+WGCqf3ie5Y9XXJixcDeQx8jnipv2S1Eq7Hf1n3SU6SoA3dIz+uQouFCqpsFSWy4hIaYM2CM9A/+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJ2gbbrkkwyPv3FO6YmgW8iBGBioIUO0x4642mRaXFU=;
 b=PWRszKsdP5oSyqDPyzvpwAT+xsIlkj3WLuJQL5L9p7x768uFlWihhAPnjvWugANbF+tJMcUEzignteTqi4GiG5+v5GTaruthOUbhZfrfdVHInyfa0BNwmUKQ7cfRj8I+3bOe9kgPqJi+fl0sh71+KI+vDbjIxnekdbA7cv3/mj4ORNZHU7/CXbKREh11SuhYcdkEyZAhAFklQBRV+BdMK339+MMy25h8EGwDxu0vgb7SOrSnt8UE/7bJvUHSJRwt6Agw1jfb8ocL3tqpuNgwY1pt8qOGC1jed5Z+2WS2m+oxON7I5pDtLJsTVfmxF0sHe45rUt+xBwJoX3EcDBIdRw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJ2gbbrkkwyPv3FO6YmgW8iBGBioIUO0x4642mRaXFU=;
 b=ElGuPvGKCcdze7XbqfdTcHBze1gumQcVDK7NmRqzPSBDlNMLGZ3A2+4ZNtW1xB3pOft8ro90yDkhns2dov2mqhsycgeWUge0szskrq20OFKsvfW9KLdVW3JIuKKHE56CZ15WG97HOhz7fSycW+v0Cm13lZzmOiWCVKvO458pRBw=
Received: from DB9PR06CA0013.eurprd06.prod.outlook.com (2603:10a6:10:1db::18)
 by AM0PR08MB11258.eurprd08.prod.outlook.com (2603:10a6:20b:701::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 15:53:45 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::59) by DB9PR06CA0013.outlook.office365.com
 (2603:10a6:10:1db::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 15:53:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Fri, 19 Dec 2025 15:53:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qEtZD69HfqPqjS7GnYtF6j4VLUFPAj5Z5JYPD5jEJqypW1a6u0U/Tpu8/io4dsXHinUg+bF0yyE7+26hqn3Q0tqjAPUN8/ZaPynx1+ZfYpL1D2CHZ+x17KxaFLboXcXsbEGyNW/XwJy1DOEKSi9c3phmXSAaGrQAeMMJPrF+x4kLuh53lvkcPwUrVdCQDf9WbxUGXWkV1aZ00gK5uWfubk2HZOGEeIR1Ro85zt/4J22aHYZ2VFDKF1ARFP0mhUY2gZnkpsLMROf/+E3fAlfVFRGL3WK/zHHSH9XOH+FV4IJWWND43hlvRLM+MsrgrWltLNJdwvqwiOwDTa1FNDJNvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJ2gbbrkkwyPv3FO6YmgW8iBGBioIUO0x4642mRaXFU=;
 b=mv3qT96KMMOE9ug3zjUdUZQaYIl24cIadgaM0tIbXWaaWilNKsdGZoBQS3/gqa+lqNl5/XBrMsOCGwP7xKnA6mfH7ZBxORUer3Sxf+C+/sy+dHv0pc01TGZ21df8MsU4EZtJD7CpFVdJiczwRdj1649yYOxSq+emHlbs82F+qwR9bRuYvx9eC7vo8dipsEnhmlQaQ8Y+vPirkwJzux6bkRLOUr5XCGt9uHno1LZlTjnbhqydfHSsLPgT//4cIIue2IkbLVka0OjDWGvyQziF4P5Ef2q5u4lcAfSn3+NowzNhxiap82voMJFYuv6jdGMkbXVqL15zS06khul75FMqhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJ2gbbrkkwyPv3FO6YmgW8iBGBioIUO0x4642mRaXFU=;
 b=ElGuPvGKCcdze7XbqfdTcHBze1gumQcVDK7NmRqzPSBDlNMLGZ3A2+4ZNtW1xB3pOft8ro90yDkhns2dov2mqhsycgeWUge0szskrq20OFKsvfW9KLdVW3JIuKKHE56CZ15WG97HOhz7fSycW+v0Cm13lZzmOiWCVKvO458pRBw=
Received: from VI1PR08MB3871.eurprd08.prod.outlook.com (2603:10a6:803:b7::17)
 by AM8PR08MB6546.eurprd08.prod.outlook.com (2603:10a6:20b:355::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 15:52:41 +0000
Received: from VI1PR08MB3871.eurprd08.prod.outlook.com
 ([fe80::98c3:33df:8fd4:b704]) by VI1PR08MB3871.eurprd08.prod.outlook.com
 ([fe80::98c3:33df:8fd4:b704%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 15:52:41 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
CC: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, Joey Gouly
	<Joey.Gouly@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>
Subject: [PATCH v2 13/36] KVM: arm64: gic: Set vgic_model before initing
 private IRQs
Thread-Topic: [PATCH v2 13/36] KVM: arm64: gic: Set vgic_model before initing
 private IRQs
Thread-Index: AQHccP+Bre8XGF01UEabuPk2JDO6jg==
Date: Fri, 19 Dec 2025 15:52:40 +0000
Message-ID: <20251219155222.1383109-14-sascha.bischoff@arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
In-Reply-To: <20251219155222.1383109-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: VI1PR08MB3871:EE_|AM8PR08MB6546:EE_|DB5PEPF00014B8A:EE_|AM0PR08MB11258:EE_
X-MS-Office365-Filtering-Correlation-Id: fd3d36f7-2082-4261-ba16-08de3f16ca4a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: =?iso-8859-1?Q?Xc1hza+G6+GwzUZcXIdmwN/8X8JNzUwMC29htx56zUhWgT72RaqJWT6+Rq?=
 =?iso-8859-1?Q?kMKcxU2QEljtGvaXz6J7/GxbxiW6LX5LxAiIw+ujzCCqG9nn7FlMvoou9Q?=
 =?iso-8859-1?Q?AxZgp31IZluhwkAMEgngyh0pp0eOrcUwFlBgBPfkss1779ZRjBn7jHwhVQ?=
 =?iso-8859-1?Q?CsLgpwH6HbpOHcaAZmZEA1y/cslqoz03gFv77GOhnb09ntCXhS9btP6ir9?=
 =?iso-8859-1?Q?aVRtKgcpQ9tvUmCR4N7sQXw4Snx/DHN8uRkaZZfLW+NN6bY5edTqj0nMpp?=
 =?iso-8859-1?Q?KAzr3FMzsHiZI47gM+V6A2PTj8s6Zfzbl7vu25DP2/jCQgWc7PcCux8wyV?=
 =?iso-8859-1?Q?C01LYicwVz+sf3MecYhwVc3E4y1MkPNdaD4ekyF00QCGi3cAmf9XC5zTBg?=
 =?iso-8859-1?Q?rJDLopEflDkY1K8nBO7Be3CknbZ3kSnKjpZC8m5R6FsGr7wj+klddKodIy?=
 =?iso-8859-1?Q?Bsjh2wUvm64MYKJ3yJ9YvdyyCO0NlrAob6KFH40x8v76eo67+8s4fKCpBS?=
 =?iso-8859-1?Q?HifQs0erQB7bkF9fPbvtPHURPd4cRwEPj63t/1yAGU22+SM9zPVUh7dXhN?=
 =?iso-8859-1?Q?44FJlG4dciGY6/rRyidXZP8L8DoG6VpQxenZsaZ1tT8lbeUBeDACsqrmSB?=
 =?iso-8859-1?Q?pIY1dZKHBq874dMd0ciBtKdSSLDB9rMnsjpGyl0EATI/BmcXMNIJ7fkl+W?=
 =?iso-8859-1?Q?iJDERaytUXfZaeCEPkq38QhMoIn4Ukfro4A5idmhEU7Hc3cd9dFFbFanPZ?=
 =?iso-8859-1?Q?chADZBGm+Np/LKt+25amWgNOgNiSidQwSFcBUdFpYC2esAs128+BKqXN3n?=
 =?iso-8859-1?Q?u7kJMuZZjOlcbGwgHGS/Xz2xULSF2c7n96/BKVpE7bKoyr9Yo0yV1vPaQv?=
 =?iso-8859-1?Q?iw6HXiWQPh1DkLJ7/fJN0VoPW1Eh3VtS0zXpACCmNXV5ercPmMG9dtJLZ4?=
 =?iso-8859-1?Q?3JckguwLh/AyUSbg1ioPhOgWLOH2Y5eVm2gv6sPojBdqonTgKoV0IXImol?=
 =?iso-8859-1?Q?UXyW4QCuALLLENljCZ89h+TjWko3y049vF8S1smWduE4jtrr2BjafGodTV?=
 =?iso-8859-1?Q?Cjli/hbF2zl74HCkM6P9ctMePoNqPm4A4yO7UehjDhRI0WKBWp16JJCuYp?=
 =?iso-8859-1?Q?Mc7pDW45NoqnDiKotrr+BeiXf+w9cU4fECgi1/aKZlS56tL7fdoFoIw124?=
 =?iso-8859-1?Q?efzzoR+xRBfDyHOvQ09bjuhcn14A714Un/jATpFs7E6pVHrOMenaxwa/mb?=
 =?iso-8859-1?Q?6iJYFzNwTFASdiMPJ/v6XFc2gSNjMRWWbqxXylgeK889NHks2tlTFg9H+y?=
 =?iso-8859-1?Q?TQJlmBJEgdg7ytpdVUCM7tamFQlIPoFdaYPUSHQcCtbVZmirE4Eu+8KGwb?=
 =?iso-8859-1?Q?EYRZo5UW+GgauP/VnYvEURvJSI2RHNOwX1R2DFfJe2KtXjaMGXd5MjQjdW?=
 =?iso-8859-1?Q?yk10I4gq1G05e2M0m8bCAp239rsCID+PoXVNYFgIGyL7wjInixFvop1VsB?=
 =?iso-8859-1?Q?3bUqbF4AD939N7KYhgWK3h15K1BRoZsz0syllXfzCKjCnBuwVoD/cb6/Uf?=
 =?iso-8859-1?Q?UGUYCwiLC3IPQZWu7uJu+T6vw4fg?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3871.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6546
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1ed5928c-fbeb-49ed-7da2-08de3f16a461
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|36860700013|82310400026|376014|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?RObF2TJvb3gC/b5dl88k93CkV96lYfTLPMUbXHjFvNuuNXJYKUsvo9s7pZ?=
 =?iso-8859-1?Q?3IDKZYjCIsZps2o8bJksvSmPYwdg7VmSAwA4XLyKSCePXW4byt9pycoxEG?=
 =?iso-8859-1?Q?WexuBHBoIQDrCB1YVwuqMF7t5pNPqSVJKljh71V0XIEmeCIfOMJJdNtto6?=
 =?iso-8859-1?Q?GCAfaQcjh/5y/b/2h6n6ONyNi+48tE1Q7KuqIhc4CSWDjmTSiggtoYoKcK?=
 =?iso-8859-1?Q?sXhPATDqHuebfRJ3o39gvj0Pu6n733x/DJl5+nVHQLfJ6Qd6CgGRnh9Ps3?=
 =?iso-8859-1?Q?7KmzNSuleXoZYtPIQgpIlIRb69FMhZ7yf3CNNYemgq0xfuNTKTBZziu9uD?=
 =?iso-8859-1?Q?+3+an5kKsLLzJ79SRTIn1sYQeEp1+FTPhzr4qelq3c9ksaghGhz9ir243J?=
 =?iso-8859-1?Q?YBRs03y81PBpQhdnxBBKdO38tQWdBBxRav+fgUAAYY4SrUplZREwqgVlMC?=
 =?iso-8859-1?Q?wpld1HcNWKa1QXupc8AbpRYN4RM8jobH1J++rvrD+c6fVhhIVBLMysNtJW?=
 =?iso-8859-1?Q?S5skZhVRcam36IhOXQlUVKM+v7mFdxmlCMsrPSG8ZUdiCTU+gz5KMVPzKS?=
 =?iso-8859-1?Q?qubUY2kFDM1vSRZb0L1piaLkBmq0YbpU+ts750TDcNJKjPdRmq6ljiGHRu?=
 =?iso-8859-1?Q?0NI8GFZs3TEk5UYHlhEbu/f0gkmKBD6Qc9F7opmixd1NV+zTi3kDQfKqw3?=
 =?iso-8859-1?Q?5D/zRhnMeHC4+OODnfsbsJ1egKvz0v0+o6K1/v/+CgEBfEvWuaKXRybl07?=
 =?iso-8859-1?Q?HuREqTv6Iayt3CwvKFmCCzeb4F8/yba1jUXG2x8cKj78hyrsh2V7uqAb+K?=
 =?iso-8859-1?Q?Qup7J4FYRgHQaCmOfE62lyccG319T8dCp0LBMpg+eIaTmr6Dl43jCZMkTM?=
 =?iso-8859-1?Q?YrZVSQiI+V4/uDFQSVgPSY8jxgCEkCKhC/ccSAot+i1L/GthQTkVlHtCUW?=
 =?iso-8859-1?Q?pg7J5ti8y+33F6YUrWRcqwrHWParGrQLmtbrh5aHQ9QB6vz1Mxgn8zWkob?=
 =?iso-8859-1?Q?qeY480BvyOrL/Ze3xs1tnBdRTIXJAGvg87m4w4dc3xyqz8s0vponirbO/E?=
 =?iso-8859-1?Q?81Ma7AD1NhcDrHnKkr9DqRGYnzaKqUdrKaApg1yA+0opuVrQGyivt1SefS?=
 =?iso-8859-1?Q?HPrGKYbYmyjwwRTVQc5zHz/cnwPTeChvOLarDHtdAUh28ZwUeViJsApUtS?=
 =?iso-8859-1?Q?r+cUGaQ6qDLYdhE2A5WjPVovxo7rglLuXBMokqnY01B0eLidyYo6d+TV1V?=
 =?iso-8859-1?Q?DNJud6kKsKM3xv9R3q9Jp0pmjnu/X6NIS7yx7RZ3LCYTTingWjoLcTUh1o?=
 =?iso-8859-1?Q?ZxeAmk0QIXi8KY+7Wb4iOTEtRu8C0xhhBjrvcBy2s3Htb2jqFfpuJuGyFc?=
 =?iso-8859-1?Q?D89hKoaOBBxFnW2GhoQhwVKysJDCBkLMuSnjgXyVvnHr659BuyLSz1nyXA?=
 =?iso-8859-1?Q?A3ezckRBmoNyYkCYM9WrleUDRaSTpZ3UhBkmNVT6TH3e35IBLFdDxoGkv3?=
 =?iso-8859-1?Q?t8NvXHoP0ua6Sv9VPYb1WoSDddPLaYegQ2QoX85sV1oPqjmBNmCxEjhl5h?=
 =?iso-8859-1?Q?XrYF6AGtZ4mQtA1LSPIvOOf+/QgocAyjQZWOD3jpm01LEi4G3bY+UhT2s6?=
 =?iso-8859-1?Q?UbD6VSFVJoiLY=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(82310400026)(376014)(1800799024)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 15:53:44.7784
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd3d36f7-2082-4261-ba16-08de3f16ca4a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB11258
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_145837_531241_6573CCE1 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
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

Different GIC types require the private IRQs to be initialised
differently. GICv5 is the culprit as it supports both a different
number of private IRQs, and all of these are PPIs (there are no
SGIs). Moreover, as GICv5 uses the top bits of the interrupt ID to
encode the type, the intid also needs to computed differently.

Up until now, the GIC model has been set after initialising the
private IRQs for a VCPU. Move this earlier to ensure that the GIC
model is available when configuring the private IRQs.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 arch/arm64/kvm/vgic/vgic-init.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-ini=
t.c
index c602f24bab1bb..bcc2c79f7833c 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -140,6 +140,12 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
 		goto out_unlock;
 	}
=20
+	kvm->arch.vgic.in_kernel =3D true;
+	kvm->arch.vgic.vgic_model =3D type;
+	kvm->arch.vgic.implementation_rev =3D KVM_VGIC_IMP_REV_LATEST;
+
+	kvm->arch.vgic.vgic_dist_base =3D VGIC_ADDR_UNDEF;
+
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		ret =3D vgic_allocate_private_irqs_locked(vcpu, type);
 		if (ret)
@@ -156,12 +162,6 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
 		goto out_unlock;
 	}
=20
-	kvm->arch.vgic.in_kernel =3D true;
-	kvm->arch.vgic.vgic_model =3D type;
-	kvm->arch.vgic.implementation_rev =3D KVM_VGIC_IMP_REV_LATEST;
-
-	kvm->arch.vgic.vgic_dist_base =3D VGIC_ADDR_UNDEF;
-
 	aa64pfr0 =3D kvm_read_vm_id_reg(kvm, SYS_ID_AA64PFR0_EL1) & ~ID_AA64PFR0_=
EL1_GIC;
 	pfr1 =3D kvm_read_vm_id_reg(kvm, SYS_ID_PFR1_EL1) & ~ID_PFR1_EL1_GIC;
=20
--=20
2.34.1

