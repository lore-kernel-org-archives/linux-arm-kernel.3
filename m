Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F26606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 12:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F0p8M4T+;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WK8JvXXE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7ta4dcBhs/BE0JAs8+0TDhtMOaA6e5pfXdxY5ldrMjk=; b=F0p8M4T+Tswa85Ffr1Cg0sOXxK
	kDy4Nf7tJxNJmBBBCptq4yK2T7mWyXOPO/bqeeYix4hXinko5QhJz6FrvsghK66QHyh16AaSOAFNF
	kLe+r602t0Q3KbXEp79JA6LPHNBWjp9m/1wIv7CC4cGshSvbk8GzmPQ4eEmCJIC3H83VQ4zeaYclI
	v42NCCEW2wh6fwSVrEDiPEM4MJs9C0O0GzAct6yXy5QuKBHRlHywIYu59GBDr50owC8C8JDXUzDGF
	lCvoQwarltFGEU8aQvJbhXnhgOnKjcuQiNgpAstLd1htel3eHLR04WIO5BXoO7+Hs/kLIxPxPo3ms
	nltHcvpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODZo-00000002N0A-0ziB;
	Tue, 03 Nov 2026 12:25:22 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODZl-00000002MyB-01sm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 12:25:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qc4DE8ko/pjLwh/IzI8OWLXpFhjg1+Er9or11pMzSWNl6tGB3cf1YdKLoF7fX//CaA8XWwi//1n+7Fri8JTqwqaMnkMYMYk8k1vAPJFzoNJ85FYiw+GjCJnRgryn196dcSl020JU4Kwnn195sBsWdnFMELj/Tc588rm5nhzLLuqcX4142RSSrLUdVY6bitqjsCT1ZoL472EWqlHea+uPRU47/gGVbyx8262jsQaa9eDlQP9voyTuRGlZIDsTZsxpfyNu/C4k1jJv46otnfcD3V2Oa0f2q8kJ0JoG1a0lxCsrQTASOPypD1qMKJyO+P00aRSHhz5CqX6ZSYOU+vt9RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ta4dcBhs/BE0JAs8+0TDhtMOaA6e5pfXdxY5ldrMjk=;
 b=v3gRLXg03Q0RPLyVvdY3MszXeQDNRyMtXVSDAaw1anw/qmJxHT8ErJFAWxp25yX4GBR/tsS9++xLa8Lkexe17wR+mKORP5sKS6JsA9KN5r8Pvc63PXZK0IwmMQxn0afAgEt406tCIYJgY4guUjw01j6ap0WQZTw8Sy8IdeiT0EZsxVZUdYzsgOm6X52dakX4+tPKXyg5NyLGhH49XZCZkEDd4fKxtUV1jsW6c8CwePaYDcK7tSlfnafZwNGzifoOmBJnSdnaAvdfQ6C4JJcbqhCjWqbhjnRyjzVvevv5qdx/zeyfnfR2YwunIXBwhl9cmIsk/Eo35wU8HroTpRB2rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ta4dcBhs/BE0JAs8+0TDhtMOaA6e5pfXdxY5ldrMjk=;
 b=WK8JvXXEPFTQ4YaJfIorS0WZm8/GRvf9KO0JzuAjkaw7PHZ+QeKlQi0WbWBeak3G9JyEwzGq/5ZLDRUHDjXE0lXQq/h/0hS7n+mMueDsmWWfDbIRhJrQf8hNSdKoiu+eFjoxpAZNVdKSLoP67y5IJyg4F0D7afXA9cHapVJxpB7dGkp0bGNa7Op4bOoD7t1/XQ/xis9baMDKUvyryH36thnNsvwuPW8SaWQRrDz+6PcaY1Jg09jKNm3yu3t4Agvl2TS+RclwGaH+hIMlWG2hsx4vWyaa9e+HSRP81xkUQqMLZmVBuk7Z4DqYQ3YYB795ixIiKV2HRGAYebgpExzVjA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19) by PA1PR04MB12223.eurprd04.prod.outlook.com
 (2603:10a6:102:55f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 12:25:07 +0000
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa]) by GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa%3]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 12:25:07 +0000
Date: Tue, 3 Nov 2026 14:25:02 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] arm64: dts: freescale: imx95-aquila: Keep DP_PWR
 always enabled
