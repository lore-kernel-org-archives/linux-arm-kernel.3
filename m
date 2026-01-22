Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984A5D46977
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 17:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YVkE+qybre6HlsJxJFEPrexC/21KokTWEWUY2qh6Rpo=; b=cZXLJWwJtWa3vGkJtdAUW/lSfy
	iIwAFrS83OIjCS0CeVRQtWAkTGrA5CMiG07xr/nlTSW56ykvRJXLDtd6nQf4UP/wvnN3NjC6je/rN
	xE/w6JOloYWT+WHl/hbVezyPbOnxsyvsWK1pRomUfesdR6pgVRzOC+Q6jxWoSAtdNM0JZmwsdPIIb
	spUtEorp5fYEE9ynTK5ifnMvN+LVgSHtxrofiUDcPBwPpXkM3GWLDU8602YU0ZNt46i9TQcWVtMCp
	fcciYRHzk5GHIyTX92KVyyOSmbl71LDRu6sQKUxnI2KIL8nhxOeXb+k1QbxpQbs5HQYRoUvu7quvS
	IYwIDODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viye4-00000007a1F-1s93;
	Thu, 22 Jan 2026 17:39:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viye3-00000007a0g-2XRA
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Jan 2026 17:38:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=YVkE+qybre6HlsJxJFEPrexC/21KokTWEWUY2qh6Rpo=; b=Cjwo4+3eV8bmleV7aUY+1TVBEc
	IXCZ5o5k+/UG3KUIT8TqSChb1i+deErBtzgK5f/r9KrxmEEq6sHlHbiwt3mQED34d+nlce02eA82n
	r5e7mTsgdZstKjc4fLMHM/uLZxq355ArFhxcuP5daYhxTcwOJDAIz2C1f4PP2gegP/BiwtQ5DMOqM
	EQvZnaHrwY0pPIrEe9njUO+KXq5qYoraWvjC0jyGsM+JOsYxpLiW0m9ikUrB9x+xlT2Bzr3KLT2Yd
	WF/RsVjA0JOiXNEFYlV4aS7ZoH8YgJkN1S+xV7x1P9+3RUlBPIOsbxBNMvpqK30u2Ih+oCGpLOIWz
	W6LxlMpg==;
