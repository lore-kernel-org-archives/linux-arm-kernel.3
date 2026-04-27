Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C3AFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 16:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kRamVWr0nMW8QJkyQzjgwwW9L0y2UjyJklSAi1c+eHM=; b=OrTP7jONyJL2kh4ZKq3rGYGu6c
	r8eewSqzr+2SvVVeRgtpZ2WNYYB6JSHRFYbsh+nAY0WNpfmL8DUn3KaVpOOHwbiCC3xGstboJ9wv2
	w5MdocaMiMSTHDvVGIuln2D79arw3FgzUW/ljWEhp6hK4z9PSLU6ur41u+wkfue9MENUAxFFl+nHH
	++7P/9J3HuCOBjSXepUjwO9u1ScDGIU4bEtKxzcBQdC9rv3VZ5hp8k+SeupuVgDO/DN2tNpqBqycT
	Z3XwAyBdIp1MslLLreCLmReH2b6Ho475F1txGZmPnIs5UMQ39H7ofgpaEJSY5+bj/0thReYi6FAku
	Js8mMcmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOVQ-0000000HHBR-0Lxm;
	Mon, 27 Apr 2026 16:08:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOVO-0000000HHAJ-3L4a
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Apr 2026 16:08:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kRamVWr0nMW8QJkyQzjgwwW9L0y2UjyJklSAi1c+eHM=; b=CI5X+bRBihMuqlZvnKqEQJnFm5
	I48GVHjbpNQUjZq5Dt3zLhBkeAhV0may4PBzvkTgToxHXe7IHDPBOJu9ayuxCObLdBX2B2dmOaiPx
	Qm8Uq3XcpNYEXbVaDmLpK9xCSPknMYyJ944NvPdUv3sb/povPWuYCxPlWYs/dY9NcVzYrgGfl8VL2
	E91IJpsu39DjeE69a7aYsFyEf6y/ppEbCpWuVsIFM89yu5sLDTQ/uwJ+LbRnwPBsIeycHFHqkmAzo
	Th4wMB95DRDUaRv0l/peEZNXdB+E9hzBp4LSFq4Z7qMeo7ChdXM/7QkK57nU8cgwZ0OJHFHXuuv+l
	6LbyGTWQ==;
