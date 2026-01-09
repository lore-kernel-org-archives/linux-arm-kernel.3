Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A697D232FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 09:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6w3rrJHDXH3gZJo7K9Cu48MXav0WVtIvRr/eQOeJnZ8=; b=SR9FT7ZUm3dY+Fsp4Y3vK9UWDQ
	qFNumLqbkIOCoyhX/qR4E8/rakmrbTtHuVDiTCjPESOQsERDJH+OuS7MVs2AguR+ttJLAxIiZhNk1
	lvF6kcM7PZXH4Co1LexVekxjDNjVG/8G8KQS89fIzD2WfPd8NBvKm3XXm/1JRQjERddyR2VCR1Zv1
	1IjVVAnMwnqsfBdxkQJT54UL8BSQWkszjBxsY9GZ7eq0HHHIMfsWTmshO6Ve8ezODVsHcwaCDeXGV
	NUF96BU5BNsLrKiWsb3mDjueGIne+84mPTpBOziviTevFLXIFUfRmUBpc6OUtElLaPLLUd5Sb4yAm
	Dx2SPBcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8i4-00000002030-2kCP;
	Fri, 09 Jan 2026 09:23:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8hx-00000001zwK-252n
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 Jan 2026 09:23:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6w3rrJHDXH3gZJo7K9Cu48MXav0WVtIvRr/eQOeJnZ8=; b=dvmKC+kEgsXwGHeXjjtMRzzIUm
	hgoyy63hLeldPtlVHusq37HVJ6v8yDoKouZoAe6ouxdku8jfYbm2Y4326xdRdvLg2+Z0eXpAUPpqB
	98m6Q2qH0s4dMSEndX23/kxqAj6yQRYdHXHWM8SRaquepLny8CFuCAFO4KsZSudbjYGFmf6mlG7hz
	Go4Ccwe6v62bGA6kdO1VgizSnIeKqXdVwmUT2JZPwSe2hPWWrY6a3vUYeSuLh2l6gkBksVJeUblnh
	JkJQmqA5ZEtQ1h3x38NGh1SP2h4Y06dsSEIPl35Sqkf6AyJANQp57ggrg2AYoJfXI4O09r6Tqjsnm
	LPIX747g==;
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8hu-0000000Et5m-32Ma
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 09:23:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOqgo4oj9V15djlFCDqe6Bp/gGnnsVArwLG7VJpge+JJBWKJxo+W7ZOE4+5O3p4OmTbHZfmmLD/gFl0jciKtP5O3IEgJO5f81FFyAMQzmRaPDu0E7wl810jQ+XJPPBvNbCFv1vwYnVRGyOvYaNQ9jL0h1GljDKLi3yDNUmo1FKj2hBXA10n6lrGRxjbE/F9dYDrz60kr/ycCn2S49oV3b+dJaZMAnulQuGRVmHcPm+vs1CVMBj8dyeGh6cWBzd57XXdgaK4VDDJzZZxQ6AyDriVannjdw4EZsax7ioWjD+sggyqyvseQJ9pmnmzMSVdLf5abe5KY5int09twFGO3ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6w3rrJHDXH3gZJo7K9Cu48MXav0WVtIvRr/eQOeJnZ8=;
 b=bTiVaFbY37itVNvn8GszFCSg89aysYWmMrGvONBM4SDMwhEiXOwhamzfbw0jDArtFylsPovbkOi0f1zEjzgwSzP3W44Yi0y3SykC2G8HBBDsU+u1G1j2uOsm4Iam2YdTClrW6LEjCnDZtF82pHIRQCzCp6usYKhkDnkEeQhBC2K4PgAea87EWCFLOINDm9XFHdC+SWo4wWgAajTm8JIeRJnKMlYxIHSbNaRKCdOW4kDrP2H5LiLlKg7KEuFPaXRH+WFL8UROfYVfbC5iwXvoBlFMdQ+n+yDs3bSXrDzcTMW6q+bnw6Hor07WQ/qGkF0B264pyGhoqehC54GZEyY4+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6w3rrJHDXH3gZJo7K9Cu48MXav0WVtIvRr/eQOeJnZ8=;
 b=c+/i0nW69gZzcNE+19oP1Cg1Q9UvG2uyBe/0t2Yo1vHxGwN8MeEY9gOeKBX9sM3VIjrpJcHBd6bG4nfL6EdHCGorvHmqS+jDaF+SJ+ctN5UTwofKWH06cEI7Dt7v2RuvP+ZGeR8R6sPp6JQ/Dq2Gm1HVVt9HnyAmc97FIjuEoFB3AV6HYLqqc+c9tKLLdfKR1usVDmrzhLSs50Dagsh3l3CbdCZqGMVb8D9uWMBbRG0Z4I86mWMxNe1nfsTUdLlkPW6J3rXY5Ovhbsnzf9+MbXcmlhMFs+pkT4C+hj2avV+hQpMiL0oyfRVp6CKXS5MIBa6iZohHVocFXLZq4fPW3w==
