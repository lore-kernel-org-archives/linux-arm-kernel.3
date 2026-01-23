Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB96D72369
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 10:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbI2pYoXWbyIs+8vi4PX5+0ck2F6/PE3QP7yAWmyBvo=; b=cNv7FeWr+o6Yy+ls7s+TH/mtLi
	HMHt5ql14gQzO6ziDYCeo4utFzmgRbbF5pTbE50PW2AaO1Vg/dNjaGsZYXMR1q5oPjtzWuI9JotWv
	rDJlPkU1cj3rVyPLAAHKIpLgIp8cr2xJTYpqyDyU23bMHLLQ2hvk+wr7CvSVwoI1BUuvHTiKWhaEt
	8FG4McAACyfduqfzHp4T0C1oWYqKP/y17gcV1k7WyYwXTMHsBhQzuYt3a3Nv3ndfm8cAuy9gkkaXg
	qpn+sJoQ1kDSUDcNhhepgdRPE7t8Zj6LmYf/hPlnX1SKXZeqBbtV6vAUt+dfbxAm/hVVRT4ung3ZN
	Nzp3A88w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEBX-00000008h0b-0OAK;
	Fri, 23 Jan 2026 10:14:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEBT-00000008gyY-1Ua0
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 Jan 2026 10:14:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=pbI2pYoXWbyIs+8vi4PX5+0ck2F6/PE3QP7yAWmyBvo=; b=O7x5A4sp4EvCmCrH2cBCJ2SA/x
	pS6ovBkjIEVKldyemgCU6Z25bn3YXbY8h5vRCsePQDpXTI0x/Vo6+9Rs5rDutyyHUW7TWgnVL80sI
	dhvbDDdd2XI1HCVqd0uwYUiXHjcOKvow27lACBPIreAUx5/F1ZVerPgYyAlNV/l9SjnsRDw+tZD7C
	woeAPvxERawHargE+SvcosA04nD2+uZywU7SpUSwP2UeDLY49QtyqEUr7+PwBKwLo/I+tanW2ahX9
	TAJGisnxz7mBUNdzLOi5vDyiGK7FluFIs7VPT0lZHA5DrsW9BBx+K1KW2Z8TO17oUf98KpnLfAmws
	ollRM5zA==;
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEBP-000000028fh-3SpY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 10:14:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pWDWXN6ptNCHDkUHPRyp9RlAzey1VNfZdVZORQhppUp3kRmaGuzqkwx8Q4/c2yAJjokasHeat+49/R0rxDZpryRd51BteOaKipCG//mp4IMRSFEZJbDjb43nKMUHydaekbvIP5HuZNIX/QiEk9GYtom+oe7+MmtnDy5kDjUB7DGDveqTRdmeqbOVwDvmKPOlJBZxKQ7nkAajw09TZad2Muy4L0fl7ZWRD4GhMhqSWq/tEvKIGfujg0JieuvJ+e/hqlfpLrz8eh0xGuB3SkmMiPTAlrP1KKSXlGQkZhfh3D8kiHkoFkp3ntEGeTGsxUySkrmysUGzzU4e162axiyHSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbI2pYoXWbyIs+8vi4PX5+0ck2F6/PE3QP7yAWmyBvo=;
 b=WM8FP5VQdnPm6js4KgxmAWtK8P1ShVFl47rpuNfwb+LSoJqosNWT4O+3zuZYYzb8jjbKivmVnrw4Pk0X/vfX3Rs8ghttqSIYmkHSU6KH9MhDV310+x+tDwCDaUtshDUahXVd6XUQuz0JkBpeTAHFTo0FetnMRw3urNkjqA3+TikEO4kfTIcyYGNc8++MOg81gux68vR3oM31nrh/aeRIBA8YMYQl/Lbr5wxyH7mAsI98iKtQOPVdHMFB4a0yqgsE6h9/HFUdyh5U2j4/tVz8ec5q/hLJIJB+v6/bdMgW3sWeiUThr4Tj0sqfNDDn8bxwu9tbzV445487XBum0BGrvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=dh-electronics.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbI2pYoXWbyIs+8vi4PX5+0ck2F6/PE3QP7yAWmyBvo=;
 b=AAY3JtvuiJGXRrp9PPgosN5h2wtOpU65agvl3yStIwwZnb0NDU3YrVB6EwiT6t3swUlr6K71znrLbBpDVAGp7dEVYFThbu4vKrnOjl+xywMfryvpC4070/aatiHxw5tW3eoG/bBisgtgtSey+kT8lii2+Vu3Qu3GJ12b4ViYrnegYWzM11u1sBkFL+IQzsJvrCBMeq6FdaO3nAAPvoTA/QS/l5ZOA53pQx42ht3nYaz/Y+2dBqy7PJ9Lb59l9vRe5zguf7DvBstNviryYgNpOXAKQJ93Te119EBKqRFBZtreZD1n3hqGx+wq53qXMhVRSeCMgoLgc2J6/pkWeCtjfw==
