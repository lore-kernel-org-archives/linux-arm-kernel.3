Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F1BD172A0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Feb 2026 19:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oY9lKxk5AO/OIHyzqKioV0eS8+fpzb5n8emykS9njJM=; b=v818wsfWAu6O1k98f5/i4lXdQM
	RgrsomK45Kz/CNXk7yPnsWRtapIWblXtKz2uKdW7TkB9qQ/Zk3vKkvQe3UcyS/9g2dzg3051s/9l4
	KgB0ec4lKwXn65QGCHDt025/OOdUxG1M2Q3GgVo36tng01WNBlESxJjLruPTfHhn7GoAL7ETY23uP
	pggSsY5XaRgvBigQqgb/uIcIO3niwDn/OR2yDh7/sa4/lFBJBVYbXgAULwVZeR4FJ+t4fJyftqw9z
	TSeA/FamQve60x9qgLZ9jLSjygk0ETlqDJTNr2PaMYA+vpaYqOW5wQFF+/I0QPv5YI3ZfuQ/nsoSO
	f5j+OhHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmcxe-000000046iH-2e9W;
	Sun, 01 Feb 2026 19:18:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmcxY-000000046dN-1tcL;
	Sun, 01 Feb 2026 19:18:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=oY9lKxk5AO/OIHyzqKioV0eS8+fpzb5n8emykS9njJM=; b=jdU90e/IR1JOqav8FIufAT2jmH
	bWn2KNSIY565PRN8uJXaTZAMrcoFb6QUy12CWtz1I4Bn+6U+/vTWjzN4uL0JlwXEU7dE2e0IJtBZY
	sqbRErmwenVCxxcH92V52Nf2nYTJaJIQriB+/3Nsi90v0MdJ35fW2yISrk4VPmVlCbW3JC0kBF41J
	lyk3PjBWT+T+DamODQlHDG0kQmonfWBvF82SOeBNcsXGo3RpAqK6NEMZBDfchhQI49zPSWpZmUx19
	DOTQpSKKBTI5OIG5wFJTfEOtIB6NMUsv25qonhYhjXQz/fJMyI0Q3+r6n1N7/rUa8/w8pVA7QGJLn
	v26vCXDw==;
Received: from [88.128.88.21] (helo=phil.t-mobile.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vmcxT-005wWz-3W; Sun, 01 Feb 2026 20:18:07 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] arm64: dts: rockchip: Add port subnodes to RK356x SATA controllers
Date: Sun,  1 Feb 2026 20:18:01 +0100
Message-ID: <20260201191804.41421-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260201191804.41421-1-heiko@sntech.de>
References: <20260201191804.41421-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_111812_498870_53778D8C 
X-CRM114-Status: GOOD (  12.90  )
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

The SATA controllers on RK356x are identical to the ones found on RK3588,
but don't yet provide a port sub-node. Per the datasheet the RK356x also
supports the fbscp capability and has the same queue maximums.

So add port sub-nodes to both sata controllers on RK356x, and move the
phy properties to it. Also add phandles to the ports, so that boards can
add their target-supply when available.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 27 ++++++++++++++++---
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index b84055a77ac5..c6bd051b6a25 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) 2021 Rockchip Electronics Co., Ltd.
  */
 
+#include <dt-bindings/ata/ahci.h>
 #include <dt-bindings/clock/rk3568-cru.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
@@ -234,11 +235,20 @@ sata1: sata@fc400000 {
 			 <&cru CLK_SATA1_RXOOB>;
 		clock-names = "sata", "pmalive", "rxoob";
 		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
-		phys = <&combphy1 PHY_TYPE_SATA>;
-		phy-names = "sata-phy";
 		ports-implemented = <0x1>;
 		power-domains = <&power RK3568_PD_PIPE>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 		status = "disabled";
+
+		sata1_port0: sata-port@0 {
+			reg = <0>;
+			hba-port-cap = <HBA_PORT_FBSCP>;
+			phys = <&combphy1 PHY_TYPE_SATA>;
+			phy-names = "sata-phy";
+			snps,rx-ts-max = <32>;
+			snps,tx-ts-max = <32>;
+		};
 	};
 
 	sata2: sata@fc800000 {
@@ -248,11 +258,20 @@ sata2: sata@fc800000 {
 			 <&cru CLK_SATA2_RXOOB>;
 		clock-names = "sata", "pmalive", "rxoob";
 		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
-		phys = <&combphy2 PHY_TYPE_SATA>;
-		phy-names = "sata-phy";
 		ports-implemented = <0x1>;
 		power-domains = <&power RK3568_PD_PIPE>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 		status = "disabled";
+
+		sata2_port0: sata-port@0 {
+			reg = <0>;
+			hba-port-cap = <HBA_PORT_FBSCP>;
+			phys = <&combphy2 PHY_TYPE_SATA>;
+			phy-names = "sata-phy";
+			snps,rx-ts-max = <32>;
+			snps,tx-ts-max = <32>;
+		};
 	};
 
 	usb_host0_xhci: usb@fcc00000 {
-- 
2.47.2


