Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5752C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 17:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FMHjshyJyOZ2PHJSvnSceAsd8KdbR5zlX5L0M7a0Fr0=; b=z88inqw5O2rnLd/YihL9P5O+3c
	gjZTtT/pggCDaB3PnIxD9f7VGNpLLhI8PzGkAxQ/cB4sb2BoCzXKMVsOSnb5EfxdZ04xhiEfPqTl5
	tBSvpjWhuPEFqNc7YkZK93RXKGb2yVr0767YQvI5JIuzmyuh6BZgj0sbkZloOZpDFuZD/RD3O43l7
	MnpGM9eYXHHMeJ++RVmy6rqEGJNVfTVT4a3uC3ne75d6iKAiuEIEMghFSadEJfYl4ADZRk3veT0yK
	wLzcC/5LfNzrK12lCmhsCDzZu9FWq+4lMLNejiQbRvRao6n62srjZL06YzpZgxZTm76EE5tb7w3Kp
	UUxYtgIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD5Ql-00000001TNU-39TY;
	Thu, 08 May 2025 17:53:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD5Mr-00000001SlM-44JM;
	Thu, 08 May 2025 17:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746726547;
	bh=/RSzOpkRHYZYYRmKtWvfee+PuCVMjJhWFvyt+KFRdsg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BHI0Dz1CNp33+w1hrp5zftw/l/K9qp5/Mr83wcnDBk4zRHJjfmniGvxFGpRbslv+k
	 1hZXEtyjd6/lqQFeYGPsYHsU7yPok408T/Pxb4+F6a2tfLZT3ajFR4bdregq8/w/zs
	 eLFn9zG08HBYmAuhF5UAaujy/n00iXEmjthI4CnNWMwx6QvphbhwM0cXlcxEhZHQmc
	 fgfag1eQFn6CM5yoDag4a9U4ULomcg6dFTP1trHcmjvPtiYBXsGlZfZZvLvoY7FIHH
	 G0Izc1UIPJSoaZUYuW1f/2K2dB0SteJT8vEqwOy6kO73mA94Z5gCb6reNqaEXaloei
	 d51+ygyLkbTqA==