Received: from DU2PR04CA0081.eurprd04.prod.outlook.com (2603:10a6:10:232::26)
 by AM0PR10MB3490.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:154::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:14:21 +0000
Received: from DB3PEPF0000885E.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::18) by DU2PR04CA0081.outlook.office365.com
 (2603:10a6:10:232::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.12 via Frontend Transport; Fri,
 23 Jan 2026 10:14:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB3PEPF0000885E.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 10:14:20 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:15:36 +0100
Received: from localhost (10.252.18.201) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:14:04 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 23 Jan 2026 11:14:03 +0100
Subject: [PATCH v5 1/6] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics f4 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260123-upstream_uboot_properties-v5-1-5167929d5af5@foss.st.com>
References: <20260123-upstream_uboot_properties-v5-0-5167929d5af5@foss.st.com>
In-Reply-To: <20260123-upstream_uboot_properties-v5-0-5167929d5af5@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrick Delaunay <patrick.delaunay@foss.st.com>, Christoph Niedermaier
	<cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@dh-electronics.com>, Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.252.18.201]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885E:EE_|AM0PR10MB3490:EE_
X-MS-Office365-Filtering-Correlation-Id: 703045d0-1ff1-4158-86db-08de5a682cac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cm5kS1U0U0JlUHh3UzFydk9JRDlsNHhEalpweWxXR0k3c0pFbzFUOUZ4TTF0?=
 =?utf-8?B?U2ZsYWF5Mkp0TWNZK1B5ajd1Zk42ZzJPVXpwK0xhZ3RvZkljRXpWUEJ5SGVt?=
 =?utf-8?B?ZVJ6V2pMU2ovcC9WKzB6VG02SUZaYW5LOEtkSms5aGROaS9XSUt0eGJ2Tkx0?=
 =?utf-8?B?ZXFjeXhBMmhkRmM3UlVlL1pnWkFzVmtVc2IyckpBQmpWU01IYjhxdEFrdWpE?=
 =?utf-8?B?THBvTlFnV1YwcUFsc2hGVlVCZEdyRTZWTTlGTkRQOXdUQlNpQWRKV3FtejUw?=
 =?utf-8?B?WE43ZjJ5NWhiSC81YXczL0hBcnY4d0lLSHVvRUJpK3Zxc242bHFmNVJSbktW?=
 =?utf-8?B?NVdwR1R3SXNWZjlhQk5CU3U0dEhTcmlUZlpYeDdURWtTMC92R0ZJY2krMUZW?=
 =?utf-8?B?TXlVK2Z5YUZWRzIyeWFCWGhkMGtLOER4cnFXc1RqcjRCRlIzbENYQ2JHOE1F?=
 =?utf-8?B?akZBbGpsUVJaOUNvakl6SHV5SXpENmlBZmJROVZsbHpXbGxkTVdhUENXYUp0?=
 =?utf-8?B?QkMxZGhWMndiblhMa0tuZmV6UEZmY0ZRL0c3V1ZJendZb0NENFplYzlaMUVy?=
 =?utf-8?B?TUp3bGt2eVBzTTA1RTB3dE5ON2h3eTVtbVRPOHd0WGxRSEhKVGdaL2tmZFBM?=
 =?utf-8?B?NG9GWVlDS2VqeGxBM2VhMGNOcFVZSzBwSUtMTmpuMzh5QjQ0MjRpT09wUjVK?=
 =?utf-8?B?Z1RxbHBpU2pKWG1oTVhIM0o5L3NpODcxK1dqNDhpdVIvRE02RUVEb3dWTngx?=
 =?utf-8?B?TGRUcHVoK2tydHEveDJmL21SS3pzUjVZa0ZPR1pMbHNaTWFISVc2SXk3OUxF?=
 =?utf-8?B?NXArVlptSGJ2SUZvU3NzLzYxQ2tFVHgyZW0xTGtpRFF5bEgrUDNqWUZXSkhC?=
 =?utf-8?B?QnlYVDVvRjh3b0NyTCtSUEdkbE5xOGRBQ2FjV1pFdWVFd0hXeG9mTmQ3VlN3?=
 =?utf-8?B?Zm8rUTFvNi9DYmR1VTREQlVzVzFUTldtQUM1UmZrZHBGcWl5Y2dpZFBEeVpn?=
 =?utf-8?B?eWcvdmp3VmRxMW01TWJWTTVORFBrNHZVZTV3NTlFZStBQnkzdDFJTHZRamZE?=
 =?utf-8?B?eXdBbG5VeUQrejdZQ21QckZNQ2lYQ2JQaXI5TjFoVmFxQStjL0M3dlJRSGVs?=
 =?utf-8?B?aXJjTDdoY09QV0p4Si9ZdFI1OGdIblhCOEllQlYvWlpuQVZaYWxRWktZOENJ?=
 =?utf-8?B?Rlp4a1NuMm5EN0FZRlMzMlNRRkZkN0I3OGovd2ZmQnduM2pJVlVzbGdWUVJU?=
 =?utf-8?B?N1hoVmFOa0pMRzZNVEdzUjFCTHRlUHRwM0c1aldhaHB5TlpuSDBSK0UzUGpR?=
 =?utf-8?B?eTRkWDh3K05vWG1QOXlLR241ZWc0VS9BWHl6UzRZUmpxTzI3ODJUYllvV3Bh?=
 =?utf-8?B?dm1wczZKckdrSDNNMFpyMnFUbVFKMGttbmRYSVBjcFhvREJiS3NoMWpzeFMr?=
 =?utf-8?B?SFQxbjFVTFZqK050bFVwZ0thZmRWV1MycEdYdVF4QkRRQzIya0Nrcjg3YTVu?=
 =?utf-8?B?U1czRmR3NU1wU3F3YXU1YnF2MGFzL0F5MmxSclNQRExCNHlZckpReGtyUWVM?=
 =?utf-8?B?NFJLWHRJRGhmdHJQYWQyUXBJUVdIZDdJdGd5a1V1MUZGQjF6Q0ZxTkExSnJq?=
 =?utf-8?B?MDRrOUlkRTd6OU1rcDd3eFpPOFVXSmJ6bld6VHBWY3g5M3AvSHZoczJpcVky?=
 =?utf-8?B?NUxQNVlxUmtTaE0yVVgwWEVjaER2VURJYXhxM1g3eTVGdjZBNFdJYnhvWE10?=
 =?utf-8?B?aXlEcEhEQi91Wk0rbDU3ZXJrSFZUM1hwRzJ5WGFsZ1FnTkNJY2M3ZG9pNDdK?=
 =?utf-8?B?MEdmU3JVSlp5QTNGY2pPcmlJMUEvVFhJMG42SUlLSWpkNGhrRXI2ZjhEdnpI?=
 =?utf-8?B?NUZyMXMzUG9IY3ovb1ozZjk2WHcrMnlqTFJma3lVajhhbWE2VjBDdG5xQ1Rr?=
 =?utf-8?B?K1V5RkJjVHFDd0x4VFhpYlBuV0dlMDFkWnhWMjd6bDdxclAwZHNjL0JvQlFi?=
 =?utf-8?B?OWx1eXYvUDRRQWI0Q0REOTdJdlVNQ080RlFGLzIzMEFva1lGN2ZuSFQ0MVll?=
 =?utf-8?B?UVhTVFJldmFVUUZ4VkN3ZytjTTZDRHNRdlJlUDU1M3EvK3hhb0Z0VnNGOE5h?=
 =?utf-8?B?MzFxRlVhUHJPNStDNjFWQVJBQ3pZS2ZpYWFBS3ZDeUJJZFMrdkV2U0hWek9z?=
 =?utf-8?B?TDFEeUdvWUJwYnN4bXBCLysyWHVibmlrbTJKVEs2SlJKU215aXNsUWduNlBW?=
 =?utf-8?B?Z2REdCtYVkV4L1p4ei9NelpjNlZnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: TSKLI1NRQ2Lsq1whfCxpZfjsPDw/0aT9Z5jQTqPd8J8DrC+Ptb8yGK/0LkRnTpwbhubcG37/od8a9586cqbAirWNrBnAWJgQUVVF918Y6M0NYUzPzApfJVQxo+C9Mdh4e+435QUMsdW/GGE2A8dT1lZE64PM8IJwrcX8TIKCwH0ZdUsAC6apmmf893CUQ0K42zTJ2PMgDmq+uERovQ7RODbfTiFjQOPCPptvXqQv3zfxjHGIKwFMM8NfeKvfnZHFKFyPprylCLR7XCVJb7/+w7Zlv4fvcU8fvIX+lBLZtlhQSAvJVYiVoGCrqb+KpoXpv33oHTEF9S9gH/8SBNVr2dvttKCZ96c5zdiiON61v2zzsqcF+kH5QvS06xWnA69uKwqBONhsF1i/aMb0x/kKUAld2FxdDmq72impE2d1zqbVBLdbsIhtJvbdF5vvpgg2BzoSOLDBitpBM3I1SPKZURi6id+1ZF6PBqhMbBD4Qkbl4PZ/RfiydA+ntHeSXaeWR/3agpxVvMmT5tgzSRiN7Br3pjPFmEg1kKAdDRRdQL8x55WhOPNC9/sKb/zdz8iSfjPec7bu0FixDafntwg90V20IqpHG/m2iAVDHfiPDeqUSpqsM55hND8PK5V5ehknEvkbSupSfbhJ+Yh8Flk/WBqdOIX1m8ebcTHcdqr2x2IG6RSWvGh4Yz03H/hDM2PKpCBFjdetMJsjHlozYe64IA==
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:14:20.4692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 703045d0-1ff1-4158-86db-08de5a682cac
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3490
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_101428_362657_3D0BC05A 
X-CRM114-Status: UNSURE (   9.42  )
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

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.

