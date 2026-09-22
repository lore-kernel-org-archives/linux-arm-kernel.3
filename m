Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34AA2C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 07:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPM4cIMEuK/SLaKck7AgGlfS4gGu3+p7D0uDQrXERn8=; b=WHHI+oMN5+VQWIFAtoEZVtrGsu
	3U5rUSVlbvxjKgqRD7Np6taQvpzAEXE0VmUnz3ymxk6Xi2IYHQVA3XpwYRdejGucHCS+J1hkwnNj6
	xRgfnPpf9fRMfAbKLPKzrbQLsyDnZS/H6Bh2u9E64G1kUead1SHqdvW9yHudrI3m9HJ9/3e6+/s0L
	vkhQJ14PZugl0EwkijPjtN7aqpxIxpXVlCoY0zbnkie7rvarYeBy/1VCrNau73s0vD3ILYSF86IhK
	l8fLubpWOxQDr6NOONR++zXEyGD1Sb5IWsBFOwdBnno2ubqF0Nn2sLmjBL1WBec+nqvzi3YkcIexz
	8SAdDzWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8v0e-00000004WW6-1gBx;
	Tue, 22 Sep 2026 07:33:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8v0Z-00000004WSY-12Vr
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 07:33:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tPM4cIMEuK/SLaKck7AgGlfS4gGu3+p7D0uDQrXERn8=; b=buYNMoNotGDgNqFx4F4VCWip0g
	5sFJCDy6ICTOxsUydRbxkqjjVQh565VLNtZVk1wJ2uSPzY1WYvxqDug4kn/7RXTebJwgk93OEoSOy
	FByZ4+aO/16oxSr5CgAqKd+hDkRwE+K+0cQMu+0rGRQKkvwPzOvyVG8aVXZkh0p4XeD01/S2aWlDD
	VS2bnoxV+cOsDWCOYMAphYOELJpAeWfBRIbj4z1Trtcc8BsI9X9tfSnbm30sljh3fLRZTCwOrkI0N
	2RZ73tpV6iT5m47Af6jbtEoPtqEM3yJMA/yO2/YMXResWNfpiulZBl0PSY7CTua/0kPDcW/LOHnud
	mRq+9mgA==;
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8v0W-0000000DDKn-2FyZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 07:33:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtI5sd9GTm+mOQJluTFbmquXCn6cmtIrfBlknz9OomYkoYyfPdI/BY0kNKPM742rjl+w71DHJ/kNZXtivJZlMHGmG5b/yf5tYcX+pVQb7P/xuTzqTrdnrlRSGIfx8jZlLhJ2wj9ttl0XqVeR+E842vs5HTafBypHeG/Z+lE5m5bKulPyOdc+0hGZ/pV4fzC9I9ktG3dCghrnEYHOxbMbpJlF+VKWx00dARdBXKRY9CINoep8txj+ByRNhoeIY42R6mm2EsHpBbt87/sPeYZDj1dCKpJFEF9yDjz84tkiagS4HtNQOtKQdZ0VjzIAvgHg2VRjMrfzed5poHlP+F2E2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPM4cIMEuK/SLaKck7AgGlfS4gGu3+p7D0uDQrXERn8=;
 b=mLrrva2Y58bvd4j5puLGdJ/K64k5GlVH5G7xu3VTQIo5vUj/lEGnDuYnkO70N5pmKblrIjLx/EUHFBvXFpJ0Arsgz0MWozz4vCER/N3z/nn052+nnEDT7ypjwoPWhPuhknnWRzLcCX707i3Sn+8rR13ZfB645OA6czw+VovyDLpJPbf8znNvSgXVblIfZS7WZrX5DrwiWtRJokb2ZyG5ab7M5Lam/xg66VLsM1fu8P8PAjixIRrECOsCq9FvMKN1dpr/S/B4k1CnNQTCCJFIc5AG+fZwAf9H5kU6Wn7Q/cfyXqr5U90ZDZnsoCzRQVjpJy9tLHsINQc5WKgPxLvcyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPM4cIMEuK/SLaKck7AgGlfS4gGu3+p7D0uDQrXERn8=;
 b=hF6H0ymAaqN5dy+eNboniORUOCkU3idBupUNZpKFfIfAup1hoOncc/Asac7rw8wYABD8lhLwDHfiinVx1WdwdzP9zFh1r8sX2RDCoJhBUI4eCECB0SvsWkm6X9Vndc5FFMa7tZS2xefTr3a2ZcFNxzy2IAUUluhp+X6265KlEpwzYZYD5D7K8cR9cuR9Kd7inm2wnvmQrPX1SlWueXfomrj86H1jyi9AcwHuR2x26Y6z2GwigVs620c6t1LwJD1Pe3ehd40eO1AUViKXs/XRFUO1zJsjgvFsi6JsHfKv/UHE/8mQ7m5zPsNUg5O0zOSRFOmC3G79mQDmZRxMKeiZ1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10) by MMZPR04MB213195.eurprd04.prod.outlook.com
 (2603:10a6:190:4f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 07:33:25 +0000
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49]) by GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 07:33:24 +0000
From: Larisa Grigore <larisa.grigore@oss.nxp.com>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Ajay Neeli <ajay.neeli@amd.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Pedro Sousa <pedrom.sousa@synopsys.com>,
	Hannes Reinicke <hare@suse.de>,
	Joao Pinto <Joao.Pinto@synopsys.com>
