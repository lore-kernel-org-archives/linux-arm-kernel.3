Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769C7CAC59C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 11:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AJ/33KwMAb2iDHxYHEy5edlwoNppIfJiQ7Kejq9MqE=; b=UK+TBMOS0x9N6Z6b3lJ2o05pmy
	HBjFBANAxJdHdt3mT17wnKeNBFFeDv0NFDR4LHpUu2IFYLTY9b0iP719LEFm29spb6O+DZn5iGmax
	jPG+fXHic46qZ747GvcwsB4zh1Se/g4qmM4utj4d7IBmAwaMw/zzg/kBGkQ/3VN4VLrGk5Tdenq1K
	pCBkNqe9NzMP6Da7cJ/j1/rfD2m38NwvCdP184w5dp0JDLJUUjVedAUAgRunNcPx7zc0NKOX7TOoN
	zkLc+oa1UQIAiSVakt876akbTe35o9oC9FUgeyvETncwaH2d2St9jjq8b6D/VGMS0+0gdw1ZRtd48
	wPwfNlYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7ob-0000000420S-1EqV;
	Mon, 15 Sep 2025 11:56:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7oU-000000041wZ-1uCt
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 15 Sep 2025 11:56:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5AJ/33KwMAb2iDHxYHEy5edlwoNppIfJiQ7Kejq9MqE=; b=UV3k4GFwMxgO3M8gAY9AimuTwp
	HeYLwqP0j0QqdnhXKSbssAsxNJbAvPihXqKtlZFf2Kio9qFWEXNHkXqNvyGmT4hf6mXKKsTP5KiGa
	ue07/2zhGgnoRbdswTyImEijYrKZD60rm3Txxng1A1G1bmz51sIsDQpqWiOQHZkII+h9aK50H24/A
	rkQIGgVedVw7O1BXp1bl0iZFGOy0pIrU8wzoA9qf+tJCN9UVR4r5lEF0+KONZqHvBgyQ1regiCExC
	7v4MdpE7uT4IEJnSBGqfoQmY8LWL21VlD4KEFfl9Ezcw8wy3hEVuSCrxMn7qYtPOy+4ko+aVYVx/5
	QfEYRcOg==;
Received: from mail-vi1eur05on20730.outbound.protection.outlook.com ([2a01:111:f403:2613::730] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7oQ-00000006xdm-2ZCo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 11:56:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zN3aEkaoUzkQJDJXr+x1hJLXt031m/Vg0jLV3lLKT3S8yGhOfqVYXhO6KU35MXBGPIKYBc5rixgfTSEW1IcvIQUXi2M6Vla1/PneLml1hbcnt/cB6RrwuRKW0dUcvzXefRNmR5mJ7HfVS9y4VuaBCfINtZGCeMVpXx2kakW6YxBbhxGGHxTQN09b8AUyRV5yGc48Bl4AqehCc5NhkJi2N4v8p884QG+luGM+AixuqZRY+Um+60pjP0wWy5tghhsLrIJNbIjiyB77dCjNe+U2C+9yybpooNCgrOr65rVT7ZIVHq+0x1ZJgMs9bpuF5B0sNHPxxDEPomEkKUKL95GBQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AJ/33KwMAb2iDHxYHEy5edlwoNppIfJiQ7Kejq9MqE=;
 b=P1DttFDQASw5AJ57H56Iqc0xSF+5huD0QqNNh0bNVapkx9hosppzDBQkJdiWjdgxZHuGgJEb2QZmECvPNo/ejSMnWyXtlBcgd2izekbqZ3LBq73SaIM3CdCgNP3M76/eQ5Zu/K/nQRpF9bVjZknDUJnuMqgcTBC81QyRzTOfGzV2QfeDcM8I+XYsYWKLWUWJ1L3UVtGN7XL9faoDkQ0wb2BZtfckEuObdmeC7Mjf4oODEercrP7c6Vp2tcN3K2BIXSdYlvOCP51TESGoth1GS4IRKUFFaTBx8pf/yWxub2K412YFyZlp4FvXE/JvwfShtTUzhKpO7Vp+ypmEoI++Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AJ/33KwMAb2iDHxYHEy5edlwoNppIfJiQ7Kejq9MqE=;
 b=bvBUfy5IRiIIVoSPLPBVl92YY1kU+6pGk8iIDxEMEZInvjXkYZ9M/sh1HThnxM3efTodxBUxmtL9U619sr3MfjPJsx6NbzIUxlM40W3oNCYjS/byyYVIKgLnwCrWOKxaO4LGMUwwahy/d6Eda6h/5+H/JGpwWVW0aCMiRLIGYsgAkYeF4tiEU7saIEKgtollB615+gf0O5OvS7ZKPW/z655xQnObz3PkqRjIDH8njJM4gdJ8j9MCbugkQLVjs/WxZ2qk9toh4YnOtGN2T9300sK7W0fsHcBQAGh4JWUdvL0hU2SKsFplm3C923p/yFMQLdEFcq6AzHIdFq7hu6jViQ==
Received: from AM0PR10CA0092.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::45)
 by AS8P195MB1157.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:3d0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Mon, 15 Sep
 2025 11:55:53 +0000
