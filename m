Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6097FCDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 08:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date
	:References:In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrjP+6rUs/7WNlUngpuXPLnG8t+Rbzmg4B1A++kqJiQ=; b=yqSFxRzXGnzb1IgSCrwBVuOB15
	R+KU2gICN+HYpy438srC3D2rkg3G3C+4BBrdFWqg/ubZJrHrIMYrZx9R0M+0MCDx2CI8XBNi03MV3
	AmeF5xvNohDrscY508mZhg/xayfCaR+ir/OnaOqegpEdviy1yPCOIo5S1+XXBQOzuEec1wcJt/5Wx
	Mz536P92GvUGFyFLQGd/9LBh7SN4Bt/FtzafzROd+EtiAKCOkAd6X+r6fWj7SLPFfIpgKrtEJvhF2
	PGPnWE0TJMkcibTOeF6mBV99gwEllKevkC3BWcfiZxDAkFdEycymNW2QRuNBORv8xZlYWNBSffyY8
	810iKCdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbaUT-00000004hri-3afq;
	Mon, 22 Jun 2026 08:58:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbaUO-00000004hpM-2wjw
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 22 Jun 2026 08:58:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Message-Id:Date:
	References:In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:
	Content-Type:Sender:Reply-To:Content-ID:Content-Description;
	bh=zrjP+6rUs/7WNlUngpuXPLnG8t+Rbzmg4B1A++kqJiQ=; b=NkN9QTr3hmFSvQ4HH14MISs5Ur
	MMzTOs7dzFLVamcfDoXFBIUoF6pmstnMRqSQNX/40VuMbsWCEs0z5bDhIus1GrJ0UE9BRfsyZ2HNi
	X5QVIDM8CbdBdbfJ1rn3IWacfHuNiL/CzSoVne8AdXQBE5nRMtjk5jBO7TWs7IuByjyVI3DucfqJe
	WHiwH1EQB0MyY0y+X17q9xHwqW3io87pVWP7mvgHmps6u/Y3mVAdx46rG5QeILFpTCzxD+RGisznP
	qUE90E6CcZZOFR3k0QWl1ntXGdCbnFLYXImYmJrNiUWzJHFKCP49qd5yS2QvaT2n9oKLJyvaPJ7SB
	5wByqZIw==;
