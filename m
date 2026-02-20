Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EB8C5AD57
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 18:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5C9753KQ/4WBD2TXyND2u5sVRqZtQ2tqZTvuEyEyBlM=; b=tiqbxLg0wgMG8APK52dcCw9Hii
	+SEGep79j/nr4yzUxKxdrKCs2Gjcb9mcCbmrkh8EWpqqXbPnqmF6MxUEkVkxwNuwV5FptsQsPTcPR
	I3mzOILPfag5LE4Ug+v/zJMl6oJY5+SJX5tDSCDIS0xlNez1sKbA/ejhAxTMH3OkpWc5p4nric/05
	rxsEMaK0auU7AG74oQJR0xzVeBbJuBlHXg5uDyntjYuOq2yDFSjqbsyFv46X1HGRs8RCy8b6SoDYj
	85iZ8FDY1io2LoTCoOeLJwIHD49sTYAN22sQxmrrJaTJ72jQIooU+NHGhQ3Aqa2CmcnVWxgrf4ULw
	2H0fEShA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtVU2-0000000FSy7-0kS2;
	Fri, 20 Feb 2026 18:44:10 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtVTz-0000000FSxb-3wKT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 18:44:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=5C9753KQ/4WBD2TXyND2u5sVRqZtQ2tqZTvuEyEyBlM=; b=L4KJFNeD52IB9ylH2z2Hxov+v7
	Ah3bt5MJbjUm7r+1tptKocfeFx/5gvFrMDqBRR0wiOcX0KgRwTW4LolvywWlrl4pnTcAhwp34LAie
	wHVxoGFSVMkgx/cA7JF5WKmU19859bWrTpsBoQ89WBnrdsRs2rS/CLfiOqBxRE5bnqtPwOskq6sAv
	9R9W2Eig+PDuAxO4PFfpcRWWhJtHu4i7cbngXC0sYB/FTggfCoB0hlyuggOQMBLfkwZKU/vvv0N/0
	3DMxBnjzr2UAww2LuPGWT+7QDV57tZvbXrfMTUFAKPM9lJnvXrtyI81MhAN8CcPFVtev1y9OQAZJT
	5Ur4puvg==;
From: Andreas Kemnade <andreas@kemnade.info>
To: linux@armlinux.org.uk,
	ebiggers@kernel.org,
	ardb@kernel.org,
	arnd@arndb.de,
	geert+renesas@glider.be,
	tiwai@suse.de,
	dmitry.baryshkov@oss.qualcomm.com,
	twoerner@gmail.com,
	andreas@kemnade.info,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	khilman@baylibre.com,
	aaro.koskinen@iki.fi,
	rogerq@kernel.org,
	tony@atomide.com
Subject: [PATCH] arm: multi_v7_defconfig: Enable more OMAP 3/4 related configs
Date: Fri, 20 Feb 2026 19:43:36 +0100
Message-ID: <20260220184336.616623-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_104407_980973_0673962C 
X-CRM114-Status: UNSURE (   5.82  )
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

Enable drivers commonly used for these boards.

- CONFIG_*TWL*: PMIC mostly used on these devices so enable all functions.
  Especially charging is required to avoid having battery drained.

- missing SoC functions (watchdog, thermal, sound)

- TI WiLink chipset support to provide WLAN for
  - GTA04A5, Pandaboards, OpenPandora, Moverio BT200

- HCILL to provide Bluetooth on boards with TI WiLink
  combo chips

- TCA6507 LEDs: some are used as GPIO os GTA04A4 to provide
  Power.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/configs/multi_v7_defconfig | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f75d75cf91c8..0c83d9471799 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -155,6 +155,7 @@ CONFIG_QRTR_SMD=m
 CONFIG_CAN=y
 CONFIG_BT=m
 CONFIG_BT_HCIUART=m
+CONFIG_BT_HCIUART_LL=y
 CONFIG_BT_HCIUART_BCM=y
 CONFIG_BT_MRVL=m
 CONFIG_BT_MRVL_SDIO=m
@@ -310,6 +311,11 @@ CONFIG_MWIFIEX=m
 CONFIG_MWIFIEX_SDIO=m
 CONFIG_RT2X00=m
 CONFIG_RT2800USB=m
+CONFIG_WL1251=m
+CONFIG_WL1251_SDIO=m
+CONFIG_WL12XX=m
+CONFIG_WL18XX=m
+CONFIG_WLCORE_SDIO=m
 CONFIG_INPUT_JOYDEV=y
 CONFIG_INPUT_EVDEV=y
 CONFIG_KEYBOARD_QT1070=m
@@ -318,8 +324,10 @@ CONFIG_KEYBOARD_TEGRA=y
 CONFIG_KEYBOARD_PXA27x=m
 CONFIG_KEYBOARD_SAMSUNG=m
 CONFIG_KEYBOARD_ST_KEYSCAN=y
+CONFIG_KEYBOARD_OMAP4=m
 CONFIG_KEYBOARD_SPEAR=y
 CONFIG_KEYBOARD_TM2_TOUCHKEY=m
+CONFIG_KEYBOARD_TWL4030=m
 CONFIG_KEYBOARD_CROS_EC=m
 CONFIG_MOUSE_PS2_ELANTECH=y
 CONFIG_MOUSE_CYAPA=m
