Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25557606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 02:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b+Y/Q/cb;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gPb+mdRB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ceRYP0OelVRJ9SFORvSCvMehcm1afoL5IOyNDLqXJ7c=; b=b+Y/Q/cbUdk1MQuMyuJ29L6wqg
	D0aNkXhhWOmcAEICXpTtP+Ni8LokkKDc5RICIkjxEiHOEuNCRl36jb23CC07/3YmUot1nH7nr0ck2
	kobREdt71DU0UmVzLdLGSzJ/dcnl9j4kvPvQUjhMYqcupyEuwrOX7BMzx2q5H4JE1rtQCZfGvhY6M
	PiNnGLBQGLh3jGoYhwBy35AAuDEUz+ukKxu5ct30ypMYZ81ds8fw6Dnoiotd6Kh/CEhy9X3m7f0eg
	lnykgGg5yfu7r/uivC0tMo+ScC1FawJtlrR2cX66ZgtaqxY8TD28+sPIXgCFzfwytpbrMc8CI9XCN
	dQNgvyWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5OX-0000000FLwY-3XHq;
	Fri, 23 Oct 2026 02:52:37 +0000
Received: from mail-norwayeastazon11013028.outbound.protection.outlook.com ([40.107.159.28] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5OP-0000000FLtS-3VJC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 02:52:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGMmxNIQhIinP9RRiMFFvbUOOb6yzxthlRtyIYbpdJc2nMbnL26nXvwK8ngKND2jAlj4URWiOUcKc83+HezluhPPD8gocQlOkrV0/nzWXlOCu3Bs+l9jVn/jyglTPH03YFWb5A6kO9hfrohaGbwDG00LYZUQHHrTOXD/NT6a0+uPm9kvF07OFg9o6S0z5YIzEJ1EU4FL7dotxNi4DcU62eInlWW/doNP07wNdbcRZv8vpDhxohwS66gQhLYbKMumY2A+Iux1mXFgjZYa6YPzvTjSXgq99zcAHusZXPPZRhzeZMkSA6om0ryhOtdqdP4xU6RVN9wnHziyZjFt0eB8kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ceRYP0OelVRJ9SFORvSCvMehcm1afoL5IOyNDLqXJ7c=;
 b=UyL0tJP2CX3ANfNOHNXAtpJfmqeYPlipkEZ2icpCarsU9kJfk6NDYcB5grnRdOIE6Fwt2QPfM3iaEBY/e53VXRjY062dXoKoQg7HgmTghL1eXVLXAQx/AueLe5rJXIoaEBlXH/cd3V1OcQQl1ArMBADLV/Oj0gxTFzrB5bIpn2llzZWQdqs2DNT5qG/0r6NiuQAkXzC5g4dwslocTgdgDb5a8blScD4xdDpOPKN5i0Vlkb2X7hkJguvkX+Nlfw2i/PltPCNwJq3vSMzsRSB4EfQQi7TyCOfxehXzc2ujK2i8Y0Td9G/SchIMKfMRfWxExTuyilXpPerOMwczN0tpcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ceRYP0OelVRJ9SFORvSCvMehcm1afoL5IOyNDLqXJ7c=;
 b=gPb+mdRBiDKOOgM6HX0xW0k7hten9H4fvj8pRgXWI8MJboVcceFWKur9MxeTl6IP2S3DYGGdFSObf/P/uvBlkREVXDYX980XKWkFCGfskw1JJhn9jbIX3uynXh8kVJC1AwjbmbKduhpTxtPQBOvkVIEYigNAhNxJDMqXznAmb/Loql5HXAbJL6XmZAlVIiU5ew4+uZecY7utL8yw3O1cjoVewiTMrJbFvEBro6/OQ6ylLFO2tRVvmzwKzwRK9DpQQp8KOfgK1pq7r4JrIXmhqouKkzlz2HqEHYvBU8E+SM31aCNNpdg7C5SmCwmiMDzJe3h9TKaDcZrco6F2SSO3dw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by MI9PR04MB185402.eurprd04.prod.outlook.com (2603:10a6:290:bc::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Fri, 23 Oct
 2026 02:52:26 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.016; Fri, 23 Oct 2026
 02:52:26 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 23 Oct 2026 10:56:59 +0800
Subject: [PATCH v2 1/2] arm64: dts: imx8qm-mek: Re-enable A72 cluster after
 ERR050104 workaround
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-8qm-v2-1-a8812a888e3c@nxp.com>
References: <20261023-8qm-v2-0-a8812a888e3c@nxp.com>
In-Reply-To: <20261023-8qm-v2-0-a8812a888e3c@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI3PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:295::6) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|MI9PR04MB185402:EE_
X-MS-Office365-Filtering-Correlation-Id: 093509d0-6617-43db-82f3-08df30b0abf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|23010399003|1800799024|7416014|22082099003|18002099003|261022105027099003|11063799006|261009223027099003|261021123027099003|10067099003|261021121427099003|56012099006;
X-Microsoft-Antispam-Message-Info: K3y8/J/GgLn+ohcsboiD3sdxrO8hUxgPap8ZQ92vv/AN326Qgbvzd7Q/u4VANqPzqNfPX43P38gKcDoPdeQdwHIISIxdGykl1decJXQSCe+MjzX8P3BYouczfqvlLYBLvxsTgIIGAzJSr3Zi8gop2gRYYz/suMwowVmtrBXpzv1kMHa6lAsWhfQCaoaIDOERO3PtPekNPiqDbPcP8YM+0yW2hCx/6hUPuZC7HdWWgfABC4r2Bdya0YVymOa3fU1rSSANorERm8x5NHtV1nQQgjlMXE6VVWUVQIPgfi60h0FYbdblXvMqtx9L3eZlkZentv8hY/29F6vNKLK+u05fU6KWwdcTjniiQm3uCwTEEX4x/JXDguqwSmTEs2Xu1zVQU9y2HNg5HDTmdGuHLXVCWeLtXeCEQVzB9ld+nkWvAyw4w5Mk3BLv4EdlijhY5P7LPFeNfMWlK0K3JNVnWMlpRNK5d+5VElrXBxL7T2flrpMOdiIi7DPxZeQk0AwoJHvUFn/EtQ/BBLI+ZiWIMT74bitnQ/sIXWGd0s+uDmygjwT+VFy/XgGOf2c38AGOA5GoGqDtyuQnXCzUkF7VIF8Z6A0fCYmzYL3/Y+xHk/Sf0GMKrB56+s7AK0g+h6q3RnSh7XYU48Tb5vFhXzgulw34r25NH4VPPR080ED1PxyWZYA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(23010399003)(1800799024)(7416014)(22082099003)(18002099003)(261022105027099003)(11063799006)(261009223027099003)(261021123027099003)(10067099003)(261021121427099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTlLTmlZMkRCVVpMeitMSlhOOFptWkFBYldLWU1jbUJKeUlHZjhueXNlZFpq?=
 =?utf-8?B?ekloRkpPK3JVeWl4a3R2WWM1ZHRVU1NVMTcrUHJGcmdmUVNZQ0toYWVROTNS?=
 =?utf-8?B?SXUvNU1Bcy9udGtxb2tBU240ODhWanZKV3JRY0xwMmRYVTEyUjRFSnVwd0x4?=
 =?utf-8?B?UUJ2Nk1qcG5sejBKVlo3NlplTzdjclJXVnI5SDFlZ3dCZHQ1bmg0TStyQVVJ?=
 =?utf-8?B?V2dhNTd5MWVxM1JCdm15KzUwaFo2Nmh5c0gxWk1vejdkTnYrZ2xtZzg2a1dW?=
 =?utf-8?B?QVgvWVJKUHlIUzJJSVI3V0tWcWZPbmFzaXgvbUpINEw3NGpJdGc3a1FHVFlx?=
 =?utf-8?B?cnBmRmt2TDVWcDA2SUdJa2FSOXNyZlF2M05uQ3lHYTdEUnh4czNFZ01aQTAr?=
 =?utf-8?B?eUwwbFBCZlFlS0lQRSthVXJHQm9MbTZaWkJ2N0ZtMEZ2NmpSbk5telZ2V0tK?=
 =?utf-8?B?Yy9nVXlUbjJ2NnlwUnJBNTZMNWlXSVdYbEptVDBMSk9iUGNPQUpMdkhIUEIr?=
 =?utf-8?B?RlhtZTRLVnY5RVJxZWJlVEc1OFo5TmVDSThmR0pUTFk2QkxheWsrdlFCV3J4?=
 =?utf-8?B?eVZGb1M5Slg5ZWpTa29MbW5MVE1udzhXYzhvWGprOGM5dzAwUmJ2bzUwMkMx?=
 =?utf-8?B?aWt3T1F0TkpnOFpRVGRSc0hmZ1hGTjZJenlncUhQSlBKcjEvUzU0QTZIaURp?=
 =?utf-8?B?N0hRKzZ3VHl2VW1uZDlJeUxQMytvYStqNGVuWi95SmZJOUZHTk16TUlmRkl0?=
 =?utf-8?B?Y2VFbHhoanNpWUliWVY5L04xUzAyUTN0WVZHZWYvenl6azN4TmR2cHVYVmdo?=
 =?utf-8?B?VUJ5Mm9BUnJlTWRIeU1rdFVVcWVHRm93M3ViUnVQRnJRK3NHQWpBVndFd2Vs?=
 =?utf-8?B?UUk3cW05SlE0YWxIbDByQ0lrTHhOcHVSb0V3bTVNMEowc0RkbDFvcXA2VkQw?=
 =?utf-8?B?aWFJWG1FYmVyNVRFTkFmbytXL0Q2am4xcVA1V3hCWlg3aUZ3WG4vSGk5VG5r?=
 =?utf-8?B?dDlmSTNEMjh1aHQ5dmJ0bm84SHdTSzN4c3VRVWdjMVFUNVRZVHJRdGtkRll4?=
 =?utf-8?B?L2ZGbjNmbDUvRDA1MmVMOG9kaE9oUUZta29kRk5CSHdzTmQrUDFCeCtaUGUz?=
 =?utf-8?B?U3hoRWsxZ0JJc1RkckFLaWtvU2k3ZHFoSzkyMFhTYWd6NUpCbXBBUis3UWJK?=
 =?utf-8?B?Qmg5NC9GMnRaY1Q2QkpaUzRsM1NxRFdYY3ZMbE5QNVFQOTBoQ2lCSHUwMHdM?=
 =?utf-8?B?UDJRY2FrOGN5TURHMEI1VVd2cVZtUFVZVkFUNFRkaHFCNUxqSW1ocWpCS29w?=
 =?utf-8?B?MGhtN1Fscng4T0JBVTF3VTJvbjhjanVtbjhzb2x3azN1MmVBMFZ6ZFpKRG93?=
 =?utf-8?B?eSsxallqNzRUeXRJbXdhRVkxK0UralRCaGxKVXJKbnI0NTBpaXoxTEdNb0Jv?=
 =?utf-8?B?NmtFYXI5Y0xsTXlKYUtacEE4Y2R6T0lIc3lkSlk4eVRIbFJpSXFPckRSZ2lu?=
 =?utf-8?B?dzZmcjl3ZmpBakd0V2U1SHRSZXpDMnBwVXZnRlRTTU1wNjZ4b245bzE3NDM3?=
 =?utf-8?B?NUlJcUNJS3kwWVAzS2JGMDJlSlh5ZDh1eDFndlo4REw2NC9ya29PeXBFSmVT?=
 =?utf-8?B?SHlHY3dVeExwOHBZTi9MOStwQ3JTL1ZvTjF4Y25KSW41NWZIMDBVZEVNTDk4?=
 =?utf-8?B?YVplL2hKWmNhdzlaQ2Qva1Vvc0ZGZyt0NGZJMkxKM1pwTTJnMzdHYnZDVlRZ?=
 =?utf-8?B?MEtkQ2J2cmtYcjE5bTZPMHNKekVoT2czWVpwOWF6M2RZUFp5NTR5eGRlMFNK?=
 =?utf-8?B?Q1VrcE5ycDNPYzZDcFM1TzVORWkweVBxK3NmWVBNT1d3czI5ZmdrNTl0VEdB?=
 =?utf-8?B?bVk5L2kxVzJpRjVXUXk1enFPMjNialpMRURtWXJQTnJLY3cyMTFONE5Icm1U?=
 =?utf-8?B?QTZxa2d0NWxwbWd4cDZUcFZKNCt5c29VWDVldVJPSmN6TkxNdWxpU3VVMDJM?=
 =?utf-8?B?NFh6REVuVHNFejdDWEFOQjNFZ0pBWW5VMC96SVFXbEhqN2swcmNJTXJPNGZi?=
 =?utf-8?B?eXFVNTFJV2N6UEhNdUxwT0liYnphSFg3UnRrZTRSSUhXeExmd0MwTElLVHda?=
 =?utf-8?B?TDEvNzcxWGFya0gyTHh3b0tPSk9aZXZtME5CU2JneXplak1lS01sVklJSXRF?=
 =?utf-8?B?azBoYjZBL1YwY1dRQjJyRFBHcTdWNDM0TzlLaEJSZkducjhSRjIzNXRpNFpu?=
 =?utf-8?B?TVNpL2dQNDR4cUxmUXpYK01keCtEUDlJMnA3dzRZc3VSQWhkdEF3d0NxdHRw?=
 =?utf-8?B?T3pNZzVVK0lXTVZvb3NqUWllNlNKSmFEUUl5ZG5qUmN1K3gxL3cvMEhtY3hQ?=
 =?utf-8?Q?6qmwGOhTTaAyvlyVnfq5LTLKjQZj9hAnNCqrJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 093509d0-6617-43db-82f3-08df30b0abf0
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 02:52:26.8026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G75lPtXPswR8xy8mBOjOc/fFpUdh3SN84P2sz4ymKeFyqUvWsOL+DaMdhV1i5S5YDY2HMOnAyBP25qXOJqFoRRrep8HoYYyqz7jcTGeFxnbNCAU7ecpy9UD3UU5vGwnB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB185402
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_195229_881558_57BAB4AE 
X-CRM114-Status: GOOD (  10.32  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Peng Fan <peng.fan@nxp.com>

The ERR050104 cache coherency workaround for i.MX8QM/8QP has been
merged upstream (d44e08dab27d). The workaround addresses the incorrect
wiring of upper address bits in the A53 subsystem that corrupts TLBI and
IC maintenance operations between A53 and A72 clusters.

Previously the A72 CPUs (cpu@100, cpu@101), the cpu-map, and the
cpu1-thermal zone were removed from the MEK board DT to avoid incorrect
cross-cluster coherency maintenance. With the software workaround in
place, restore all deleted nodes and add A72_0/A72_1 to the PMIC thermal
cooling-device map so both clusters are properly managed.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 9e49ac377162b..d346958965026 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -17,16 +17,6 @@ chosen {
 		stdout-path = &lpuart0;
 	};
 
-	cpus {
-		/delete-node/ cpu-map;
-		/delete-node/ cpu@100;
-		/delete-node/ cpu@101;
-	};
-
-	thermal-zones {
-		/delete-node/ cpu1-thermal;
-	};
-
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x00000000 0x80000000 0 0x40000000>;
@@ -995,7 +985,9 @@ map0 {
 				cooling-device = <&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 						 <&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 						 <&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						 <&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+						 <&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&A72_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&A72_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 			};
 		};
 	};

-- 
2.34.1