Cc: linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	clizzi@redhat.com,
	aruizrui@redhat.com,
	eballetb@redhat.com,
	echanude@redhat.com
Subject: [PATCH v5 06/12] scsi: ufs: dwc: Export common clock divider and link status helpers
Date: Tue, 22 Sep 2026 09:30:03 +0200
Message-ID: <20260922073009.1449688-7-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922073009.1449688-1-larisa.grigore@oss.nxp.com>
References: <20260922073009.1449688-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0006.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::16) To GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12558:EE_|MMZPR04MB213195:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e1d277a-8d58-4db1-bdcd-08df187bc934
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|23010399003|366016|921020|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 1KkTwvjE+if/Jo1gU2iwgCQ77SAJz8PCyV8CssNq5CJ/GbvuNoLVXAFB1moIOWl2DoJlnlzNDUEvw0HEfnUTa84c8Qe5+XbhcXTKtuB7epq7zuEAhNvgMyajgVUkTso0IYtSMVfv/qrnGciwZD6Bz93qTqKFb7doeIniFp3wA+nd8DeMu/KsyoxPtsrdz6kFeRdCxUCjQYNuEFo6GJ3INpEyWDa3U5o9G4zU75sFVIWhzQIwzR9us6Nez15MV44Pv/2IEje7zpscT5oFTQcf5shp3njmfyM309Tism//c0EwuMCE7r+bTFT4NvNmOb4HfdlBNDoXBF27/tfBgqfHMgU9uWyO8gLbRw92f0Yh1WHFFDPWtz4TZ/Q9rbaJi7+Jydcdp6pqbHSErXVuustvRGVf3yxzZ+n1X3hgfzt5Cq24w+EivCpLb81CtsdMfNEucGOnQEXkLHBCkvJSuegpok1HDXQZ9y2w3nan6i45fu1471KRZ5KhA7lXzsuICvedc6VQnqOGzITkQPWFU7xfM9nij+9dAP3q3uYAX1+1zzTbkQE4OrYQTuKc9uL/mc3AObFWb7R0vgINiE8+jMNnCFUWuBC8y/y73E4swLFi3Brwa420ps7ND7DwOgiIRqwYkyif5Kc8n5MfSKMtK3iV+JMZ7T9KQPzKd9SwNFeY+Gws43J5Uy3eRCaW/Bz8gwjyKeszbZTETwIQ2x4agYvBMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12558.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(23010399003)(366016)(921020)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2JER2RoVVhrSlh6NVpiVEVCRThFbHVZM0t1bHZOaDU5bTRjTThNSHBtVlYz?=
 =?utf-8?B?dStPM1NXSFllZkRSTXQrZWk1bHVwVW1JanFFRzdSaVVHV0JZUVEyMWZwVkpp?=
 =?utf-8?B?MjNjcFVjV2dvaEVzN2lJMjdRR3FOVWk4cTZVRHZqT3E4ZVNaRUY0bzdnd1h0?=
 =?utf-8?B?c2lvN3FvUzkwTU1HVjNEclhIYjY2ZkFJSEYrVG1TNm41NGtEV1orTTBBaTlL?=
 =?utf-8?B?b0FqcDR0bEoxVFJONlJCeEI2RytLVDFGcmxiWkNZTmJKQ0xPd2JhYUEzSVFy?=
 =?utf-8?B?Z2JQVjZjZXJmU2Zma1h5ZFgvVkg1REJoblZ5MERTdzhQVm8zRGl6Z2Z6ZFND?=
 =?utf-8?B?eEVXMlJhKzFLWTVxRXFjbHhhdkttUEQxT0EySGRKRzVtY0QxdTBTL3ZBdUEy?=
 =?utf-8?B?eGVvb3p5RWsrRkc2ZTJMNjg1RU5hZHNCRDlsUGFpZ2F1S01UT0RsOS9oMzRo?=
 =?utf-8?B?VlM4Zmhhd2Zhd3FKMVFsVGxqVFRsYVpOZ25OdGt0ZGpBNGtBMmJIbjRxcFAy?=
 =?utf-8?B?UktaczEybEkvVEdxUm83TDJ3WmFuQ2YwaEtmb0VvbWpFRW9vbkRWUVN6WWdz?=
 =?utf-8?B?WGdxQll1SkVTSnJNajJYUHF2YW9ZdjkrZ01sMjVJV1UxNXdBaWh0MlUwcW53?=
 =?utf-8?B?QlVtT0drTnNkQ0M0ejgzRWFBcFl2WTA5NHg1NERrTWw3bFNURk5XQkZEZzM4?=
 =?utf-8?B?N295Rko2b3V6cHRMTkppdDlyampxdndJdndpL2dUN0wydWdtVHFKRkpiWlI1?=
 =?utf-8?B?WXUvNHN2Q1FHak91cVUxMGdNa3FZTkQ2ZkxZVFFnRnpLNG9lWEwzUHVuZUhs?=
 =?utf-8?B?aENRa2FnbU9GZ3hnakwrZUcwSDdvY01tcjYycEp5dGpFQ1JtcDIrMTRHMmV0?=
 =?utf-8?B?Z3JvNXhGbUt0SVRHRUhKSmliR0dxN2VQV2xHTmRhaE84U3lPdFZRTnZXTzdY?=
 =?utf-8?B?Y0F0Ui9RWmhVZHpoYUIvOFhmeElFWTNJTmkyaDVCL3V6T2lzck9mS2MzTGtl?=
 =?utf-8?B?c1BjOWdybnE1VndTWkZuMk1UeUI5TWowWHpzanQ3cE5FbHM2N24yNDRrSEwz?=
 =?utf-8?B?S1I1bFZBSEM2NHhWNnBPZVEzUG5EQjVpYUlzTldmbzhrSmxCajQrdHVVTFpB?=
 =?utf-8?B?MXVRa3UzSnV3cEQ0T0lBM1lIaUVvcUVLUWtSTjBZR1Z5bmZXbS96SVAraXlZ?=
 =?utf-8?B?cHloZ3JiR1R6djY5a2srbWxUcXZ4ZXBPMGgydFN1ZzZOTWFFOGZuSFNucGVt?=
 =?utf-8?B?dUxQT1dCT3lqalVUV1p4T3FMTDRVMmFZR3pzM0ZQN0lKa3NLSXdPK2tGTDJH?=
 =?utf-8?B?aUZKZnM0Tm1KOERSWmZlVnJXam1oeER2djlCODZZdHFjODYrbHFFc3k1d2ZW?=
 =?utf-8?B?aVNiVU5hWWhTYldRZ3lrNVNuZVIvRFd2RFJjN0xkclNLTHhIakZmOXV6Ylg5?=
 =?utf-8?B?V1UyWWVtU2IrazdKUWJoZWY4a0pUd2hURmRVSkZ3SU9tMmh1VEtTMlRESGEv?=
 =?utf-8?B?YVIyQTA5R0J5K2dlekQ0R1JqYVpVeUFaWVljdUJMcGYydkRTdkxuUWdONDhS?=
 =?utf-8?B?MWtpcXhsTE1Wa0t3U2FsNy9aMktYVmJ4WTNoVC9vQkVTWGdHWUhiZUc4QklU?=
 =?utf-8?B?K0poa2VOS2lwQmVLWEZaMXBqbVdGY0h4Rm1OUTZQTXczckRrTGk1VWM3QXkr?=
 =?utf-8?B?ZTVsOU5ZWU1vRkowcmtTZGlEdTBBWEJQaXF2aitOemdTTDNIWHB6YmQyYkVs?=
 =?utf-8?B?U1ozY3RkSjU0a3ZyUnhEZjJNNUpEVk10TFlGM2hST3BWS0svWGhzYk1WdmV3?=
 =?utf-8?B?cldMVFc0K3p2ZDBNRWkxalRTZzJwVUIwZCtjN1h1S0JpZlIwZnRJNldJWU9O?=
 =?utf-8?B?S0ZpQU5yQ2F0Qm5FRitzRlBKZjVvMkpiMkdhUzhBQWRZWlVKWVo4YjJzOXkv?=
 =?utf-8?B?OG4vTUs4R1ZWc2tldkxicU9yV1M0Nk1jaU1OR1VRRGlBY05kK1JQeTZJUW5V?=
 =?utf-8?B?M2t5anZEa1lTblJsNGEvcy95YmV5d3ZRWkhmaGtlWDkzWlphZ2V6eWNZOTda?=
 =?utf-8?B?SXh6Ym5KaVJTK1FXNW1YaVcyd1ByYURjcGM2VkZuOVVlUlZLb3U5ODhQZ2dq?=
 =?utf-8?B?ZVFUbnFubG9UQjlsMUR3bEMvUDUwdTdLRVZrTGpvTTFIQTJFOWxvY01YeGpm?=
 =?utf-8?B?bW5yMFZoU0VYaVlTSUkrd1VEMG01ZXJHL0NSYzF6Lzk0V3k0QVkrS1g2SVdk?=
 =?utf-8?B?eUg4c0ZqbkNTY1AyVmpac25ZQkh1T25CeUhBRHNsay9mV1RZMVd6SlUzZUZC?=
 =?utf-8?B?Z0FwTUY0a2NJSldFZ3ZBTmxYUmtkWE1wb0hST1RTb0lPeVNiM0pjOEIvSWtT?=
 =?utf-8?Q?sEbMa86WCde17/pU=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e1d277a-8d58-4db1-bdcd-08df187bc934
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12558.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 07:33:24.6443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WLDk6HBerlUdNLKYQiFLtUQ8mFLFqn5vYinS+z5wrdA0MyRxWQ9uAUtjpPT1cQXGFgOQL5QoXrOLQS9pESCaJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB213195
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_083340_718493_DC9FFB7F 
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

