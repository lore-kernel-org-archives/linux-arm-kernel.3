Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F95C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 12:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBKlIlvjCT1HWiGwarelgi26pjIy9DLF0HtrSAdkla8=; b=IqzD/nZoix3iff5uwpVlOZzbOR
	gJN+BZGzWlJ3vdXfGSOkNs7yPEYBgjKQZGR2XRwU1M7ZZ5C+MY0/HVfHMYt0uusK74b6TigK+NNXQ
	SqXCLQMbkHhVxzUsrriCft4GsRJLtPWTfXYMKTYv6+zkYFNxmbbqcYAcL1eil/QZKVAlwB8BkV70R
	VasQQHH05IbxcqL8o/uZgFAe3GgG+B/z35xJ5leB00uQAcQBSYyKusME62S7nfX8Wl8fBYzQKP3Bv
	zpXMw28ra9LVOld4XRgu1WGfpxpp3lAQ4nvj//JGRdY+IlNkoQay+F6rXFYqBMJ1mpsI7kr4UVqSP
	2B1EBcBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrzm-0000000A91Y-470C;
	Wed, 18 Jun 2025 12:34:26 +0000
Received: from smtp-42ab.mail.infomaniak.ch ([2001:1600:7:10::42ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRq6G-00000009nhT-25B1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 10:33:04 +0000
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bMg6w620szV2b;
	Wed, 18 Jun 2025 12:32:56 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bMg6w1Bd1zC3G;
	Wed, 18 Jun 2025 12:32:56 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Wed, 18 Jun 2025 12:32:43 +0200
Subject: [PATCH v3 4/5] arm64: dts: rockchip: force PMIC reset behavior to
 restart PMU on RK3588 Jaguar
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-rk8xx-rst-fun-v3-4-081f02d3d348@cherry.de>
References: <20250618-rk8xx-rst-fun-v3-0-081f02d3d348@cherry.de>
In-Reply-To: <20250618-rk8xx-rst-fun-v3-0-081f02d3d348@cherry.de>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, 
 Daniel Semkowicz <dse@thaumatec.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_033300_683126_34DEBD0F 
X-CRM114-Status: GOOD (  11.02  )
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

The bootloader for RK3588 Jaguar currently forces the PMIC reset
behavior (stored in RST_FUN bitfield in register SYS_CFG3 of the PMIC)
to 0b1X which is incorrect for our devices.

It is required to restart the PMU as otherwise the companion
microcontroller cannot detect the PMIC (and by extension the full
product and main SoC) being rebooted which is an issue as that is used
to reset a few things like the PWM beeper and watchdogs.

Let's add the new rockchip,reset-mode property to make sure the PMIC
reset behavior is the expected one.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index ebe77cdd24e803b00fb848dc81258909472290f1..176925d0a1a809d1e2500f5e5efbbfa6a6d0bd42 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -10,6 +10,7 @@
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
 #include <dt-bindings/usb/pd.h>
+#include "rk8xx.h"
 #include "rk3588.dtsi"
 
 / {
@@ -693,6 +694,7 @@ pmic@0 {
 		vcc13-supply = <&vcc_1v1_nldo_s3>;
 		vcc14-supply = <&vcc_1v1_nldo_s3>;
 		vcca-supply = <&vcc5v0_sys>;
+		rockchip,reset-mode = <RK806_RESTART>;
 
 		rk806_dvs1_null: dvs1-null-pins {
 			pins = "gpio_pwrctrl1";

-- 
2.49.0


