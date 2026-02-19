Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D371AE9A05F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 19:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o1DQ5FrHUojcDZV89bwPeBda0or1FVwzEnJmhTYHN0o=; b=GgY6tw8E8O+vIn
	XyzxZVoYcxpMAUJJrRL7IYx262Kkymbw4BltEr567LqRQxvRVSHOoIBDCIyArN8N+Ire2ZdNPdirh
	F/g1TRNqu95TJkaKfEJ3LlUI7VNF2AuoQn9aysa5f3zxRqfIYrnK6smCRbjRTN4sC/NQSsjTKTRcO
	r3PYAjQiQMfqm17tzEEQIFqcX+EmMOHlc7hErATRPqDiuuRxew7uQ6MOaANpZdzdK1X5LymgQnmAd
	9Mu6lU2/JndoSUvsnlmyRjZbgizcewKAIIXfC4sKycsXEVXQvYlHIzdlWONzPgPPCXv0d74+1dt5r
	usutLRSdl/dXKyfb+Xbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9wK-0000000BsNT-3Q10;
	Thu, 19 Feb 2026 19:43:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9wI-0000000BsLS-3Tc0
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Feb 2026 19:43:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=o1DQ5FrHUojcDZV89bwPeBda0or1FVwzEnJmhTYHN0o=; b=cmgjacc4qPITPPlPEjFLCTcQpH
	mc0DKNJzJ2YGSPUZmaeF394vM/VkDNHxekibOa4Ih/FeNB1DE9exYzPm0vzLZvmpGM/WkPdLUd1yA
	weWzYdsqlon7ueqLQk/skyKe7TN1vMD2p/KgmzwFX9lTbuWJWXoI2tc4yNvbLXFdPJw/rixBe1dUW
	B2r9TFHkofWJQZjR4Y/xJKe7QL8JcHSlQCynCDNKAHCc0PEibOlZumooEx3sMRrxV42L74g41Nrbi
	V+DqlVWgA7nI2fXO3j4SJhNWMBIpea0G0WySmNYddNzNBjH1+3gJGCJrNoI/gNzPpZ0A79Cqa182f
	dQPglfSg==;