Make ufshcd_dwc_program_clk_div() and ufshcd_dwc_link_is_up() available to
DWC-based platform glue drivers. These helpers are needed by platform
drivers that must program the controller HCLK divider and verify link state
during their vendor-specific initialization flows.

Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/ufs/host/ufshcd-dwc.c | 6 ++++--
 drivers/ufs/host/ufshcd-dwc.h | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufshcd-dwc.c b/drivers/ufs/host/ufshcd-dwc.c
index 82b03b926e77..977b368474b0 100644
--- a/drivers/ufs/host/ufshcd-dwc.c
+++ b/drivers/ufs/host/ufshcd-dwc.c
@@ -39,10 +39,11 @@ EXPORT_SYMBOL(ufshcd_dwc_dme_set_attrs);
  * @divider_val: clock divider value to be programmed
  *
  */
-static void ufshcd_dwc_program_clk_div(struct ufs_hba *hba, u32 divider_val)
+void ufshcd_dwc_program_clk_div(struct ufs_hba *hba, u32 divider_val)
 {
 	ufshcd_writel(hba, divider_val, DWC_UFS_REG_HCLKDIV);
 }
+EXPORT_SYMBOL(ufshcd_dwc_program_clk_div);
 
 /**
  * ufshcd_dwc_link_is_up() - check if link is up.
@@ -50,7 +51,7 @@ static void ufshcd_dwc_program_clk_div(struct ufs_hba *hba, u32 divider_val)
  *
  * Return: 0 on success, a negative errno value on failure.
  */
