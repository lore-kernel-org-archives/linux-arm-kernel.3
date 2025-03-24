Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D54C36008
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 17:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cR/5hxquurT+szgUjbvjvvA0G0npbkaHO98nXlWI0cc=; b=pf3nQQ/gKF9AEAks480ne0mhw4
	QNpXxute4Ej48k2a3xhXiHRQH6MtVzXYZH7QPEmtUcKNRcZvliKjI4LbtjIRLyK0r3TrMHSRFNapE
	bRjQa5b4uvBA9XkQlkAvjhiBGGeyZlL2YjGzgwt7bDXhtNwqf/5frOSc1E0JYijguEnLHa+zMSHk2
	xl7ufnLUJ/P0Gvt0EOHEJVdwtmiWaY77kNAe2KKXdlsQZYtAkuxYa+H+P3LKZ1jwuvONNL4rsIQ58
	8gF1wN0PwjHfeJu/4AygrNtVhMFJaPdeb410Fn7nfLMzrjcMOX/fufGlfPvurY+asf7wjqT3JNPa1
	AT1cUH5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twlJ2-00000003l0U-1OC6;
	Mon, 24 Mar 2025 17:09:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twlDt-00000003k2P-0DOq;
	Mon, 24 Mar 2025 17:04:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742835863;
	bh=0gLnYYOisV9YYhtXLBxrTYPVgD131atFQu3Y9z1S44o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QV8nQYO+jzLNvensNtcj6/LQdY9vARE3vSc1PSNfxkO/66mAPgmuRkkrD+bc93i5t
	 rS3JXBHUe/rj/XZt3HHLagd9HWmdgJsZ1yrFch00R+5+hACrOO0MAgGB4QAPo9sKY5
	 g/SMEmjQY/13ELGaBfpF3DAhkT3NFXONo0VT+/gk4TDXSs3sOJG8YhgDnVlXcKV+15
	 DnyA66rP3cSZwQ2RBkUwYXb9FyqgzYrfV2T4Z0vc6mojYk4K0NyXFSBXITQuIkCgaZ
	 FrfRHvOlJSfUyJljoW7RxpQhINxAaEDDIWj13gmq12ZpvvZ3v/2fAHekE3XyT48aec
	 OEeOdUjcF1Ehw==
Received: from jupiter.universe (dyndsl-091-248-188-184.ewe-ip-backbone.de [91.248.188.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1F9CB17E0C38;
	Mon, 24 Mar 2025 18:04:23 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D9D2E48003C; Mon, 24 Mar 2025 18:04:22 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 24 Mar 2025 18:04:25 +0100
Subject: [PATCH 4/5] arm64: dts: rockchip: add Rock 5B+
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-rock5bp-for-upstream-v1-4-6217edf15b19@kernel.org>
References: <20250324-rock5bp-for-upstream-v1-0-6217edf15b19@kernel.org>
In-Reply-To: <20250324-rock5bp-for-upstream-v1-0-6217edf15b19@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4423; i=sre@kernel.org;
 h=from:subject:message-id; bh=0gLnYYOisV9YYhtXLBxrTYPVgD131atFQu3Y9z1S44o=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGfhkJbN2syahpd7q1NftmVTmOJ42npCvflWF
 gYQucPvSgCJS4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJn4ZCWAAoJENju1/PI
 O/qaZeIQAJV7JJ2sJ9TFjiFuBcEuVmsO8L6jg+YQbSmBAg8GprwIpT/OzdpY8z0mJe3rhXUHKHg
 TUiEVj9BPPpQZwSdFqw8EXh7BqmHJgE8hwxBtcAnQxzN6n2eTaaPAIQVscQfHBmIyXpEwIGarm6
 i32ThHEWImpoE591c6sLSSVxOAKtkvhK/RdgrFHbOk/zbZI1HMaNYgKoxU3eYsQuD3EO9eL3bSM
 +LI3JlvSENfEBda9a6jMG/ofjwrwXQZgXACs+wMyZGqmgco9JdN6TyK9HswYaXtF53eFN2aeDZt
 VEia9Ll5i+Sj8YchDZbrhEkuq822YXPC6eRaTwfC5BH/3ZdSuShbmov7hrgMWjVTG4QpQPe2iUN
 xr6+CAt3XS8Pf2pFvejF3fZFhu3AZzJaUNVB88KtNKzdtPGY9HcWyJSVbUkf44DxpxL1h050kgK
 Jle7JAKOMqXWwUvwyRkRgOeZIgaYgv6Cy7F0A9ey9j7OaTiFp+HIr4/6fyaTmNfAP1F4OEu11QW
 udu2y5sq/ljFmegX3drKH/cuzsCTpgLd+jLPg0YyCQ4FIltfxlhTrKYBhPez14FFF4UWFjuK8JF
 EktSkuGcwrFA7QY64DEe4B7zCMJDXDzAAhYqNsHtCR53B8JcKH9SJWXCK8KYHQDd+FSt2YSZvS9
 w7APpf3Dcw7EzVdglxt8eKw==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_100425_439171_711B297C 
X-CRM114-Status: GOOD (  15.46  )
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
index 3e8771ef69ba1c1428117cc2ae29b84e13523e21..6525329fcf060aeb89382d184ca4c6c5c1d07088 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -164,6 +164,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5-itx.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtbo
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-plus.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-toybrick-x0.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-turing-rk1.dtb
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