Received: from mail-northcentralusazon11010020.outbound.protection.outlook.com ([52.101.193.20] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9w9-00000001njU-36xw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 19:43:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xM2F4CskGS2sSvLYj9M7VpAATU7D/9aDDz5VmBzhCCLF2aBqRofhT6o7U+LrIM7TBZcYelwkm4sCJqCzWzzNjwNoLu8QOJ2oyZTKxa8JAsViu2UFxmffmwNif3PW1EDwyi1y54x7WwoDfQT03yoQtnATVmylvMaV5GLvT80HzcoYSdjfUKgp7eljlyCg6RFFmW2ERpQY75rliZirChz82KLLX3K545mf4RjQpAjLfQMx8zxIc+96wHIwDvItfcUP6AHFlEvXyimdYEyqAFRnnommQqiBOqZKtrRf3YcJX7GaMfqmxUKhK1x/fCaOgD7Rbs/u/lZgsyWQWxoRawpnOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1DQ5FrHUojcDZV89bwPeBda0or1FVwzEnJmhTYHN0o=;
 b=RsRxkIHELy4AEuZux2w0MiKqz7L0R6/bsU0+ApoBzH6vpAfbqAJUhCVrllUqXhO2Nd7xmIUW+D6gyN76Z1n/saHPYQPJr4SubnrDeYh1vCvh6nsXDl8SXwl06pJ54sval5eDub+L2OcdAKVQy3sJEEcggCDnLTnjF89rB79ljPEDHKsBsfmMPiyb/VAXgq3Hm7cBBX+FA4Y8XqHC/NViMk45KTZUlBszQab2klT1ga/2TFU79ClX8nVzCVf0OBLQLwm8/R45CSJTYtzzFxcSs/H8EdHstU6+XsreLOM1L+UBiaFvZXmHJV2tl1kF9xkdas2FvLyDi5wB4ceisWQqxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1DQ5FrHUojcDZV89bwPeBda0or1FVwzEnJmhTYHN0o=;
 b=UR3IxkvbhvDCljFVOLeuACzLBPp9st+mYE++EUu+REog3BSB+4/XvANqtRmpQU9do6EMl3ceJq89EeaTU7yuhw/77I2CZav31Ni1MdpN9Cnmhc4yd0udXfNOYk93E2r//EbkW9uY+Y6+kVnJvZn45L7f9952iv0x8YFelJpHdaU=
Received: from BL1PR13CA0191.namprd13.prod.outlook.com (2603:10b6:208:2be::16)
 by IA1PR10MB5924.namprd10.prod.outlook.com (2603:10b6:208:3d4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 19:43:36 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:208:2be:cafe::d6) by BL1PR13CA0191.outlook.office365.com
 (2603:10b6:208:2be::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Thu,
 19 Feb 2026 19:43:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 19:43:35 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 13:43:21 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 13:43:21 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Feb 2026 13:43:21 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61JJhLBY2638942;
	Thu, 19 Feb 2026 13:43:21 -0600
From: Kendall Willis <k-willis@ti.com>
Subject: [PATCH v4 0/4] arm64: boot: dts: ti: k3-am62l: allow WKUP UART
 wakeup from LPM
Date: Thu, 19 Feb 2026 13:43:15 -0600
Message-ID: <20260219-v6-19-wkup-uart-wakeup-v4-0-eda09dce5623@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANNnl2kC/3WPQQ6CMBBFr2K6tqbT0gKuvIdxUaZFG6KQFoqGc
 HeLiUaj7uZP8t7Mn0iw3tlAtquJeBtdcO0lhWy9InjSl6OlzqRMOOOKAc9pVBRKOjZDRwftezr
 qxqYZAAGFkVVZapLgztvaXR/i/SHlkwt962+POxGW7aKUwAX7lkWgjKJRFmRdmFKqXe822J7JY
 or8SaeHmPpB80TXVYaVkQoLnn/Q4o3+XyeK5LA5osZcQS30yzHP8x2vgoVQNQEAAA==
X-Change-ID: 20260127-v6-19-wkup-uart-wakeup-11c1c3d5b99a
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Dhruva
 Gole" <d-gole@ti.com>, Bryan Brattlof <bb@ti.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Kendall Willis <k-willis@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771530201; l=2448;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=nNfbxh0awlFnwS3UqlD4KYkzYmHQSKXYKgqkpYpWqLo=;
 b=r6y0lR1gGP1prWRtM1086qEgIfIXXXACpurp/o5iTuwAklzXKXOo3MMFKqGpZeWNyCwZYBdhQ
 Knv3rSYLhSIAEehNYyzLkZPTCiPSUzOYIiCqZ50HmJ1TVRGUoaUmVUs
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|IA1PR10MB5924:EE_
X-MS-Office365-Filtering-Correlation-Id: a0fb1f2d-6df9-44a2-ec1e-08de6fef2be8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGw2TzZUQkgwUmhYbWNlR0E3WmhnRENpVmxkWkhSaFIvOFNxZkZWeEJYeVVI?=
 =?utf-8?B?a0pWdjRHRERkVXgydHIxUHNmckRNRUFIWmhEYWFlVW5nWUpXQ0VycVh5U29P?=
 =?utf-8?B?SlpiSWtnNXVxb0lnV3BJLzJUUVJqczFKblRDOHRJeXNLRmJnc3I4cWhaSXNu?=
 =?utf-8?B?aGF2ZVY3WUtieS9PcnJoZzdPaW1SbkNkZnBpM3cwQ3JYcUFKWkNNUGxBNnV2?=
 =?utf-8?B?bFdGQml6Z21DeHgxL2tOOEFVV0JvU2dXWWFmYVBzT1VoL3l6SkVyUjYzMGYy?=
 =?utf-8?B?eVp2SGR3VmpWQ1kwcjJYbUdGTWxmTnJvQ0pmN2ordmZuVHYvYlJPa0ZaajV2?=
 =?utf-8?B?ZGVmNERwblhyOUwzeDR3WGxTc1g5YzhjQVREQnJTVkF5cE0wandQcHZyZVk2?=
 =?utf-8?B?aWlNWk1HcTRDQmxuWWRZWUM4cVRjbEZyaXpOVng3dHZGVXU3VzUvSGFYRjhE?=
 =?utf-8?B?K2VOd0hBNlZjS3JRaThIczBpRXladkd4M2xYTjNjeGhURWxwMmM4S0xaU1U0?=
 =?utf-8?B?Yk82U2pyN0krdGlFamE5ZHlaOThVb3RVZE0xcDdFeEZrRmdMSm1uRktxelFF?=
 =?utf-8?B?YklQa3F3cjc2TkQ1ZmJTKzNIMDRXUUlFR0l4K0EwdGZkM1RIY0tWMlFlckhN?=
 =?utf-8?B?bWErOFcva21XakFjS3YwYWh3NW96ZkFVWVdPSnZEQzRlWkN4dFRNdlpWZGxU?=
 =?utf-8?B?NlpjRUlRRGtYSU5VUzVDR3NJejB2cUJGU0NoUmFyK3BqVjBZcjVESGZFSmgx?=
 =?utf-8?B?VE9KYSt3OFhGSHFON1FFdG85a1ovR0V1azFmdnZEZnJpUGhzYTk0ditTY3M1?=
 =?utf-8?B?UHNYRS9OZXJhUWRJYkdxL1RWYlJ6WXpENkFBUXhXZ1NoNXM1QjR0bENBOEhL?=
 =?utf-8?B?T2RxeHBvZXh1ZUowMitCb3ZrL0JMb3g0U0dTTEJlQ1krTFZJcTZWRnBTQUR0?=
 =?utf-8?B?Rlc0YnJqVGVNTXA4V0gvWngwY3M2NVFuTFlseEJickpObm9qOW94ZzhsYUJX?=
 =?utf-8?B?dnliZi8wbXNycmRRK0N1WnBoVXFTa0FNVFgzMUNkKzR2alZkcGIrbFFjT3Zy?=
 =?utf-8?B?ZnEreDlQTEhvVHhZV3NYQUg5cDJqc2VZdnBNYURhanpIVHNHRjVRWXgrWHFu?=
 =?utf-8?B?azF4OXdiRVVKV3FKRVdNV3NhcVcwbUJGem1jeVBCMVozU0FFdTdBMUZ5MjA2?=
 =?utf-8?B?ZUR1aVVIdmg5RERqZVFKWGJHZkYrcUtwUmdud0pYbVlFcVdOcDVZM1RkSW5I?=
 =?utf-8?B?MmtubjZyazN2UnNDMEtrVmlnaVNDZmZhZDl4alUra2xULzFGYTc0a1RWQkN0?=
 =?utf-8?B?d1VOVlZZellQcFFaN08wblM2RUVpOUNtRzVmY0NWYkgwd3NySy8vR1FlemIz?=
 =?utf-8?B?eW5aUWdrUkNkeUxvWEZWMDJFclNOVDVUTXdXU1Z5NEpnYXJkNVltWFdDSVk2?=
 =?utf-8?B?UG9od2F5VmNDWGRxTWp4Z3RDUXVDZTZWRFE2ZXdTaG0wM2xxUVJNM2hleklw?=
 =?utf-8?B?ZmFzMkNDV1ZrUlNEeGd5Q2w4cFArR3dmVWM5SkgyRjVNOVBHaVNDeGcxMzB2?=
 =?utf-8?B?UTNZZnlZQm5PSEFMNDRXRkxxdktTZ0RUV3diWWJOd21yQ1RmdWhoZlY0eGZs?=
 =?utf-8?B?TnJheGRDM1dNUFlCRmRSZHV3WE10WDJDWU5KVFBobkpIOXBiVURPbXBBVzNE?=
 =?utf-8?B?cklMZHhpQUszcEdJU2t0T3E1TzkwZGdsLy81dlRmbkhNTGZHbnljYjBFZlVl?=
 =?utf-8?B?RDBOM20rWTRnOWF6YVJaUGVHU2NvMXpXeTdqSHlQQk9ac1RwUWdOaW01Q0Nv?=
 =?utf-8?B?MU8wZ1FTNGY0OUtOL3oyRC9oeC9xaWNZdFkwNjJ3eVcwUHE0cHd5bUhZVlJD?=
 =?utf-8?B?YkVmRjJ5K2luSVc5NFExNTN1aDFoRUZWNEMzbW1xbXJhd1FpRmhITEdFRkxz?=
 =?utf-8?B?YWQreUlyM3JiRnE0WEVQU3gzRmcwRVU1Z3B5czJSMVltN3NpTkVGWHB5dXFE?=
 =?utf-8?B?WUpaSzJ5YlZrR3pua2FlMXdmTVR2RFFpMlV2ODBxUktFamVIVkM2SXd5Vm5s?=
 =?utf-8?B?aU55b3ZzL1NrOEgra2JkSERYMmtFZGxMcUI1VzMxNTZJejZ4MmpoUzlXeWJu?=
 =?utf-8?B?bHBOK0w1MmRSYU1XU2wwVHpjWEtycks1WDVPQytyeVV0WXp4OS9ld25WemNN?=
 =?utf-8?B?cHJlZ0N2ZU1DZERuNXovWU12SDZwUzhkMDZOT2J6bEJWZWFoY1ZnR2k0TE1x?=
 =?utf-8?B?QU1PL0ZCdFJKMk9MTVk4L1l0ek5RPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: L5nh7yZ/ElotWITeCRk2SQL7yQKKJkl0x9Z1z1msoqcuaDT5W6eJ8EcGi+bBFbBDE8AKjBLGD3h3vQjSUx5S4uqTSSTuzcZQs0aIdt7fx9hUeIicMLBq3EhY3DNYWjF4j6/AA5nMMyjFGb/cI8Bjp5aMUIqdd3P5Q9xjFlQuchhp6Evu9cV/9fKK+doOavmAu8QeqP/my5Cjwq+ozfTcyPp2KSmOISSHoWUqRRXHc9XPMn93Bn9s9ueja7832qaeicW9FRpGF4XwoVG4LenPpEro8PIn4nLGqSHDYCmaMSvsFkZrNvlxHOcfk6dp8Q1JsxRXMwsnCnsRsW5CaizCAim+hSzQZFUQYx2RBnx31g+xYUpygkR8COX+ASCI6atyMjiprzHnjoy3ofkiOPbbFk6FqVrnytgmNYJLF9T1DrES+MpLC+hdSfeKcXvOcuDU
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 19:43:35.6494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0fb1f2d-6df9-44a2-ec1e-08de6fef2be8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5924
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_194345_920645_0BA5D0E2 
X-CRM114-Status: GOOD (  12.22  )
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

K3 TI AM62L SoC supports wakeup from WKUP UART when the SoC is in the
DeepSleep low power mode. To allow wakeup from WKUP UART the target-module
device tree node is enabled. The ti-sysc interconnect target module driver
is used to configure the SYSCONFIG related registers. In this case, the
target module node configures the WKUP UART to be able to wakeup from
system suspend. The SYSC register is used to enable wakeup from system
suspend for the WKUP UART. Refer to 14.7.2.5 UART in the AM62L Technical
Reference Manual for registers referenced [1].

Other TI K3 SoCs configure the WKUP UART to wakeup from system suspend
using the ti-sysc target module driver. Refer to commit ce27f7f9e328
("arm64: dts: ti: k3-am62-wakeup: Configure ti-sysc for wkup_uart0") for
an example of this.

wkup_uart0 is not enabled to preserve the Linux console printing on uart0.

Testing
-------
Tested on AM62L EVM.

[1] https://www.ti.com/lit/ug/sprujb4a/sprujb4a.pdf

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
Changes in v4:
- Fix target-module label to accurately describe the function being a
  target for wkup_uart0.
- Update commit messages with the fixed target-module label.
- Link to v3: https://lore.kernel.org/r/20260127-v6-19-wkup-uart-wakeup-v3-0-e7ccac761f3a@ti.com

Changes in v3:
- Add pin definition to wkup_uart0 node.
- Link to v2: https://lore.kernel.org/r/20260106-wkup-uart-wakeup-v2-0-fb4cbd56c827@ti.com

Changes in v2:
- Change subject of commit "arm64: boot: dts: ti: k3-am62l3-evm: enable
  target-module node" to better match the code logic of the patch.
- Link to v1: https://lore.kernel.org/r/20251230-wkup-uart-wakeup-v1-0-cd6e15f8d956@ti.com

---
Kendall Willis (4):
      arm64: dts: ti: k3-am62l: include WKUP_UART0 in wakeup peripheral window
      arm64: boot: dts: ti: k3-am62l-wakeup: create label for wkup_uart0 target-module
      arm64: boot: dts: ti: k3-am62l3-evm: define wkup_uart0 pins
      arm64: boot: dts: ti: k3-am62l3-evm: enable wkup_uart0_target node

 arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi |  2 +-
 arch/arm64/boot/dts/ti/k3-am62l.dtsi        |  4 ++--
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts    | 15 +++++++++++++++
 3 files changed, 18 insertions(+), 3 deletions(-)
---
base-commit: 44982d352c33767cd8d19f8044e7e1161a587ff7
change-id: 20260127-v6-19-wkup-uart-wakeup-11c1c3d5b99a

Best regards,
-- 
Kendall Willis <k-willis@ti.com>