@@ -342,6 +350,8 @@ CONFIG_INPUT_GPIO_DECODER=m
 CONFIG_INPUT_CPCAP_PWRBUTTON=m
 CONFIG_INPUT_TPS65219_PWRBUTTON=m
 CONFIG_INPUT_AXP20X_PEK=m
+CONFIG_INPUT_TWL4030_PWRBUTTON=m
+CONFIG_INPUT_TWL4030_VIBRA=m
 CONFIG_INPUT_DA9063_ONKEY=m
 CONFIG_INPUT_ADXL34X=m
 CONFIG_INPUT_STPMIC1_ONKEY=y
@@ -521,6 +531,8 @@ CONFIG_AXP20X_POWER=m
 CONFIG_BATTERY_MAX17040=m
 CONFIG_BATTERY_MAX17042=m
 CONFIG_CHARGER_CPCAP=m
+CONFIG_CHARGER_TWL4030=m
+CONFIG_CHARGER_TWL6030=m
 CONFIG_CHARGER_GPIO=m
 CONFIG_CHARGER_MAX14577=m
 CONFIG_CHARGER_MAX77693=m
@@ -549,6 +561,8 @@ CONFIG_ARMADA_THERMAL=y
 CONFIG_BCM2711_THERMAL=m
 CONFIG_BCM2835_THERMAL=m
 CONFIG_BRCMSTB_THERMAL=m
+CONFIG_OMAP4_THERMAL=y
+CONFIG_OMAP5_THERMAL=y
 CONFIG_ST_THERMAL_MEMMAP=y
 CONFIG_RCAR_THERMAL=y
 CONFIG_TEGRA_SOCTHERM=m
@@ -563,10 +577,12 @@ CONFIG_AT91SAM9X_WATCHDOG=y
 CONFIG_SAMA5D4_WATCHDOG=y
 CONFIG_S3C2410_WATCHDOG=m
 CONFIG_DW_WATCHDOG=y
+CONFIG_OMAP_WATCHDOG=y
 CONFIG_DAVINCI_WATCHDOG=m
 CONFIG_ORION_WATCHDOG=y
 CONFIG_RN5T618_WATCHDOG=y
 CONFIG_SUNXI_WATCHDOG=y
+CONFIG_TWL4030_WATCHDOG=m
 CONFIG_IMX2_WDT=y
 CONFIG_ST_LPC_WATCHDOG=y
 CONFIG_TEGRA_WATCHDOG=m
@@ -845,6 +861,9 @@ CONFIG_SND_SOC_TEGRA_TRIMSLICE=m
 CONFIG_SND_SOC_TEGRA_ALC5632=m
 CONFIG_SND_SOC_TEGRA_MAX98090=m
 CONFIG_SND_SOC_DAVINCI_MCASP=m
+CONFIG_SND_SOC_OMAP_DMIC=m
+CONFIG_SND_SOC_OMAP_MCPDM=m
+CONFIG_SND_SOC_OMAP3_TWL4030=m
 CONFIG_SND_SOC_AC97_CODEC=m
 CONFIG_SND_SOC_AK4642=m
 CONFIG_SND_SOC_CPCAP=m
@@ -987,6 +1006,7 @@ CONFIG_LEDS_PCA9532=m
 CONFIG_LEDS_PCA9532_GPIO=y
 CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_PWM=y
+CONFIG_LEDS_TCA6507=m
 CONFIG_LEDS_MAX8997=m
 CONFIG_LEDS_ACER_A500=m
 CONFIG_LEDS_TRIGGERS=y
@@ -1088,6 +1108,7 @@ CONFIG_COMMON_CLK_RK808=m
 CONFIG_COMMON_CLK_SCMI=y
 CONFIG_COMMON_CLK_LAN966X=y
 CONFIG_COMMON_CLK_S2MPS11=m
+CONFIG_CLK_TWL=m
 CONFIG_CLK_RASPBERRYPI=y
 CONFIG_COMMON_CLK_QCOM=y
 CONFIG_QCOM_A53PLL=y
@@ -1183,6 +1204,8 @@ CONFIG_STM32_ADC_CORE=m
 CONFIG_STM32_ADC=m
 CONFIG_STM32_DFSDM_ADC=m
 CONFIG_STMPE_ADC=m
+CONFIG_TWL4030_MADC=m
+CONFIG_TWL6030_GPADC=m
 CONFIG_VF610_ADC=m
 CONFIG_XILINX_XADC=y
 CONFIG_IIO_CROS_EC_SENSORS_CORE=m
@@ -1205,6 +1228,7 @@ CONFIG_PWM_BCM2835=y
 CONFIG_PWM_BRCMSTB=m
 CONFIG_PWM_FSL_FTM=m
 CONFIG_PWM_MESON=m
+CONFIG_PWM_OMAP_DMTIMER=m
 CONFIG_PWM_RENESAS_RCAR=m
 CONFIG_PWM_RENESAS_TPU=y
 CONFIG_PWM_ROCKCHIP=m
@@ -1215,6 +1239,8 @@ CONFIG_PWM_STM32_LP=m
 CONFIG_PWM_SUN4I=y
 CONFIG_PWM_TEGRA=y
 CONFIG_PWM_TIECAP=m
+CONFIG_PWM_TWL=m
+CONFIG_PWM_TWL_LED=m
 CONFIG_PWM_VT8500=y
 CONFIG_KEYSTONE_IRQ=y
 CONFIG_RESET_MCHP_SPARX5=y
-- 
2.47.3


