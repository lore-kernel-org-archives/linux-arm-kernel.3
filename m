Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76D2CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 20:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GHJXiywH86VtoTDLrlm7iP3whdx8pmIgYCaQWpC+qfc=; b=SJ+2sMXTd/2mqmL/Lg699v+M7I
	EB0aTwC4UgzaBx59KLH05N9K97QOyY3infs430srbugJlQOJ6Uf23YbXSYU6d6rSNpR8EXLNdgOF5
	TQ0FvunRXeVE2HpsxpfAT+Rxd0EMz7N5IWaXx3vYbu/2XsCt9mS2Bdv7Tc5P1nlVx3McsUilPl+0E
	fsi7mACjZF49AEwAQpmRzRjIMMn/z8sHPgM9UKfVT0VIkCcBzE2z6PKltm0JoTKtVjn3KZF/c17bK
	0CIBi7JUbRU3pRPiiQeKQmu1SojxHKP9aw+zT9voPfKL+e5WJf/Q0SwmpfR6cWSHh6rzcXJPQISFb
	nNj/RF8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHoHr-00000003yg5-4BED;
	Fri, 16 Oct 2026 20:12:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHoHm-00000003yaE-3nvR
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 20:12:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GHJXiywH86VtoTDLrlm7iP3whdx8pmIgYCaQWpC+qfc=; b=fv+unegztJ8lAiMi4GyNvkoYCK
	VdT78mjA0TgHTlA9AOAeixHrz81g4FdlaMMqGiBq60sX0Ur41eIcynOJgk+QyfA/bFXJpMNKL7avQ
	q1tmeB7RJonaG9Jep1ETJBIpyu38kJhqoJjn58YT6w+ps2RFiYQLL3lVAs2FPhHEasIZvLss0pbcq
	Vg0KR/lfQipwIoOCZGNul+joBTqZOOe4jvVzBAS3m2zfoBLox1izawzQB5KrZboyR11MEH/aLJ/Xh
	73edPyeqIpSgejN0ZA2kbD5Yp2ZiNuGLrpBMhMVWZiBWvBXUQn52+PXNDis4/BKVGfw/1AkYoBkFj
	QB66YQMQ==;
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHoHf-00000001vNZ-380N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 20:12:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKrmDI1llY6BUERfIoRyMURriX1RJ4ZSwQSQQ1M7Y6DXr0uQ/FqHLTBMmOAOZUZP6mEz/DC5Wxvh3YBlLcnxKWeMmZuPCQ/NC7dhH0KKooftvya9kqOl4qIYWn7+YmeIk50Ss4Q0TDJOuharN5cVfa33rrvN0jEoCZ05ptn0Don7eaOMmRzbvkuRYlIMe12/spc/r1hbSZ96mkOk/XpHIEhpEDpd6MSuXY475emQHGUiO3ySk+QYkwgXr4npyy1EZzFJDwvvpl+WJhYCeX75o0qNsatC+CbrxEpzb57zrnYC7bXzm3aXyaNTDlEnMoFAXy/ngmjOfHY1i7k26oBCpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHJXiywH86VtoTDLrlm7iP3whdx8pmIgYCaQWpC+qfc=;
 b=LZHdXAGzWYwjSXU1j60wsMlVWxC9XAvtUv31lAV3U3dsf1B9d2EtSjGyEEWEv6bP/lRXpZF8Z6/Fh7TCZtubOfUFUKXgol0VQlMjHo9LCBZHnk3oVdIw58qYCJEBsS+8JeKhAVxcc+QcYBhaE4lGVcTL1Gg5BEVBOCgtfMDA8YeWRAteklpHku66DAANdsAVz4cat1MXTm+4AxBt3Bn926jeR06CLT91kzSTJQOOIsICx7ZNHYiN6bt82rw9oT+edrXlaYflHfBjr9owBtthJrF1GD6fp4+/wv2tq3Ya1V6x6fyPfEJhKxVKyQPBhsB9XhwFnqhVQDxUy3+W9BGmXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHJXiywH86VtoTDLrlm7iP3whdx8pmIgYCaQWpC+qfc=;
 b=Dq9H8acx5TwlQOV7Ju4cyvO355nKGRhC9IFJHgGIlAemylpOlIlujGfXotUzk7g70HUqNPr+JB11qcb78IgtHqTe3Mfqt58jBl+bLqXwI+Pf6kG1ZzjyKD+iDHKM8pOf6wUbW5IWhSzWs+dONQWv+DhcyJj7F8pFLyXIlnmmSUEsc0ZYQSq+hDVwYrLBl0xvqv4F4kUNobm5cCgKt7w6GmAB+b7q8Kwceb9pNim1s7M67KIbPqBB1XLciJMf04tsWAaTYHHKAmQeLLaGdJnZcXtuhXHtJgTRkjYzVmk6gFI/DRElyF0iSYGcnSYM0Lxf/xmMACts/QjA/NbB8QcAug==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8738.eurprd04.prod.outlook.com (2603:10a6:20b:42b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 20:12:04 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 20:12:04 +0000
From: Frank.Li@oss.nxp.com
Date: Fri, 16 Oct 2026 16:10:57 -0400
Subject: [PATCH 14/14] ARM: dts: imx6sx-sdb-mqs: remove empty pinctrl-0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-arm_dts_cleanup2-v1-14-3a0cab9fd784@nxp.com>
References: <20261016-arm_dts_cleanup2-v1-0-3a0cab9fd784@nxp.com>
In-Reply-To: <20261016-arm_dts_cleanup2-v1-0-3a0cab9fd784@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792181453; l=768;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=OMxbueNGr+vRDQa7DFmLaaH4S/x0dnn/E7+QFXHkFWk=;
 b=FJa7gf7JTKcjGoQCdp3joa8TaYT932wNRIskvvF//dVE9tSX5U6LLwo1/QtO8jSg7vMY5hBkr
 Lv2ZrbjtrDWASRP43bS7OOVqpg9i/ynr9dKFnBySBTYWd1cSZVdJo5m
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS3P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:45f::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: b40c2649-8505-49c6-291c-08df2bc1bf14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|23010399003|10067099003|18002099003|3023799007|22082099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: hNOuRwf3PCVSIS5cX+zU/0SVIjVHR3Y79tTkdxTXS1EiSN7VFRUjDB1Nc5Xl6nKfU83Atj9viA70BHES9po2K7cl1DeG+dXA4HCAUkRkfjIOYk//1e6hh3s++kp78WuVN2iHvwgBfIljLKFdGrLvHN2ryqdXu1GNdw+yI8eThpiabBVK1VSJNJ8BXQZhj6n85FLOOnV+zWyKSXFIk5k3nLTLjx+SbGW0Xkdt6BeFzW+oBnLEX0gwP0Jabt+qwG87/9uYoTduaWmMeIyYStWTJZnsdBE50mTmJT9/IWURx+u4i7VpY3dE+jZTJCf0JW6je5Zl02XhoDmGZOLWwXjX9CDzhWlBPyhX2BKdhklxCO7HlyFq1rxeJRqDLKyFVvVf/viXYuaECPNeodUa3AhVzIvhNERtia1g0j5twjq9yAXHzu1RqN6j4FYfGoE7WrxL/ioQ8P9czNVnlDm4AxaqJgl+AIRGf4fScfviCwvunYz3dBWNvmtddmXZC+PRb5M1Qi69qON4KwMb0BU2kW9yeiP9BYMx0LQ0LxBM0uTt5gAf4xizLyuh93f7IucbxTzR5hxMYhAykX/4xjKOni3nTY5pKPojXiUkfNvmmoLArMyrxROOFEANZVzdpwUdyXma
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(23010399003)(10067099003)(18002099003)(3023799007)(22082099003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGkyc3pvbzJGUzJCaytiYndoV09WeS9velRFeUoySXJmMTlpbWZwVmxiN052?=
 =?utf-8?B?TkpBYTlINTQzOWxnRHljQ2lESzZ6SmdTd21IWG80MlFSV01IRjIvWUdzd2lR?=
 =?utf-8?B?emphQkVOWXhoVHRwQXJ1amJCYlRhQTRGN3JldytLUmo5TmsycW1Sa3ZSK3k2?=
 =?utf-8?B?S0ZDdGp5LzNKeXFidm0zbzNJZXl3emhCa2JEOE5CcFVqalFyZDdxWEpSOEE4?=
 =?utf-8?B?NUdzUW42cUF6cWRDcEZtY0x2di8rRFRCVTRYbmV0ZnE1N0c2NXFWU1Q5dUdw?=
 =?utf-8?B?VE1qMTJUMnhlamtJeFF1Wk5HQjJZVmlqNGN6NGJOMjRQaEFjbDFHc2g5QmYv?=
 =?utf-8?B?Q3hZc0wrejF0c2tyakg2YmQwQ1N3Vi9MdllNQi8yejdJUVRTbDZQTzhPb2M0?=
 =?utf-8?B?b3VOQS92bkh2dnorenRFYmpGcEN0T3pyR21xMnpNNEE0aUtGM3YwMWpGOE15?=
 =?utf-8?B?Zmd6VTlQYW15Q3NIY2dIT0tSQzNGL2NoYlJKSnMzMzA1OElKTUxobVpTL0tt?=
 =?utf-8?B?RXpwSzhpcFJhWTJhZ0ZqY0ZrTS8rdkxJdEw0Ry8wL2ZuZVZnYUtVVkVDNDlI?=
 =?utf-8?B?SkxYNlRId2QvQllDTnQ0ZHpic1FCdURLenZ5MVgxMUNpM1F6ZVVXZEhpLzNv?=
 =?utf-8?B?bStoNWNIazlHbDNKNnJCS0kyVTJ3YWRhQU9Tc3VIVEN1a2pZZVJKRC8xN2hj?=
 =?utf-8?B?aURSZFpUeTVXSXpIcU1Ga3A2V3czZlhOeVhaeUtrS2s1Q2RWdWJMRTY3bzM4?=
 =?utf-8?B?amhwRjhrMlVvcG5IUldQdDR3VVF5YmxObUcrYUZDdUk0cU5zencxL3U2QzY1?=
 =?utf-8?B?MFdtenZ5TTlXTTBQcFlYMGJFMytHeDd3blljTkMzdTY0eEVCZCtlOE10YUNQ?=
 =?utf-8?B?ZGRvbDhnSHBBRUxxNmxkZktQS1FYTTBqRCtTL2J1MHBhekI1T1luUCt2RHBl?=
 =?utf-8?B?d1NuaU5uK0VPbC9GR0VZRXJ6U3RVK0daNU42aDdXVlNPOHlhWVNSTUUzbWph?=
 =?utf-8?B?WHJVT2R1NWVmRnZTRXF4cU9xTkxWdE9IZ1NLRHJxYW5JU0RyMHVtTDh0aEI4?=
 =?utf-8?B?UTZ5elRpbUVOcHMvTU5UYW84UUcwYVlUSnRVeXRKTHNWaVpiaGV3c2s5aks2?=
 =?utf-8?B?cHJpMm40NXM2QXFGVVZSc3IyNUU2ZFVPWnU3VkwxazdLTk5XK1pjbStzb0h2?=
 =?utf-8?B?MzBKQkkrQ0FJZDZoWm5Cd3dDZnI5TUdUb2VsYkhSc0h1aGRHYW5vbzZSQU1W?=
 =?utf-8?B?UzdZY1pLOVhJWUZOQ2R4Y3VkVVYvVU5QcHN6WnpZL09EclpyZWI2TVAyUzZY?=
 =?utf-8?B?RXU0SEZ6d243WmY1RlhQYm11dDR5QmR3K3F5blg1ODE2NG40aHl6d0xxY3pJ?=
 =?utf-8?B?SFIvNXkrZFRiWUs4Y2pXUjV6RjZPWEpsU1FHdFdYeldWaGJsRmNQS2F0bXZN?=
 =?utf-8?B?Z2pQUmVTMUlSSk9kK2k1QjlhNjF4MG0rNEJCUWhpekcrMTRGcVhLZnBjVmhZ?=
 =?utf-8?B?Z2pscEJ2cDRFalg5elFQamJNUGYrUVNFQzNxSHAzN0ZMNFhBaDJOMmRmbS9K?=
 =?utf-8?B?TDh5ZU1yR1ppWnRTUXIwczF2R0wvMklCeUVOV1BiV1lZNysxTHZjYm1KbEpB?=
 =?utf-8?B?Zk1oV09qY1JidEQ2cHpibWRnNG0vRU53V2wxUk15YnNuN2lhZEdMUkVsQnZH?=
 =?utf-8?B?dngrTi93ZTFUSXdOYW1aV21MeE8zWWlKdnYwdmMzSnFkYkV0OVUwWFRMVndU?=
 =?utf-8?B?aUNSYXRBaDVKZ2VHMGF6b0gxY1hzVTB2MVFqVXJqUklaQkZORDRxbFBrZ0VX?=
 =?utf-8?B?dTRUM0tMeU1UcHZyUFRZcHVHL1owN0dwbm5BZWNCRURsbmJFa29YVmJuYmFU?=
 =?utf-8?B?bVZrSEZqUW16TUFpTmdmVjB5aE1CN0pLVGVObTJ2SldHVUVieTlvNjl6Sjhr?=
 =?utf-8?B?VHFydUNHdnVvcFpLcCtGTkFaNyt2STdJV21VbGplV2Y3TEplUHo3b2RkL0Zh?=
 =?utf-8?B?MlNqUlVWM3dvNjNOYzdwRXNMREVwRUl6TDRHcVJOc3JyTElQWmxiNmZEUW9S?=
 =?utf-8?B?Q2h0U0U0aTBtY1QrVG9KYWRnUG12VTRRcngrVjZreVFDWXNrTWVOTVJONDhF?=
 =?utf-8?B?WWNMbFA0emdwaVZDT2RhcWRmVVIrRVhSbERmS2RscG1RNE04c0NuK1RINFlT?=
 =?utf-8?B?WE9UMWllZ012VWZ6OTRYT0xWUUIrWjh6eFNEYnZWNjhTeENESklYNWU5c0o5?=
 =?utf-8?B?ZjEvZGpwR2FZMUd0MkFvS1Y4a0dhTDZmMU5KSXZBcm1lamNJNDZnY08wYzUx?=
 =?utf-8?B?VGdlck1jOUVCTUYxRFVESXJNUTB2K2Q0UEdwZHhRVURhWkFFVm50bUFBL1NM?=
 =?utf-8?Q?c/v64wftBBCy5wK2yCzGR9Kio7/QsVNo4+/eV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b40c2649-8505-49c6-291c-08df2bc1bf14
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 20:12:04.5584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KJBNZLJU+hXJpMO3JC2eqsoivY5VepiWs94kwOtxdyx5ho1UYz+g1qYcQVNgkRcmb3YSvSBs6f+TwUcTRKkbVYcr6gc2twySmVd70Pnsb7lMgoOF46DGNPOk2wnzv/TI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8738
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_211207_834361_53386248 
X-CRM114-Status: GOOD (  10.09  )
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

From: Frank Li <Frank.Li@nxp.com>

Remove empty property pinctrl-0 to fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dtb: sai@21d4000 (fsl,imx6sx-sai): pinctrl-0: True is not of type 'array'
        from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dts b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dts
index a4ab2d3e960c4..82ae475a018e1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dts
@@ -33,7 +33,6 @@ &mqs {
 };
 
 &sai1 {
-	pinctrl-0 = <>;
 	status = "okay";
 };
 

-- 
2.43.0