To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
present in all boot stages, so add missing bootph-all phase flag
to these nodes to support SD boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32429i-eval.dts  | 80 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32f429-disco.dts | 80 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32f469-disco.dts | 72 ++++++++++++++++++++++++++++
 3 files changed, 232 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32429i-eval.dts b/arch/arm/boot/dts/st/stm32429i-eval.dts
index afa417b34b25..05cdc3d9d015 100644
--- a/arch/arm/boot/dts/st/stm32429i-eval.dts
+++ b/arch/arm/boot/dts/st/stm32429i-eval.dts
@@ -175,6 +175,15 @@ adc3: adc@200 {
 
 &clk_hse {
 	clock-frequency = <25000000>;
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_i2s_ckin {
+	bootph-all;
 };
 
 &crc {
@@ -196,6 +205,50 @@ dcmi_0: endpoint {
 	};
 };
 
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
+};
+
 &i2c1 {
 	pinctrl-0 = <&i2c1_pins>;
 	pinctrl-names = "default";
@@ -265,6 +318,18 @@ phy1: ethernet-phy@1 {
 	};
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pwrcfg {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &rtc {
 	status = "okay";
 };
@@ -280,6 +345,10 @@ &sdio {
 	max-frequency = <12500000>;
 };
 
+&syscfg {
+	bootph-all;
+};
+
 &timers1 {
 	status = "okay";
 
@@ -312,6 +381,7 @@ &timers5 {
 	/* Override timer5 to act as clockevent */
 	compatible = "st,stm32-timer";
 	interrupts = <50>;
+	bootph-all;
 	status = "okay";
 	/delete-property/#address-cells;
 	/delete-property/#size-cells;
@@ -326,6 +396,16 @@ &usart1 {
 	status = "okay";
 };
 
+&usart1_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_hs {
 	dr_mode = "host";
 	phys = <&usbotg_hs_phy>;
diff --git a/arch/arm/boot/dts/st/stm32f429-disco.dts b/arch/arm/boot/dts/st/stm32f429-disco.dts
index a3cb4aabdd5a..75c1de0b0496 100644
--- a/arch/arm/boot/dts/st/stm32f429-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f429-disco.dts
@@ -102,12 +102,65 @@ vcc5v_otg: vcc5v-otg-regulator {
 
 &clk_hse {
 	clock-frequency = <8000000>;
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_i2s_ckin {
+	bootph-all;
 };
 
 &crc {
 	status = "okay";
 };
 
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
+};
+
 &i2c3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c3_pins>;
@@ -165,6 +218,18 @@ ltdc_out_rgb: endpoint {
 	};
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pwrcfg {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &rtc {
 	assigned-clocks = <&rcc 1 CLK_RTC>;
 	assigned-clock-parents = <&rcc 1 CLK_LSI>;
@@ -205,10 +270,15 @@ panel_in_rgb: endpoint {
 	};
 };
 
+&syscfg {
+	bootph-all;
+};
+
 &timers5 {
 	/* Override timer5 to act as clockevent */
 	compatible = "st,stm32-timer";
 	interrupts = <50>;
+	bootph-all;
 	status = "okay";
 	/delete-property/#address-cells;
 	/delete-property/#size-cells;
@@ -223,6 +293,16 @@ &usart1 {
 	status = "okay";
 };
 
+&usart1_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_hs {
 	compatible = "st,stm32f4x9-fsotg";
 	dr_mode = "host";
diff --git a/arch/arm/boot/dts/st/stm32f469-disco.dts b/arch/arm/boot/dts/st/stm32f469-disco.dts
index 8a4f8ddd083d..8d089546c0cf 100644
--- a/arch/arm/boot/dts/st/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f469-disco.dts
@@ -168,7 +168,52 @@ dsi_panel_in: endpoint {
 	};
 };
 
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
+};
+
 &ltdc {
+	bootph-all;
 	status = "okay";
 
 	port {
@@ -178,10 +223,26 @@ ltdc_out_dsi: endpoint {
 	};
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pwrcfg {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &rtc {
 	status = "okay";
 };
 
+&syscfg {
+	bootph-all;
+};
+
 &timers1 {
 	status = "okay";
 
@@ -225,6 +286,7 @@ &timers5 {
 	/* Override timer5 to act as clockevent */
 	compatible = "st,stm32-timer";
 	interrupts = <50>;
+	bootph-all;
 	status = "okay";
 	/delete-property/#address-cells;
 	/delete-property/#size-cells;
@@ -239,6 +301,16 @@ &usart3 {
 	status = "okay";
 };
 
+&usart3_pins_a	{
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_fs {
 	dr_mode = "host";
 	pinctrl-0 = <&usbotg_fs_pins_a>;

-- 
2.43.0