Received: from AM9P193CA0027.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::32)
 by DB4PR10MB6966.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3fd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 09:22:50 +0000
Received: from AM4PEPF00025F96.EURPRD83.prod.outlook.com
 (2603:10a6:20b:21e:cafe::c2) by AM9P193CA0027.outlook.office365.com
 (2603:10a6:20b:21e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Fri, 9
 Jan 2026 09:22:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM4PEPF00025F96.mail.protection.outlook.com (10.167.16.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.0 via Frontend Transport; Fri, 9 Jan 2026 09:22:50 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 9 Jan
 2026 10:24:04 +0100
Received: from localhost (10.252.25.201) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 10:22:49 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 9 Jan 2026 10:22:48 +0100
Subject: [PATCH v4 4/6] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics mp13 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260109-upstream_uboot_properties-v4-4-75e06657c600@foss.st.com>
References: <20260109-upstream_uboot_properties-v4-0-75e06657c600@foss.st.com>
In-Reply-To: <20260109-upstream_uboot_properties-v4-0-75e06657c600@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrick Delaunay <patrick.delaunay@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.252.25.201]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F96:EE_|DB4PR10MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: 29d6f5e0-ae7f-4e93-4049-08de4f60a925
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUk5Q1pqTjFITVhmOWxFUlVlYkZxcE9ONzB4blhQQXRGYzJtdm5YZzN2dUFY?=
 =?utf-8?B?aEVVdjdOWU5yR3REWG1qZk9Dbko1Z0tyd1lTS1FyTkdrU0o5UkRhUktwSE1p?=
 =?utf-8?B?R3dMSkhUNmUxODZSMlgzUTIvSFZhbkhVdmpCTU1ZYmNLV25wbnRISitiakgw?=
 =?utf-8?B?cTBkNGo1Ung4YkNmN3B1cis2QitBaFNsM1d2RkJwNVk3UlZxVnVRay9GQ09D?=
 =?utf-8?B?QmRMR3ovai8yV2VFYm5wL0tjVjgxWU1vOWV1akZIRkl0Ny9VeXJaQ2FQbldq?=
 =?utf-8?B?UVRuWlhYNjh6TEtncGNRNy9lVjNxUjAyT0IrM0RXNWdML0cxZVlWRXdLRUZD?=
 =?utf-8?B?Q3RySzI1WFlHTWRjMTdoYkdYaDZsS1c3MXMxOEhWUUlBdVplVkVhS0xEbjBi?=
 =?utf-8?B?em5CekJ2S1hBSVhOWXpkL3ZMTjJqeksrZk1OUnZuSVp1NElCMGRRUklzbWd5?=
 =?utf-8?B?OGJDNWZ6RUVsZ25zVk0rSzFyTnRucDczVXBlaFB3cGpHR0FhQXpwOERBZVNz?=
 =?utf-8?B?N05VOFhra0tZd3RWam9UeDErTVBUU1dTczArVVJaNzg1aHduUVdYREptOU55?=
 =?utf-8?B?amZOT2VJcFFPTmhhQUlJYmlSYW1NN28wdlBDYjZnai9Bbkk2UHB4cUlSQk9X?=
 =?utf-8?B?UHUzTWduRVc3eWRZRFYyVHNQRWIzRE9GcnRxZkFtN3BwSXI0Zk9wTi83UUl6?=
 =?utf-8?B?MWt1Q0k0MS9Jcy9WL0U1YjY0WloxU0RWK1B1eUNXb3NpUE5NQWsyWnBORFNV?=
 =?utf-8?B?dzlQQUwzeUFjQlBEclcvNk5NSTBTSFNvTmNZaHpZVDg0TWNtaytKamhUcHhx?=
 =?utf-8?B?cHRXYnRDeUtMRHFac0VTKzZMVzdubWI1NE9qMFI5dG50QXlvSWIvMmt2Q1Rv?=
 =?utf-8?B?dm9IcWFRK2tvVC9UOEVCS2RXTVJmRWdhZTJ6NHMwNWd6Yk9OaFc1b0tWSVJI?=
 =?utf-8?B?WjNPWGVYckhPZS9jUTl2YVI5U2RIdytrRVF6REZEcHlQbGdMeE02bmdqaGlJ?=
 =?utf-8?B?dEdCTGo5UE5GdFZ1MSs4cFc4T0E5UWVkdkY4dDJ5bFhkb1prT05sQkVETmJ1?=
 =?utf-8?B?NGdHNnp4amppR1ZoMWFSYjZDbExnb1lLMmQyZmZ6WFZmVXRrc0lHMTR5NUg1?=
 =?utf-8?B?dkxITzJSQ3NneVMvRGJBVzlnenAwOU1WRWtnSk03b0liTzRtV3g5UldvaUVE?=
 =?utf-8?B?bTIraWM0eGZuUzZCMCsydG94bG9TZWd1b2NZQ0thK3ZmK3pISGozcXpZVDVB?=
 =?utf-8?B?OUpzVHRGMjZxVDhkT0dFaXlCNmNyalBFTzFSc213WmdqZ3JlTmloTU1TY0hZ?=
 =?utf-8?B?WkxudUtYQ0hkUzFSa1E4TGV4cnl5eTgyTkhFVlVRQ3hHL000UVc5bTJFMER6?=
 =?utf-8?B?TVM1aEo4NmF0NXd0T3VPdFpsZmRFQUVia1J1aFlsNkFuaGg0RjZoOWE3K2lm?=
 =?utf-8?B?RFpNL2tWYWZBOC9nMVIxak9iclZ6RE1TUDdLVXBwck9tRlcvakdLbjlWNXZi?=
 =?utf-8?B?ZTduMElwUnhMVXp3YzU0VUM0WWk2eTl6dExCODhvK3pUdTZjQ3c1eHpndmtL?=
 =?utf-8?B?OHozanNiYW8rMzZvdDlxOTZrdG1Jb1NQdjdUR3IrOFV6RVZJdDF6MnlXN1VC?=
 =?utf-8?B?OVdyNk9ZdEFLYnlRU1hPV1VJRE50TE1vbFh6YSt6a20xRnZEVjFlc3V4amFk?=
 =?utf-8?B?c0Y4bDlyUExhZEdXdVlObnBMdGVPN2RDcU9qRVhWUFJTTmsxRjBPV0pVK2FU?=
 =?utf-8?B?b3ZhMGhyUkZVNXpLaEIvbk1CWFZvSUJSVUZ0L0xYYUN3VWJzRGJ6a1g4M2Rs?=
 =?utf-8?B?d0kzY0QvRjFXTktLWjc1TG1rUTlVNTl2cktnUDVadjN0M0cxcHB6S1B2NWhB?=
 =?utf-8?B?RTFGQkJ1VmJSdUZoU0tjTlJ3TUtDQytrQzZNM2hCR3hrQ1Jia1o0TE1FWTZQ?=
 =?utf-8?B?Z2VxUVdTeWVtYllMWndLQk5DZzBoVHFFSG94Y1o5VElGRlV5Qlh3V3E3eXk5?=
 =?utf-8?B?K0JaWm5ibjdnWFpHRW9OdXNMekQrbnpCK0RUb0s5dzJvMndrYzdIZWZoWXNP?=
 =?utf-8?B?MTJTY2lwV2ZGcG9zOHRNRlFDQ1U1VFNHU1lzdFlzU0phdmlNalVUREJNMEd3?=
 =?utf-8?Q?nzN4=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: yyjIFNWA5sWjzzs2hU90dx/tSqqlckgDZ+h+sCYaB/6Ms+wLRnK9v9uMtzvvq8CRZO6DimzoV8N3NsiwP2VW7zL9r+l4MUl8R5Gj6QP+qJnbK7GGNLXA3PpmK0h0oGyv97bwXnFLXsEVuuLTHBajASkaeeDlxZHuEN6kY5odBBEZNDpPSOXjgwHG1h2owlTNv+E7d9QnO30JmWeKT7iMGzBTyKMxq4kMq/yPQ2slIiqfwvdSBxdMMiRqqpeN2PiIQnrdHZs8sJhOhaB9eWyYtXWPtN7qqj65+1RaWFsoTmaxyTNdTr6rnuRX/la9FI++Uz6K1pCiT1hDxbCqi2ErgzmcQwQx0vVjE2SIJQfTOoZZ7wr8SxcMRoS0Ree+lRGPKTgg0AlJpnmQbhSznRtbAB+owcNFFxFMMkoVJvjdrn1JyebEZ7gbfvWQhK6zgJUTls42lYHjlHaNw3xqZgKiBFkwEO8js9WupRygWuwbSaiXVaK0O1KjcvGLsd4Pvk6f++gR+aAHTKFE9xRMkJlCbz9AruaG1Nm6Ye1ANl4qBQs07tFrnv/g15rXgljBqwNJdF9Al9eSTiQt14z5xYKmRvbGlTB32JrR3gLe61lyd4RLQ/x7mojwlUvx/p4u1kAcEVjnjVEK092WgBEKKCKWxLdWwPezh3IN0KbPOnHVOS/ChfVpX4NscMXBaYWPKvIW
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 09:22:50.5633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d6f5e0-ae7f-4e93-4049-08de4f60a925
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6966
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_092258_866242_DC91194E 
X-CRM114-Status: UNSURE (   9.93  )
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
 arch/arm/boot/dts/st/stm32mp131.dtsi    | 21 +++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp135f-dk.dts | 11 +++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index fd730aa37c22..26c3b5529582 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -35,6 +35,7 @@ optee {
 			compatible = "linaro,optee-tz";
 			interrupt-parent = <&intc>;
 			interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
+			bootph-all;
 		};
 
 		scmi: scmi {
@@ -42,15 +43,18 @@ scmi: scmi {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			linaro,optee-channel-id = <0>;
+			bootph-all;
 
 			scmi_clk: protocol@14 {
 				reg = <0x14>;
 				#clock-cells = <1>;
+				bootph-all;
 			};
 
 			scmi_reset: protocol@16 {
 				reg = <0x16>;
 				#reset-cells = <1>;
+				bootph-all;
 			};
 
 			scmi_voltd: protocol@17 {
@@ -88,6 +92,7 @@ intc: interrupt-controller@a0021000 {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+		bootph-some-ram;
 	};
 
 	timer {
@@ -131,6 +136,7 @@ soc {
 		#size-cells = <1>;
 		interrupt-parent = <&intc>;
 		ranges;
+		bootph-all;
 
 		timers2: timer@40000000 {
 			#address-cells = <1>;
@@ -791,6 +797,7 @@ rcc: rcc@50000000 {
 				 <&scmi_clk CK_SCMI_CSI>,
 				 <&scmi_clk CK_SCMI_LSE>,
 				 <&scmi_clk CK_SCMI_LSI>;
+			bootph-all;
 		};
 
 		pwr_regulators: pwr@50001000 {
@@ -900,6 +907,7 @@ syscfg: syscon@50020000 {
 			compatible = "st,stm32mp157-syscfg", "syscon";
 			reg = <0x50020000 0x400>;
 			clocks = <&rcc SYSCFG>;
+			bootph-all;
 		};
 
 		lptimer4: timer@50023000 {
@@ -1003,6 +1011,7 @@ iwdg2: watchdog@5a002000 {
 			clocks = <&rcc IWDG2>, <&scmi_clk CK_SCMI_LSI>;
 			clock-names = "pclk", "lsi";
 			status = "disabled";
+			bootph-all;
 		};
 
 		rtc: rtc@5c004000 {
@@ -1020,6 +1029,7 @@ bsec: efuse@5c005000 {
 			reg = <0x5c005000 0x400>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			bootph-all;
 
 			part_number_otp: part_number_otp@4 {
 				reg = <0x4 0x2>;
@@ -1646,6 +1656,7 @@ usbphyc: usbphyc@5a006000 {
 				vdda1v8-supply = <&scmi_reg18>;
 				access-controllers = <&etzpc 5>;
 				status = "disabled";
+				bootph-all;
 
 				usbphyc_port0: usb-phy@0 {
 					#phy-cells = <0>;
@@ -1670,6 +1681,7 @@ pinctrl: pinctrl@50002000 {
 			ranges = <0 0x50002000 0x8400>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&exti 0x60 0xff>;
+			bootph-all;
 
 			gpioa: gpio@50002000 {
 				gpio-controller;
@@ -1681,6 +1693,7 @@ gpioa: gpio@50002000 {
 				st,bank-name = "GPIOA";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 0 16>;
+				bootph-all;
 			};
 
 			gpiob: gpio@50003000 {
@@ -1693,6 +1706,7 @@ gpiob: gpio@50003000 {
 				st,bank-name = "GPIOB";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 16 16>;
+				bootph-all;
 			};
 
 			gpioc: gpio@50004000 {
@@ -1705,6 +1719,7 @@ gpioc: gpio@50004000 {
 				st,bank-name = "GPIOC";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 32 16>;
+				bootph-all;
 			};
 
 			gpiod: gpio@50005000 {
@@ -1717,6 +1732,7 @@ gpiod: gpio@50005000 {
 				st,bank-name = "GPIOD";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 48 16>;
+				bootph-all;
 			};
 
 			gpioe: gpio@50006000 {
@@ -1729,6 +1745,7 @@ gpioe: gpio@50006000 {
 				st,bank-name = "GPIOE";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 64 16>;
+				bootph-all;
 			};
 
 			gpiof: gpio@50007000 {
@@ -1741,6 +1758,7 @@ gpiof: gpio@50007000 {
 				st,bank-name = "GPIOF";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 80 16>;
+				bootph-all;
 			};
 
 			gpiog: gpio@50008000 {
@@ -1753,6 +1771,7 @@ gpiog: gpio@50008000 {
 				st,bank-name = "GPIOG";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 96 16>;
+				bootph-all;
 			};
 
 			gpioh: gpio@50009000 {
@@ -1765,6 +1784,7 @@ gpioh: gpio@50009000 {
 				st,bank-name = "GPIOH";
 				ngpios = <15>;
 				gpio-ranges = <&pinctrl 0 112 15>;
+				bootph-all;
 			};
 
 			gpioi: gpio@5000a000 {
@@ -1777,6 +1797,7 @@ gpioi: gpio@5000a000 {
 				st,bank-name = "GPIOI";
 				ngpios = <8>;
 				gpio-ranges = <&pinctrl 0 128 8>;
+				bootph-all;
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 9764a6bfa5b4..a05d458c9b37 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -517,9 +517,20 @@ &uart4 {
 	pinctrl-2 = <&uart4_idle_pins_a>;
 	/delete-property/dmas;
 	/delete-property/dma-names;
+	bootph-all;
 	status = "okay";
 };
 
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &uart8 {
 	pinctrl-names = "default", "sleep", "idle";
 	pinctrl-0 = <&uart8_pins_a>;

-- 
2.43.0


