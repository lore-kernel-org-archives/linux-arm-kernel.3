Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A51FC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 17:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0GBtwHL+k9u9PQI4kRV/rAIOOs3cHNpH8C7qrcnHPGQ=; b=HfOhppHB81BcxhC5iNuVmfk9Bi
	P0e2rq1UnEgKMNihqq3HazCrm/5sscU4A3823/XDLCoXBz2fJgz33NovslkJIsboZx+0fKSd9eR5V
	0Y34baf/Say09adkgtdUY1Jz+8ogu1FObXp12j08oSHeGVvYf14ieIriVxIvLnd3EAZ4HebkRBawL
	NEt6U/SjdBGhNAF1ly5/9tal0Ra1ymyRPG1n48sPxx33UGUgJfsAN4Nuiv3qf776pYV/p3jwPfG5l
	TGvDmZgb7gWEmuyUivVB9kXlp9eDbpgSwRURm1LkFAY7x00isep6vdAULiNHJCuVMdNmRP2n5KjgO
	GCnyUiYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD5Op-00000001T6f-2nbZ;
	Thu, 08 May 2025 17:51:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD5Mr-00000001SlO-47B6;
	Thu, 08 May 2025 17:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746726548;
	bh=oJteRPSyB7g/KEhdX4ew+DpLSvfNWA+O0sFgmeyciUs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Gb+3btMld3pFQlmCYskRxtF2FIKFquMIqIpXQrFmZLCUJd/PPs2LFopbPgomLLKdx
	 ovJHJ6D6/g0y9A6uRUeyHxAtsxkg7voFlJmRoiHj3t2u4G980VUOckN5Wvur0lZKWY
	 TO0NUscuWMm2KeR0AVSHsNNBKJ0d2v9iYM/P1DW8y/zrYPAYVvTlYSocs1XS3soMtq
	 xGFvpGDonCMz7VL2sO+2YO2j4kPRqu4vBjGpRO3jaP5whGSDMHIrCKNEhI/2l5b/hU
	 bKrPBpEppGe3zYiHmZxHhZL3/cnH5JJgAvWs7xE2QW0WKRCmwBSZw8GUUsafFKYyZ6
	 y8vu94EltMKRw==
