Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4EDD0BB5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 05:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FovBiw1gy5DMbMWuNTogpl1PBiY530irUGBBAainHsw=; b=WCD0mrDfDAPbzWTegqfmfhf+GP
	pZ1ouSEIohYviqlyexCjRdXoPc/QU2NvxdZvAhD0kUNhFJH6oD8ZAvLNFlJjh/Vt4qWQ5eToaYX1/
	OGZkCqksTK722SnBZLtfd8EA7DSU7GHgSMbmDJw6wPP1x5LFqOYeuliEZfTVAaFIgqg+qfliZ7tJ0
	Y4he3iIjb4TLhq611/hVSbz7F2eMfM3HRtWC+B11yKLkDHvy7GMShwvOCrExIgCeUQjWdpExX47sm
	wxxljB5azXhMGeFjDTz4m1tLA7w1NE6RFV4analAsF1oKVWoSViOdeDNUOgh/UU9ND5q8h/jiWSg4
	C2fL4vfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3qYE-0000000GpCW-44v4;
	Thu, 24 Oct 2024 05:38:26 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3qIB-0000000Gn90-1Ufb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 05:21:52 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49O5LmIB109932;
	Thu, 24 Oct 2024 00:21:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729747308;
	bh=FovBiw1gy5DMbMWuNTogpl1PBiY530irUGBBAainHsw=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=uIAw/BqKMJGE7MoTmqL4jlPFl08WJTsk/mxWoSL8S9GQq1odcMvk3SdmYYyznD8ek
	 gs+AzErBSDe/DZP7lRVgZfv6S84bMPvsuDuiW8p7/GuGJzM1rAHFAFqCkiElsiElPD
	 KJVwbbtB4H46w4CtZovWbvcyjVURqdtTDCPBd6Zw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49O5Lmtc025122;
	Thu, 24 Oct 2024 00:21:48 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Oct 2024 00:21:48 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Oct 2024 00:21:48 -0500
Received: from [127.0.1.1] (uda0497581.dhcp.ti.com [10.24.68.185])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49O5L4lH090467;
	Thu, 24 Oct 2024 00:21:44 -0500
From: Manorit Chawdhry <m-chawdhry@ti.com>
Date: Thu, 24 Oct 2024 10:51:06 +0530
Subject: [PATCH v6 09/12] arm64: dts: ti: k3-am68-sk*: Add bootph-*
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241024-b4-upstream-bootph-all-v6-9-2af90e3a4fe7@ti.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729747264; l=3955;
 i=m-chawdhry@ti.com; s=20231127; h=from:subject:message-id;
 bh=DIvjMla05HLiI1/XLCDUNxF0kf/gSNM5WoACMqNNNxE=;
 b=156ZjYMbc3oyJNYzbnhEhndJie2LnzTfXGQcJXxKDohtChyrzYci09QT2ywgMoIADjTn+RXmn
 6spVbFMro3dD8xac/3GmHBAQlolt5S9quLjlM66V5CyRJBVd65tvHZA
X-Developer-Key: i=m-chawdhry@ti.com; a=ed25519;
 pk=fsr6Tm39TvsTgfyfFQLk+nnqIz2sBA1PthfqqfiiYSs=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_222151_527994_C4130A52 
X-CRM114-Status: GOOD (  11.32  )
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
- main_uart8, mcu_uart0(DM), wkup_uart0(TIFS) for Traces
- mmc1, ospi0 for enabling various bootmodes.
- eeprom for board detection

Reviewed-by: Udit Kumar <u-kumar1@ti.com>
Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---

Notes:
    R-by picked up in v4 ( Udit )

 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts | 8 ++++++++
 arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi       | 5 +++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
