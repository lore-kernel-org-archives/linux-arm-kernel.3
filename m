Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C32606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 06:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=slya9ljn;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=HGfEIAwt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lP84x6jamEsQhmvAkar7pfpGsWrgb3M8UC8b8nLssoc=; b=slya9ljntwxkww
	1nX2LCLTF++DFkpjRhyywR7WX018G0per99CpH0kU0TJ2WVOU1Hy9NOodklqlN00rsGhLbKC35fL7
	vX+GQPvpemwlV3e5T0ncQW7tt8FFXWDHeWwhvaeJqD7Fr8OggINkp+vSmgj1LwP0ABBQjCoW5ZQfZ
	O4SYSK9j9sMncSBS9p8IM0qXNusiBvbVwgLXHPPQxo+Wv30dhAk0EGnY8r6KlYEP8zV2WosrMH7mb
	grQwG9UXrM16jvud25fZ1miOFCGPnYPP2rb2SNKtYhs1TXpvhJG15JbtzFUvNp82heg3URnyJ5Ayy
	Ij3Nyw40XKArGW7oNYrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOrAO-00000007xr1-3VoD;
	Thu, 05 Nov 2026 06:41:45 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOrAJ-00000007xp3-2ICQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 06:41:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yvjGLb2jgZ/AAkA/DlP79+f6ZWrHyABMpYfMIQr4vOE/EvuymMZUHsMEegDhSXZrGNLN7SalI+SObvqYILdFcbt6v32sFK2kX74WQfj9YLaanCvvZbNbFZvalYkJyknSYoEWg1VnWxJSe2nkR3ldcIFUqeHQFVPnblSwaC5ISJLTj4Da23nc61frRhOKsH3F8H0kDtYmu0iiCCF5bmGLVfsJFsz1gTiAd88Ll8FEQORXN3cPIzMBK9fVf77dfONmDQjGoQA5E0lucTQ52DIea+5T8w9asoM4keHxndqz0KfOi8xgzpeHc/UVE2h0jv9jX5ev7V0Go5IncAQhsFvUrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lP84x6jamEsQhmvAkar7pfpGsWrgb3M8UC8b8nLssoc=;
 b=gFpgI10/eHcAMpwDbwxseuPjDMwI9s3Ve/Wjgz30qpdFAcf+gBoeDzYzJ+U//2qWSZ0R8SPWCdNGK3SlyA7EJqgAfm9Dfl5gUB6V6ktdbTdg+xfnletQ/1n+cmUr67624s56LXWkUE1cPRhK5ZkoesgKop3tZbkA55uZaWSxBHzpSUsd6ojfzvK+tTJLsZk/GzVtU1azwjej4JcHCUudhPoEnMm0vqO25z5FaXBXycG7EPzhk17c3LIZCg5p9KUxyS6rdxRUgwr+Lj9+dOhIDJqA35AwPmDgnICNYTC0MRqnFXVCo5SlrUbWbkf1ld7W8s0Xm8KIWUUTAtjgsliWSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lP84x6jamEsQhmvAkar7pfpGsWrgb3M8UC8b8nLssoc=;
 b=HGfEIAwtvS84TClLlSw1uIMlfA1NNSO0pnHl0pomC8nh+GT8qxyLK6+YC7FS+XluCe0iY5UWJ8PYJPLKxO2AlTXQr5LpFqf/CmVsSCwVGIkxcQNWuaqfncTkMqgTHs4hEgz2IFPHKM2MQ+saV+CzqZhii3CUTR2K7+9fZL2z/lSc3wYQ/rUY6AjzvrSfAnGhdLABZqjdnwTZ/u8ZcY00vklw/VDb8EbyJ9cR4+EXGQC7xGobYaimyGxBz+/ieNZXXrZH/i808Aavk8wpDtPrEy0OFz+54YvjffTilnpUPCNA+J8GKBF7LegkbBpQRbA6c6XaVUAa5TjRszPZFvrcyw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by DBBPR04MB8026.eurprd04.prod.outlook.com
 (2603:10a6:10:1ed::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 06:41:35 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 06:41:35 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/4] dt-bindings: connector: Add fsl,aud-io-slot binding
