Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25DEFC5918
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 09:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yg2wJ8fgNB2iam2O5pRUFbOX+Wuq04Yjwsp4hQkgz8k=; b=4BSpRc++s8Scu5VQ9kSCUh/eKQ
	YuGusP0UuO8Np20mclSKdgS75nSEjmoP39tCkSpfaPt1uki/JtBIQSy8hOCXDR8xUE7I7oAPjdl4/
	Q59tPKuK0vQr5v8dINUO69xAzigQAdHEDDsf2376Xcuvkauhx0cZI40npyQ01r85L8GHGyB7ZjJhZ
	qIHW3HF4lKutWT4H5W+BAEJQYUeQbQ6Ow9JuZi7JXrLiVvnoB4nWTc/z1a/fySLPC8RnR55XgvgQz
	3U3OPN/ftMMiPB8fzpd4j+k8l/ac05GX8ps/mx/s63X5i2M1TVgrQw0Ki58iDc1gyy57t5qVgp8nw
	P0b284ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvX8Y-00000005iN5-1GnU;
	Thu, 26 Feb 2026 08:54:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvX8W-00000005iMB-3kCw
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 08:54:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=Yg2wJ8fgNB2iam2O5pRUFbOX+Wuq04Yjwsp4hQkgz8k=; b=AL3xX1eHzTWAJwFjS09ovqYTpk
	llA9g5OvYG4C3/aKmKxS0jp5iiM85YyLY8Rjx4NR9wTgtXGtC/Z9TxAUlkyA1fDrk1iwFX0MryP3w
	XFWi0jigCOia3++wSVSSRHWLKULpoxIHnL2s3ANddA6idEDfXMXH2mpo0TvzxEtjr+bEHLuBO/WBL
	7c9dlys/uRWYEh8tZSDJbjypWKk8Ib2KFBf8hJ4Iyg1uVJ1gd86n5dJqtv7fcZtMQCHZOpdHMODCS
	FBcneRjOpjRLwpYh32wEqoFJlt9I+Qax7aWdh0wVmcYX5hcZDm6Fq9tsiVi4ugRrZMDFW9+f3xfqK
	F+rSymdg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvX8T-0000000AYHh-2PdZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 08:54:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 809404458F;
	Thu, 26 Feb 2026 08:54:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47EF5C2BCB1;
	Thu, 26 Feb 2026 08:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772096055;
	bh=tVDFFZNNq+3cx8vwsO+uDpr3OUAYyGNXUn5yFrn4B/A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NBmEEySyjir0pNKDyl8fZ8qAfnmFnYbxr9lDgyxpvgXoQ/+zgaz0MfudOEH09W4hh
	 M8rKq+oPF9Ehx6tzMETgWhGSmhd0oUHM7dkoG8CpItZ2N3H5a1y94rWWpuk3Y4H/0L
	 rMXHs4PkPLV7UPPdAawLMLfnnR1WYblzIhRQ7xtLkuO57pce3vmUxZZtSIF8do9DoC
	 9ejFCjVFFUViZjGdJFxUt7o4fSRWm4wIUpQx4D3TbOb2R4KfvufJov1AiyVp3l3zWM
	 lAYtpBL7a1iF63GMo23vxuhIgAoTKjY2L/Hvfjy3OMI6rapDSqn3KFgLevqlwAuFv/
	 nlec5xtKVfZcA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38AF2FC5916;
	Thu, 26 Feb 2026 08:54:15 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Thu, 26 Feb 2026 09:54:09 +0100
Subject: [PATCH v7 4/5] dt-bindings: net: nxp,s32-dwmac: Declare per-queue
 interrupts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-dwmac_multi_irq-v7-4-f8fe3b945bb4@oss.nxp.com>
References: <20260226-dwmac_multi_irq-v7-0-f8fe3b945bb4@oss.nxp.com>
In-Reply-To: <20260226-dwmac_multi_irq-v7-0-f8fe3b945bb4@oss.nxp.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, rmk+kernel@armlinux.org.uk, 
 vladimir.oltean@nxp.com, boon.khai.ng@altera.com, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772096053; l=3455;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=Ulgz8SoBFJZWXNyBqoPUpgpX/c4gObaapFU2nTXzIJo=;
 b=UT9Qnilg/WovbJ350EVFkkHtyTiIJ/8YySev0ZAZqayVGhbPMzLEiSpapf65FmRkFN42GTtjD
 jsQfEpx3uCsAnn+P+DQUXtsW/Pt4oKRObdxxyWJxA2CxT7ahzuivfgj
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_085418_069908_3EAD66AA 
X-CRM114-Status: GOOD (  12.47  )
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
Reply-To: jan.petrous@oss.nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

The DWMAC IP on NXP S32G/R SoCs has connected queue-based IRQ lines,
set them to allow using Multi-IRQ mode.

Reviewed-by: Matthias Brugger <mbrugger@suse.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 44 +++++++++++++++++++---
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
index 1b2934f3c87c..3a0e41b63c3d 100644
--- a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-# Copyright 2021-2024 NXP
+# Copyright 2021-2026 NXP
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/net/nxp,s32-dwmac.yaml#
@@ -16,6 +16,8 @@ description:
   the SoC S32R45 has two instances. The devices can use RGMII/RMII/MII
   interface over Pinctrl device or the output can be routed
   to the embedded SerDes for SGMII connectivity.
+  The DWMAC instances have connected all RX/TX queues interrupts,
+  enabling load balancing of data traffic across all CPU cores.
 
 properties:
   compatible:
@@ -45,10 +47,22 @@ properties:
       FlexTimer Modules connect to GMAC_0.
 
   interrupts:
-    maxItems: 1
+    minItems: 11
+    maxItems: 11
 
   interrupt-names:
-    const: macirq
+    items:
+      - const: macirq
+      - const: tx-queue-0
+      - const: rx-queue-0
+      - const: tx-queue-1
+      - const: rx-queue-1
+      - const: tx-queue-2
+      - const: rx-queue-2
+      - const: tx-queue-3
+      - const: rx-queue-3
+      - const: tx-queue-4
+      - const: rx-queue-4
 
   clocks:
     items:
@@ -88,8 +102,28 @@ examples:
               <0x0 0x4007c004 0x0 0x4>;    /* GMAC_0_CTRL_STS */
         nxp,phy-sel = <&gpr 0x4>;
         interrupt-parent = <&gic>;
-        interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
-        interrupt-names = "macirq";
+        interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+                     /* CHN 0: tx, rx */
+                     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
+                     /* CHN 1: tx, rx */
+                     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
+                     /* CHN 2: tx, rx */
+                     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+                     /* CHN 3: tx, rx */
+                     <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
+                     /* CHN 4: tx, rx */
+                     <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq",
+                          "tx-queue-0", "rx-queue-0",
+                          "tx-queue-1", "rx-queue-1",
+                          "tx-queue-2", "rx-queue-2",
+                          "tx-queue-3", "rx-queue-3",
+                          "tx-queue-4", "rx-queue-4";
         snps,mtl-rx-config = <&mtl_rx_setup>;
         snps,mtl-tx-config = <&mtl_tx_setup>;
         clocks = <&clks 24>, <&clks 17>, <&clks 16>, <&clks 15>;

-- 
2.47.0