-static int ufshcd_dwc_link_is_up(struct ufs_hba *hba)
+int ufshcd_dwc_link_is_up(struct ufs_hba *hba)
 {
 	int dme_result = 0;
 	int ret;
@@ -66,6 +67,7 @@ static int ufshcd_dwc_link_is_up(struct ufs_hba *hba)
 
 	return -ENOLINK;
 }
+EXPORT_SYMBOL(ufshcd_dwc_link_is_up);
 
 /**
  * ufshcd_dwc_connection_setup() - configure unipro attributes.
diff --git a/drivers/ufs/host/ufshcd-dwc.h b/drivers/ufs/host/ufshcd-dwc.h
index d8673cd54d4c..53b523ef59df 100644
--- a/drivers/ufs/host/ufshcd-dwc.h
+++ b/drivers/ufs/host/ufshcd-dwc.h
@@ -47,4 +47,6 @@ int ufshcd_dwc_dme_set_attrs(struct ufs_hba *hba,
 				const struct ufshcd_dme_attr_val *v, int n);
 int ufshcd_dwc_phy_reg_write(struct ufs_hba *hba, u32 addr, u32 val);
 int ufshcd_dwc_phy_reg_read(struct ufs_hba *hba, u32 addr, u32 *val);
+int ufshcd_dwc_link_is_up(struct ufs_hba *hba);
+void ufshcd_dwc_program_clk_div(struct ufs_hba *hba, u32 divider_val);
 #endif /* End of Header */
-- 
2.43.0