Received: from mail-westcentralusazon11013026.outbound.protection.outlook.com ([40.93.201.26] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viye0-00000000wZQ-1xpT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 17:38:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTr1o7ZV5h/Aab0v6jAxDs96nEvTnC08Ddj0cp+tlu1N+pdXMhy7uLiLrLD9fLTC6cclHrSZaiXXqc8qSZQD/5Xz7DtmIp0XUA06vaLkiRccDXSDRchPwEYSxbfcZIoC0hoFX/xh+6nqNlre1ObercddZi9lQY9wCPDNVpdKQdgLrfrN0SdV6CdH0S5hA81fAVQgiypDBS8vj5Unm8DdxOLvJW0lSynaZTo2caWMVF4nt3LpLK9YZrFxKoENUvx5DdC+otkG/Or5YfcQf3aT6S4QRwpXlcZ3gv6WyUoeVLf+xSUATEYWAIT+YK1ngPpjrMWd8eYgtDwV0HLP0cettg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVkE+qybre6HlsJxJFEPrexC/21KokTWEWUY2qh6Rpo=;
 b=Y54xmX9DLBnvSDuK1d06ULaUfJ1ycGMqvLf7cViikXQSSQIV4qMf20kiAUfr9jHqkYdpjZ4fNg0kJdxOuhWmeFOACVgntuUN4JPS6JgYDz8RwhLs5PDCV3e0eM9XYBOWCI+raicI0rrkJV0c1QgWBvf6ZHiKKHiKEh6q9G+zz7fPO2hYQfciRrZOUFon9jdv0FJVdZwrBx2f525sDP6gEYYs/kwNgc+PoAExaGP7u8J8AyxSkqc62jjklAcEM3XOW0HrzHc8BljJKylos0Btyj6Y6KLumhE++tSF8Ws8n0uLsFutggaB7/V9YWoGNNU/ERDiPyTgoNBmJLch1upNLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVkE+qybre6HlsJxJFEPrexC/21KokTWEWUY2qh6Rpo=;
 b=OShgk6+sciq9a8zRuGGiKSP54lK85FAobT/qFen0rBaP/FPbFQYrEEu+vt3mp7lXD/geVrZ/o5QTE0akOPpVHM4wEO5KEyUi26kAOVB6THK8aPzHAPfsjltL6o6ISZVGV3O8hKk+QUTC3/DDIrIr8gxgmwqxUGE5jO+XfzxV++c=
Received: from SN6PR2101CA0007.namprd21.prod.outlook.com
 (2603:10b6:805:106::17) by DM4PR10MB7402.namprd10.prod.outlook.com
 (2603:10b6:8:182::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 17:38:46 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:805:106:cafe::90) by SN6PR2101CA0007.outlook.office365.com
 (2603:10b6:805:106::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3 via Frontend Transport; Thu,
 22 Jan 2026 17:38:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 17:38:45 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 11:38:45 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 11:38:44 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 11:38:44 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60MHciJH934604;
	Thu, 22 Jan 2026 11:38:44 -0600
From: Kendall Willis <k-willis@ti.com>
Date: Thu, 22 Jan 2026 11:38:34 -0600
Subject: [PATCH v4 4/4] arm64: dts: ti: k3-am62l3-evm: Enable Main UART
 wakeup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260122-b4-uart-daisy-chain-dts-v4-4-cfdabdf5e6c1@ti.com>
References: <20260122-b4-uart-daisy-chain-dts-v4-0-cfdabdf5e6c1@ti.com>
In-Reply-To: <20260122-b4-uart-daisy-chain-dts-v4-0-cfdabdf5e6c1@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<d-gole@ti.com>, <msp@baylibre.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <khilman@baylibre.com>,
	<a-kaur@ti.com>, <s-kochidanadu@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Kendall Willis <k-willis@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769103524; l=1813;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=kXu8/WFDLyU1KI/xZUFBmxaGvnMjAietjGz66fvMzi8=;
 b=MrRvehXAj7VcAUWDIk47EDVGONa93k4D2MoqkBrpofNPjgIGLyItxd4lzZ0Zwz51F92zUwLqP
 RUif17cml3cDytb4B3AJfd+8E1CWRlvkQSl16M4WpwUnPTrouMelgbk
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|DM4PR10MB7402:EE_
X-MS-Office365-Filtering-Correlation-Id: fb0348f4-a4fb-4515-a1b0-08de59dd17cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2xaTEU5aHhGc1RYT0tvV3RJQ1g1cVJ5R2ZSV1ByNkVvdjBxMlExbmRqeFE0?=
 =?utf-8?B?M1FpZUpQMG5KYWxDU2hvb0tEMXVSeEZHUDVUd0xjZXNFSHVpZlBaWVd4WkZS?=
 =?utf-8?B?czBKbnNGNVhYUlV0VWtYUWFYK28xMHZnK0Rtc0plYkRWUlNwVHVOQjYzRDhV?=
 =?utf-8?B?R3B0K0hwWTZtcVBLTzdnQTdPMEwwQlh6UEVKMklUMXAyLzRmV0tsekdCTkUy?=
 =?utf-8?B?bzR5QWFqcmtBL0JJbG1pbFAxYldxbVE5d25IblNLTDBCcVg5UlY1aHNQU3ls?=
 =?utf-8?B?alMrWXlaWWZFYnU5dnVZUUdiWFdQRkJZcEFtV2VCVU81WERJWTl4b3Q4Qklu?=
 =?utf-8?B?UGVESXZVcm9wZUcyaldDMm1vSG45MU4rN0pLblE5SUxwb2htZ2o2NWZCYmFv?=
 =?utf-8?B?Smd6NTdpdk9VNzNER28vaXk5WEdxQ3I5bVJCYXZCZFViMUl2cnlscFRoK0da?=
 =?utf-8?B?TGREK0RrUWJQdHNqdHNxTlpiVk9wRldMN3RLMytXN2pOWGZWa2tKS1pOTU14?=
 =?utf-8?B?b3M1ZlN5cmtrZUhNN2V5M2d0OCswZDNIQVE4MDVVV29zekZIMXlOVGwza2pW?=
 =?utf-8?B?L1hMNXFsQmMyTFNDVmU0TW5TZEk3UEFJbFUwMzBzVGc3dndNekZ0eFJGbzRI?=
 =?utf-8?B?Qk4vK2xzcGNaOERXSFVQcU96Zkh4NWdnOUJQMkkzdG5Mb3Nvc215YW9qNUxP?=
 =?utf-8?B?UkZLOFJzUlMxODBhS0dsQm9Cb3pPbUZ1WG5PUzRZczZJeEpWcnd2YzJpWC9Y?=
 =?utf-8?B?TjFXeFU5ejhMVm5mMEFlNEhibGtXZ3ppWGVWRlR1MkgyeWxTL0tDQWw3SzdM?=
 =?utf-8?B?bStHeUNaVmxiOHdUald3K1duWGlmMDVtdjhJSmR6TTRKeEwyMnhaSjBaK3BF?=
 =?utf-8?B?TE02MWhsVWJIMURxdDR5Z3lzYzNFWW9pTDMxNUpFVWtaSzhQdWw4YmRjWjVm?=
 =?utf-8?B?enVEVFROR0ZSTjJJWlJlWHJ3UDFPNDU3WjAvOUNkdjZUeDVpUXVJVW5SbHl5?=
 =?utf-8?B?alRzeVhBMTlsQ1pielhFcFNwVkswV3orOEg5TGZlOG9KNzF3RnIyWmxPWkpn?=
 =?utf-8?B?QkcxWlhFMnl0a2JqSjdDTGhtSXExNHFTOFdSVENqNXNwQXl6Q3lsVDFyem9T?=
 =?utf-8?B?YXdubjNrQVMyMW04UkJ6NUpYUVcrb0E5bFBBR1JCUnBHd0ozNjIwUXo2T0k0?=
 =?utf-8?B?bndwZFlsVHNZVStRb21VbWYwdmp6ZkFxZURjYWlFNGJpRzArMlBFV21rQnBv?=
 =?utf-8?B?NzdCWXM4Z3dNMmNqa0lybnF2OUFZUFRlUGhlMDlvQlZKZGx2VkcraWFrQVVF?=
 =?utf-8?B?Qnl6RzdSRW0zcW9ReHprYWlnM0QzaXE4NG13cGZzSXh0eXR3VVFsL3J4c0Jm?=
 =?utf-8?B?UFcwa2JjR2JhaTIwN0pBclVPS3hPY0g0b21HcWk3STNydWsyQ0k3QUQ5MkE2?=
 =?utf-8?B?UnpyQ2o3azJ6S01LVVA0c3lnNGxIUHhlQUYzeWVBVkFld242aG9kdnlqa1RN?=
 =?utf-8?B?dkdkKzJ1emU2WmhBYXV2dmRmdWlGbVQzaUk2R0ZacC9TdUdHbE1KblRqQThK?=
 =?utf-8?B?NnhlRDJlbitQOUdUZmh1Z0tWcmlEOXRLYjd5WUhkZkowd21ZRi9acVJISjFv?=
 =?utf-8?B?NEJlWTI4NHdoUlMwa2czaFUrQUNPWUpHQ2swcHpIYjl0RzBDc1hpRWozcWJw?=
 =?utf-8?B?Ris5cXVGNXhqcVFhZG12RVB6aHJ5dHE4aU9FZUgxWDFLNHgxTXNTU0l1bUdw?=
 =?utf-8?B?S3pnc0s4eEtPb1ljTnlhSDJyV01idzFaVnlVSGlhSzc2UUFUWGJHMGVwVkt4?=
 =?utf-8?B?ZUhNTHc0NUtVQ3J5ZHRqMEVINVZrcmFHMEpVenArN29wQng2ZkpNREgrQ0Zz?=
 =?utf-8?B?WXhXN0ZMNytVbFJmMGNZeUUveEswR21YZW9ZUFZ2NFVrL0lhaEJRZzEyeURn?=
 =?utf-8?B?TTFIK0tWQTRlWExHZDBxc2RhYUhCOTJGLytvVEF2RDlmNGxFSGlwWWtKbjk4?=
 =?utf-8?B?c3FqU25XVDNlU05td2taTmtsRmxhbFJHTnBxZi96UTBwQkwxRVdscS8vdmNJ?=
 =?utf-8?B?R0ROaDJZU3FmYlBZWVEvbEhDQVI2SkpyVER6TFozRis3VUI1cWtJeGEzSTJB?=
 =?utf-8?B?OWhTV2NvL1VEVWE1L0ZjWDk5dEZZVVRXQmFzWWVOeDN3ZXZ2VUFtZUFZaWds?=
 =?utf-8?B?akZhS3VYbHgyZy9jaHlsMHRVWWJjU1FDRlVtQkl0SlpDbGRtT255MkZPRjdj?=
 =?utf-8?B?cHNVN0VPbnBTSlVCTFEvQnNpcWlBPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:38:45.4386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb0348f4-a4fb-4515-a1b0-08de59dd17cc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7402
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_173856_621967_1CA85760 
X-CRM114-Status: GOOD (  12.53  )
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

The Main UART can resume from suspend to RAM states when PIN_WKUP_EN
is enabled. Add the necessary pins needed to wakeup the system. Add the
system idle states that the Main UART can wakeup the system from.

The UART driver uses the "default" pinctrl state when the system is
active. In the suspend hook, if the UART is wakeup enabled, the "wakeup"
pinctrl state is selected by the UART driver in order to allow wakeup.
Upon resume, the default pinctrl state is selected again.

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>
Reviewed-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
index cae04cce337366b50928d39b0c888550b14e43d3..943a5b9408b119eb09426fabaa798de4879fd03b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
@@ -288,6 +288,13 @@ AM62LX_IOPAD(0x01b8, PIN_OUTPUT, 0) /* (C13) UART0_TXD */
 		bootph-all;
 	};
 
+	uart0_pins_wakeup: uart0-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01b4, PIN_INPUT | PIN_WKUP_EN, 0) /* (D13) UART0_RXD */
+			AM62LX_IOPAD(0x01b8, PIN_OUTPUT, 0) /* (C13) UART0_TXD */
+		>;
+	};
+
 	usb1_default_pins: usb1-default-pins {
 		pinctrl-single,pins = <
 			AM62LX_IOPAD(0x0248, PIN_INPUT | PIN_DS_PULLUD_ENABLE | PIN_DS_PULL_UP, 0) /* (A5) USB1_DRVVBUS */
@@ -329,7 +336,9 @@ &sdhci1 {
 
 &uart0 {
 	pinctrl-0 = <&uart0_pins_default>;
-	pinctrl-names = "default";
+	pinctrl-1 = <&uart0_pins_wakeup>;
+	pinctrl-names = "default", "wakeup";
+	wakeup-source;
 	status = "okay";
 	bootph-all;
 };

-- 
2.34.1