Received: from jupiter.universe (dyndsl-091-248-213-080.ewe-ip-backbone.de [91.248.213.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C346417E07E4;
	Thu,  8 May 2025 19:49:07 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 734E8480044; Thu, 08 May 2025 19:49:07 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 08 May 2025 19:48:53 +0200
Subject: [PATCH v2 4/5] arm64: dts: rockchip: add Rock 5B+
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-rock5bp-for-upstream-v2-4-677033cc1ac2@kernel.org>
References: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
In-Reply-To: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4437; i=sre@kernel.org;
 h=from:subject:message-id; bh=/RSzOpkRHYZYYRmKtWvfee+PuCVMjJhWFvyt+KFRdsg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGgc7pPmFw9DAZz3CgUVoMPVMcOZ9Rv6j92CW
 ID9Vkj83bZYnIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJoHO6TAAoJENju1/PI
 O/qaQyEP/38TeLSm+D0HLXMIXQ8Zcr04VABhMGa0s3xSRO0FR+qUwZ+wjJCIVEhqMZ9fXazW5AF
 6jvWvYS8uOToCTsZDb+VdEWPN9uQ2JdPflpK+xflBgsHlr+MxrV3nkZH6qLYF8wbi2oPsXmQltD
 8sgH8dbFv4Mh4uGyZFqNbQ7JKxVa7C5vHxm5/3QIPA7upJ3k/H3d9o4IVlp9wFzqaCCXy5QrSj+
 Kj6SZWmoKKqgCkLDJ0ubOS/eUwIKYdaqbo0eXMjtM0lB1VK40+oo21QtFQmLei5wzDMClLolr58
 PPfu3Cd0vccD6wubNsTQbS1XujvZGa7JvE+SbGNUOaTfIZwLihDIXJPazkkCHX3XfqtCLKVZFhP
 +rLaWP7plKDgquWIFiTzIgpuf+nTzmrnlJz+jXOUunB6Y9MCijX5gTKlfcqXiLvTTSHlHwRWedp
 nqKUH49sVd3Hc247fY5Xe/Ts5NqPx2Af1p2Q6okbtLbney+ZjK201pHZU2jHUfHmYv4P3kOLazn
 qKE3LD+TsjPDbdnkrE7ekept+hlLR2e5GH6JOMD+ZDMos4hpVEW9TTmeiSq3q2NuKQi4+4RI+7I
 0O45MRgE00PEMPMYc6WgnkcH79gYX2DonTOD3BSz+9kk8S3MBzYb+55qEqOO2t6M3pufizH9J/V
 3Rluqq6awZKprTZbeZRk7nA==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_104910_164948_EFF00D9C 
X-CRM114-Status: GOOD (  15.40  )
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

Add ROCK 5B+, which is an improved version of the ROCK 5B with the
following changes:

 * Memory LPDDR4X -> LPDDR5
 * HDMI input connector size
 * eMMC socket -> onboard
 * M.2 E-Key is replaced by onboard RTL8852BE WLAN/BT
 * M.2 M-Key 1x4 lanes is replaced by 2x2 lanes
 * Added M.2 B-Key for USB connected WWAN modules (untested)
 * Add second camera port (not yet supported in upstream Linux)
 * Add dedicated USB-C port for device power (no impact in DT;
   the existing port has not been changed and the new port is
   handled by CH224D standalone chip)

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../boot/dts/rockchip/rk3588-rock-5b-plus.dts      | 113 +++++++++++++++++++++
 2 files changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 7948522cb225cbbe54099fb7537fc70357164f13..7a05bd885d5ecb96c3decbd3f483a6c58b81e0ab 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -165,6 +165,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5-itx.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtbo
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-plus.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou-video-demo.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-toybrick-x0.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts
new file mode 100644
index 0000000000000000000000000000000000000000..74c7b6502e4dda4b774f43c704ebaee350703c0d
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include "rk3588-rock-5b.dtsi"
+
+/ {
+	model = "Radxa ROCK 5B+";
+	compatible = "radxa,rock-5b-plus", "rockchip,rk3588";
+
+	rfkill-wwan {
+		compatible = "rfkill-gpio";
+		label = "rfkill-m2-wwan";
+		radio-type = "wwan";
+		shutdown-gpios = <&gpio3 RK_PA6 GPIO_ACTIVE_HIGH>;
+	};
+
+	vcc3v3_4g: regulator-vcc3v3-4g {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio1 RK_PD2 GPIO_ACTIVE_HIGH>;
+		/* pinctrl for the GPIO is requested by vcc3v3_pcie2x1l0 */
+		regulator-name = "vcc3v3_4g";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <50000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc3v3_wwan_pwr: regulator-vcc3v3-wwan {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio2 RK_PB1 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&wwan_power_en>;
+		regulator-name = "vcc3v3_wwan_pwr";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc3v3_4g>;
+	};
+};
+
+&gpio0 {
+	wwan-disable2-n-hog {
+		gpios = <RK_PB2 GPIO_ACTIVE_LOW>;
+		output-low;
+		line-name = "M.2 B-key W_DISABLE2#";
+		gpio-hog;
+	};
+};
+
+&gpio2 {
+	wwan-reset-n-hog {
+		gpios = <RK_PB3 GPIO_ACTIVE_LOW>;
+		output-low;
+		line-name = "M.2 B-key RESET#";
+		gpio-hog;
+	};
+
+	wwan-wake-n-hog {
+		gpios = <RK_PB2 GPIO_ACTIVE_LOW>;
+		input;
+		line-name = "M.2 B-key WoWWAN#";
+		gpio-hog;
+	};
+};
+
+&pcie30phy {
+	data-lanes = <1 1 2 2>;
+};
+
+&pcie3x2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie3x2_rst>;
+	reset-gpios = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_pcie30>;
+	status = "okay";
+};
+
+&pcie3x4 {
+	num-lanes = <2>;
+};
+
+&pinctrl {
+	wwan {
+		wwan_power_en: wwan-pwr-en {
+			rockchip,pins = <2 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pcie3 {
+		pcie3x2_rst: pcie3x2-rst {
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	usb {
+		vcc5v0_host_en: vcc5v0-host-en {
+			rockchip,pins = <1 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&vcc5v0_host {
+	enable-active-high;
+	gpio = <&gpio1 RK_PA1 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&vcc5v0_host_en>;
+};

-- 
2.47.2


