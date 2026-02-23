Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5510CEA4FC1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 13:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKzZmUF3e/EMczVJbvGTTAlD+3+vGtQBALWlnTbMvUo=; b=sVo5X0Z00R2h0ZsLnmvZ7QkzsZ
	zK9OFN5kafV5FAaHSsp8xd9XZbstN/zoIAW0cxeSFLkAkvKCWl41loWx3AxsU1vk3GhkD2k97quX4
	X699SlY2BtyjpOC5ox8d71n9ruCjLoMcJeTnS2vceiTD3FtQPsjb3vOnxgtomaiuPHqqg3vnPB1i/
	ysb5/QRr1cdT72zu8WzjkvjvAYLrvCQPtraoJsOetd6CqZScM5uOwBnAp8rau5+PGvM4DhAaK6V0Z
	ifOr9kCnGTrJXJLKgShqJ/vPadoX2kvvreKx6lXpbWXJdhox/eRNICFmYHhl/OZD6CQdNKQJQhRKR
	XveIBUDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWSB-00000000Qkb-1htk;
	Mon, 23 Feb 2026 13:58:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWS6-00000000QhZ-38y2
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Feb 2026 13:58:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=JKzZmUF3e/EMczVJbvGTTAlD+3+vGtQBALWlnTbMvUo=; b=Jhmu6O715h0vGjRmnxiBF05M1n
	9B9Dm83JYoWLUHxuhE/Ui1wL4ianCBlawMn5T3MIclyBbw2lgLKgYYbauywvkNT35EpmtvAe9ldV7
	nAhYigzs3b9y7naEyHtR+m3zVwVRmzKqFIBbtukFDQc1dBfW/RSEQNVnyo47WjjRgJfjzSczHK8xK
	TI4f+ue4KtzsyO9IiEmfxvQfiBNxU+1qDB84CgxSCWxR4z+U4am5fRj1YRsK+8sRmxHlTXbq9MOOl
	Mfknff77TC4KnosJKe7a1DO5qG2nacsmOlxJlrlYtavdev04DCqhOq4fZvJoac9rFTsXUbSK01Wx2
	k6S2kBWQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWS3-00000005BRu-2jCc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 13:58:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 067914442D;
	Mon, 23 Feb 2026 13:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5178C2BC87;
	Mon, 23 Feb 2026 13:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771855094;
	bh=t5KwaNb/RUlMNvnjAQljSY30lTI+e060jlUtQ9txKe8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CB0i1sYaGvAKnvJDXjpHisBs89VSjY27mSJhKAj0XGlOraz8vvxd2/WyynOn4xUJj
	 b2hg9udlqGeeiJIN1vL1iTYASn+XRKntSYGERBlxiVDMXx4bL1Bg4I1dZM6nlRXvQJ
	 koDoawYnCB6tVDFudFvVOV4BqtgZGRQohybGp28nESZEmUGoNw/Gv3jRTUDSaoYd1A
	 vRHlQxPfM4FWrUWSW1z/WZknkWf59fkv4eKF8z2RGKZfvUJjbkIrVKNoGQ5HlVmd13
	 ETu9twtV70eXq/Tn3suvMZacDyPHnifgdHOhURSbT/DyT70tg1GPHGbsfW0LmZEMj9
	 GFaxrGk0Ak98g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB717EA4FC1;
	Mon, 23 Feb 2026 13:58:14 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Mon, 23 Feb 2026 14:58:06 +0100
Subject: [PATCH v5 3/4] arm64: dts: s32: set Ethernet channel irqs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-dwmac_multi_irq-v5-3-8fc699a5fac4@oss.nxp.com>
References: <20260223-dwmac_multi_irq-v5-0-8fc699a5fac4@oss.nxp.com>
In-Reply-To: <20260223-dwmac_multi_irq-v5-0-8fc699a5fac4@oss.nxp.com>
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
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771855093; l=4163;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=GJtLVXXJ6B4rcW9eI+Zdnzjbg44iN/frnopr12Ti4EU=;
 b=TmoJDDNlTmMgV+Qqkl8ZoPkRk6WcQvMR/GbsNwsLdbJ2rG5Dyepdv0jdKiQzldQ7FqOj9HWgF
 u+Wyy0NwaVWAFSohZpnwMJYVrnBYfIp5UIx3X0ji+TpnxElk+AyTYo+
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_135820_145933_53A35AA2 
X-CRM114-Status: GOOD (  11.01  )
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
index e314f3c7d61d..b43e6f001f4d 100644
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