Message-ID: <aunOT21BZmGkJQ25@vm>
References: <20261103105323.2394012-1-francesco@dolcini.it>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103105323.2394012-1-francesco@dolcini.it>
X-ClientProxiedBy: FR4P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::14) To GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12318:EE_|PA1PR04MB12223:EE_
X-MS-Office365-Filtering-Correlation-Id: b2d9d82d-d46b-4c43-f619-08df39a57eae
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|366016|7416014|1800799024|376014|261022105027099003|261009223027099003|261026121527099003|261026140227099003|261028144727099003|11063799006|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: foLfAuSP6jiQaXNiadCspgT5BbR45zK8DtdcX9Srp81gX1q+dIrBgFFUQPoaWcAirKswDJIijH+yoKtGky2wXSU5uswDjd5jTdr73VXCL39zixdm9gP9Q44XJmwYytn0o7/DMnfUXDtImQT7Dxv/cVmLsypvGNGvrMqTci7jEJNja35CKUpRhbvi1RZrqeyfRBvqct+OtWvdRqbEXRVmeZ2jHBHA2UBWQAZGmJ97ZvZIwPDPl8A5vWgPyAav0L5k9k6qyPSWMjt56LDXWUGCdgSBoh2FEHXUF3mTue9seLSBAXXmPL5eYzmECnneDdZxA/6vmpXUZEtexp16NJHbDVaXpBODW88tGQbbv++dPcCEY+4QbvZoxscNrzfmjuUk4oiQcYygQfpGL5YQgPo+s35qdpzA9NcILv7z36SWgxc74KvnlnUUTl7KnRx/Vk5NfUCJmCHuic5+gUo2OyxS7OyWoLA10datBePJZOYpx9MVhZS2Ah6wrUGs1ZRhCln8o/SmdMTlzObFGfb/9khTWlzJiGZvKp/nyGioHpQWo2cWPpIh4CrQ1xPloepKtWlXynFVbzfyVz9JxavVgX+1xAlmJEOcBjPCsbsTBQrqJzBvRTWJlEJZzx/12749/LwLEtgRSUTR4ccEtGRgyxSPQcCdVat9KZZfqRxzPjBSXDY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12318.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(7416014)(1800799024)(376014)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aWksfYNK9jcRaYcrFsntdQDxn4Bb4HP8hn5QYR5eWdcgJ3DHn0qCTNYDQjvr?=
 =?us-ascii?Q?9HQjqWnqHlgnuFUGG4ATXvTfnTIB7CGqBHT7CcBhU7nRTsCFquHbsZj/XnW1?=
 =?us-ascii?Q?YXLv1byOENRYwBN/P83Y1kabMZv5co6oPEGyrWMb4Ows5fHiNL2bY33WXwYq?=
 =?us-ascii?Q?ySpkhReWYpOL5SM7elphyTtLsSuRjA8Fdf/PughTpnMEsUDZr4umRw5PVH+9?=
 =?us-ascii?Q?vhvdjmc9t0WH7fdxqnBpQHubg6lXcp3Sq+2Q1ONf6Jna4KQb6WO1dl7zCCWu?=
 =?us-ascii?Q?or1rpPBXJWZrpJwNHJthv0vPEul/B0tQddMeqk+mbaiKTJwb//szuKlzVSF8?=
 =?us-ascii?Q?8WM6GC4uq+SqFddvgXcpN3KPW+wMSIvBekkF6NGeytwiLDG7F/J9LlI/Sh1g?=
 =?us-ascii?Q?uJlEIOornUi3v1ZRgoix5Fy+upoglcC1cWyv4OD7pCDluXz4JF9b9Yf9PJOr?=
 =?us-ascii?Q?nEkfZQO7mC9suHmhtY67mbqPb+4AqWpZ/MALwFdGsFf9VLRwXkHd3egiYsBe?=
 =?us-ascii?Q?FeRQNxs2AaClrriWV5Gh/S+JTnfpvKKdLMtpdLiIg02MeMbFea21pEaSk8lU?=
 =?us-ascii?Q?aTgdHWyXO+RxRgy7xHzfvMeW2hf/7G3nl3tnZLh71uwc1/O9gvnM/gvkR7LE?=
 =?us-ascii?Q?Dp5Y5cK0EKYjV7zjckZGiIEl2GbkEp/a8wGaTRPFldv2LMbJKQqgfS2NjGuN?=
 =?us-ascii?Q?rMCzOght4BbgOuMC99MyN8m1oNyHo2dVJGF/LaTd706fDyTLDm5DRNlGTeNU?=
 =?us-ascii?Q?PTZJQZNqPgYO7aHPeP2yHFBdg6jbBPI7sARKoR8rRfQP0BTyvfjZUoHEB7J1?=
 =?us-ascii?Q?15U+4LesOwcU2ObQTHzDDXNLRy+jzylmlenvRcKtid1yG9ym759wEdRSIupu?=
 =?us-ascii?Q?ZbvJhRFMKAgxyY55EEZI3ozAL4YvsjbRLdNOoCIfLlaFl/7xp8yyWRsgwfrF?=
 =?us-ascii?Q?zMOwXdLXbFgImONBMAkEF2dnt42RZ4MZS1eFd5k8/Xqa9hreTWhGJQ9fHgcT?=
 =?us-ascii?Q?3NF9YmOW7qq/LWF4Bujt73/LcKjC9soWpWZDSyJp9T7iaRZsUQRXG5SPcSgL?=
 =?us-ascii?Q?IXYOqmNVrCF9+5axtXl2VfcO6txdVNfepzp/mN8udFb1qfIIYr/F6ky0LfDS?=
 =?us-ascii?Q?uHYaZVh9SU2flgb19/FI6XK410tTRyJs4QaIPeDhak3tvOPi6+zGH19dgC9Y?=
 =?us-ascii?Q?9rfC51UW7rHTLabzvNp1NHdpQo90D/xCsX6pOAidnLPGAkFqHLo2qB4u24jA?=
 =?us-ascii?Q?LYWvdsZBwDIZCXtF/bnHB0irk5tWdE8VlpQyl+EpU3zQI/DTKW1g+norvE/0?=
 =?us-ascii?Q?moaL9xMxFdbFFig4HdM6aWdGEHf1u3ttgTkO8+DyaL+qQQh7i+SeOitxYzBT?=
 =?us-ascii?Q?IkTy3toejKWtza4SEPIVnU3ccBUm8EsASQM+ykeVakBfEwLfJOVhZjcfGSjP?=
 =?us-ascii?Q?fo9wL1QPDSLnJFiMKfUF9fyIUgLgyiCUjbKEaXLbBQ4DFE3/IRdsTuhsW5T6?=
 =?us-ascii?Q?ehaYy3dIfvECcNX9VvkmxnKHQMm1YKogpHmokkM3vZzrcqSM7JtGOJX9m0dU?=
 =?us-ascii?Q?oXbPqviXtoFKngVRaPTkDB8KagW8znfkHNQ4OpmoiT/IAwHyqOPj59gG5nj6?=
 =?us-ascii?Q?49MwqHbQdTL4xno6WZh2V6ZlKdIGrRxOPUs1jRLHj75/fUvKdYd0MYt5qMTe?=
 =?us-ascii?Q?Btss5/v+OWjvAt36pXUEF+aVdPt29CmA6BR9utbQfiFOY8AgKIFzB0V1H5+m?=
 =?us-ascii?Q?J6qJ3+ghZYOe4QhdpwrJxmM+83O4fOA=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d9d82d-d46b-4c43-f619-08df39a57eae
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12318.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 12:25:07.0004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4GzTteWx50zLt4J/Q1IybDD4OMeYPQMQAuKal8MAksrPXROR2P9ntFup71c5UHczFFZzyvHGwvbEdWiduI9RMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB12223
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_042517_059465_878596EC 
X-CRM114-Status: GOOD (  12.45  )
X-Spam-Score: 0.0 (/)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Francesco,

On Tue, Nov 03, 2026 at 11:53:14AM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> DP_PWR on the DisplayPort connector powers active DP cables and
> adapters, which do not work without it. Keep it always enabled, and mark
> it boot-on so that the firmware, e.g. U-Boot, enables it at boot,

I believe this "mark it boot-on so that the firmware, e.g. U-Boot,
enables it at boot" sentence is a bit misleading. AFAIK, u-boot does not
parse the kernel dtb to see which regulators need to be enabled. The
'regulator-boot-on' property in kernel dtb regulator node simply
indicates that this regulator was left ON by the bootloader (see
Documentation/devicetree/bindings/regulator/regulator.yaml). If your
goal is to have the regulator enabled by u-boot, I believe you need to
add that in u-boot dtb as well.

Consider updating the commit messages on both patches accordingly.

-- 
Thanks,
Laurentiu