Received: from AM4PEPF00025F9B.EURPRD83.prod.outlook.com
 (2603:10a6:208:15:cafe::d2) by AM0PR10CA0092.outlook.office365.com
 (2603:10a6:208:15::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.21 via Frontend Transport; Mon,
 15 Sep 2025 11:55:56 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AM4PEPF00025F9B.mail.protection.outlook.com (10.167.16.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9160.0 via Frontend Transport; Mon, 15 Sep 2025 11:55:53 +0000
Received: from Postix.phytec.de (172.25.0.11) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Mon, 15 Sep
 2025 13:55:52 +0200
Received: from llp-moog.phytec.de (172.25.32.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 15 Sep
 2025 13:55:52 +0200
From: Yannic Moog <y.moog@phytec.de>
Date: Mon, 15 Sep 2025 13:54:35 +0200
Subject: [PATCH 1/3] arm64: dts: imx8mp pollux: add display overlays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250915-imx8mp-pollux-display-overlays-v1-1-59508d578f0f@phytec.de>
References: <20250915-imx8mp-pollux-display-overlays-v1-0-59508d578f0f@phytec.de>
In-Reply-To: <20250915-imx8mp-pollux-display-overlays-v1-0-59508d578f0f@phytec.de>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<upstream@lists.phytec.de>, Yannic Moog <y.moog@phytec.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757937351; l=7257;
 i=y.moog@phytec.de; s=20250509; h=from:subject:message-id;
 bh=U+IX9tOKpC7rpeI9cV3EVgSNIt3ZiM96jNVeiUuiLa0=;
 b=QjSc1whYTATpxqblxLikH45yhcjkWOx/fWH/TTm5lpuTtGlPYaEyPBq7VDXuyUgq8/q8gi9cq
 IsjNLOnnyX4A4zQ0a6TbgDGhKpCg7LXHeFaZcvRxdPVAhRCyHi7NZjY
X-Developer-Key: i=y.moog@phytec.de; a=ed25519;
 pk=rpKoEJ4E7nD9qsrU/rfKVwMTWNWYaTBylZuJUXUiFr8=
X-Originating-IP: [172.25.32.51]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9B:EE_|AS8P195MB1157:EE_
X-MS-Office365-Filtering-Correlation-Id: e12fd762-fd21-4245-4322-08ddf44ed26a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U08zM3lVTlI0U1laRzlILytpZFF5WHNaRkd3V0tMckRDQytLaGxVYzhiL0lv?=
 =?utf-8?B?T1dGVGNUZUJuQUxxOFl2V2xiVkp3RE94Yy9PVERXNUNYWDZTQU5qNytIdEF6?=
 =?utf-8?B?SVRkWFZNQUY3OWRuQ3BrVDhaVVY2bU43TzVOU1QvazhVYVBKbEtkdmhWdS9P?=
 =?utf-8?B?RWZ5cXRHSlVDaXpLK3dQYU81ZkdjSU12YlU0UjRNWmZvYUUzVVg3NUJjTFEw?=
 =?utf-8?B?eU5SS08xaXp3RWJONVZuTlZEZVN3dkdtMWM2YW1qZFdibUZRRHF5N2thR3dY?=
 =?utf-8?B?TzlQNkJSbVNHL0JpMTFtZTJUeDB5NC92Wm5qcm0rQkNjczFtTmJkY2ErbHE2?=
 =?utf-8?B?NEx1anFzS2xETEFqbzBuaUtqaWltZUZoMkJXaVY0aUZKL3FSQWtCNnpLU2Zt?=
 =?utf-8?B?K0RwM3o5QUsyejNMNm9jcmhKWVhCL3lMU0FvR0Q4QnFSME4vdXZyZGJlMzht?=
 =?utf-8?B?elRlMEtnWUs3akxDSFp0VnI4ZjAvV2QyQmRxTjAvS1NtQlVVU1k1T3NaOEow?=
 =?utf-8?B?cHVqbGROZEs5VW9kMHVxWDdvSXpENlY5TkdVMXlMQnZFQnBmc2dnM01lQkxR?=
 =?utf-8?B?NkI3WldrMjkzNTVCekJ1WVRGNldGQlh4Vnk3MnlQMnUrckNPSWN6cGluZzZv?=
 =?utf-8?B?UXEwV0JLRXVCbDdsNHRBZ3pWLzdhNTU4QnYvOFNjaUo2Ykd5QlZWZ2cxcGNl?=
 =?utf-8?B?ckxsY3RBbzd6dXo4alRuaVZTZGRkSzQwS0hQdmRncXZOL1EwTEVqakh2Y2NU?=
 =?utf-8?B?MVkvVC9hVjRaL3JmTUdXaitHaXFwYXNSNGhLQm9NKzhCVlJwbThmSU5NOVJ1?=
 =?utf-8?B?blJmWUIyUlQwQzAyVktiNGZ4NnQ5Qit5UE02SjBqT29lSmpMR3NCeHNYcUls?=
 =?utf-8?B?aThCb2t5LzJBM2l0QUM2Ukt1ckVpYW5SSllHaG8vc0hyVDNjRXVZMUxLeUJH?=
 =?utf-8?B?amIwQTVBZnJ2ZDFORmthS0lNdHhrN202TEQ1MjVHOVNvSFNWM0U4Y3lMY3B6?=
 =?utf-8?B?OEUxMUkrWGh5OXZsWVEva2FuS0tKMGJpVVAyQ0Nqb28zeklqdDhmRVhydGN1?=
 =?utf-8?B?K0w1cWpMZ3RYS3ZCSFNqMEd5QnNJbXZBYmh6R0hsL1Y5aWdjUHczaWNmL0l6?=
 =?utf-8?B?cmhKTHNNNnBseWRkdXpBZTkxOG9KN0NuQTZOVVhPOTNZQ25aS2pFMjdEL3Rw?=
 =?utf-8?B?OVdxR25Ec0RqUUIvc2M4STVrRHdYQkNWN2VpNWduVU92ckkyR0h3ekhNTUJ3?=
 =?utf-8?B?WWxhVkpwWWcxcmVadzRuRitJbFRyL1NNSGxrUmlHaG54cGY3aWJVYmNtem4r?=
 =?utf-8?B?Mm01NjJZZWtRRGs0SkllMkd4Rkk5QmJmOE5OOGJMb0UzemNyQ09nK3lKU0I4?=
 =?utf-8?B?bnoyREdhZ1JOem1FdjY1Y3RqS0xPUDF2V0lPVGh5K2w0dlRDa1l0NTJmTExJ?=
 =?utf-8?B?dnNZS2JkWjRza3hSRDA2N0szbE5FdkZuL0VRWXYzb0VnSm90dDZSWGVDOXVm?=
 =?utf-8?B?UFVsRkNFZGs0Yk1YeGNyeGZxRFNUTnkwMWZBNzREaklYNEpBNHhyL2lSRFBy?=
 =?utf-8?B?R0szOGlPb1FrVjJWR09OZ3NNVC9pRk1nWGZ5QmdEMWpZU2RiVndzeGJsbFQy?=
 =?utf-8?B?UmhFREI0RHFMMWRvRHRXdkw0K05NeUsrcE9HdFovOUVXOEl0UTFIa3pGaXNG?=
 =?utf-8?B?enZUYjVpL0lMSi8vbXNHOUVIOFc0VHp4SHpTNFJPZzNDL3lreUZ2QzN4UzZu?=
 =?utf-8?B?M3JDOEM5M1F3NVk4ck1hcmpiRUZJWjVUYkxnUnlWd0x1UTNxMStWcXZqNVpT?=
 =?utf-8?B?VEwzWGhyQVpMaHpOcnlzSkltOG8ra2s5MjljOEsrTHhJdTdaQ0c2Vy8rT1Mw?=
 =?utf-8?B?T0I5Mnh0UTRuV0xCNmowWHczaVdUZFYzdTFnUDA0d2l1aldTM09ONnpybS96?=
 =?utf-8?B?dW90QllocldOOFpvWWU1Q1pwSzlyeUJiSk15ektzNmxYTDVZRDNBZk5TRHFQ?=
 =?utf-8?B?WHhibW5KcmlLTm83dlNtMldPdTRtcDlVeDlMOHcyOXhRc0dmNTViQkYxcGlI?=
 =?utf-8?Q?yH1ecG?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 11:55:53.0832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e12fd762-fd21-4245-4322-08ddf44ed26a
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB1157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_125602_838885_05D28D74 
X-CRM114-Status: GOOD (  14.36  )
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

imx8mp-phyboard-pollux had a display baked into its board dts file.
However this approach does not truly discribe the hardware and is not
suitable when using different displays.
Move display specific description into an overlay and add the successor
display for the phyboard-pollux as an additional overlay.

Signed-off-by: Yannic Moog <y.moog@phytec.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |  6 +++
 .../imx8mp-phyboard-pollux-etml1010g3dra.dtso      | 44 +++++++++++++++++++
 .../imx8mp-phyboard-pollux-ph128800t006.dtso       | 45 ++++++++++++++++++++
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   | 49 +++++-----------------
 4 files changed, 105 insertions(+), 39 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 23535ed47631ca8f9db65bec5c07b6a7a7e36525..805ab9e5942bc9e2b9776e92412f56e969b6b39a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -218,7 +218,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-navqp.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-nitrogen-enc-carrier-board.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-nitrogen-smarc-universal-board.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk.dtb
+imx8mp-phyboard-pollux-etml1010g3dra-dtbs += imx8mp-phyboard-pollux-rdk.dtb \
+	imx8mp-phyboard-pollux-etml1010g3dra.dtbo
+imx8mp-phyboard-pollux-ph128800t006-dtbs += imx8mp-phyboard-pollux-rdk.dtb \
+	imx8mp-phyboard-pollux-ph128800t006.dtbo
 imx8mp-phyboard-pollux-rdk-no-eth-dtbs += imx8mp-phyboard-pollux-rdk.dtb imx8mp-phycore-no-eth.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-etml1010g3dra.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-ph128800t006.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk-no-eth.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-basic.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-hdmi.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-etml1010g3dra.dtso b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-etml1010g3dra.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..713d65b0fb32a57bd566929a5f67098b3fe43963
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-etml1010g3dra.dtso
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/imx8mp-clock.h>
+
+/dts-v1/;
+/plugin/;
+
+&backlight_lvds1 {
+	brightness-levels = <0 8 16 32 64 128 255>;
+	default-brightness-level = <8>;
+	enable-gpios = <&gpio2 20 GPIO_ACTIVE_LOW>;
+	num-interpolated-steps = <2>;
+	pwms = <&pwm3 0 50000 0>;
+	status = "okay";
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>, <&clk IMX8MP_VIDEO_PLL1>;
+	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
+	/*
+	 * The LVDS panel uses 72.4 MHz pixel clock, set IMX8MP_VIDEO_PLL1 to
+	 * 72.4 * 7 = 506.8 MHz so the LDB serializer and LCDIFv3 scanout
+	 * engine can reach accurate pixel clock of exactly 72.4 MHz.
+	 */
+	assigned-clock-rates = <0>, <506800000>;
+	status = "okay";
+};
+
+&panel_lvds1 {
+	compatible = "edt,etml1010g3dra";
+	status = "okay";
+};
+
+&pwm3 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-ph128800t006.dtso b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-ph128800t006.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..68975f0f3d84b5c29ee3e4e8815ce0d03ea19860
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-ph128800t006.dtso
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/imx8mp-clock.h>
+
+/dts-v1/;
+/plugin/;
+
+&backlight_lvds1 {
+	brightness-levels = <0 8 16 32 64 128 255>;
+	default-brightness-level = <8>;
+	enable-gpios = <&gpio2 20 GPIO_ACTIVE_LOW>;
+	num-interpolated-steps = <2>;
+	pwms = <&pwm3 0 66667 0>;
+	status = "okay";
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>, <&clk IMX8MP_VIDEO_PLL1>;
+	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
+	/*
+	 * The LVDS panel uses 72.4 MHz pixel clock, set IMX8MP_VIDEO_PLL1 to
+	 * 66.5 * 7 = 465.5 MHz so the LDB serializer and LCDIFv3 scanout
+	 * engine can reach accurate pixel clock of exactly 66.5 MHz.
+	 */
+	assigned-clock-rates = <0>, <465500000>;
+	status = "okay";
+};
+
+
+&panel_lvds1 {
+	compatible = "powertip,ph128800t006-zhc01";
+	status = "okay";
+};
+
+&pwm3 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
index 436152308642270c320e3ae3b21b9e46b923c043..e96b6faa6e0364231b1867b5d282264e4867e755 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
@@ -8,7 +8,6 @@
 
 #include <dt-bindings/phy/phy-imx8-pcie.h>
 #include <dt-bindings/leds/leds-pca9532.h>
-#include <dt-bindings/pwm/pwm.h>
 #include <dt-bindings/thermal/thermal.h>
 #include "imx8mp-phycore-som.dtsi"
 
@@ -21,16 +20,12 @@ chosen {
 		stdout-path = &uart1;
 	};
 
-	backlight_lvds: backlight {
+	backlight_lvds1: backlight1 {
 		compatible = "pwm-backlight";
-		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_lvds1>;
-		brightness-levels = <0 4 8 16 32 64 128 255>;
-		default-brightness-level = <11>;
-		enable-gpios = <&gpio2 20 GPIO_ACTIVE_LOW>;
-		num-interpolated-steps = <2>;
+		pinctrl-names = "default";
 		power-supply = <&reg_lvds1_reg_en>;
-		pwms = <&pwm3 0 50000 0>;
+		status = "disabled";
 	};
 
 	fan0: fan {
@@ -43,10 +38,11 @@ fan0: fan {
 		#cooling-cells = <2>;
 	};
 
-	panel1_lvds: panel-lvds {
-		compatible = "edt,etml1010g3dra";
-		backlight = <&backlight_lvds>;
+	panel_lvds1: panel-lvds1 {
+		/* compatible panel in overlay */
+		backlight = <&backlight_lvds1>;
 		power-supply = <&reg_vcc_3v3_sw>;
+		status = "disabled";
 
 		port {
 			panel1_in: endpoint {
@@ -232,32 +228,8 @@ led-3 {
 	};
 };
 
-&lcdif2 {
-	status = "okay";
-};
-
-&lvds_bridge {
-	status = "okay";
-
-	ports {
-		port@2 {
-			ldb_lvds_ch1: endpoint {
-				remote-endpoint = <&panel1_in>;
-			};
-		};
-	};
-};
-
-&media_blk_ctrl {
-	/*
-	 * The LVDS panel on this device uses 72.4 MHz pixel clock,
-	 * set IMX8MP_VIDEO_PLL1 to 72.4 * 7 = 506.8 MHz so the LDB
-	 * serializer and LCDIFv3 scanout engine can reach accurate
-	 * pixel clock of exactly 72.4 MHz.
-	 */
-	assigned-clock-rates = <500000000>, <200000000>,
-			       <0>, <0>, <500000000>,
-			       <506800000>;
+&ldb_lvds_ch1 {
+	remote-endpoint = <&panel1_in>;
 };
 
 &snvs_pwrkey {
@@ -282,9 +254,8 @@ &pcie {
 };
 
 &pwm3 {
-	status = "okay";
-	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm3>;
+	pinctrl-names = "default";
 };
 
 &rv3028 {

-- 
2.43.0


