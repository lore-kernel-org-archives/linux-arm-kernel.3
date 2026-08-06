Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932F7C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 19:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3TmK+8ru3Hkq5+SnLnZDOYJrvYg4u67uv7Tv9+uzUkE=; b=4jQ3srmK7S1oFn+HxAaHwSQCqL
	9FBBBnBdTuM8zlcGzHF0eYsE5iQVGhNSnMXRqiyzRfDn/qrQKkOy9Sv+7RoFcUjuX89q12O4h1TqM
	PDx1fza46AFLom0+l49hV4IeyvhWvdvO0hbCzr6S+qJxOx1bzC6TVmCdSy7ggvDG/BVr22vTYylve
	ix32Y4S8oieUDA/+em5yEqNij1pEGsxdb9BN+MVe2UISCAVwLdMAm6MHXY7RJ0qBs7ylOTl7oo18y
	IHqQ0xGWBDM0lwv7Eqk+tkItFtaYQFSqVWjsrrBbC9msd0eq8Fb9A01+W/QdyI+6UJom0D/94gP4R
	S4r37LsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws4D6-00000006cV1-3LjU;
	Thu, 06 Aug 2026 19:57:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws4D5-00000006cTT-1E2X
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Aug 2026 19:56:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3TmK+8ru3Hkq5+SnLnZDOYJrvYg4u67uv7Tv9+uzUkE=; b=HD4NMNvJPvnQxe0nK2uqBBh17a
	0Kc/24mB325o87vv3aq7MaSzdwoWr5FlvRr/4sWStbYix6X/Fa/pJw3aCFyik+sz17z/XV2IQqGYJ
	L2xu60ARDrOMxV8dD9r4GZ9tuv4YkrjqfTGEhewiwztugPu0+bCIkVRGulsKI+twac3rG5GSDyfy3
	4v4O0DIDl9k12UaKyI4KRWiGX/aZ8QbewjA4HlyiIFc7YZ+/8xoi6VMlRhA6j8X/14/mpKlAKMVe8
	mGnaP0VS+cbxiGXGsff5Q4Q5M8OcrCuexRooeWshJ3S0qD12zFVpNie0yqb1IsKjQf36Z4siRoxdT
	iGW9dSqw==;
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1ws4Cy-0000000Bo3c-36Xc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 19:56:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=poSLF8RRsxVinA9cwHGb6kznkG2Yqz46K7XwYDrL6c8LX40Msgt1WXmZSPud6Ucj20TNPOdD2gUlVGeCjQ6d0V0KeratAl+MWDzSDlNYtTucOpJuCrOTA6oAuwpkdztVh0OsB7Tayktd4hyAHSCW592gFb4BIGkS9xIKCEmYyAhXxmTmyQAs2kpB3rM0hVAHJZyAyo50D6ZTEXf8TPS4tqb1GoLak3oEQ6O+8NsPYOXYceECyJYfqnyBGalWJmJTMFUuPdttFKq98T2HFkYNvDwEhv1QT24q/RIb35b+SCRU8fFC1D3VHpc165rrZEFRyA8slZlCo4+vLFrZN56+gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3TmK+8ru3Hkq5+SnLnZDOYJrvYg4u67uv7Tv9+uzUkE=;
 b=rA6CrxsEG5TE8Io/qUV1w9OuOtRczIrpWSQBNeJvhI/65oo1fuF8yMeCk9e664m1B1OFNVKXnYOiA+GJwetlgxb7SqH8v/3rLyRkwqBEAOMKBkvMoxq52B8HGI2Yyf3r+8zghr8NgSGRgHyLl9BQLISY2+iK5HsTNaOoYUO+4QZPwmvTYlL6xT0XsFaZBg8sy/2LSpVbS9zLosjljoZySok2fDDxEVxOmaOq55YycWeBYuumHtxxBl2FHgXNTBWOGtnp+EDr0y31IxUVWbVUuCFZx829Ckh8oCFLtKXqlBr//bbJBxEMrCaXYO7kwJ8YHZZDQPcZTa0FLzWoDd20PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3TmK+8ru3Hkq5+SnLnZDOYJrvYg4u67uv7Tv9+uzUkE=;
 b=ig1IlxgPdgis+HjasHSbu/8WpjAo3X4IkCcMAP6F7hSlkqZIOs63TMYOH4zzq72DmIq6H7HJxYAzaJZF/SP9uFMorYMEvyJRq9GZtknUBxOA4R4cgyzH/bwy78SeByJJwTKqpbpOihIKck/upvs5tdkPzPfhBFIc3Ur4EUj6NQYrbHkm0sZogRGZpiyFSAdbXXBHpFSeGcdNl8fgMCGt7Bbax/kNy3R40CUuUDGifJ7fIqt1v+ais/tLAsnOQgd2yOuQdi4QbEvlglRXzALIwJXQukXbcOUYXEpi4u4eQBLnINW/T5gdNuhRjH6jZhg1YVYKxLSUcFfAPaWEH4TdaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB9907.eurprd04.prod.outlook.com (2603:10a6:800:1d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 19:56:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 19:56:49 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/3] ARM: dts: imx7d-colibri-emmc: Add Toradex Displays 7" Parallel
