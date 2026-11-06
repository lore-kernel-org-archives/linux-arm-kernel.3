Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3CE606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qUN7rWV2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sWuxxH9KeTzjFdlQTFI0LN67TNXQ6QISFuOPWqPoIDE=; b=qUN7rWV2Zg4SCQUzUV9U6YszTu
	V3YQSjr0Nay/QBjXVnHq0wXPikERO2PoCHsmdATdLpjROybnApOS/m//RbDbVBsMPvxndIK3X+H9i
	BNhcAwyC0UIo0YG11t72fKUwyuw3vxqPyUrtwqOlSAyCbQuHbvYwCp+1X5YrxdxmwGv/jcnj2U4cR
	7yzMwHhDWeIJnd3wdGQf0i4coftbEel7Fx26VISiBa3+ISEgutja0v7OUJ8TKOqC0fG2kNK46c+oG
	xSBF3lCC2CGzWST1cDnOcz5f34e+cx3rLbcADjH8vwk4izsnfu9imOCKDAd3RFkJQ0EBPbNVYL/1P
	VKE3t8HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHYX-0000000C27y-1nRP;
	Fri, 06 Nov 2026 10:52:25 +0000
Received: from mail-japaneastazon11022102.outbound.protection.outlook.com ([52.101.126.102] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHYT-0000000C25v-2a7E
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 10:52:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hEov2htBmTeV/TnV57LDKTB2yKVjVkBaPQTotYtaKLzhVQFz/kZhb8JsZCasGi5kFuRZZHRyFdKZGYPeWDQ0hBfY1zGZ2nV+6/nH6U0ulmGQX/vPpIYhp1ll+Lq6ZSlhsxUyZPeueDkx4FBskTJ398z9k6PTf9ovvAwqQTg/CbveRie5H6Dgynb7UtBo0A7EyqrFG7W7+Xkvc5B4H4QpFY8azPkr9XL8Vi2kxTEYhrDO9eEstOK1G0vKAfqy0gOQWKC6bjkDQzIu12Q5asSUkFYnCBL3sNHhaHJcO2a/k3eNWoSnBNKxofzD9NnAXJ4Eaoqvpau058vYJoQ5IrE5Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWuxxH9KeTzjFdlQTFI0LN67TNXQ6QISFuOPWqPoIDE=;
 b=mAdgJ6q+JWCcrGHBIs5+wN6Lkv7i4lPPbFPbWJ/pF9PSuGvQnzJ7kO5K3bG93Qpat37pkRuBDSs2y0WMhA6a2fbyFMU7TkpQdKwE53HLU1835EiqIJtK5wMpJbsW8OF/0VGNJGojyHxQXAq9J77vYoSIhEVhk+CKV8HyTf1/qonYmP6APigZThksS+PPUGXH8B+yNFU4D4hhqG2MpWioH/6eM81pc6Bsna032jaj4odArX9YIDBpCshvAeTz5qUotf6ih7h8RoEtrLzySbasKTwQdrplHPsS2V9t7wlY/0IamHi9Yk6qz/JCMqSsj8uKXk9W0ECIdjW9IXKXVJEIoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0036.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::22) by SI6PR06MB7168.apcprd06.prod.outlook.com
 (2603:1096:4:250::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.5; Fri, 6 Nov 2026
 10:52:16 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:4:192:cafe::2) by SI2PR01CA0036.outlook.office365.com
 (2603:1096:4:192::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 10:52:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 10:52:15 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 9617E40920E7;
	Fri,  6 Nov 2026 18:52:11 +0800 (CST)
From: joakim.zhang@cixtech.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: cix-kernel-upstream@cixtech.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v5 3/4] ASoC: dt-bindings: Add Cadence I2S-MC controller
Date: Fri,  6 Nov 2026 18:52:07 +0800
Message-ID: <20261106105208.1246554-4-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261106105208.1246554-1-joakim.zhang@cixtech.com>
References: <20261106105208.1246554-1-joakim.zhang@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|SI6PR06MB7168:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 48a213c1-fe4b-4661-1bc0-08df3bf40556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|36860700016|7416014|1800799024|82310400026|56012099006|261021121427099003|261102123227099003|261009223027099003|261026121527099003|261026140227099003|261022105027099003|261028144727099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: HuO7fcGs/z4RMmwzPHq1WD3KqF0egZrwVbPgKrXGGlSuHbX6xabruaL+AUwrS7RlDegKrGG1yw1hLWPlo6jIVvdYMcaah0LMIE5xxWaDVGd4SFmqS8Gr7iafnvQ+N7KdyS2quTNXBzQVWXzXJULVlrPowvRGSWsofWAtNCuuvHVY30G8rxQOZh9bVJP0gPwBnr/OUDPAFDWdfn+blMm6TqBdnU2Z3FN+GX/fwaDWn5XLsQKYJa0tODPRfy7z5MAzk0PmdLsKnZf2LYoAopbfy8tt5h2IDGbynwiqrjSRGIK5vRoZIPysoI9vjdLXaeQk2PUDRvv0V/5JfIcOwTlORK7fs0Bq9HAqX8asKBtOTFmpx76Higcyrepf5Dz9jPSnusmjljEwXibKn+WJcWRKLibDniNiqBgU1/vayY4mViYJgaqSi+813kekzWkpcfPxchWqTrUwd9dKzlw1kHoOo72DO2ubu6X+DXmEKDx86CMSmrtGDwsAOmO/8bNTZePeSGwpyzIIQ0MZx2Rg5RXS7zAcSNS/5fl0fijlwVLAjvlwFuxZK6xaINbgwi4vJDdy5+v7tRaOKceGCeZAak6C+jGbur06MklymNZQZwgQYTKtbmX/IDGbu3TMCFPeuMrGBJW2pLb9YGlwE9iRvRjrSg==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(7416014)(1800799024)(82310400026)(56012099006)(261021121427099003)(261102123227099003)(261009223027099003)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VnybMzmeIZwJozgFZGbLWU/ZwTtUQCh3SkObnagkGb5HyRg3g5c9l6Mn2HxCatLEVNX300Tr+cggSJsQARO/GqCiqnUb33ClVlUHf37s6Huz0qfl4YX8vJeqSTLwktdDYQsUr/7/DWdxZRb2BIyGfNwzCxsM7mlkqE36HUmdr1FoHi2y+P3zW8F3E6UaWnbwijEWWJ410NSC6sScF3GlUKxd2TGF78D5dmM89WmbonlGXS3+Sh8ulLDQcveAm8eOrsANkjd4dzU0l4Gzypwjm5QVSO2w8YI4SjWbMCyYLd6w1kdUKQZdaIcDlZYJiSJXxnad/t6KfEFTx50/CMqMjVkVSRsXx+FS0rhYpYmrrp/OBerDijPRBgYojGoTMTcZdoKfyd7TsrdhGgcYSiUJutL2SBIqD277bX53gAKiNPLoxRimyQIVPFQNbL9hLmTo
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 10:52:15.5218
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a213c1-fe4b-4661-1bc0-08df3bf40556
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR06MB7168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_025221_661145_58F21182 
X-CRM114-Status: GOOD (  13.20  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add the DT binding for the Cadence I2S-MC multi-channel controller
integrated in the CIX SKY1 audio subsystem. The controller exposes a
transmit DAI and a receive DAI and moves audio through a configurable
set of its 8 data pins. Which pins are wired out and in which
direction is fixed by the board design and described by the
cix,pin-out-num, cix,pin-rx-mask and cix,pin-tx-mask properties.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/cix,sky1-i2s-mc.yaml       | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.yaml

diff --git a/Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.yaml b/Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.yaml
new file mode 100644
index 000000000000..e750009edbdb
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cix,sky1-i2s-mc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence I2S-MC controller
+
+maintainers:
+  - Joakim Zhang <joakim.zhang@cixtech.com>
+
+description: |
+  The Cadence I2S-MC multi-channel controller integrated in the CIX SKY1
+  audio subsystem. It provides up to 8-channel playback and capture through
+  a configurable number of I2S data pins, and exposes two DAIs: a transmit
+  DAI and a receive DAI.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: cix,sky1-i2s-mc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: hst
+      - const: i2s
+      - const: audio-clk0
+      - const: audio-clk2
+
+  resets:
+    maxItems: 1
+
+  dmas:
+    minItems: 1
+    maxItems: 2
+    description:
+      One DMA channel for instances wired for a single direction, either
+      "tx" or "rx", or two channels for both transmit and receive.
+
+  dma-names:
+    minItems: 1
+    items:
+      - enum: [ tx, rx ]
+      - const: rx
+
+  "#sound-dai-cells":
+    const: 1
+    description:
+      Cell selects the DAI, 0 for the transmit DAI (i2s-mc-aif1) and
+      1 for the receive DAI (i2s-mc-aif2).
+
+  cix,pin-out-num:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 1
+    maximum: 8
+    description:
+      Number of I2S data output pins wired on this instance. Which of
+      the 8 controller data pins are wired out is fixed by the board
+      design and can be any subset.
+
+  cix,pin-rx-mask:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description:
+      Bit mask of I2S data pins used for capture, bit N selects data
+      pin N.
+
+  cix,pin-tx-mask:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description:
+      Bit mask of I2S data pins used for playback, bit N selects data
+      pin N. The rx and tx masks must not overlap, and the number of
+      set bits must not exceed cix,pin-out-num.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - dmas
+  - dma-names
+  - "#sound-dai-cells"
+  - cix,pin-out-num
+  - cix,pin-rx-mask
+  - cix,pin-tx-mask
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i2s@7050000 {
+        compatible = "cix,sky1-i2s-mc";
+        reg = <0x7050000 0x10000>;
+        interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&audss_cru 17>, <&audss_cru 27>,
+                 <&scmi_clk 100>, <&scmi_clk 101>;
+        clock-names = "hst", "i2s", "audio-clk0", "audio-clk2";
+        resets = <&audss_cru 1>;
+        dmas = <&audss_dmac 2>, <&audss_dmac 3>;
+        dma-names = "tx", "rx";
+        #sound-dai-cells = <1>;
+        cix,pin-out-num = /bits/ 8 <2>;
+        cix,pin-rx-mask = /bits/ 8 <0x1>;
+        cix,pin-tx-mask = /bits/ 8 <0x2>;
+    };
-- 
2.50.1