Received: from jupiter.universe (dyndsl-091-248-213-080.ewe-ip-backbone.de [91.248.213.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C201D17E078A;
	Thu,  8 May 2025 19:49:07 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 70B0B480039; Thu, 08 May 2025 19:49:07 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 08 May 2025 19:48:51 +0200
Subject: [PATCH v2 2/5] arm64: dts: rockchip: move rock 5b to include file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-rock5bp-for-upstream-v2-2-677033cc1ac2@kernel.org>
References: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
In-Reply-To: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4054; i=sre@kernel.org;
 h=from:subject:message-id; bh=oJteRPSyB7g/KEhdX4ew+DpLSvfNWA+O0sFgmeyciUs=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGgc7pNbxKNemZtyJxPJD3blLBvyrhuBg5vxD
 BHWCLxwDKebNokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJoHO6TAAoJENju1/PI
 O/qafNYP/3xQOh+8NeGXo/mDFqevwRVm/vg1OzQqgy9MqdeTcnhruNBJnw+NkA/HIuE3vuTI+qa
 AJDxMpPTa33OBF+l8C0wTCTyLeBDCOhU8MDbpWQIWAe+aOHv0+/5DKnaQVTPmKxJwK/eKBS9nl3
 NR0RIyEXgvPcp7BfB7Yk2dRSqFki8eOvnNbRcAJTEReassZhTBRkRLdKMugzFci6o/IEQGteyyc
 hokYDUnEm0ggPrT+H1B+jhnzvcKuk9MQxkinH7TpEErCV5+KCr+oJiwK9qN6mao07BRpNMt/DD2
 ynPogpljeHoU5FIixF0nMQXYuBiDZM/b7FeXErU51jUr6hwcQ5XYepydRFYwyGolb8tA/sAggGU
 UiFCIKMPv0Y/ptD0E221fbA2MN9Hx0m4GJVrYtE/IpL6O8E1BLzjqH28epmaOtVMBBB8QyjEIjn
 o0W2S+XZcuKvsag+8dYHd4QqHzGubZ6x5/F7dhzSke3iOsUM1qCl7uCrzegNq8tJil0bmQ02XQR
 +v5XWWs15OeHGc6FsoYOLTfwpm2QpPNUiDS3qZrc5FM5T6nDpbWQi24bCaPx9vLlvQ0GnIiPZL0
 mdlJ8EkN+loIQDD4hqFMOcF426v19APhmLqRWIBnkK5Ljj+or5S/Zl3hZ3+RY56JzAcUlNownts
 jzQu8IGOmSCj6fBZ/3BMiUA==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_104910_168332_C74678F6 
X-CRM114-Status: GOOD (  16.50  )
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

Radxa released some more boards, which are based on the original
Rock 5B. Move its board description into an include file to avoid
unnecessary duplication.

NOTE: this should be merged with the previous commit to ensure
bisectability. The rename happens in a separete commit during
development because git does not properly detect the rename when
the original filename is reused in the same commit. This means

1. it's a lot harder to review the changes
2. it's a lot harder to rebase the patch series

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts  | 52 ++++++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi | 40 ------------------
 2 files changed, 52 insertions(+), 40 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
new file mode 100644
index 0000000000000000000000000000000000000000..9407a7c9910ada1f6c803d2e15785a9cbd9bd655
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include "rk3588-rock-5b.dtsi"
+
+/ {
+	model = "Radxa ROCK 5B";
+	compatible = "radxa,rock-5b", "rockchip,rk3588";
+};
+
+&sdio {
+	max-frequency = <200000000>;
+	no-sd;
+	no-mmc;
+	non-removable;
+	bus-width = <4>;
+	cap-sdio-irq;
+	disable-wp;
+	keep-power-in-suspend;
+	wakeup-source;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc3v3_pcie2x1l0>;
+	vqmmc-supply = <&vcc_1v8_s3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdiom0_pins>;
+	status = "okay";
+};
+
+&uart6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart6m1_xfer &uart6m1_ctsn &uart6m1_rtsn>;
+	status = "okay";
+};
+
+&pinctrl {
+	usb {
+		vcc5v0_host_en: vcc5v0-host-en {
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&vcc5v0_host {
+	enable-active-high;
+	gpio = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&vcc5v0_host_en>;
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
index 17f4fd054cd3d1c4e23ccfe014a9c4b9d7ad1a06..6052787d2560978d2bae6cfbeea5fc1d419d583a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
@@ -8,9 +8,6 @@
 #include "rk3588.dtsi"
 
 / {
-	model = "Radxa ROCK 5B";
-	compatible = "radxa,rock-5b", "rockchip,rk3588";
-
 	aliases {
 		mmc0 = &sdhci;
 		mmc1 = &sdmmc;
@@ -139,10 +136,6 @@ vcc5v0_host: regulator-vcc5v0-host {
 		regulator-always-on;
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		enable-active-high;
-		gpio = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&vcc5v0_host_en>;
 		vin-supply = <&vcc5v0_sys>;
 	};
 
@@ -488,12 +481,6 @@ pcie3_vcc3v3_en: pcie3-vcc3v3-en {
 			rockchip,pins = <1 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
-
-	usb {
-		vcc5v0_host_en: vcc5v0-host-en {
-			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-	};
 };
 
 &pwm1 {
@@ -530,27 +517,6 @@ &sdmmc {
 	status = "okay";
 };
 
-&sdio {
-	max-frequency = <200000000>;
-	no-sd;
-	no-mmc;
-	non-removable;
-	bus-width = <4>;
-	cap-sdio-irq;
-	disable-wp;
-	keep-power-in-suspend;
-	wakeup-source;
-	sd-uhs-sdr12;
-	sd-uhs-sdr25;
-	sd-uhs-sdr50;
-	sd-uhs-sdr104;
-	vmmc-supply = <&vcc3v3_pcie2x1l0>;
-	vqmmc-supply = <&vcc_1v8_s3>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&sdiom0_pins>;
-	status = "okay";
-};
-
 &sfc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&fspim2_pins>;
@@ -566,12 +532,6 @@ flash@0 {
 	};
 };
 
-&uart6 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart6m1_xfer &uart6m1_ctsn &uart6m1_rtsn>;
-	status = "okay";
-};
-
 &spi2 {
 	status = "okay";
 	assigned-clocks = <&cru CLK_SPI2>;

-- 
2.47.2