Date: Thu,  5 Nov 2026 15:41:14 +0900
Message-ID: <20261105064117.277495-2-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261105064117.277495-1-chancel.liu@oss.nxp.com>
References: <20261105064117.277495-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0081.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2::14) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|DBBPR04MB8026:EE_
X-MS-Office365-Filtering-Correlation-Id: 2298d6e5-ffb0-4b7b-2e3c-08df3b07d5c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|23010399003|22082099003|18002099003|6133799003|10067099003|3023799007|56012099006|11063799006|261026140227099003|261028144727099003|261026121527099003|261021121427099003|261102123227099003|261022105027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: MYDZcGraKBXwXfmnEcjK4rKTMDa57mS+D6w93QmdBsdROMLuOY/QkDlu8s+y/f5ei/ckGeODgh7Mdmp6fBsxSCflwcfOJcRF/5nHHY5+FT+xqBAVqZzMd+Py5UQyLLstlw1LIrSNoqyEb6BZU9gn9IPm1tX5MxI433Hw3v+vKvn6XcRHzAcNHe18YXDPrJQlZUyAIfZjoCL3M4/CuivuxQYopgvDZwGlS3T5+5ce1199QOIvHzWuKREHk1s/CtJAiuWdH/icjyjus8/mYYGgs+z6rybr+VHLD/j/52jVkp5fG5+9Wa5Q0iePGQBZ1qGjkD927pjX7yLFsUd7hnhCIPhNfIO0XhECsl86hT9n8zt5At1tyOjxwBODpNVnCnL3/oluRu8bUU/kpYgt1zXvFbhBdK09GMnDmszWqgB7op4e4XEpfzg1k9M6fSes4kxjvgm9oVQZx4pR/KrU/ADkLt37TcBvj/gzM43TDAOHYz+1urSuUSmEWd0z8BsZlBsNcyM4aYsc8DSKs1DBMEuP7WrPddTo48aL0cGQXkw8L16a9D5EqUoVEOmx9EF8GvrtN/T1neAfQgdIuUm8gI/WzLhi7NRxlyhCcGGS8oDru2ZyD7fFjMGEP5wKjZNsu+YA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(23010399003)(22082099003)(18002099003)(6133799003)(10067099003)(3023799007)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261026121527099003)(261021121427099003)(261102123227099003)(261022105027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gWG8i8sb1vsbO+LNjjtMb65XPvqU4+Uepvi/gu0w/YghvcPWSIhsbZ+qhD/n?=
 =?us-ascii?Q?Lb1G+aYKQzP69GrSgw10jfv1PB8jFClQMpipC2ulkCVlQwVT5v3ECfg5B3P2?=
 =?us-ascii?Q?kU+5VpGInIdyPjUq2itxhCtkgQ7HQYuFoqg+DI/80KR2eUMu1goVSDjybj0L?=
 =?us-ascii?Q?CeTKAXDYTCJhzI8BQa2Q8NnlKp4eocvao5Y5EhFg0xxw8EXrKw9CHwS2WoDt?=
 =?us-ascii?Q?JrKHozSoy0XfsQmP2tRlV/CEt+isiMczMJsL57BY4vt2h2WuBs3Yc1l7bG05?=
 =?us-ascii?Q?4dJClebU2w5w+CUVFzzjAD+vw4O8GXXAMW39EWyBbesdZjJ8tUJFymSYSNke?=
 =?us-ascii?Q?BjiaBEbCqgLqqDOKqALPxnbFwuz7oEYVa1nM6TKSuDWUvpK/16OhlQRiVZVR?=
 =?us-ascii?Q?CXJ44csdfr55J1dPDnjVxIPmwNlr0QsoGU1ktzkSYZYxSnIgcVV7ekwk0PqD?=
 =?us-ascii?Q?rRx30lCHdwN0OAeglGTo8MRYZ1wU0Zft0nXy2E0n5iGRA2Ia73Ax2Q7wW3Cs?=
 =?us-ascii?Q?uHn6UoENDiLxVbulIgGMe0fP94h2L9+ljU1vv5jCx/ZWZhUaCgC8/PFOFqEs?=
 =?us-ascii?Q?ZzTTesyB8n0WENzzgBjdBKTTXSmMjSA7XRwpXTfSGM4xak1GFGNrVxEIjTjN?=
 =?us-ascii?Q?C0orBJ8Ev8B/cWBXkVAgjHfBKA2vIaF60Zt+SF+vwgBXR9/dhAeoEifXpSRU?=
 =?us-ascii?Q?N1h/6cZ0dmQZuwuK0xv6fdt+98ZXyaNc+4KK2iqImnPaPuDD9cZdPHoap2H9?=
 =?us-ascii?Q?x1Qim9jUaGEv6M/RSOdOr+S2eDIKknlaI51sgmmfelcFaxHY6LAkE72z68kZ?=
 =?us-ascii?Q?q9VtrEml9WKX9xpw02Zr83RBzzEWfpRZJISwizmeSiNraMJ0Dd0Vp2R/VOXP?=
 =?us-ascii?Q?OLWB6UpZpt/myrd1e+A4A0PmnBoMh3N+fZ3BCgf5pA4q5oP5gZiqqUniy/cz?=
 =?us-ascii?Q?Lpk7iXdNHeM+aPJdLaBbOMOXaecMfMIIuMq9UuaiEUpjHeUDFQt00ktpX+Vi?=
 =?us-ascii?Q?SuZQtS8II+Edg5gmY8vm++5MReteua2p2VZdHc/x6fuPdj0kQv1HGcY/Wsql?=
 =?us-ascii?Q?+ucwYiw3hrnt7oMXa6LCUJNiIh9R8tKmBhtG2RG4t4eGkoJnBFaBA3q8AvFT?=
 =?us-ascii?Q?njxwzGGZQ6P8P8OGqN+Xn1Y9Mgv4Kk42i0aCBWYfdDpJviQfr+WmufmUoPnC?=
 =?us-ascii?Q?sRSOecQWr0kXiUZ6sW2nQooqy/05Nvi7bEL2DExR40pt0xEaDoXizb5JnlPg?=
 =?us-ascii?Q?Lwbh/FCB6YHu+yrHhCEZAKL18YjWHoHbRZOmQxBL2LrbcVJvV7qvONKyISXx?=
 =?us-ascii?Q?fxpn5mlJp8dRZ28d3qe3twBgEFe/RkwONSt6Zl3fufuwtjCAgBfLV7T+jIgj?=
 =?us-ascii?Q?WyTW1Ku/thBJ+kEShlTpqOBCGit4DrEHsQpAT7bixt2xxZYjmh68mtXD+Ubd?=
 =?us-ascii?Q?voVtSX8Z/11vNfJqpaULAGfdykDq5c+kwYUowayvEwnMjkYX8lBweA75y3Ti?=
 =?us-ascii?Q?E9AguIKkPlr7sVzqQSpfywPpFSsOPSIADNGrhlSY8Tsj3fTYGbf/3on3aYFr?=
 =?us-ascii?Q?N1p5qgPpMelhfdpLQQ8i4y+TcOr7iXI9IE2bngtdNyoh3zAT1WtLudgAIwFU?=
 =?us-ascii?Q?s3QPEXecuCnrtrYsde6Qa6gMVCf8gfLf2M/xO6WpzE0qvQT2kkndQCP5wdvr?=
 =?us-ascii?Q?s3BUfesHxKP9b7op4oJkP9ci37mQi+gY9G7u6Xh3dgf96LrCuHSWhyqGZ1ij?=
 =?us-ascii?Q?CuAlydb3k2MPnNTd55/nh9HYxc7s/INXEs0mA9fC+bYbwrynSaTC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2298d6e5-ffb0-4b7b-2e3c-08df3b07d5c6
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 06:41:34.9120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qUD1oowliaMijbl6krj2CJ7gbqnVYZgReAp6+uHj7wVjDZH43IcjelutQdAnoOJI6nwDkmbG+ZMiUlbVMuIMuYWc8dzr5YN4dYSBQiuvAVDNQAaT+l1T+x1V9ph0UUQv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_224139_593463_31A48A11 
X-CRM114-Status: GOOD (  13.91  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chancel Liu <chancel.liu@nxp.com>

The NXP AUD-IO slot represents a physically present I/O connector on
the base board. It acts as a nexus that exposes a constrained set of
I/O resources, such as GPIOs, clocks and interrupts, through fixed
electrical wiring. All actual hardware providers reside on the base
board. The connector node only defines index-based mappings to those
providers.

This connector type is present on i.MX95 19x19 EVK and i.MX952 EVK,
where it is used to attach the IMX-AUD-IO audio expansion card[1]. The
same add-on board can be reused across different base boards that carry
this connector.

[1]https://www.nxp.com/part/IMX-AUD-IO

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../bindings/connector/fsl,aud-io-slot.yaml   | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml

diff --git a/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml b/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
new file mode 100644
index 000000000000..6e1e3f1b6a33
--- /dev/null
+++ b/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/connector/fsl,aud-io-slot.yaml#
+$schema: http://devicetree.org/meta-schemas/base.yaml#
+
+title: NXP AUD-IO Slot
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+  - Chancel Liu <chancel.liu@nxp.com>
+
+description:
+  The NXP AUD-IO slot represents a physically present I/O connector on
+  the base board. It acts as a nexus that exposes a constrained set of
+  I/O resources, such as GPIOs, clocks and interrupts, through fixed
+  electrical wiring. All actual hardware providers reside on the base
+  board. The connector node only defines index-based mappings to those
+  providers. This connector type is present on i.MX95 19x19 EVK and
+  i.MX952 EVK, where it is used to attach the IMX-AUD-IO expansion card.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,imx952-evk-aud-io
+          - const: fsl,imx95-19x19-evk-aud-io
+      - const: fsl,imx95-19x19-evk-aud-io
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-map:
+    minItems: 1
+    maxItems: 3
+
+  gpio-map-mask:
+    items:
+      - const: 0xffffffff
+      - const: 0x0
+
+  gpio-map-pass-thru:
+    items:
+      - const: 0x0
+      - const: 0xffffffff
+
+  '#clock-cells':
+    const: 1
+
+  clock-map:
+    minItems: 1
+    maxItems: 2
+
+  '#address-cells':
+    const: 0
+
+  '#interrupt-cells':
+    const: 2
+
+  interrupt-map:
+    minItems: 1
+    maxItems: 2
+
+  interrupt-map-mask:
+    items:
+      - const: 0xffffffff
+      - const: 0x0
+
+required:
+  - compatible
+  - '#gpio-cells'
+  - gpio-map
+  - gpio-map-mask
+  - gpio-map-pass-thru
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    connector {
+        compatible = "fsl,imx95-19x19-evk-aud-io";
+        #gpio-cells = <2>;
+        gpio-map = <0 0 &gpio1 8 GPIO_ACTIVE_LOW>;
+        gpio-map-mask = <0xffffffff 0x0>;
+        gpio-map-pass-thru = <0x0 0xffffffff>;
+        #clock-cells = <1>;
+        clock-map = <0 &clk 1>;
+        #address-cells = <0>;
+        #interrupt-cells = <2>;
+        interrupt-map-mask = <0xffffffff 0x0>;
+        interrupt-map = <0 0 &gpio2 27 IRQ_TYPE_LEVEL_LOW>;
+    };
-- 
2.50.1


