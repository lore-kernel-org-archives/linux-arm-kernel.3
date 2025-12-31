Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DF1EE57C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 02:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=huVxmmfgNue09RFq5GHgJWJqyUp2DxbIRNDBJ3JDAoY=; b=k50ZXNeIVi3Sw9YmZuINzinGV9
	nuEIoDh3WCDAGc3r2Ez66SM1Y2wc4pLjw3yZKG9kidKkpaxnaedxhGuHcnyHAJ77GWwNOCWnyaqNq
	0VKNyC5Z4xHRtuAAzjFzaG/Mv8Ndng1dtyekxtTDsoBFwrpliuchhmLTtNjtQlBVuwtgemT8MdHCc
	N4EXsrEX9B3rGrtqfJGGpcVSmJTsX0bZkFEBbcq7vTQpjQ0ZLOLM1/ErqGmJhHRzv7tjXZfGG17bJ
	zbJix5px3bZ/C6hfvfl7lBXPm8tkM0N0xiUbo0B/aj4q14qlndmxlV1Z91oqrJ/ZEou+vr+BybjQg
	CHPXQJ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vam73-00000005a8x-0rmP;
	Wed, 31 Dec 2025 02:39:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vam6u-00000005a5S-2YE4
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 31 Dec 2025 02:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=huVxmmfgNue09RFq5GHgJWJqyUp2DxbIRNDBJ3JDAoY=; b=bsXZPcFlHsarbef6T83wWmQ/a6
	SY+WIpoWKlMl3kOSmVJx6a8cK0srw3QyZy4sy2EJab+qjnO4Xchkvtuh1jYtzk8JatsWtc1G2SsT5
	p/GN5UrvmeM+AFMsKB/ofaVvLrsQSgGCV25mSxPur/iTpxHakGGMWBWpOj/App4f5wGIflo2LiRHL
	CO1LB9DyWUscz/QR/ZJTBrxJvWkcexePjLlt+p6/GSe8sGnaiNwJOzp5tlkXLjai2jyvGLywwC6WA
	cXbwPaP5fpDfRwAOcFSm/2bcdOiIsblKA1z2acuI7NkRZYbPOU6f+xaAh3DGGL7qrj00RlLdHeYjj
	WyqppgBA==;
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vam6q-00000004JG0-2Phk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 02:38:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qjI2VFNNPcfOkFm2yA6J7aSY6tB3uBahgDW/9nzJ7DSsOnNyW/dqOLFdta67cPtySnH6VD1ifjQYNAU1quIcHX0csZUm9ed1QiSuiN7nX0+EUtxthjRS98qjGTGTv8cevxampgtRk2sMcMb5KZdq1nhAagysle2xZgoOFe+KQ24m31csY+EfztP09A3Iow/ARofQkYqlyuyiFApeZbuZfXH56pH7qeu6UEToASJSk8lRmOeyszFyZ3rSsGqbzGk6Obk0YKQYPvKEFGPNLfxjAAIPavLRsW4NmIuwDkR5I8KyMlNsL7cAoctY9hAQCg50pQlwsPR76YZBEvh0HM3E0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=huVxmmfgNue09RFq5GHgJWJqyUp2DxbIRNDBJ3JDAoY=;
 b=COxvLQ2HoPgCBWODSM3OBJ0VJl13RLHJINqFj+4HJ5mstyp5Soh+mXdkcDrI6n8LlvODuGUJ9xuNc3OvDyMabHNQ+J6suq7IT1oejUDE91mz/vMPB2GKmiJKRb+wpJv/52OL/T4ihyt+WUneF0Me4jICsF+4dPjhHAMwAriAgKVdDU5HBEwYnWn+As073cueUmYYOfTYRooo5mmj2LcY/fpf1VTXoIU0FSt22FrCQyJJevXlB+fs136EKBugENGT0PbmK9ge15GoCSWB1F/4w7MhyhLgCoZzR809AfzEZLkQISPG+CGNDfoxKp0GaG0mtyMS9EVUxtE+8XwjzGDq1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huVxmmfgNue09RFq5GHgJWJqyUp2DxbIRNDBJ3JDAoY=;
 b=m60NEXCaSNflPBzeBenr5085rcWfRJxaPLVf7NFPbe1UI3g2YUmymwJ0Kt3RBX5AK4xXI1EI3v+EyS6B1r9HafFOFTUFg0pHcaFhvzk/TOneRhVLfJEQO5i53H2v0f+iI8poEns8s+n48pzbsZ7hxD24vTTR3/OghCRm8O9YOls=
