Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D2DD0BB45
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 05:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqHQQLIWxl1kkVlHdoZdrdo4pztiw/iiLGggIBUJ0x0=; b=x7AhAlS9Eiab7MSvkgPCxt5f/E
	cQsLRKryI/0/S4PTHxETHuNZ1A9Fb/pCZ0d1/a93EneHWOY482PwAPdJPnl1f5hbDu1Id2K0lS5C6
	ICVBJbjnPPiFv2XdMtP+0XrgPwHCPN56qXw729MjdDl3L8p1iAe+aU2Rjgyd7FMSH9sTfAr+45e9U
	AL60lvAg2LAsc1N7nwQFMRzWlxrYwjbOXIpKWmKu77OjtDkmP3szNr6K7NOi+6uzs7oR3YX6LcwZI
	NyrC+CmfMX0PiDtJRuhowksxkOT6vdQrNYkw1f23RbAat7gjmyqrgXwogDSxP84GxPJDOzDSKdrjZ
	K1BK9KKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3qcj-0000000GpYR-2YKh;
	Thu, 24 Oct 2024 05:43:05 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3qIO-0000000GnCS-1mIQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 05:22:05 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49O5M1Z0113426;
	Thu, 24 Oct 2024 00:22:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729747321;
	bh=oqHQQLIWxl1kkVlHdoZdrdo4pztiw/iiLGggIBUJ0x0=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=haH+AIaMefzM/iAwi4nDOOFzpb/38IzdaM9Q34NYv165Gzr5IA7tXAb142SsyXWig
	 RSZGC4z9Tbird23D1AhFPVTuyUBK7bPFkcxDMEGB6GB+0RLJx6CL3Fe36vEtyeX0la
	 J1k/8i5ZE/vcVvItxJ2D77kUvnuM0Meq94dwlLsE=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49O5M13m025188;
	Thu, 24 Oct 2024 00:22:01 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Oct 2024 00:22:01 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Oct 2024 00:22:01 -0500
Received: from [127.0.1.1] (uda0497581.dhcp.ti.com [10.24.68.185])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49O5L4lK090467;
	Thu, 24 Oct 2024 00:21:57 -0500
From: Manorit Chawdhry <m-chawdhry@ti.com>
Date: Thu, 24 Oct 2024 10:51:09 +0530
Subject: [PATCH v6 12/12] arm64: dts: ti: k3-j7200-evm*: Add bootph-*
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241024-b4-upstream-bootph-all-v6-12-2af90e3a4fe7@ti.com>
References: <20241024-b4-upstream-bootph-all-v6-0-2af90e3a4fe7@ti.com>
In-Reply-To: <20241024-b4-upstream-bootph-all-v6-0-2af90e3a4fe7@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Neha Malcom Francis <n-francis@ti.com>,
        Aniket Limaye <a-limaye@ti.com>, Udit Kumar <u-kumar1@ti.com>,
        Beleswar Padhi
	<b-padhi@ti.com>,
        Siddharth Vadapalli <s-vadapalli@ti.com>, Andrew Davis
	<afd@ti.com>,
        Manorit Chawdhry <m-chawdhry@ti.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729747264; l=5351;
 i=m-chawdhry@ti.com; s=20231127; h=from:subject:message-id;
 bh=46PvWcO1Y+g4FOBZ8tCATYLmz+1G6stPwizRvVFOk0w=;
 b=CVBTPby0nz1ySFr7EBcoQzKOm1TgU/bQUmapYyjxDelG5ShEod8v/kLaV078b45+r4EB0eZVM
 v3is5falx6xDCgPhzfvWwNinxKF5PzcC1IQ/sOZaR0b5/S/V4tpryni
X-Developer-Key: i=m-chawdhry@ti.com; a=ed25519;
 pk=fsr6Tm39TvsTgfyfFQLk+nnqIz2sBA1PthfqqfiiYSs=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_222204_596467_E7997405 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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

Adds bootph-* properties to the leaf nodes to enable bootloaders to
utilise them.

Following adds bootph-* to:
- pmic regulator for enabling AVS Support
- main_uart0, mcu_uart0(DM), wkup_uart0(TIFS) for Traces
- mmc0, mmc1, usb0, ospi0, hbmc for enabling various bootmodes.

Reviewed-by: Aniket Limaye <a-limaye@ti.com>
Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---

Notes:
    R-by picked up in v5 ( Aniket )

 arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts | 13 +++++++++++++
 arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi           |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
index 6593c5da82c06463c2d7cbbe01d6fa481be1aa1a..d03690b8d65230d22b3630770a6bc819409837c1 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
@@ -129,6 +129,7 @@ J721E_WKUP_IOPAD(0x94, PIN_OUTPUT, 0) /* (E21) MCU_UART0_RTSn */
 			J721E_WKUP_IOPAD(0x8c, PIN_INPUT, 0) /* (D20) MCU_UART0_RXD */
 			J721E_WKUP_IOPAD(0x88, PIN_OUTPUT, 0) /* (D19) MCU_UART0_TXD */
 		>;
