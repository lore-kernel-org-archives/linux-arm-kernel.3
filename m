Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F07606A339
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4WINq+p0;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=py2SuujI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uJt8XpUVl+GN7oObxExwgOVaxZFqZarhL9hWSNJwMQc=; b=4WINq+p06mJlp3
	DMxIzEd2W6rrlCVQmxluRJTdcTAPi7jEHZHzp4+smno54XdlfiK3jcsrQwfNbNE9aKPahowaXwoSz
	2bMnVVg5RHXN1NExWrwP/pmVovmJ/P7QAVZzqmZ16e7KeXMGfddH6KHH4PYoYBPZw5UUlI7QWTwhM
	s3kleECF8JwC6UGtKnW+Ej1UqPBo2BJrhEseGUCVTXDHpF6FK2v0D76YoIo5F3WzKVtGV/H0BM0BR
	DAVL/DJozlFpLtNyia1gje+g84+cBGR5gev1nblqaeh56KOdeJUkVaqOmv/2byTB0MHSl7Tu0AYDm
	V74o/0zW0QEfUi1gibFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO8Zi-00000001IFw-2jit;
	Tue, 03 Nov 2026 07:04:54 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO8Zg-00000001IEq-0xzO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 07:04:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AigzADObEDL9VlkZ5s2aI5+8Rj4E2c43Ovt+pCcAGviqapq41GppoQFUzXvv1bYIoKDe+V4rmQexgWnqoolVriUlEQ7AkvPo89DN2JI/wmRIe3h6eLZ3bGFggBbcsOfY1Y521XhBWdP+sD7zhYGxadubp5PhFkbTG80OrS99MRyNA7mNfJVhgTP3JT3oDpfC1Sgc9scD2f/ObYXfpBoGkIie6DM2Wa5yq0Hf7pTkL44WIn9sIuD8xFQAmZXfnTJO1jl5MdZ1xpAcEc6X+9eEzQFWPuOyU9WYXXdh6hor5m2IevCmwBJnlpumsAUOuxvArI6sQNnrvEeXYp9k0znXEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJt8XpUVl+GN7oObxExwgOVaxZFqZarhL9hWSNJwMQc=;
 b=dD9uZfMjSIYZzOycwxU+kL/ZEdWtZ0DLXU4CxxfroYDNK/K14usYlWACBWZBCgSwHHF0OWj4p2jLn9fjwt1VuVWmXT5+p4GAqO1R2egZULl2tuHHkr2NlY8c9tE0lLyejfEDc72LYlDEtagCksj/LGLfFzODNgsmWlbFioB1RuKXuGtHPHRmnyLnH5WwHL4+wtLmjYc4MkmZ4U967TVEbPTeBXptb/T+Mk3gf0OLMMEy9eN/NOwzT99ngo5gvgwwIcP/PFfggt03HrKVeBZXm90gW4Jf4l7j/PhzP5RNA9vvc+kg6obU/uUJ6G015Yap6nUNauTdTVUWnDiGFmDl9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJt8XpUVl+GN7oObxExwgOVaxZFqZarhL9hWSNJwMQc=;
 b=py2SuujIR8rzn7fWexMgAxIy+02GzjQz7QuOrACX80sS/oq5Yykj5JsW4bz3clj7CGICT45yKA0OZYvZLnFn5lOEvZ+M9qStOvvSiCmcA5a4JbkC4p7lApg72LKwETjCV4Ty6AgW+dMsY3osHe/2q1w13GHkBlQMa8/hi0sTVzynlql13dH81PbtreJGdtE1PQvtOXuCRsWrCGaWjKXans8WdiMSiYo0bxHPzWyQ6fEvZtoqor/S3aViLsF6gJP81KIV9fwP7vC5xf5VXsdCzyMbox3NlK86ZhudHcpjlkrxQ0gL7MvBYw0wzkHAvpp/JFvFY1oitK4Cb8X4Mv37jg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by MRWPR04MB11518.eurprd04.prod.outlook.com
 (2603:10a6:501:74::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 07:04:50 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 07:04:50 +0000
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
Subject: [PATCH v3 1/4] dt-bindings: connector: Add fsl,aud-io-slot binding
Date: Tue,  3 Nov 2026 16:04:30 +0900
Message-ID: <20261103070433.2307145-2-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261103070433.2307145-1-chancel.liu@oss.nxp.com>
References: <20261103070433.2307145-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0046.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bd::8) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|MRWPR04MB11518:EE_
X-MS-Office365-Filtering-Correlation-Id: 93b0926b-1b17-4c7c-6639-08df3978c088
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|7416014|19092799006|1800799024|11063799006|56012099006|261009223027099003|261028144727099003|261102123227099003|261022105027099003|261021121427099003|261026121527099003|261026140227099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: OqEfBF+CIXdAVhM79SqnNDQ1AJuqumB9Q6U+PcuqcTKOdT6yVe8vTB/SzRCPgEo7jafP24hBSx4QcXJdcBwNe0uzJzyD82z+/TPwzUSCT+1lSBhVDkPwB+1mFl8rVa8pedtNuTew6MxdnlN6N+Txk2IIAH3WL1Kbo6sakw/TcZJdNRQXeb6Txc8N5WEjiiRcwnACB5HtchD3eC32kkcPIpxs1lKMBZtaoyUkGmAfUNDrjcmfDgpgglUgo5+uncc4BDp7VUiB26NzyYmFbDB2uE/MrHC+bM0w4iP7ZvEsvvxLjYYsg8iboioLbDad0pZMdNn2PJLL83UJcXLKNvEJW2G9yBWQr7XpBgQAUJ9LPZqubuypLR4ZbJ/FZXrRM6ZiJZvhlOncJbmaNNObiCzX5MEoT7UmE7gCr9sB4uhLFuMqHBWuSCFet0viUsVBVYbYN7iIGyhmG10ZjK/eNgWu2Mdx1beI9L8BLoFa/q9TFtZk+RK9ED3ieIxhS5x2AkYphaj0A4Vsf8IBK56p+vIow+I6XY15rTA0+YHNhtRhtvffPBK8SUQUGMlYvioT5u+HBHQ5rxKpPoulT+BjPQXTgVd5/VrJ/k8uUjMZb5LIg+XeFtCyjXUTD4+vdKUshBU2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(19092799006)(1800799024)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261102123227099003)(261022105027099003)(261021121427099003)(261026121527099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wt+GT/t0jHSkVPZPGykYhGw+pePbyt1rOAnyeTTo7ZhZGft8jVf/PCBgELXI?=
 =?us-ascii?Q?z1IyEZqrm/st/J+Fq/Xd/1b1zDwDoEHJHc7QpJ+oyottwyic+PWu9K45PLUg?=
 =?us-ascii?Q?xbPepWC09eMUDDkq+nOmvBZ3EVAL0KETTkTENZcigfjGc/HT3e/iWLrwKmh5?=
 =?us-ascii?Q?lGp1j8RHS1arHwUqveYv07P5eqe/ZfWAJcQnQGv8kZbuBXi87PM2L8G5122m?=
 =?us-ascii?Q?JsYf97Lys3aytiy/vaBahDOS4ibrcxeDLKSQtR44IuRAXPf14pG11VCbitxs?=
 =?us-ascii?Q?Pj5eg5jA2bVcGhFG8B+rd34ctc8pIVs8DhN5kmTgaHEa1sKPZuV9G/zQ1lUU?=
 =?us-ascii?Q?QgKasryG7/3QhuknPdGz+K3wdnxWpm/OjAkvpOsdmp3tKu6m2gScsYVSwpYm?=
 =?us-ascii?Q?Bxl0isgwmOT7VdRwImoKOBQ4YxrF2632LqqvtCM6QTrdIE+Vl+ByIUVFE3Rg?=
 =?us-ascii?Q?3GeiCQyAl5mJj3JkTmgd9ryQn9GAGk0kFVnPmM33Z5834tUBv3MksEhxBEDp?=
 =?us-ascii?Q?Wc0hQb8cJZIKMO+A9R63oIbAHltScyahX5v6SSuWG1oM+74bmMm+e03o/6q2?=
 =?us-ascii?Q?Mc2G+QHoUG7l3dITKOqb8JL0sQto3lo95xkWkpgFRhhihlJMofIrxhdAzuJ4?=
 =?us-ascii?Q?SI1RaL1NWEdU16RL4ggc7FmgHvIUFQIk83X5r7QPsIp7wtPSrIvtWuW3znE8?=
 =?us-ascii?Q?nlwgZ8t6HPXLJlxfztqPC+2B7EAIQC1yJDB4iOUHzL2KVV3WzU2MaHxDITaj?=
 =?us-ascii?Q?tlH0K3bbmrjVa5MTufznwXRRCFQPn/M96Qjd/WgZXvACf4Y+ymZlzT9ObcaT?=
 =?us-ascii?Q?HkOeygkwEzuXS+/muaHE6siMJpJjwTPgJHrESjrVjOshKymJDFt2GPD2IgpX?=
 =?us-ascii?Q?vtsFFJrOB2FFK9NUJKQ8WaamraQGt1j6bt0+NKItvWxJUb5OdvHEzewzba1f?=
 =?us-ascii?Q?q2SRcUv1FQd6PMckayvR591m29mRwFhI5/wJLZtKnuECHD0ORX3qZIhO8wTv?=
 =?us-ascii?Q?WFg/oebHeEvvf6BC4QKlFHMSzUvayj0s5oxhxwzC38KKCxjk6WdnnRcJP+ne?=
 =?us-ascii?Q?wRiOO4BUXVMCWZZOl41jhOfrkFIIYaOT6QEXGjY6Gm/JaRM0sG0dA58cXpqJ?=
 =?us-ascii?Q?H2ldZ0vrcoak/HzDcdySazbHUJxmTH4at3J8wxNXYcRV/q6Q9YwZyt9Zjteb?=
 =?us-ascii?Q?20sSY114stry6AmBVznzt+ONnVr/vZHEb4pa+DVmbWOO9PlLAiBpJBZ9uB8P?=
 =?us-ascii?Q?YAyG4BzSc/OgVxoxP66xNiHc+9PtTiSu4YtkdS+RjR+nsYMCOsIzQPjCKS1h?=
 =?us-ascii?Q?jXqasoWOofq/MSxtFvolyzeuSJ0Le45YNX7qwGHe5AWCM15Oje0SuQKxgS8h?=
 =?us-ascii?Q?H2fPouQIcTSI2UffGxXZbXxlJcY9Z+1MaWzJqqoBV4dxHglD5P787gJYyVNt?=
 =?us-ascii?Q?Cc6mtaxHMM2fn0pT1AgjezSNefoBA4wNpsNjqx+cfGtYvht3jU2GiAd5E2rC?=
 =?us-ascii?Q?vXR4obeg0l28FlsZd9euCl4Jrzcu+IJz0C8Nzd8tSCB9W3Ju3OLHi7bvSVIr?=
 =?us-ascii?Q?0jmyC8l1voZEOhM/yJi1nCB869T8qPCyudrNBy3ms5nzcf3JUPWZo+lMMujk?=
 =?us-ascii?Q?CxLJsJk3wutsUeUhRa892AdKcLJ6Cote741xuCfuSxXL1Kv7Y5Gs29dD9AT3?=
 =?us-ascii?Q?bz1mj0vZWi7dm0TtkcWduJyDT4T+HD5pmqhwG3X5Y88149HvV2hx5z5Qq87R?=
 =?us-ascii?Q?GmMxP5YwIU/GQA5ddLgNrw9TShquXbzTWF6MLtElcfWq/av3AEIi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b0926b-1b17-4c7c-6639-08df3978c088
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 07:04:50.0684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SLC0Rn8gjgjOLKGjbq+/WnradsI32u3zuWpyJnpnmgfP5WB1J/PcWXstMYu5OfWybUd3ZjnmWWcpxlwKSaIqvlkad7Asqwgm1QHIMEdkTaHYKqRm0ZpCR3fHTAKQk4Ya
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11518
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_230452_277024_D05F645F 
X-CRM114-Status: GOOD (  14.00  )
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
 .../bindings/connector/fsl,aud-io-slot.yaml   | 106 ++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml

diff --git a/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml b/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
new file mode 100644
index 000000000000..fc3896d0fafa
--- /dev/null
+++ b/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/connector/fsl,aud-io-slot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
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
+  gpio-controller: true
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
+      - const: 0xf
+      - const: 0x0
+
+  gpio-map-pass-thru:
+    items:
+      - const: 0x0
+      - const: 0x1
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
+  interrupt-controller: true
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
+      - const: 0xf
+      - const: 0x0
+
+allOf:
+  - $ref: /schemas/gpio/gpio-nexus-node.yaml#
+  - $ref: /schemas/clock/clock-nexus-node.yaml#
+
+required:
+  - compatible
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-map
+  - gpio-map-mask
+  - gpio-map-pass-thru
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    connector {
+      compatible = "fsl,imx95-19x19-evk-aud-io";
+      gpio-controller;
+      #gpio-cells = <2>;
+      gpio-map = <0 0 &gpio1 8 1>;
+      gpio-map-mask = <0xf 0x0>;
+      gpio-map-pass-thru = <0x0 0x1>;
+      #clock-cells = <1>;
+      clock-map = <0 &clk 1>;
+      #address-cells = <0>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      interrupt-map-mask = <0xf 0x0>;
+      interrupt-map = <0 0 &gpio2 27 IRQ_TYPE_LEVEL_LOW>;
+    };
-- 
2.50.1


