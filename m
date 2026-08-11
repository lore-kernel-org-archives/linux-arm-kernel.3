Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD6BC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 14:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5lHsgQ26VTFwl/93DIzKcKD464qKEtmZdQru8ijLtTE=; b=sWfkR9N3n+x1qpsjDUqPwRtLew
	KNUsqx123opHNAQE71Cr2KiUembB80tLVmA1Y8BAjni8ryu6bJccRJAb35JUJ4ClenercUGZgDtEU
	QbKNOnfZwQXW4S6GRVVC7g2cuT8IyIa1Xjbf9vd3zGIHW6vPfYRXW0UExi3rw7TjgOMjY/UxxEmaO
	EWpZ/+YQ0j31DTz8Ax1z74R0aMtz4WzdOs7OTQbIqVTwkxJ5eNzYk8mdvh9OC366glFslQvrpCZUD
	vKBA6KVebmEluGaGURTpd3oB8zP3g3mZ5hOyfhbD124ZatGko3JC/6N+c1xQ+mQ4sI2BQUoMhlf8/
	jd79oQmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtn9u-0000000EBOY-3dAf;
	Tue, 11 Aug 2026 14:08:50 +0000
Received: from smtp-8fa8.mail.infomaniak.ch ([2001:1600:19:e38::8fa8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtn9p-0000000EBJl-3jnI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 14:08:47 +0000
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4hKD4T0zcLz1jW;
	Tue, 11 Aug 2026 16:08:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1786457320;
	bh=5lHsgQ26VTFwl/93DIzKcKD464qKEtmZdQru8ijLtTE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Vb42qCmfz7cEf8AtXsFKEIR2oSAr2sHrOm3E7iPKDwAtx7xCgLLnCherrq8NGpSgU
	 d/7VC6m0flEA575vePNPKZOD194g171Wnw8YAkrDz0bHNfmej3b/lnOtb7LTqJVHaO
	 BaXp6rrt87tr82fGpqXb4DO2vgmewVNgKplJ2Iri3qk7pN4NErqTeoedBfAuoa9GeW
	 q8TpyzfdiCGaquFJeHhNH3mJqhRcfuXAOESbBDTkVp+wUWJ6w8HOnXq+yeE7UNQU4m
	 WlBR5XHcZSP8jckASnKy+5fBrRXdPT3Wd2PwkEz+UZ98NCv1vJv2KaSSmJiuS2wdYj
	 /9RHBMp6FFWJw==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4hKD4S0NCLzDkM;
	Tue, 11 Aug 2026 16:08:40 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 11 Aug 2026 16:08:27 +0200
Subject: [PATCH v2 2/2] arm64: dts: rockchip: support CAN1-CAN2-UART4
 adapter for RK3588 Jaguar
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-jaguar-can-v2-2-7e78415b5a08@cherry.de>
References: <20260811-jaguar-can-v2-0-7e78415b5a08@cherry.de>
In-Reply-To: <20260811-jaguar-can-v2-0-7e78415b5a08@cherry.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Cunhao Lu <1579567540@qq.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_070846_063584_0D0F8564 
X-CRM114-Status: GOOD (  11.54  )
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
 .../rockchip/rk3588-jaguar-can1-can2-uart4.dtso    | 26 ++++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     | 10 +++++++++
 3 files changed, 40 insertions(+)

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
index 0000000000000..6c21bf78591b3
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar-can1-can2-uart4.dtso
@@ -0,0 +1,26 @@
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