Received: from mail-swedencentralazon11013000.outbound.protection.outlook.com ([52.101.83.0] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOVL-000000014jk-17vZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 16:08:17 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=PlMLJm8KX6eF1VQ8ngkZw+8CssxWS0C1OQykphncQoLcxPFQZcjUpix7nmmg9dE0L/AHJkyf20JjAyOjiAVwJAXhJfe8Th/bKmVjow+TWIon714JfghIDZctkBxghR5JJBrsX3uEtNgiNswxl+wABfMNQEilgIeLUzp9dz27X/IqcavyYu74lj+whcATs50Kz7L/oMnS+jvyxPzrruxjt+OtaCKwZeV0TkykDl7zDlDqI1GwJ+MX06ZWPCs3Eror7ogxyeU8GZKVnMCz4jYd51LZLc6QEjXetxoeaZ/8fEKTeaQiqIV5Pn/3TKi5jC3f17+DB7V2YAXfAyVfmY4bMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRamVWr0nMW8QJkyQzjgwwW9L0y2UjyJklSAi1c+eHM=;
 b=w0OYu/eur9ApWu2PemqIzuVUck1mxSFah8HTKealUDCBnMoE6/fmZ6L+us4EDbcHyrmuY8XopyqBnF5nz8yCAPcV2ma2lDh4lpe2y+3W/dMg7VVeqe31OH2/pSPaU0HEqCEs7s+u4Pwzg9VcT3KSURNeOR/OCluuXPI/I9OfCBskoggjgJIF2o4k9AnG/hFoBJFtqHp5OLYwqoLVNsovo8NGiqKfX79W/0u4Hq9bkeP0ZzhIknz7MMR29/kZwZkDHmrVCN6kIJN4Oentctz4qJLEYKqsnmN8l5S9v+DpS2aBwJK+/PrDNWsNSavmpeFNV4EzHwBsjJdKGHRuablo0g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRamVWr0nMW8QJkyQzjgwwW9L0y2UjyJklSAi1c+eHM=;
 b=cNy3/bm47jvbCo9CfpCpI/MH6Bf7xekdFUaEPAsisJg7M6D5AADiaNAA4AYwSISmFe6YhtOoO+h6pkkA3P7IPZihiZojk4AuqEAiFjOcLHdCLhu/q5kWcKRhNDcvnC7Al94foD/zHzbhhemvEOOypU91O4JufLIn/GJ1AZYg+lg=
Received: from DUZPR01CA0336.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::21) by AS8PR08MB9017.eurprd08.prod.outlook.com
 (2603:10a6:20b:5b1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 16:08:06 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:4b8:cafe::ab) by DUZPR01CA0336.outlook.office365.com
 (2603:10a6:10:4b8::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 16:08:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Mon, 27 Apr 2026 16:08:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aiLE/1zr+MzDWtMBlpEzdr1TInGmleVXj+w+LdynyR/+xgmRMcc1lRTf+3aTLHmBy3kgbYZ5fkPRHNH4tLx7vJhr8byLhhnRZJaaYLquoU2fnnE6To2P+wZJRQ25qhas/wcdCSNzyhXYY2J/FC9AJXUTrLwcqEFkcuub++IKx3/pv89mLNrD/4wY9Quz7+irPD7aXMUPM5xlOktf/OwUqD5/UvHhhMjQYbCE8lQBsHdUYITiIaVOQcaimDG59qhkR1S2a/dTNvZfNgbmrn3fsdSRVjIeKic1bqjRuO4cME3fyS/Ddd888ja2zKtGFSez1w08xD7t31DWDIrdAtn8lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRamVWr0nMW8QJkyQzjgwwW9L0y2UjyJklSAi1c+eHM=;
 b=dv8KWNuRPRHV9f8OSQ2sp0i+4jxngjCSGVG7entKHohbIms5K9v2VOw3f9u0BVY1kwSV6L0BAvMmvQD6yVOsZMzX847FYYzoMvzp3/yVLqoru3hxvxYPruHOhp9jjnsRenviTlas9fyxDbujizOVuxQQ1I8Sa4E6htWYxz/jR188RfNITurkiyqmXpD7n6G1/X3g7Pu1padPwxS4E+yDmGiJHNaLWyW3bzogRqNDTCaV08LvvTyf4PfF/I+O8Ob86BgnZewB6bGtjyEcWQP1PvI2Yz5NcyNgR01+2mevMTREWwPH4uj+VETL/+qzoHiXeFLmkJn0QBOrLM6I6I+7LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRamVWr0nMW8QJkyQzjgwwW9L0y2UjyJklSAi1c+eHM=;
 b=cNy3/bm47jvbCo9CfpCpI/MH6Bf7xekdFUaEPAsisJg7M6D5AADiaNAA4AYwSISmFe6YhtOoO+h6pkkA3P7IPZihiZojk4AuqEAiFjOcLHdCLhu/q5kWcKRhNDcvnC7Al94foD/zHzbhhemvEOOypU91O4JufLIn/GJ1AZYg+lg=
Received: from VI1PR08MB3408.eurprd08.prod.outlook.com (2603:10a6:803:7c::10)
 by VE1PR08MB5792.eurprd08.prod.outlook.com (2603:10a6:800:1a6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Mon, 27 Apr
 2026 16:07:03 +0000
Received: from VI1PR08MB3408.eurprd08.prod.outlook.com
 ([fe80::6daa:d2f4:acf1:84ba]) by VI1PR08MB3408.eurprd08.prod.outlook.com
 ([fe80::6daa:d2f4:acf1:84ba%7]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 16:07:03 +0000
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
Subject: [PATCH 03/43] KVM: arm64: gic-v5: Add resident/non-resident hyp calls
Thread-Topic: [PATCH 03/43] KVM: arm64: gic-v5: Add resident/non-resident hyp
 calls
Thread-Index: AQHc1l/jCx2DBVuBLUy+7GS3HEx/cw==
Date: Mon, 27 Apr 2026 16:07:03 +0000
Message-ID: <20260427160547.3129448-4-sascha.bischoff@arm.com>
References: <20260427160547.3129448-1-sascha.bischoff@arm.com>
In-Reply-To: <20260427160547.3129448-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: VI1PR08MB3408:EE_|VE1PR08MB5792:EE_|DB1PEPF000509FA:EE_|AS8PR08MB9017:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f962fa1-e37b-47ea-fcff-08dea4772b1c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|18002099003|22082099003|18096099003;
X-Microsoft-Antispam-Message-Info-Original: fC4TOizrLqNeVY6b3t9U3KiQ+7O3w4NchmNOs6lyueYNzUln38W4CC6VYvSelB/2F+czbJ6Eg921WIS4Yy/AR1SqnvLlZibdQ2IJZyHl6x9chLoBUNuWSYfblfnSP2rsF3y5IouuJco4+xc5F+CMmZcrPUA8OgTQ0Pz2pvzjsVtiNdG2nQBigEjpHwQktJyZYntrSRXBV4H8W1QhSJjzscIKai9BISHRV4u+KWsasbjXPvBMUbRwghGLUf8Nis/c/ztLBLZLOdbk3dAkL0EWRGsU5E80hNfBqCFcax3qR5LEL6KVhsJwnzDCmotq/jT23JvZc4s0yVy7Aejgp6HDSAZa6QVqfPBHlatlOkDftQEmT0JGOjbEjLfHKcHzCnfaF2fsNeNlnj/NENUM2rcbNXTdOjRX8RsVuyxG1ymYfeO6+1GjgQP9cAMaRzKYoR2paNfMtCcPMEZmTGIlE88frqbikQHoQythkm19cNOmYWzeVcDArV1H3TsGdmGd0xp8Bfg4TUO/2W4jr3piP9ekWJri6tLsMfViAMd9EU6ODhK06XBtOoJBJ1Mz99TaqOMY24kNZnmQlzRRELsImxCtEk8Cw/i0r455zu6bh4nOUe8EPUxRElK11fP9LzCHYKSnioaOTWKKg222ZcADwzJSmSrqKJtbPjsM5asWP3Ki9uJZDUHTrImucR+DUdy7nxEmU9JkO9DhcR6At7n79BHQh8v9+0O8sfbvfuy/0kPCXjkc/7CXXhao6UhBeZjQmUiTT+vxxZiYBh04EfHhg9Mu+6+OuPS/AHmroihpsToibyM=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3408.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003)(18096099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: L9UmOu8wARAPzwEnc7F0gK2GjdepFrr9m/LDZShi591AMAgPMWUUCMWmvFXihrSaWfAjUWXP+e8T15ze5f1PpwJWrm34STcQKGRUHcVxRv+2ws0tzvy4EpRZwiqRY2bHnwDEMGD5/yYhOSBZW8ut8McFkUfpHvQg8GoWa7KmFpxiQgc/rY4XKiv0HwaoqNNuTZhumPE1ox8+CoVyQ5AWbPcM4MPo7QmFuwVkoRYBk/5D5qef7YU0OKeX7zFr6KpnigOfNYsUxMrtXgn6/bteJhDqEvY97Jlkx0a9oBFdUw0sIfZtN6r7jlbwj/YrG/GjbnkP53DEOWC+T+A0s+8+Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5792
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e3a17124-ffad-4738-865a-08dea47705ae
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|1800799024|35042699022|82310400026|376014|36860700016|56012099003|18096099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: jUbnVfN+/TzV0j5gEFXfTZBJoTCdgC1FS5Jf1LkLmzFG4nnWDp3dueEJIBcsv4JJEIHPmQw4fsu5wb4tznGpRNMWyBl+hlbgD8Uj0eamijBVqHepCY06EkKnnhpdrNHzlHHTuuKprYE3VvARj6A9x5Al1esY2Je5lmn/lO42QFBtvfekVmUfCeGWEm6MXA3qq3uP0/oHXwr3Jh8VbfETnzyfyJNf1FyxT4kCvjzn2n1DK5aIm7KJpsqqUVYtVPGjbyeSBzd9k92DTFyafy7NOu8kSFfsGvgcZLxSSWjbtE4gka57L+CLHqKvnmHiwum1rQfe8G7KBciByoNOAtimvgPOvIiOXY+5lNgHomIhiDzMLpeO6UGDt7hHZLNDlliGAwvr5iNjO5/PR1iGmUG0JWHWJ7gOCmvRkeZ9B4k/+35Tltelxa0Zgxn9AcQS6FRoxUW0Pfs3lURqBwwRW2nunWaZH1w8eG+57wzJiTtkHPLUENNHC+h3eNX0/BfTkbdO7JfUz8WkJVzUPtrEgDsrPNS7YVFie+bEnlhyj8dofhDdM4mRmEmyC9OTd1Vl2Q0Oh0T4AZwZgsbZsGBQb9p1dQeFzCT45NEci8AtwdmO2zveV0gVCl2XqA086nxwVehVWGGo5z2y4mYoYQrlRVUSVCyAj3pi5/afAFr3QyA6/YWi+W57y/UDUGmTTXfeBc57dwfEWmSX5UW+9U/UcY5cBODCtPgyvptcP74U5ZeXpPms0ib1Zayy2xPijfoZJNz3CA/ynTflx+yPy5TczohpSQ==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(35042699022)(82310400026)(376014)(36860700016)(56012099003)(18096099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FRHFqexzMfeidPtj3wZBggPHdhQma+9zQOSmgeuOG9r4SLJ9rJs2yvCYQc58kx8LmRjMUvtIOyM6MAXw6I11RXI8TtJEfXMYVvcfMQhTDGmt86B84aoyWiyhQCmEUagUbWBc9pC/qK2IcrAOuJ/XpQc//KTcVGvYkM32laosEtcEpmxK1OgmgkspcWC4MxtnUm53nTceyZyX/ti7kJexjG2AmJ8jtdnnC7/idtSQw4vqtuMAlrwbQK2Y0f/NidHJEJtgU5sjCBLhmoqscPP0nmUvJqA8z4/SkbTs/ZFiuU4+zh76K0MNT4aEPC0Frpvr1YnR4BZCFvGQ3/fMn9/odvqRJ26UPfmNRjfz37/A7XIlcpRnvx2jjgrhXBuXlVq9a5gcfnsDZCbA2JWLKhcz/Hxq0MXKcpk9zKCGlzWJkNW9nwP3kRuU7Xv7/4dG1jSg
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 16:08:06.3356
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f962fa1-e37b-47ea-fcff-08dea4772b1c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_170815_444567_18012681 
X-CRM114-Status: GOOD (  14.07  )
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

So far the KVM GICv5 support has been limited to PPIs. These only go
as far out as the CPU interface, and have no interaction with the
host's IRS. Therefore, PPIs can be directly used for guests without
host IRS involvement. However, in order to support both SPIs and LPIs
IRS involvement is required.

GICv5 introduces the concept of VPE residency - a VPE can be either
resident or non-resident. When the VPE is resident, the IRS is allowed
to select interrupts that target that VPE (or the VM) as the HPPI
(Highest Priority Pending Interrupt). As the IRS handles both SPIs and
LPIs, these will only be picked as the IRS's HPPI when a VPE is
resident.

A GICv5 VPE is made resident by writing to the ICH_CONTEXTR_EL2 with a
valid VM and VPE ID, and marking it valid in the process. This informs
the IRS that a specific VPE is running, and that it can begin HPPI
selection for that VPE. Making a VPE non-resident (by making the
ICH_CONTEXTR_EL2 invalid) informs the IRS that the VPE is no longer
running, and it stops HPPI selection for it.

This change introduces two new hyp calls - one to make a VPE resident
and its counterpart to make a VPE non-resident. As part of making a
VPE resident, the ICH_CONTEXTR_EL2.F bit is checked in order to catch
faults, at which point the kernel will WARN. If everything is
configured correctly, this should not happen.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 arch/arm64/include/asm/kvm_asm.h   |  2 ++
 arch/arm64/include/asm/kvm_hyp.h   |  2 ++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 15 +++++++++++++++
 arch/arm64/kvm/hyp/vgic-v5-sr.c    | 25 +++++++++++++++++++++++++
 include/kvm/arm_vgic.h             |  3 +++
 5 files changed, 47 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_=
asm.h
index fa033be6141ad..8c69f1f4de534 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -79,6 +79,8 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___kvm_timer_set_cntvoff,
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_save_aprs,
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_restore_vmcr_aprs,
+	__KVM_HOST_SMCCC_FUNC___vgic_v5_make_resident,
+	__KVM_HOST_SMCCC_FUNC___vgic_v5_make_non_resident,
 	__KVM_HOST_SMCCC_FUNC___vgic_v5_save_apr,
 	__KVM_HOST_SMCCC_FUNC___vgic_v5_restore_vmcr_apr,
=20
diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_=
hyp.h
index 8d06b62e7188c..5f9184276b04e 100644
--- a/arch/arm64/include/asm/kvm_hyp.h
+++ b/arch/arm64/include/asm/kvm_hyp.h
@@ -88,6 +88,8 @@ void __vgic_v3_restore_vmcr_aprs(struct vgic_v3_cpu_if *c=
pu_if);
 int __vgic_v3_perform_cpuif_access(struct kvm_vcpu *vcpu);
=20
 /* GICv5 */
+void __vgic_v5_make_resident(struct vgic_v5_cpu_if *cpu_if);
+void __vgic_v5_make_non_resident(struct vgic_v5_cpu_if *cpu_if);
 void __vgic_v5_save_apr(struct vgic_v5_cpu_if *cpu_if);
 void __vgic_v5_restore_vmcr_apr(struct vgic_v5_cpu_if *cpu_if);
 /* No hypercalls for the following */
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/h=
yp-main.c
index 9e44c05cf780e..804a9ffdc8594 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -672,6 +672,19 @@ static void handle___tracing_write_event(struct kvm_cp=
u_context *host_ctxt)
 	trace_selftest(id);
 }
=20
+static void handle___vgic_v5_make_resident(struct kvm_cpu_context *host_ct=
xt)
+{
+	DECLARE_REG(struct vgic_v5_cpu_if *, cpu_if, host_ctxt, 1);
+
+	__vgic_v5_make_resident(kern_hyp_va(cpu_if));
+}
+static void handle___vgic_v5_make_non_resident(struct kvm_cpu_context *hos=
t_ctxt)
+{
+	DECLARE_REG(struct vgic_v5_cpu_if *, cpu_if, host_ctxt, 1);
+
+	__vgic_v5_make_non_resident(kern_hyp_va(cpu_if));
+}
+
 static void handle___vgic_v5_save_apr(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct vgic_v5_cpu_if *, cpu_if, host_ctxt, 1);
@@ -711,6 +724,8 @@ static const hcall_t host_hcall[] =3D {
 	HANDLE_FUNC(__kvm_timer_set_cntvoff),
 	HANDLE_FUNC(__vgic_v3_save_aprs),
 	HANDLE_FUNC(__vgic_v3_restore_vmcr_aprs),
+	HANDLE_FUNC(__vgic_v5_make_resident),
+	HANDLE_FUNC(__vgic_v5_make_non_resident),
 	HANDLE_FUNC(__vgic_v5_save_apr),
 	HANDLE_FUNC(__vgic_v5_restore_vmcr_apr),
=20
diff --git a/arch/arm64/kvm/hyp/vgic-v5-sr.c b/arch/arm64/kvm/hyp/vgic-v5-s=
r.c
index 6d69dfe89a96c..04c5846b9abac 100644
--- a/arch/arm64/kvm/hyp/vgic-v5-sr.c
+++ b/arch/arm64/kvm/hyp/vgic-v5-sr.c
@@ -7,6 +7,31 @@
=20
 #include <asm/kvm_hyp.h>
=20
+void __vgic_v5_make_resident(struct vgic_v5_cpu_if *cpu_if)
+{
+	write_sysreg_s(cpu_if->vgic_contextr, SYS_ICH_CONTEXTR_EL2);
+	isb();
+
+	/* Catch any faults */
+	cpu_if->vgic_contextr =3D read_sysreg_s(SYS_ICH_CONTEXTR_EL2);
+	if (WARN_ON(FIELD_GET(ICH_CONTEXTR_EL2_F, cpu_if->vgic_contextr)))
+		return;
+
+	cpu_if->gicv5_vpe.resident =3D true;
+}
+
+void __vgic_v5_make_non_resident(struct vgic_v5_cpu_if *cpu_if)
+{
+	/*
+	 * Make as non-resident before actually making non-resident. Avoids race
+	 * with doorbell arriving.
+	 */
+	cpu_if->gicv5_vpe.resident =3D false;
+
+	write_sysreg_s(cpu_if->vgic_contextr, SYS_ICH_CONTEXTR_EL2);
+	isb();
+}
+
 void __vgic_v5_save_apr(struct vgic_v5_cpu_if *cpu_if)
 {
 	cpu_if->vgic_apr =3D read_sysreg_s(SYS_ICH_APR_EL2);
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index fe49fb56dc3c9..d14cf4771d606 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -495,6 +495,9 @@ struct vgic_v5_cpu_if {
 	 */
 	u64	vgic_icsr;
=20
+	/* The contextr used to make VPEs resident and non-resident */
+	u64	vgic_contextr;
+
 	struct gicv5_vpe gicv5_vpe;
 };
=20
--=20
2.34.1