index d5ceab79536ca45fb1421a2a2e133db6a458b518..11522b36e0cece248571b27819c8a87e0ffe06e2 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
@@ -184,6 +184,7 @@ main_uart8_pins_default: main-uart8-default-pins {
 			J721S2_IOPAD(0x0d0, PIN_INPUT, 11) /* (AF26) SPI0_CS1.UART8_RXD */
 			J721S2_IOPAD(0x0d4, PIN_OUTPUT, 11) /* (AH27) SPI0_CLK.UART8_TXD */
 		>;
+		bootph-all;
 	};
 
 	main_i2c0_pins_default: main-i2c0-default-pins {
@@ -211,6 +212,7 @@ J721S2_IOPAD(0x0f4, PIN_INPUT, 0) /* (R24) MMC1_DAT2 */
 			J721S2_IOPAD(0x0f0, PIN_INPUT, 0) /* (R22) MMC1_DAT3 */
 			J721S2_IOPAD(0x0e8, PIN_INPUT, 8) /* (AE25) TIMER_IO0.MMC1_SDCD */
 		>;
+		bootph-all;
 	};
 
 	vdd_sd_dv_pins_default: vdd-sd-dv-default-pins {
@@ -313,6 +315,7 @@ J721S2_WKUP_IOPAD(0x074, PIN_OUTPUT, 0) /* (F28) WKUP_GPIO0_7.WKUP_UART0_RTSn */
 			J721S2_WKUP_IOPAD(0x048, PIN_INPUT, 0) /* (D28) WKUP_UART0_RXD */
 			J721S2_WKUP_IOPAD(0x04c, PIN_OUTPUT, 0) /* (D27) WKUP_UART0_TXD */
 		>;
+		bootph-all;
 	};
 
 	mcu_cpsw_pins_default: mcu-cpsw-default-pins {
@@ -372,6 +375,7 @@ mcu_uart0_pins_default: mcu-uart0-default-pins {
 			J721S2_WKUP_IOPAD(0x08c, PIN_INPUT, 0) /* (C24) WKUP_GPIO0_13.MCU_UART0_RXD */
 			J721S2_WKUP_IOPAD(0x088, PIN_OUTPUT, 0) /* (C25) WKUP_GPIO0_12.MCU_UART0_TXD */
 		>;
+		bootph-all;
 	};
 
 	mcu_rpi_header_gpio0_pins0_default: mcu-rpi-header-gpio0-default-pins-0 {
@@ -413,6 +417,7 @@ &wkup_uart0 {
 	status = "reserved";
 	pinctrl-names = "default";
 	pinctrl-0 = <&wkup_uart0_pins_default>;
+	bootph-all;
 };
 
 &wkup_i2c0 {
@@ -495,6 +500,7 @@ &mcu_uart0 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcu_uart0_pins_default>;
+	bootph-all;
 };
 
 &main_uart8 {
@@ -503,6 +509,7 @@ &main_uart8 {
 	pinctrl-0 = <&main_uart8_pins_default>;
 	/* Shared with TFA on this platform */
 	power-domains = <&k3_pds 357 TI_SCI_PD_SHARED>;
+	bootph-all;
 };
 
 &main_i2c0 {
@@ -597,6 +604,7 @@ &main_sdhci1 {
 	disable-wp;
 	vmmc-supply = <&vdd_mmc1>;
 	vqmmc-supply = <&vdd_sd_dv>;
+	bootph-all;
 };
 
 &mcu_cpsw {
diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi b/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi
index 5bc0d2fb4b8f3969d6f372a374be91e5b5cbd821..4ca2d4e2fb9b063086b4bec2a184e01dfab11f24 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi
@@ -156,6 +156,7 @@ wkup_i2c0_pins_default: wkup-i2c0-default-pins {
 			J721S2_WKUP_IOPAD(0x098, PIN_INPUT, 0) /* (H24) WKUP_I2C0_SCL */
 			J721S2_WKUP_IOPAD(0x09c, PIN_INPUT, 0) /* (H27) WKUP_I2C0_SDA */
 		>;
+		bootph-all;
 	};
 };
 
@@ -169,6 +170,7 @@ eeprom@51 {
 		/* AT24C512C-MAHM-T */
 		compatible = "atmel,24c512";
 		reg = <0x51>;
+		bootph-all;
 	};
 };
 
@@ -190,7 +192,6 @@ flash@0 {
 		cdns,read-delay = <4>;
 
 		partitions {
-			bootph-all;
 			compatible = "fixed-partitions";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -226,9 +227,9 @@ partition@800000 {
 			};
 
 			partition@3fc0000 {
-				bootph-pre-ram;
 				label = "ospi.phypattern";
 				reg = <0x3fc0000 0x40000>;
+				bootph-all;
 			};
 		};
 	};

-- 
2.46.0