Date: Thu,  6 Aug 2026 15:56:41 -0400
Message-ID: <178604616242.431490.2877142775301570674.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723105225.194366-1-francesco@dolcini.it>
References: <20260723105225.194366-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0080.namprd04.prod.outlook.com
 (2603:10b6:806:121::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB9907:EE_
X-MS-Office365-Filtering-Correlation-Id: 05c6be6b-33f1-405d-a6a5-08def3f4da0f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|23010399003|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: FN2z9Eku/AR/v+BomkUDus4PiPRT6jAXTL83IbKOTC5v/Ux5HewsCEP6LCfRuPMqsctOCuCIzriJUoclGepPMQxhYdp8P3O47zU3t/bWTIE1MKXlwPaTiBzLULJ/1vACj/YLbElBAw9BLwqXV6rOC15OidOqNzncNUwI1k+sOGliFRM6UF+JeosCRxRJuR7J/MMrZwK1t5BI7Riq2+2lOa2qjGWw/b5kz3X1Mbu5wJVLv6qaXxbviApXfppw43yaX3DOtrkcT7D8kY8YLxKLqQr20RAbewuhZ3RkqhkViSrncNz+bkjdHkR95KEGe0KgjXyI4n/tBRkkmKdHWD29IuryN0R7brcKXiO68mfg/Bje1MPfhDTH60Wn8FgujXqy7WobQvVdQxOCTKfMpf1lPBI/E9PWKj1R7yrtAS798/gb98AF9sM0dg26L0eQHGHN7Sm36zI6TutmTXR0sMNDDN50mN9sKyPXwdRp2Hk90XEZ8SsHHhExLraXfhFwDrPX8ujbFQ0FDNl4b1zjtd3zNepC/+N2SHONd7ytdNrcFoNTxZp4L9Vtqmcj6iffT1q6lx5E3pRVgbn+PAynK7bDHiXjumdvMlLyN2HZYr2m534GKW5JIjZQRHRxdBZY+VN+eQsJ7GUNV4/sxuhQ2YtBA4Wtw2gYeMUwGfDaJ+C0GjY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2lJN2dUbS9zemdVblZ0SEZxZStmUFJ5bUhHclZaMFRaVWZqalFnMUN4TkFH?=
 =?utf-8?B?bUZYVlVrZnY3UHdyUE43V3k2VUlBUlRQYmFQenhVUHZ3R1ArOUVoaGZzVGFl?=
 =?utf-8?B?NlBrSWxxSjNCbTZuM1hHKzYySkEvcm0rM2QxY010Z2krMDMwZ3Q4UDF4eEdi?=
 =?utf-8?B?QUM2N0pRbmVNUzdtWmVyWmFoRXg3OGl3bjdSMVlaWTljQzk5RjRCTjN5Q1dQ?=
 =?utf-8?B?S216ckV5Tnp4WXZSRkRqQ3BTc3kzUUVRalVMVzd0UHZja1Q5ZnFUcXZ0ZGxw?=
 =?utf-8?B?clkyOVFjRjQ5SThjSEY4Tzg4K3RGd0NzNWd0R2xtMXhVNkJWcmNQWnJvMVNN?=
 =?utf-8?B?eTRBaDJQdmVXMW5wbXlmS21BZ3N6YSthYWxRbHI4Ly93Wnlsb3M3aTNsbTlx?=
 =?utf-8?B?N3FSaHRKR2ZQQlVSdCsxOEduclVHU2N0YjVFTVRTVEt0R0tVTjFkbnM3dUlj?=
 =?utf-8?B?VnBjeklObStYUE5IVVhZMHFUYzk3SE1XL2VuOHR1UlVkb3JUUGp6OTdON1R5?=
 =?utf-8?B?eFowbTFKUjB3V24vL01pQm5KTXpndUF6NUVwMVNnSnBuNU92cHVUNDlMQ2Nn?=
 =?utf-8?B?V3cvTUxlVnl0V0JCcjcyK0k3WTlEOHVtTGU5eE8wdHd4QjE4SDJsYzJiSHIz?=
 =?utf-8?B?d0U2c1RTTE9aMEVNNXZ2R2FNamI3QVJiRVFKc1lHUUJoNTQ5SUNqYkZvb3pZ?=
 =?utf-8?B?UkhzKzV0WGp1K1MxZGZDUHZZSGZETVhiaTNsQ1E0UjJvSUZuMFBseEx5UThW?=
 =?utf-8?B?S2VSK0tKT1lKYU8vdEg2OWVEcWlOYTJ0cENhS043TmVWNHh6djJGWjhFV2dv?=
 =?utf-8?B?MnQwc0ZIY09ZQWV1Ylg2SlBGdk9hcjd5V0xYQ3ZFTlV3RDNXV2tyeFdQckFS?=
 =?utf-8?B?UVJQOVV3SDJHTXBVb0hhWGdRRW1xbG5ib1FjMTYvVHlVaFhoSzdISVRuN1E3?=
 =?utf-8?B?emsxS2VaUHI0NTVncTl5eFYyM1kzZ0ludU82RTVFbFNrRjJER2FZL3ZGWFU4?=
 =?utf-8?B?a3VhU3RhcDhxMG9Kbzd1L1l6Z0drVmNMazFmZk8xWVNQK3RiYnBJdy9ZRGhB?=
 =?utf-8?B?SFMyaTVTcWIxek9FbHBrTDQwWTdOekxKeEE5dUd6bEJFRDFLQWRNZ2t6eFVi?=
 =?utf-8?B?b0VVNXpSZHhTTXNHeEVuUm5COFh2T1JMT0tCN1FxSHNHV3F5U3VHaWo5Nlc3?=
 =?utf-8?B?ZitwUHhxQUgzelF6R21ORDJGMWVjT3dZSU9RWE5GWFFCenhheTlhS0ZCTTZ4?=
 =?utf-8?B?RmJkL1RLeXpLUHpmLzNIcmllcWpDWHlmSmZST2gyZGMrTjhqeThTS2hWdUZZ?=
 =?utf-8?B?NnlEcDdtVUI4WnpTeU5nNVBkNDdLM21kMUN4MGJwckV5VnZHL2w3SzQvcGIy?=
 =?utf-8?B?L05lOHVCS2dWMld5cFBCeVczMGNScWpSYTM2OW5DMWlQK212eDFXK1Z5TWNK?=
 =?utf-8?B?c0hNa0hTMlJzNHZpWDJLdWJRVW9sVlo1Y29vM1ZwbitOUTZ3QXNNSWRZL0N1?=
 =?utf-8?B?RStPbGFobzdLNmtsNW0zcXpvVUdwTWt4TC9JVEEzMEhpaTd0M3I0ZXYxT1Y4?=
 =?utf-8?B?UHJiVDVMeUVzaDhPMnIzaW5mZjlQSnZMR3Y3b1ZwMlgzT29pZ2dkZGR1dG5I?=
 =?utf-8?B?amRMNCt1bFBucjlaSUF1Nzk0NjNkUjY1Z1VKdXBkUVFnVlZIUHhBNU9vTFhl?=
 =?utf-8?B?aE4ybHE0ZHBaYmh3YWcyQ1RKWVpOeEhHMXlseVpDV2hQMkZYUDJDZkszSC9X?=
 =?utf-8?B?aWlCNG4yNHRxajFIbTA1QS94STVIK2JoK0RlbU9GRTZaZ2E4VmlLWDlOcHJz?=
 =?utf-8?B?TUhtdTliOXkwZDRkc1lwK1Y2N2FxWi9ieE9WS202Y2JkWEIrNTduZ0JraU1B?=
 =?utf-8?B?SmVEL1pjaGtyUGFsT0FFckUrNFBVdEdsM0V6RkpHTHpNNzFXY2U5RHR4MzBl?=
 =?utf-8?B?cTJHcU11eVJMczBRODNPcjErWXdCUlpXbk1GN1YyckdBRnpkOUpRTU4wdnc2?=
 =?utf-8?B?VVY2MmxnRnJTZVRtNG5Vb0krdjhKZHVRQXVRbTFHbllEbmJJUmlYeG05eVJH?=
 =?utf-8?B?VXpOTUM3WXVhTjNHNVI3aCtJYUUzQmpWVzJqTFI3SXRjVzE5QUVZNDZzK1pN?=
 =?utf-8?B?d1N2YXA2VmZoejNYMmVPSzVCeEo0ZlV4NkFBOE5sL3hzU3pNdTE3QkxvQTZl?=
 =?utf-8?B?ZmYzM3dpVU85TVRhS2hWSHRoSEpydC9aMWtvbXE2NnAxUlo4SnB3OXlXcDBs?=
 =?utf-8?B?MzY5azVuRWNzalljd0cwbmxmOWlML1EyQ2Fkd01IUUJ3QUdsc2dOc0hCL200?=
 =?utf-8?B?L3NrQlo4WTZhN2lsN0lZMEZWeUhmRjBicFBzT3lybkhWYnNBZFBvMHJHQWIw?=
 =?utf-8?Q?JcSQoxOZBg2O7m59sO+FRKpI6ZRY1ikPsYKYF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05c6be6b-33f1-405d-a6a5-08def3f4da0f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 19:56:49.1375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ofp14Y9FPZ2oXj+3QWytz5ah1pDWOQI8itRVQ5fPLXNnKKufmR9ET7WNFMWf0LeVKTADVC2a+zXzv6JE3Xht7qCy4D4GmyYwp2UXCoGWxnyPv+9cWmRzaxzuA2Bkdij
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9907
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_205652_886503_4000F431 
X-CRM114-Status: UNSURE (   9.19  )
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

From: Frank Li <Frank.Li@nxp.com>


On Thu, 23 Jul 2026 12:52:16 +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> This series adds device tree overlays to support the Toradex 7" DPI displays to
> the Toradex Colibri iMX7 SoM (eMMC variant).
>
> Francesco Dolcini (3):
>   ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 7"
>     Parallel
>   ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 7"
>     Parallel with Touch Adapter
>   ARM: dts: imx7d-colibri-emmc: Add Toradex Resistive Touch Display 7"
>     Parallel
>
> [...]

Applied to imx/dt-indend, thanks!

[1/3] ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 7" Parallel
      commit: b83637163279a2a69a559c8789cd2197d9ae0104
[2/3] ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 7" Parallel with Touch Adapter
      commit: ce580e453d27327c79ac8e95dd3533a325cd4202
[3/3] ARM: dts: imx7d-colibri-emmc: Add Toradex Resistive Touch Display 7" Parallel
      commit: f37a9b80fad87bf39b66a3f5b4dcf0d0d91c9994

Best regards,
--
Frank Li <Frank.Li@nxp.com>

