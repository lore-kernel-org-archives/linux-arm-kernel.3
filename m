Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D78606A6C4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 20:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PcRIKGNn;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=imfgZk/A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=M7lAO3IDo85TK3JKNlnPu7LW+uL3cKJKrH/5YSVGIT8=; b=PcRIKGNn5BPWKp3nMm2cO2p6oH
	m6JAw57Bp6Ha/kJT9BhJjGDZv/KNCrbmjsFIyWYvSqK6t7MF1oP7PV7XgAEFs5MPs61oapwAhk5fh
	cRDpltl/1LV82XqPIN3SJBfuaO2lUu/sP+2eltLxnAM5jAririZn2JIty9qrXTAsZDtz4A8HSGAQZ
	AMbWBiPTN9mPliEf30ZF9bMBGVUKHeykQ0XT5IiOgcrE8lmI5euvAE0QViKgDqnLTbHExBydSMwEk
	7LBrBtlCZQh6tvdbBmf3fgw8cV2bvlzlCHgs9ZoAUKCue0SVhMJr32G7pyLFcFW2dFdiT8ANcCeI5
	3BGMxJ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3dZ-0000000AU5B-1HUT;
	Thu, 05 Nov 2026 20:00:41 +0000
Received: from mail-westeuropeazon11010004.outbound.protection.outlook.com ([52.101.69.4] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3cy-0000000ATfg-2PwP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 20:00:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mYGi5b1ZjmabxBwlwmXOe/9sUe2OfeHawPgm4t0XlruYMmJFFxcF+YBwkMomXvMIOt+d/bqsVlOP9wqTB2UJbAgPHMn8ynuCNh5QgaRKPKW40xSsxUOgtXDvcRNZePOrfvKKRZFWvWjYH+3Q2H4pvUiph6lIX4x7F0xuU3ogyJZHB+p/j0UK8bfxfbMU/dg4Q+O+ZC72c3C2FGGbLF2rC9v8nW0eSdA6SFHkPeKlv67qeUrLT/3kRFsi4Tcdl9AUQrdTUeFA1wTPimPKpYCFVaT7B7CCVP7esoAqZqYo5Du+I+KqyhZw2rxiyrbmvfVGNL119maObRXNbMmk3hNsTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7lAO3IDo85TK3JKNlnPu7LW+uL3cKJKrH/5YSVGIT8=;
 b=tJFxCSRFXkWQy05BH8Umudkq6cNC35XLit7r5VgtrRpo6hcEXDB336Rh2TzqGYOiS5bYrH38h8YSjwn7sxCg4/WCIVxVxZRSustLNtobK8ynuro7WYe+h/har8oBv4B8GgDs3jiuURiaY7EXhyyAZ19KrWgHQQEaGRWtwgSLpu8a1p+i0axp28IeG+y2kwehw/Eq1dGvcHGMiv8FfI+0crw3GglKY4y9Ko/AxJd6GRxHRhpqEXeZeolPwgFGVrpWz0dOqmqjN1jndJSrx8u/jhcq/Bp9Wl4IQaXPwgpeFVXHiCAWFuW7iXHIkO+VAqRdQqE1UhpjJdohxg8zSh0VRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7lAO3IDo85TK3JKNlnPu7LW+uL3cKJKrH/5YSVGIT8=;
 b=imfgZk/AAvugLCHBnLz4WKGTjbTOTShno3maKwtLJO2K8y/LSMHsmAqMgS8p9n1AyNP954JAjoFUqZu4VaUt/ydfUth1carH7C7OJW8TFysSL/vgni9YGWvw2huM2QELoXwv/IYUz2hqXZSRDjYdyRxFF4uyy5mVjWzyvP57dmdfmnLeVaizCxdUCjOnOKM0RAPtvy41D7SrIpiF6d6+O8/vCIep9xJb9toVz9j4yomydjisUIXKK+rybENgdJB/lQPh3fI1RBXMhDKxhV21CD+BkliIW0Hje1oyTv/ueb5p+eEikXdu1rSO8/ri3tiRU+QxaT+unOG+INHseEENpw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by FRWPR04MB11199.eurprd04.prod.outlook.com
 (2603:10a6:d10:172::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 19:59:59 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 19:59:59 +0000
From: Frank.Li@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	alice.guo@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alice Guo <alice.guo@nxp.com>
Subject: Re: [PATCH v1] arm64: dts: imx91: add U-Boot bootph properties
Date: Thu,  5 Nov 2026 14:59:52 -0500
Message-ID: <179390878934.1670931.1601083616841690325.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030145149.921308-1-alice.guo@oss.nxp.com>
References: <20261030145149.921308-1-alice.guo@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0041.namprd04.prod.outlook.com
 (2603:10b6:806:120::16) To AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|FRWPR04MB11199:EE_
X-MS-Office365-Filtering-Correlation-Id: 538dba3a-83ce-4484-fa13-08df3b775f03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|23010399003|376014|22082099003|18002099003|10067099003|56012099006|11063799006|261009223027099003;
X-Microsoft-Antispam-Message-Info: 3UZ57Q8sfQnXAHM4GimFIR42aoTKpK8WMKlBEM9QUJZeP/ezczW8vdIMKu9ZwnRvpIPkZUQ1Ij16mISxHAXxU7f/g8mHXdKiIMepDDS6awd3KZDy1qHcAHDfgs/9oQi4IK0aRsYfnp0PjdP83Wr3UeSVXdWLJs68zACtxCpBS+J+l+ixBrGjq8rx5rjfxZG40s/CHz92wFNSwEm9F6JihqltV8qr8Nrvay+DIYFoJx3ysGo907fcjxCtV+EN5WF/aFGwNJTpH4DCxK7Kj06k7E5+ugiGmc6RgdB9Ya835e2+4t6rlXawt2n37kXym5qeQ5fp2B+iaI8erRY+tFPdSwgznKEZgvlVnmfVP3iQwXoKHq9bTt0RJesPoYWOAsByplGkNCCjlZFQaZoO24ZpEIQJ5FA9Tbm2zPO+/GICa9eIDzF8UXz1Dc3w4byxpyzRocMaz1Flrwj1csyU5qPZjHuZYD7OYsN7Bm3W4/sXopVsPvyMP9zaXWZF0Z4e2WV/6x8kDYmXgWFm4E2nt05ML7/sXDrNAr2wAiW2jpWBxa7rjmvSpkLnCeaCrYiCGu9Vi/2m6MFMOZIknrfve3uURNJN27ioNWxWz8NQAiCepGWo22DYSWIT1xw+BGM6Zgm+kyMnLDX1loZvztE50vadkJofFSAaAdXAGITsiFatLLk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(23010399003)(376014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yzlvakl4WnNBTTI4R0dUYVl0YWdQK2U0VlVyMnFxWWM0cFFMdUl1ZXB5dGpX?=
 =?utf-8?B?dzdZNnB0UG1EMjZGdWxpNndLaXdHSVUyczVtbUk2NGR2VTBoaEwrVjJWTXN4?=
 =?utf-8?B?SStxOHNMTldFZno2SXdkcEJpMnk1SGtSU3BqaW9vZDlSSTB6MUg5T3dkaGNL?=
 =?utf-8?B?d2o2Q3hlZWRDS1Nma2RORE5mQW9BVmU2TC9RbDkrSS9Mb3U0eHZqcEU3Mlda?=
 =?utf-8?B?VHVSV1N0M1ExM0kxZUZ0OGtsVVg1UkM4d0xGVzBOYU1jcTZram50TnNXMU9C?=
 =?utf-8?B?Q2E2VlBuMUZ5eUJlN1BZOUU3NWlRUEFDM3BCcWFQU0hmUHpEYTVpbFIyN2l5?=
 =?utf-8?B?bFZDV1JYVy9IZ1VuejB2dnVRWkhZUzU1a0lPM2d2NEQxRE9ZUE4rUFZZNU5C?=
 =?utf-8?B?KzFkay8yb3I1MFJEREcyWE5LWkJTZmMyY3NhQk5YVE1vL1JoVThzOHNRbGYx?=
 =?utf-8?B?VERzd0RicGVmWGw2K2UyWm5SUXhjWlliQTJGcGZCZ1dIRFdPWTdUbm8yRmxI?=
 =?utf-8?B?ZGpkKzErRW5mbXNvd3YzRCtEajh2aXdnTFdIV09HdHpXclNPbzZZOWp2a3Nm?=
 =?utf-8?B?OE9lNkZDeUJYVlNKWmtrM3JmSTRqaDh2eUduMXNaa2hxQVJUcVJsMHk2WUdH?=
 =?utf-8?B?SmgrQTMzOFZ4c3JxQ0JqRlRxVzMvbEFRemk0OVJPMnpPQ1cxbmlBMU83NkNx?=
 =?utf-8?B?Mzc4Q1pQTUFsdUNXQVNnYmJBMWNGcUFvYnRZdVJvdTBYVzZlNmJQMUFFaUQ4?=
 =?utf-8?B?c3g5YzFtako2ZmRkd1ZobEJqajRUc28wWnZFTEUvWW9UemVMMGx1aFMwL0tZ?=
 =?utf-8?B?TTNYdlJreTVWQVJSNm95d05tS0NoMklkcXkyaU1aU002c0kvazZOQ3FacjlY?=
 =?utf-8?B?TEdrc21oZU5hQm1RcGliMC9ab3l5S25jd0dtZTNsdDFabFJHWER4OGkrQm04?=
 =?utf-8?B?alNYK3RvVlUxcHBsYXpQVWxwZGJYcGRNdTZ3cEJQYk9hUWxDV0hvNXlnRFNV?=
 =?utf-8?B?UlVFTkU0MG4vV3V4UGxKQzFWcExSb083bklJNDUrcm52SkdNWDlHTS9raC9W?=
 =?utf-8?B?UmxHUFNaVFJBQXQ5dms1YjZKSDh0UXlLakFibjJYd21YMXlPNU1qb1RuVUpH?=
 =?utf-8?B?YnhyUUpPYnFxOEZPaWoxdmVGWVJnbzFrRGtJZytYRDA4Q1dwQ212aFloYzJw?=
 =?utf-8?B?d2NqNm8zREZpRmM2SnRyRi9XRFVMRVF5YjloTVBCaHp1NWhidEtxMnFUOE1q?=
 =?utf-8?B?bDBoQUFSZ3ZpMWVEVzFsQ3hUanc3dW1uRG1LYmFxRnRFUk1EMHZ5ZjVhOFdO?=
 =?utf-8?B?d2tWS1M4ZG1aeFZNRE93azYzRSs3WFVNRUpSNjM0UG5jcVZVeW1qMDlVZDFs?=
 =?utf-8?B?Sm96TVh6SzJXSkg0bytXWWw3OEIyb3J4YllFTGhET1ZVZFRzUkQ2ZzRIUGo5?=
 =?utf-8?B?dVhadlhPamxIb05LWXpnUDBNMU1oSkNpMjU5ZXB2NzY1Z0JMdDdVWXdTNUdH?=
 =?utf-8?B?VWt3eW9qcFVCVGY3bWV3VmF3L3p2ZDZIcHpwSlFUMmViWEpkcTliTnk3VGsz?=
 =?utf-8?B?ek5lU0U5ZlZ4TWd1UG9mSFB6bFl5enZSZ2VCSlF3Y3F0UnJGSHljS01WbEVa?=
 =?utf-8?B?ZlFIY3ZGamNTTWZVZnM2TndyNmpBMS82UHhKOFZ3dXNENjhLcGVvQU1zTEM2?=
 =?utf-8?B?R09pWHc3U092Mkp3aENhV0lnV0IrNXF6N0VFcmlZc3I1eVhWZWNJeG1IM1FY?=
 =?utf-8?B?Q05sV2VXZkVwY29aQ1YrM1loNGlPcTl0eVFBSmd1OTBDbVY5WXV1Ti9tS2pD?=
 =?utf-8?B?Y1FseVVFb1p4MUFncDVLR2lLZjd6Y0tpZzVIZXhyNFNsaTNZeHplSGJibnFj?=
 =?utf-8?B?bFpxV2xjVkQyWTJ0aTVZN2hieldSTUR5bUFhV2E3YnBqVlQ1R29WUUZuTER0?=
 =?utf-8?B?RWwrTFNUU1ZFbmJqeVhtaXc1TUVWaFBiVGU4Ny9Obmpad0diMHNQMTRkWStV?=
 =?utf-8?B?K09wdzdsUXZNR2Vsc1FGRENleHZ5T1o4bmF2L0J2RVFpQ252UEU1bWlxcm1v?=
 =?utf-8?B?N1hwSUNacUUvN1FCSHJySlprL0w5NzlybnZUS2JleWhPd2h6ZENxNGxBOVZz?=
 =?utf-8?B?dHA1OTdEK3Ird0J1Yjk1cENNQ1d0QzB5NytHeW8rYnVxdHVpRG0vKzR3dUNu?=
 =?utf-8?B?SDJRT3hQeUsyMWZUSyt6WG9kMVd1VzJHSjNzMHBsWE1wcWl3anJZc2dnLzNJ?=
 =?utf-8?B?Nm9SdnpJNk1Cc1YvL1daWlFhdkRYaEQ2TmJQMDBCOHFkSzNMOWRoWHhsMmN0?=
 =?utf-8?B?N2hHMEUyTklCY042UVlaNmorcXNPZkozamNSc09QcXk0NDBINHBRSGhiSFpH?=
 =?utf-8?Q?56pYIWhS+xsjSO7tT/ZvMeEMX/SufjF+sNA6c?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 538dba3a-83ce-4484-fa13-08df3b775f03
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB12445.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 19:59:59.2081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i1rnlLomUgH/BOE4dLNcLiN07boWXnaTUxxS4+z7EEqB7I1RXXrhseQaMXpbiA2cnbBN1na8/Arkx9hU9fqYY9B221yQIMxeMJOShXx38OujdtdLOiFY3mI5ufux5MB6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_120005_605192_7CB3B46C 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Frank Li <Frank.Li@nxp.com>


On Fri, 30 Oct 2026 22:51:49 +0800, alice.guo@oss.nxp.com wrote:
> Add bootph-pre-ram, bootph-some-ram and bootph-all properties needed by
> U-Boot for early boot DT processing.
> 
> Place the properties in the Linux DT sources so they can be consumed
> directly by U-Boot when generating its device tree. SoC-level nodes are
> updated in imx91_93_common.dtsi, while board-specific nodes are updated
> in imx91-9x9-qsb.dts.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx91: add U-Boot bootph properties
      commit: 1d4689fb2f2bb004d811d37abb5e319ccc4ec90c

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

