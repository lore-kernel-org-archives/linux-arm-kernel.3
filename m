Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A092C55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 13:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8mayst51iY72mvdSiqi9wVfJxee1rgOkUeHmMnudiA=; b=2F434plQCa9B8AbOgjpDmZvWa9
	5eztpYH3pjEt9oMjxeHLk4a04jXeag0eR1xEIjE0QQY/pMy9KB5YwF6MqrYQXmSAe+hw2cGF3oVdN
	Fu4xAFhC/AgLOLlyyrPqirLv2NCgfwmdVxO/F4vENPCupH5F9zk/gnbwxLrXphoSznfsi5kSNSfbJ
	EIEMCJ7+jmx4wLVuuWOJshKCHWCX301HhP6ObqNvm7KIJ0qiwdR4uDBklND6Mzb5Bx58GvAjwht4I
	xwetvs2fCxwzY6x7sLtN/CFgafMdDcwwQwzJpI9LdBdAonzQi//kHJWd5IyujvZRjA/BE7UtPy7c+
	h4z/dI+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQeu-0000000AZGr-2kGa;
	Thu, 30 Jul 2026 13:18:48 +0000
Received: from smtp-42ad.mail.infomaniak.ch ([84.16.66.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQej-0000000AZ7t-2lCB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 13:18:40 +0000
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4h9qX90RgNzGJk;
	Thu, 30 Jul 2026 15:18:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1785417512;
	bh=m8mayst51iY72mvdSiqi9wVfJxee1rgOkUeHmMnudiA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WYQRBlrCJCEJvAxFrSf4os72LF2WLYnvvctHQNUNWnyJLWhKtNHcjCzC8MlGWZ8f0
	 AqA6ysKoSE2NKa/G0RYdy/FYhMmPgIYbLijriV642uUfiP28FW/eqh9lAwM03m6Gsa
	 Lo2ZgJ3HAXzEisUwGYWmGCMj2/HnRXRrLT78Hu8No6xrLgaD8HtQUuuDDaueUBz8Pt
	 RMmLAbZPRPSD5unkVZHrrbEGd1QLWIAZvfVYxsdgAPlB6kagXPavkGy2sjtJW72ZZw
	 R2j1HO9VygtiLksIRR+LukXL6X4kYSOQuldkqmapFlRSKTzNzbAoSU2dRuXUxcSBfT
	 QJqyDP8tqbCig==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4h9qX80PtxzHyr;
	Thu, 30 Jul 2026 15:18:32 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Thu, 30 Jul 2026 15:18:28 +0200
Subject: [PATCH 2/2] arm64: dts: rockchip: support CAN1-CAN2-UART4 adapter
 for RK3588 Jaguar
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-jaguar-can-v1-2-9b566bd785da@cherry.de>
References: <20260730-jaguar-can-v1-0-9b566bd785da@cherry.de>
In-Reply-To: <20260730-jaguar-can-v1-0-9b566bd785da@cherry.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Cunhao Lu <1579567540@qq.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.16-dev
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_061838_049538_F5CF2181 
X-CRM114-Status: GOOD (  12.34  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

RK3588 Jaguar has a proprietary Mezzanine connector which exposes among
other things CAN1 and CAN2 controllers as well as UART4.

Add support for the CAN1-CAN2-UART4 Mezzanine adapter for RK3588 Jaguar
which exposes two CAN busses (CAN1 and CAN2) and an RS-232 UART, limited
to 250Kbps.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/Makefile              |  4 ++++
 .../rockchip/rk3588-jaguar-can1-can2-uart4.dtso    | 27 ++++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     | 10 ++++++++
 3 files changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 761d82b4f4f2a..11c96e06b122a 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -307,6 +307,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6b-wifi.dtb
 rk3588-edgeble-neu6b-wifi-dtbs := rk3588-edgeble-neu6b-io.dtb \
 	rk3588-edgeble-neu6a-wifi.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-can1-can2-uart4.dtb
+rk3588-jaguar-can1-can2-uart4-dtbs := rk3588-jaguar.dtb \
+	rk3588-jaguar-can1-can2-uart4.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-ethernet-switch.dtb
 rk3588-jaguar-ethernet-switch-dtbs := rk3588-jaguar.dtb \
 	rk3588-jaguar-ethernet-switch.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar-can1-can2-uart4.dtso b/arch/arm64/boot/dts/rockchip/rk3588-jaguar-can1-can2-uart4.dtso
new file mode 100644
index 0000000000000..9dfb81e5d0a0b
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar-can1-can2-uart4.dtso
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Cherry Embedded Solutions GmbH
+ *
+ * Device Tree Overlay for CAN1-CAN2-UART4 adapter for the Mezzanine connector
+ * on RK3588 Jaguar.
+ *
+ * This adapter has two CAN transceivers and one RS232 transceiver.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&can1 {
+	status = "okay";
+};
+
+&can2 {
+	status = "okay";
+};
+
+/* RS232 */
+&uart4 {
+	/* ST3232B only guarantees 250Kbps */
+	max-speed = <250000>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index ed6c1162bd821..0446834e84d5d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -201,6 +201,16 @@ &can0 {
 	status = "okay";
 };
 
+&can1 {
+	assigned-clocks = <&cru CLK_CAN1>;
+	assigned-clock-rates = <300000000>;
+};
+
+&can2 {
+	assigned-clocks = <&cru CLK_CAN2>;
+	assigned-clock-rates = <300000000>;
+};
+
 &combphy1_ps {
 	status = "okay";
 };

-- 
2.55.0