Received: from CH0PR04CA0047.namprd04.prod.outlook.com (2603:10b6:610:77::22)
 by SN7PR10MB6476.namprd10.prod.outlook.com (2603:10b6:806:2a3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Wed, 31 Dec
 2025 02:38:40 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:610:77:cafe::d4) by CH0PR04CA0047.outlook.office365.com
 (2603:10b6:610:77::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 02:38:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.0 via Frontend Transport; Wed, 31 Dec 2025 02:38:38 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 20:38:34 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 20:38:34 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 20:38:34 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BV2cXVC1704518;
	Tue, 30 Dec 2025 20:38:33 -0600
From: Kendall Willis <k-willis@ti.com>
Date: Tue, 30 Dec 2025 20:38:24 -0600
Subject: [PATCH v2 5/5] arm64: dts: ti: k3-am62l3-evm: Enable Main UART
 wakeup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251230-b4-uart-daisy-chain-dts-v2-5-fa5257ec54bb@ti.com>
References: <20251230-b4-uart-daisy-chain-dts-v2-0-fa5257ec54bb@ti.com>
In-Reply-To: <20251230-b4-uart-daisy-chain-dts-v2-0-fa5257ec54bb@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <d-gole@ti.com>, <vishalm@ti.com>, <sebin.francis@ti.com>,
	<msp@baylibre.com>, <khilman@baylibre.com>, <a-kaur@ti.com>,
	<s-kochidanadu@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Kendall Willis
	<k-willis@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767148713; l=1967;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=DVZ+3ox+QGUP68XqibpCGHjND7o5enwybX/DBu9Z2zY=;
 b=W9DLz8ZzTGILw46vFEW6X//CMFK+Dz0PzsUE4wGLBgw0hPFSSkJN7LJxjr87/kqJWxl36C5Rv
 hA51sdjXsdnAV/d0It8n+rBj2RSipQg59u3GupRSqCDidaN/0djJFQQ
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|SN7PR10MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c5a1fdc-814d-482e-ed04-08de4815b451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnZOeUduVFlnWkZsS2c2TW5yakppaU00T0JBOHdyS2kxL2JMTDJiNk5jYmpm?=
 =?utf-8?B?azlaUVQ1RjhOc3dzTEFYV2JQWGpsVHgxR3hHUnRmQUdhdzRlUkdyd2djS0dR?=
 =?utf-8?B?aHJaUXhLSGRLeVF2WE5uc0xRNUcxVFQ0RDB0NUcyUDdmYnlRY29tWjdpRDBO?=
 =?utf-8?B?Q0FFcEVXT2pUcDdEOUoyMHFyd2xiL3g5M2VzUERvck52bTlLMEhNUURHUGlX?=
 =?utf-8?B?eWQ4YUErRURyL3krb29BQ1RwalNBa2ZZWGZXZXVqVjB3WGJpVEo1aXhwVUJu?=
 =?utf-8?B?c0ltVERRZ0NINWlzeEZXVm0valVlWkZtSmM0MlNoell2L0RQT3UvYzU0WTZj?=
 =?utf-8?B?Z2gyV1VaTDJKZEVpNDFnVHViRmNQeVZvaW5RS3RrUXU4dVRVZHlmRk5ndnZV?=
 =?utf-8?B?dUltSUpVTnhXZ3Z4Nkg3cXZoMVE3TnlwRTN0OG1Zc25mOE1aKzdMd05ib0o1?=
 =?utf-8?B?bG0rVGlJZ0pCTEx6cUc4d1B3WUltNU9KckE1OGp4ek0rbWFGYmtYbzdvZ0VW?=
 =?utf-8?B?UHU0LzlGby95MGd1aUF3M1R4eG5EL0prS3g5YU9FMUR5QWhTZWR6ZWV6VTJn?=
 =?utf-8?B?Q0dhZFQ4WU9FTGxOTWNMU2JoZ1ZBa3VYZVltSDhscHBNdkxibzBZS0ZaNDc0?=
 =?utf-8?B?bS9sbDBYcnpqTFVtR3VWOW1oQjh4a2dFRkhyRkxRMHUyWTQ0U0pBblRtOFlL?=
 =?utf-8?B?SmFXYVBhNzNRRFF3OWFFZXF3MmJYcUJjNThVYklmQW9CQWlMb3RHRE9IVkhQ?=
 =?utf-8?B?V1N0c1lRcmFXb1M1WkxnMUwxYjh1UnJqQktVcUJ0SW56a0I4U29CRUNuZS9H?=
 =?utf-8?B?SFVDUG4wZDNuVmgyazNsWGNRalY2MjNPcDFzRHBLLzRqbXFmN3NJRDdFTUg2?=
 =?utf-8?B?NzN0U010MytFWDBDTGdXOXpzRzdBWVpDanFyallRdmdrVHpISkZ4c1FxMGVW?=
 =?utf-8?B?MzZaeXcrWWVycEExOEk0czZ2QWN1bHI3U3JOd3dNQ25EeEQ5K0Y5RGtpTkJX?=
 =?utf-8?B?NGw1V3JBVVRVZy8wNzdhN3RqTXQySWFKbk5nSUxXWkpsek5yV29RcUNDYXVV?=
 =?utf-8?B?Z2h1SkhUNmZxM0pLR2dxUXp1YVBaVnpaUmgzOUR6VXNTSXdOTU41UEZhTlJH?=
 =?utf-8?B?WGhReFN0anB1WmZId3Z5d1BqZFZQR3RaNGdlQjhpMFpVdVk0REZUVXJrRHVJ?=
 =?utf-8?B?OGxtdVViOHhTQVY0S1BHUnM4YUdETkNGMUwrVDQ4YVgxcU9YMkJkOTBZcmkx?=
 =?utf-8?B?NkJTODRwNkNjdjF5UUY2N2NCRFkrL2RnUllvdE4waXMvZng3UUo2dy9qNXQ4?=
 =?utf-8?B?ZDdqSW5oVEZHRm8ySFByQnFacEhtNmFRS01wSGI2NVlQOTErTUdKdU93WmdY?=
 =?utf-8?B?ZlNGbEVKenhiTGQ2aklSZzZYWlNNYWZxMHN3MDlzcEp6QmMwWWVSb1kzd29p?=
 =?utf-8?B?MmFTL3RSVDRSUDlYODBQQlh4dlVGT2JYMHVCTTJDbnFNcDdZM2wxcU5CUDNy?=
 =?utf-8?B?RGlDVXJ2YnF3YlFJNkhaaTZrNmhOcVFVQWVHLy9zQlJkYW95MisxL3NtbTd2?=
 =?utf-8?B?SS80YUdlejhqWVlNMExtbTJQemVvVHRxVlhaOGhJdzU4OGpWeE9XK281Z1pr?=
 =?utf-8?B?Ym1TcHJ2cWd1ell3STB4Mkh6T0tJc0oyZzZ2V25mWDBGSXlNS0xLY1pBMkxk?=
 =?utf-8?B?VTlTTWRjclBPRm96Z0dtb3Y2MDhEdUlycWRTTXdmeGRNOWUrWXpRRmtBeTAw?=
 =?utf-8?B?TkFSTndyeGJTbkorOXFTUmNZVTF2cERvUTU3UTg1azBKZXNKTmp3NThKREZZ?=
 =?utf-8?B?YWdiaTNGS0l0Q2U0MUJvYTRyM2Z3Nzk2WVo1ZHRaQWRqMUhMNHppS0g4SUxp?=
 =?utf-8?B?M3NmSXBzUWQwSDY2bWk2M2ZnS1B3R21kelJOaUJieXZpSE8zUnBRWXpCWmxJ?=
 =?utf-8?B?VTlNYlhZcUxDTVdub2t2dVY1VGovODg0Z3FnL2JiSVJXNEYrK1NxejZvMERR?=
 =?utf-8?B?Z29rQVBtZllZV3ZiZnBRanBTbXV5Q0pRc0o1SWZzaml5N3M2QTByaEo5ZnJR?=
 =?utf-8?B?V0tqZ2RoSEhwNTVCYmVjVm0rT1gvVm5hWHBxbzV1R3I4R0RwR1l3bTlUSGRu?=
 =?utf-8?Q?By2w=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 02:38:38.9004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c5a1fdc-814d-482e-ed04-08de4815b451
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6476
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_023848_911160_6101B50C 
X-CRM114-Status: GOOD (  10.52  )
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

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
index cae04cce337366b50928d39b0c888550b14e43d3..911719278e7191d96a886ce1e818f98085dd5d67 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
@@ -280,14 +280,26 @@ AM62LX_IOPAD(0x0234, PIN_INPUT, 0) /* (B6) MMC1_SDCD */
 		bootph-all;
 	};
 
