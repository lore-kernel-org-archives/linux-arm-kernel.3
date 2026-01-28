Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9ADBD35692
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 08:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0YpJNjTGmp8Oqzeap+RRYypHBkSqnBQs6O7frsTnLHY=; b=mZ7M5vSOJ9fnL7ENiOUMA186JH
	0uGcnyC64J9qYQ12WlbsoW+Nobh1YE58kPR5gygTH7SZzSbY+NPgl4ivax/R0Y+cZnGcgiVmB9Bhj
	POkmFe4uE2Sn+ERvyLZyTEdT0E3q2oZlgVJbAMW+Osb4O4AYY58iiJdKq3dQ5pvz891loMhNaM6wL
	EE3rEzWyuYdbz0CQDL+lg3mTwYpglLQj6mjjoJ2lx5aggdFcTzwKChT4W+3p8uha7u2qOKj+DG3np
	uJBin4H2pHLEBFJQXzuVoobllbVtfPy/CXlx3AyKKked/UtgyPnNyEOAwoThqFt0pEZPBr7+o7awW
	Tam9jvCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1FY-0000000Fgqt-3lE7;
	Wed, 28 Jan 2026 08:50:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1FO-0000000Fgn5-3s1S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 08:50:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D948D4450B;
	Wed, 28 Jan 2026 08:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3795C2BCB4;
	Wed, 28 Jan 2026 08:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769590197;
	bh=jPApKe4OnUHqDCmVrRe+5LbHO4U2RPR4SqBfUuQaobI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Mr/PhjvkPWThtzj+jBqy7ij02xYvR6N/zfnZDu3NIpKaaifanMfxhYK3YUFKSQ6BH
	 hOoPmzFi7tI9L04vrY3Mdgre55/DqW5LoGUtspGCAB3egoipohTp0FktlAWw+tpltW
	 nNM60cvAcEj/OQdjvr1aj8w6VOhsPmFp03JqiAkkIws+9n6C1fcsmxOUCt9Sk0RA6i
	 6ejhrt+O7QoMBI2zGbovryvg8tvkMbmO+nmCFMXvSEZex2FPhtzVig4orcOgM+goq7
	 jerw3g46/E9/gmMKw6AnJ8lJW0oG/rYBUC1py18/DgjxzSCLSRDoimdEy94RGCSOtg
	 YMh9RczEnIAAw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C85D35692;
	Wed, 28 Jan 2026 08:49:57 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Wed, 28 Jan 2026 09:49:54 +0100
Subject: [PATCH v4 3/4] arm64: dts: s32: set Ethernet channel irqs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-dwmac_multi_irq-v4-3-82fa34fcf2f2@oss.nxp.com>
References: <20260128-dwmac_multi_irq-v4-0-82fa34fcf2f2@oss.nxp.com>
In-Reply-To: <20260128-dwmac_multi_irq-v4-0-82fa34fcf2f2@oss.nxp.com>
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
 Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769590195; l=4163;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=+bEJwX/3spHrmCusaHSSPK6wPAR1HCTfpAlGDA5P1YA=;
 b=vIN+HXciTpOHUqUDxNPWM6CkKic057xj2uyyBnyM5d/9gwSF2zq5RrS5qanARCUGxClzBMw74
 4gX5zl4Eh37DGUy1maQF2fOrE/zajahR9r8le6wXCP3kFez45HrDOJs
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_004959_011165_C8009BAC 
X-CRM114-Status: GOOD (  11.24  )
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

The GMAC Ethernet controller found on S32G2/S32G3 and S32R45
contains up to 5 RX and 5 TX channels.
It can operate in two interrupt modes:

  1) Sharing IRQ mode: only MAC IRQ line is used
     for all channels.

  2) Multiple IRQ mode: every channel uses two IRQ lines,
     one for RX and second for TX.

Specify all IRQ twins for all channels.

Reviewed-by: Matthias Brugger <mbrugger@suse.com>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 26 +++++++++++++++++++++++---
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 26 +++++++++++++++++++++++---
 2 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 51d00dac12de..5a553d503137 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -3,7 +3,7 @@
  * NXP S32G2 SoC family
  *
  * Copyright (c) 2021 SUSE LLC
- * Copyright 2017-2021, 2024-2025 NXP
+ * Copyright 2017-2021, 2024-2026 NXP
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -732,8 +732,28 @@ gmac0: ethernet@4033c000 {
 			reg = <0x4033c000 0x2000>, /* gmac IP */
 			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
 			interrupt-parent = <&gic>;
-			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "macirq";
+			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+				     /* CHN 0: tx, rx */
+				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
+				     /* CHN 1: tx, rx */
+				     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
+				     /* CHN 2: tx, rx */
+				     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+				     /* CHN 3: tx, rx */
+				     <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
+				     /* CHN 4: tx, rx */
+				     <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq",
+					  "tx-queue-0", "rx-queue-0",
+					  "tx-queue-1", "rx-queue-1",
+					  "tx-queue-2", "rx-queue-2",
+					  "tx-queue-3", "rx-queue-3",
+					  "tx-queue-4", "rx-queue-4";
 			snps,mtl-rx-config = <&mtl_rx_setup>;
 			snps,mtl-tx-config = <&mtl_tx_setup>;
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index eff7673e7f34..e1f248d3aedb 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
 /*
- * Copyright 2021-2025 NXP
+ * Copyright 2021-2026 NXP
  *
  * Authors: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
  *          Ciprian Costea <ciprianmarian.costea@nxp.com>
@@ -809,8 +809,28 @@ gmac0: ethernet@4033c000 {
 			reg = <0x4033c000 0x2000>, /* gmac IP */
 			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
 			interrupt-parent = <&gic>;
-			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "macirq";
+			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+				     /* CHN 0: tx, rx */
+				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
+				     /* CHN 1: tx, rx */
+				     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
+				     /* CHN 2: tx, rx */
+				     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+				     /* CHN 3: tx, rx */
+				     <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
+				     /* CHN 4: tx, rx */
+				     <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq",
+					  "tx-queue-0", "rx-queue-0",
+					  "tx-queue-1", "rx-queue-1",
+					  "tx-queue-2", "rx-queue-2",
+					  "tx-queue-3", "rx-queue-3",
+					  "tx-queue-4", "rx-queue-4";
 			snps,mtl-rx-config = <&mtl_rx_setup>;
 			snps,mtl-tx-config = <&mtl_tx_setup>;
 			status = "disabled";

-- 
2.47.0