+		bootph-all;
 	};
 
 	wkup_uart0_pins_default: wkup-uart0-default-pins {
@@ -136,6 +137,7 @@ wkup_uart0_pins_default: wkup-uart0-default-pins {
 			J721E_WKUP_IOPAD(0x48, PIN_INPUT, 0) /* (B14) WKUP_UART0_RXD */
 			J721E_WKUP_IOPAD(0x4c, PIN_OUTPUT, 0) /* (A14) WKUP_UART0_TXD */
 		>;
+		bootph-all;
 	};
 
 	mcu_cpsw_pins_default: mcu-cpsw-default-pins {
@@ -204,6 +206,7 @@ J721E_IOPAD(0xb4, PIN_OUTPUT, 0) /* (T17) UART0_TXD */
 			J721E_IOPAD(0xc0, PIN_INPUT, 2) /* (W3) SPI0_CS0.UART0_CTSn */
 			J721E_IOPAD(0xc4, PIN_OUTPUT, 2) /* (U5) SPI0_CS1.UART0_RTSn */
 		>;
+		bootph-all;
 	};
 
 	main_uart1_pins_default: main-uart1-default-pins {
@@ -238,6 +241,7 @@ J721E_IOPAD(0xf0, PIN_INPUT, 0) /* (N20) MMC1_DAT2 */
 			J721E_IOPAD(0xec, PIN_INPUT, 0) /* (N19) MMC1_DAT3 */
 			J721E_IOPAD(0xe4, PIN_INPUT, 8) /* (V1) TIMER_IO0.MMC1_SDCD */
 		>;
+		bootph-all;
 	};
 
 	vdd_sd_dv_pins_default: vdd-sd-dv-default-pins {
@@ -259,6 +263,7 @@ main_usbss0_pins_default: main-usbss0-default-pins {
 		pinctrl-single,pins = <
 			J721E_IOPAD(0x04, PIN_OUTPUT, 0) /* (T4) USB0_DRVVBUS */
 		>;
+		bootph-all;
 	};
 };
 
@@ -267,12 +272,14 @@ &wkup_uart0 {
 	status = "reserved";
 	pinctrl-names = "default";
 	pinctrl-0 = <&wkup_uart0_pins_default>;
+	bootph-all;
 };
 
 &mcu_uart0 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcu_uart0_pins_default>;
+	bootph-all;
 };
 
 &main_uart0 {
@@ -281,6 +288,7 @@ &main_uart0 {
 	power-domains = <&k3_pds 146 TI_SCI_PD_SHARED>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_uart0_pins_default>;
+	bootph-all;
 };
 
 &main_uart1 {
@@ -379,6 +387,7 @@ &main_sdhci0 {
 	/* eMMC */
 	status = "okay";
 	non-removable;
+	bootph-all;
 	ti,driver-strength-ohm = <50>;
 	disable-wp;
 };
@@ -390,6 +399,7 @@ &main_sdhci1 {
 	pinctrl-names = "default";
 	vmmc-supply = <&vdd_mmc1>;
 	vqmmc-supply = <&vdd_sd_dv>;
+	bootph-all;
 	ti,driver-strength-ohm = <50>;
 	disable-wp;
 };
@@ -401,11 +411,13 @@ &serdes_ln_ctrl {
 
 &usb_serdes_mux {
 	idle-states = <1>; /* USB0 to SERDES lane 3 */
+	bootph-all;
 };
 
 &usbss0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_usbss0_pins_default>;
+	bootph-all;
 	ti,vbus-divider;
 	ti,usb2-only;
 };
@@ -413,6 +425,7 @@ &usbss0 {
 &usb0 {
 	dr_mode = "otg";
 	maximum-speed = "high-speed";
+	bootph-all;
 };
 
 &tscadc0 {
diff --git a/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
index e78b4622a7d1ff320259b17850e8f1735508f7dd..291ab9bb414d7883f102101035b19fd324767306 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
@@ -121,6 +121,7 @@ J721E_WKUP_IOPAD(0x20, PIN_INPUT, 1) /* (B8) MCU_OSPI0_D5.MCU_HYPERBUS0_DQ5 */
 			J721E_WKUP_IOPAD(0x24, PIN_INPUT, 1) /* (A8) MCU_OSPI0_D6.MCU_HYPERBUS0_DQ6 */
 			J721E_WKUP_IOPAD(0x28, PIN_INPUT, 1) /* (A7) MCU_OSPI0_D7.MCU_HYPERBUS0_DQ7 */
 		>;
+		bootph-all;
 	};
 
 	mcu_fss0_ospi0_pins_default: mcu-fss0-ospi0-default-pins {
@@ -137,6 +138,7 @@ J721E_WKUP_IOPAD(0x0024, PIN_INPUT, 0)  /* MCU_OSPI0_D6 */
 			J721E_WKUP_IOPAD(0x0028, PIN_INPUT, 0)  /* MCU_OSPI0_D7 */
 			J721E_WKUP_IOPAD(0x0008, PIN_INPUT, 0)  /* MCU_OSPI0_DQS */
 		>;
+		bootph-all;
 	};
 };
 
@@ -146,6 +148,7 @@ wkup_i2c0_pins_default: wkup-i2c0-default-pins {
 			J721E_WKUP_IOPAD(0x98, PIN_INPUT_PULLUP, 0) /* (F20) WKUP_I2C0_SCL */
 			J721E_WKUP_IOPAD(0x9c, PIN_INPUT_PULLUP, 0) /* (H21) WKUP_I2C0_SDA */
 		>;
+		bootph-all;
 	};
 };
 
@@ -186,6 +189,7 @@ &hbmc {
 	flash@0,0 {
 		compatible = "cypress,hyperflash", "cfi-flash";
 		reg = <0x00 0x00 0x4000000>;
+		bootph-all;
 
 		partitions {
 			compatible = "fixed-partitions";
@@ -347,6 +351,7 @@ bucka1: buck1 {
 				regulator-max-microvolt = <1800000>;
 				regulator-boot-on;
 				regulator-always-on;
+				bootph-all;
 			};
 
 			bucka2: buck2 {
@@ -520,6 +525,7 @@ partition@800000 {
 			partition@3fc0000 {
 				label = "ospi.phypattern";
 				reg = <0x3fc0000 0x40000>;
+				bootph-all;
 			};
 		};
 	};

-- 
2.46.0