-	uart0_pins_default: uart0-default-pins {
+	uart0_tx_pins_default: uart0-tx-default-pins {
 		pinctrl-single,pins = <
-			AM62LX_IOPAD(0x01b4, PIN_INPUT, 0) /* (D13) UART0_RXD */
 			AM62LX_IOPAD(0x01b8, PIN_OUTPUT, 0) /* (C13) UART0_TXD */
 		>;
 		bootph-all;
 	};
 
+	uart0_rx_pins_default: uart0-rx-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01b4, PIN_INPUT, 0) /* (D13) UART0_RXD */
+		>;
+		bootph-all;
+	};
+
+	uart0_rx_pins_wakeup: uart0-rx-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01b4, PIN_INPUT | PIN_WKUP_EN, 0) /* (D13) UART0_RXD */
+		>;
+	};
+
 	usb1_default_pins: usb1-default-pins {
 		pinctrl-single,pins = <
 			AM62LX_IOPAD(0x0248, PIN_INPUT | PIN_DS_PULLUD_ENABLE | PIN_DS_PULL_UP, 0) /* (A5) USB1_DRVVBUS */
@@ -328,8 +340,10 @@ &sdhci1 {
 };
 
 &uart0 {
-	pinctrl-0 = <&uart0_pins_default>;
-	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_tx_pins_default>, <&uart0_rx_pins_default>;
+	pinctrl-1 = <&uart0_tx_pins_default>, <&uart0_rx_pins_wakeup>;
+	pinctrl-names = "default", "wakeup";
+	wakeup-source  = <&system_deep_sleep>;
 	status = "okay";
 	bootph-all;
 };

-- 
2.34.1