Received: from mail-northeuropeazon11010069.outbound.protection.outlook.com ([52.101.84.69] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wbaUL-0000000HEeP-3K25
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 08:58:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDuCy6PLzobyYH1bnnqN6L4xhFsi8F8qERo2uYshEliMHVMztrrtOfDmt9bUf2K0GQlS3+/Blaz/H0hDPe4A5DSrZn/fjmWkdrgR84nFZBJk8KU/i3Xs9RuB+MM90XDmbtbut45HX6cRpx98k++f4UB5VaA1QtMeLADTCNjIFHX2tKiAlgHGSOOXVl6/UTDwLMg0MQ2MyNeqH75xwkS1FMhbX3HYDBA9egXRf2yXUCUM60nJWq60GY+nQmY8RtnBRJX+l44GhH94WkdiHJEv0TS933HA08dsSh68ciCPaCeY2bzvN55JNGgW+FIced4WMCaN1rGJwUOJdcMNF1DKZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrjP+6rUs/7WNlUngpuXPLnG8t+Rbzmg4B1A++kqJiQ=;
 b=MQe4pwmwbeYI5c2ux/ucyt9IfYIOEgaWRSXCpRhaRBmMxR+duPQFmzrFipbPAbtpKdlIM/q8jU+K+36Kuma9xKhWKRenYQjMAAALjv6ZEOnp12DEdQJF7xmWLeopjGj3D0gYg4y/e5FtCh7JmWu6GHaLaE1r6HpaWigfW3moKC3soqV03Frhcjssr1P+wbzpCgFg8VSwgTbgas3O9hDrS3iAGPAMxG8Hh0X1UVZuvRB9r/DszuPiuIpwQ0hMqgg7xEkyuN2/k5+skvwyPFxrOb8q6dzj9AKgBpp2TE+Xrdx1RrPrS8hHQI1a22FdvyCof62rcQpUIOdXaqw/Fx1D6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrjP+6rUs/7WNlUngpuXPLnG8t+Rbzmg4B1A++kqJiQ=;
 b=igS0ptEhV3Zv/AQfKQUQLlFfLFE704/DL/FQ6itCjNvp+pfwDDwEE+OfQiFfBJROnhoY8OBANQD184cCWSItXzgQPdJdybIJBJ6ASo3DoFmFufD0CdSNj3nDIEmjxqTuYSpW7CpDKhNNl11pR6zFAgW8/+1R2mNJZQqhbNNM5Ys+vJ+MgChBqc/fqTH5V09SIeTz6pYHeKVIOJchGRoIfzYHxbEmZGUkS7ed74osYe+pvE/Jb6D3ez4aCK0glbqgAJwDr4cmaxN2d575AzunsHzmzPjXt2V2NM5kQo0FkM1yj9KmKa4r/n63i6hOHdVvfhcw3YSmUumZEdBxcdzwoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by PA2PR04MB10088.eurprd04.prod.outlook.com (2603:10a6:102:40e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 08:58:37 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 08:58:37 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 8/8] arm64: dts: imx8qxp-mek: add parallel ov5640
 camera support
From: guoniu.zhou@oss.nxp.com
To: Frank.Li@oss.nxp.com
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260617-imx8qxp_pcam-v5-8-7fa6c8e7fba7@nxp.com>
References: <20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com>
 <20260617-imx8qxp_pcam-v5-8-7fa6c8e7fba7@nxp.com>
Date: Mon, 22 Jun 2026 17:01:14 +0800
Message-Id: <178211887405.4030874.10964807720406733748.b4-review@b4>
X-Mailer: b4 0.15-dev-0e760
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782118896; l=3599;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=zZnsBlQORplLuHLwMEovSvr79Y9QwHnSe4tKen3JyZU=;
 b=mKwyTBf3GZg19H5ozDqUYeMZxIIA1HFHHA6pDVubdUmfX3cr6MZBBwAYv2moZ5l9pDVFfjmU4
 0xiT0QVE6eiDfXKLpB/L6gidWLbA2DGV8n4sut9AzP8OV9Miw5m0mCJ
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI3PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::17) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|PA2PR04MB10088:EE_
X-MS-Office365-Filtering-Correlation-Id: 016e4230-8f92-4cf7-ebc7-08ded03c7244
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|19092799006|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: d24BFKteNUVK1EXdtyUWuno7x8zHtryspmWCYk8anveVpgsaC6ucOMdbiFt7k8f12OK407QRNkpx4sRtGVZvxt0kKg3lGH8nz2YlCNcN3llxG8W+JDMaFTYaIPbMd7YorFXlCa1s/gTztTuEZItLooNKI+xQYcwIom1etBN+juKjt4FOuIFlSESVOBTuYs7U6r/0fO8BCqRedWOWTS3Saxxqbv+GX/jHTe3wXCWbW9K53BKq8k10su0a/UV32RRNOQJpmUjohDmjxFgN5eFyW2cKGFxx8qkYwiU4itVliTYb2cE3LJz2iZfTgPjo9I7EyCyh6vOMCU1faojTX2H92VZlSnT4D6O4Had5yDcREKs0GfVFXTypMbOmeO4CODa1bjEVHePWUXk0uyQy3dTauTScqpJOYCQ4Lyqgb8Upgyb7FbXUloQ7/ZLGDpE63fw8zEkVxY8JVYwMZInao81PyTSFEqURL74ORQ6/QRc9HVIwooxOt+xoy38mWrTod5e6moc5mXum/VDAnfLWIsATWUL8yD6m9bZIL2kROWTLuxT27bv9+IOhCH47p1wkOfQRQ8JOAQq7mJ/NQ93ULLb+QTtvcVcz+Wuxi+OU/uCoZYRIl1zSWXZrndkxUU6vjXjOPLOR+ux18I3TTfjV/uK6sK6DeKs1IzVWe7AeEU4jueg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(19092799006)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDVDVS8zcnpOMU5aVllDQ0xidWIza2YvWmFVK1lZY21hUDIzdzR2TGFWaGRG?=
 =?utf-8?B?OGpmUVVlU3BydHVrakVWemhUREN3VGIyWGNSbXA0KzJJd2RQQjFkZXFhT1Nn?=
 =?utf-8?B?WTVoaXN6UHlBN1FZU01wQk9FdE5CMUQvSXpSQ3B4b1pqOUFKUW9XR1QrcHQ5?=
 =?utf-8?B?Q0I1dEVNVDFDYyszUitzZnB0SVg5SFZqS0xRWmIzNnJSRVJKVXlhVFJEZERq?=
 =?utf-8?B?RHVQaXQ5cmk4VSsrUEt4ajZueUtaeHdlNjBrZUlyeXNzaWE0VXpFbHFBSVdU?=
 =?utf-8?B?cXZSMEE5Sk1SMDhxOFk1RWdwRFZxRnZCNGI2U2RsYU9RM0owVzRkWCtydnQ1?=
 =?utf-8?B?U3JHdytjM2tTakpkaC95VnBUN05Ca2ljeVRYNnlTZnF6REljMmlGdGVCRS9w?=
 =?utf-8?B?cXFINWdMMDNVRG9EUHdrQW9lZC9EZEdvR2FZVk0xc2Z0Q0pBbVZGV0M3L0ht?=
 =?utf-8?B?S0daTHErMGY0QjB4WWhsbmQ0Uit3dHFyYUtFSjdNY3JxaTRobDdjTUJVNXAz?=
 =?utf-8?B?Q3E5YzZPR1ZjRFExRzNIcGNiaGx1dEk3bFVoK0xqbkNibHlIZHIyT3dJTXlP?=
 =?utf-8?B?SmxiQWQ4a0tGZnU1Q1BrODg1N2Z3T1kwVk1EdmZJMHVuRVVZeGswQ1RZdDlF?=
 =?utf-8?B?T3FkOHVReFBoaTdqV3lVQkM4RHErZ1RqUkNONi9LdU5jZEY4VUhzY1pGcWVO?=
 =?utf-8?B?RUl0Nm4zUEYzZzg1ZzR1WisrZTVyaDNGRnNFOFA0NlVIYUdNcTRLSzlsZWVN?=
 =?utf-8?B?OHJtQlA2VS93Y3lGb1RFZGlLL1NvVnlSZ21ycS8wRTRNU0Q5cFRUZmNUbVNL?=
 =?utf-8?B?bzZsdFVEOENiVDB3Mi9qU1ZPeTVpNXhUOVNMZnBvZzZPdE1WTER3d3IyNm81?=
 =?utf-8?B?aUh1amhzTUxuN0VrVlVIcWMyQTlHYzlLakxEWC9LbWNiMXgrK0ZvcERPbmlB?=
 =?utf-8?B?TGYzOTJ1d0Q0QSsvcUhWTkFjNDIvcURLN3hOMEVoMlVETGo4b3Axa1ZoclZ1?=
 =?utf-8?B?eXFVamIrU3J2RDVJdG9KWWRLMHM3ckI4bFJNVHh1TEx1Tk9wVVJlYTNTY3hC?=
 =?utf-8?B?NXMxZ29rYXA0WFVzMEFkSnA1NXpFRGpOc2kvTldKeld5a3JZYlBPdVFpbWR3?=
 =?utf-8?B?d2VMYkhDY0tRdW82WXhJckNCZExpbHBXdG9qbjJmWU4vUGNKVXBwdmFaUzAz?=
 =?utf-8?B?YzcyY0Z6bzJVR1NBdFFMOHVnckRLVytyRlZvN0g5MUk0Z0hFVGs3VXhueXZ4?=
 =?utf-8?B?bzJla0dUZFQyNlpyTzFxWnREdUFYVFZpdWIybTY4WUFLSVpBZXl5eHV0N2JX?=
 =?utf-8?B?VUhIWUNSVFF4QVl0QVQyNTVpa0cvcG5KZmI3aUlQWXdpY0cwRkNFbFhYWUlm?=
 =?utf-8?B?UWZydDBuK2NOWW5hU2VOOXd3cXFuKzlUek5YbERuNmNtaWR3OEJjSzJXcEgv?=
 =?utf-8?B?ejdPZkE2YmpudnJFRlMrMW4rUUpGeEtZL3pGNUhoclp1WVdiR2p2VEIvMWdJ?=
 =?utf-8?B?dnQ2RXoyMHg2TUJ2Y2VSSHFFRWZEK2p6MUM1RENFUkU4blB6Ny9yR2l4clRy?=
 =?utf-8?B?Mjk0Y3JPVDJSdkNXZlZmdXRyL053RWRJOTJJN0ZmbEVuVFdWZ0NFb3h3ZnJG?=
 =?utf-8?B?WkdHU2N4dEtqMUJNU0gvYzB3U2ZLbWg5TnZ6SG9zNDQzODduaWJ3emMwbUUz?=
 =?utf-8?B?NjVUeTNnVXlhQnRkR0syRkJxYnozejFLc2FFeDB0VnBwd1pPR2c3ejMwN1gz?=
 =?utf-8?B?MlhuT3poQnFtcGpkSkc4dUNiMkNBZW5SN21GblZWTm5BdWQ1VjZjbCtIV2Vl?=
 =?utf-8?B?OWJvcHQ3dnBVa3BwcFE3bXF6MExrdkhUTVNVTHBxUjRhWTlvazdTMlh2enQ0?=
 =?utf-8?B?bmhMS0JKMHFjUTNLL0djQ3R2dXVDRnZweVYza1R3ZDV3aXdMaUVZV0xSS0k3?=
 =?utf-8?B?VWFzTFljUTRMeXlieDk3RXdOeXd3R2tpbkdsSng5cGV0SzYzYWtKYkxBcWhj?=
 =?utf-8?B?SVVvMFFaaEpSR0NDR3oyczZkUlVDazI3dUZEMVhiTUtzTk5PMThSS0dQVU85?=
 =?utf-8?B?Vk14S3FKbTNMR3EyU3hFOGZJOWxpVjk5Z0pMU3hhc2lyVEpuTFNtN0xZbFY5?=
 =?utf-8?B?Sk9JTjYvL1h5Tk1UQ0lQTWhOV0t0Rk1KU244SUU0eitxS3d0aCtabzFCVUlo?=
 =?utf-8?B?V0ZqMU9TeHE1M0Zkd202VGN3RFJmT3hDa2VMNlBETGhFVXNBb2NEWGdCYU5Y?=
 =?utf-8?B?VXdSOEtKVlAwQ3pQdDVuS0hWQkkrZGc2bEc3U1lrMHJjUms4V3hUMUtJUlpJ?=
 =?utf-8?B?QVh3TjIyTFRYVkx6bndHTEVVWHpaSkQ0L3ZyMThBd1ZrZ2NZU001Y1cvUGFi?=
 =?utf-8?Q?3rnq5lxsYB0NXXPoICHmQJSDuFXNFglzWZAxj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 016e4230-8f92-4cf7-ebc7-08ded03c7244
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 08:58:36.9444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bAECfGDxZL2R/KV4rdY0Kvg3xv58vO6b32EsX/oWP1YzmYEb97DS2/FV3d9tZuVbf6jdVEfEmJn91c8yD2WS/cwBqv/Q5nvCtHVLfvMMH+W+QtDnLiLRcBlOGYy9Pska
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_095842_039928_232E0823 
X-CRM114-Status: GOOD (  12.92  )
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

> Add parallel ov5640 nodes in imx8qxp-mek and create overlay file to enable
> it because it can work at two mode: MIPI CSI and parallel mode.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 711e36cc2c99..f54fd4cdd926 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -434,6 +434,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
>  imx8qxp-mek-ov5640-csi-dtbs := imx8qxp-mek.dtb imx8qxp-mek-ov5640-csi.dtbo
>  dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-csi.dtb
>  
> +imx8qxp-mek-ov5640-cpi-dtbs := imx8qxp-mek.dtb imx8qxp-mek-ov5640-cpi.dtbo
> +dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-cpi.dtb
> +
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8ulp-9x9-evk.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso b/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso
> new file mode 100644
> index 000000000000..9fbdd798f17d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso
> @@ -0,0 +1,83 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/imx8-lpcg.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/pinctrl/pads-imx8qxp.h>
> +
> +&cm40_i2c {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	ov5640_pi: camera@3c {
> +		compatible = "ovti,ov5640";
> +		reg = <0x3c>;
> +		clocks = <&pi0_misc_lpcg IMX_LPCG_CLK_0>;
> +		clock-names = "xclk";
> +		assigned-clocks = <&pi0_misc_lpcg IMX_LPCG_CLK_0>;
> +		assigned-clock-rates = <24000000>;
> +		AVDD-supply = <&reg_2v8>;
> +		DOVDD-supply = <&reg_1v8>;
> +		DVDD-supply = <&reg_1v5>;
> +		pinctrl-0 = <&pinctrl_parallel_cpi>;
> +		pinctrl-names = "default";
> +		powerdown-gpios = <&lsio_gpio3 2 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&lsio_gpio3 3 GPIO_ACTIVE_LOW>;
> +
> +		port {
> +			ov5640_pi_ep: endpoint {
> +				bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
> +				bus-width = <8>;
> +				hsync-active = <1>;
> +				pclk-sample = <1>;
> +				remote-endpoint = <&parallel_cpi_in>;
> +				vsync-active = <0>;
> +			};
> +		};
> +	};
> +};
> +
> +&iomuxc {
> +	pinctrl_parallel_cpi: parallelcpigrp {
> +		fsl,pins = <
> +			IMX8QXP_CSI_D00_CI_PI_D02		0xc0000041
> +			IMX8QXP_CSI_D01_CI_PI_D03		0xc0000041
> +			IMX8QXP_CSI_D02_CI_PI_D04		0xc0000041
> +			IMX8QXP_CSI_D03_CI_PI_D05		0xc0000041
> +			IMX8QXP_CSI_D04_CI_PI_D06		0xc0000041
> +			IMX8QXP_CSI_D05_CI_PI_D07		0xc0000041
> +			IMX8QXP_CSI_D06_CI_PI_D08		0xc0000041
> +			IMX8QXP_CSI_D07_CI_PI_D09		0xc0000041
> +
> +			IMX8QXP_CSI_MCLK_CI_PI_MCLK		0xc0000041
> +			IMX8QXP_CSI_PCLK_CI_PI_PCLK		0xc0000041
> +			IMX8QXP_CSI_HSYNC_CI_PI_HSYNC		0xc0000041
> +			IMX8QXP_CSI_VSYNC_CI_PI_VSYNC		0xc0000041
> +			IMX8QXP_CSI_EN_LSIO_GPIO3_IO02		0xc0000041
> +			IMX8QXP_CSI_RESET_LSIO_GPIO3_IO03	0xc0000041
> +		>;
> +	};
> +};
> +
> +&isi {
> +	status = "okay";
> +};
> +
> +&parallel_cpi {
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			parallel_cpi_in: endpoint {
> +				hsync-active = <1>;
> +				remote-endpoint = <&ov5640_pi_ep>;
> +			};
> +		};
> +	};
> +};

Reviewed-by: Guoniu Zhou <guoniu.zhou@nxp.com>

-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>

