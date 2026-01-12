Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA86C9EC94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 15:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mmFn94WtfpelDb34tOBKdumTndbPzUcp1tdj59DEwpg=; b=c3lQotyetTbhFxxZL33DkRYJHF
	YUoi9Vyjdct4io5MvsacNI/adUN4uGJ8m1zEmhAUsVlTUvDhZFHFE7OUeXGG28QtD/Fp2R6IwWqkk
	OBREXIM6y5dNLH69FBmTKXkxfNEwZeYFhlGWTD6EYEZS6iqV78hJMx8Kf4mZ5ZfyWCPQjPvsUi9iO
	6ZOnRmp/W5ISo77nHhEr324yBk/nvHlQMfNGw09vBhM8emzCwJ6PbBhWMLya3aVNAZ8fTLTqgjlwa
	Avj77OJQibxC3EYIoyMu9sAu2/Wz0oOxSaHYbMSrQAMDgtLUOgVmT2FsXPAi8aY+w4zzPBK5tmEvd
	7yVzgP+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJxA-00000005eHs-15HG;
	Mon, 12 Jan 2026 15:35:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJx8-00000005eHJ-3ySh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 15:35:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 04EAD6000A;
	Mon, 12 Jan 2026 15:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7D4C16AAE;
	Mon, 12 Jan 2026 15:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768232133;
	bh=7hXIqTf3b9quKHMEcBCSHtHVC5OrOtjJELcXHum5F5I=;
	h=From:To:Cc:Subject:Date:From;
	b=A3awc9pT4DUhccCjVKMNmkoL6jXL9BjUR4FbZI2Ep2jfSxz1La/BZoLok/V3vAI0v
	 BXCC6IvO0/5h6mq1/Y8jMKu3MIpC85msBlqfHh9CYt1hlkYiVUm0RL5nzU4ca6Yujf
	 6pGjOx+H+GLp2p/o1lwchw07KIbcnKAsa3At+sB1MznYDvLgltmGpBIrWfhMTBGZW4
	 q5MleRdpeUNdG5naRB4bqo/KjFRWANX3IQt6fRO1l6A0hnRrQT3qACn9iW1mUuWn/f
	 jW4qW7B6cwP4O0EjfI28K0I+ztTOwBX9ieYt92CyJmcRO764xiwbXuG/jJBcQtFIAV
	 o/y/FuAe05GRQ==
From: Arnd Bergmann <arnd@kernel.org>
To: soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 1/2] ARM: defconfig: move entries
Date: Mon, 12 Jan 2026 16:32:54 +0100
Message-Id: <20260112153255.795553-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Arnd Bergmann <arnd@arndb.de>

Some Kconfig files got rearranged, so change the defconfig file
to put everything back in the order used by 'make savedefconfig'.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/configs/multi_v7_defconfig | 31 +++++++++++++++--------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 7f1fa9dd88c9..22c50b60c794 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -8,6 +8,8 @@ CONFIG_PERF_EVENTS=y
 CONFIG_KEXEC=y
 CONFIG_ARCH_VIRT=y
 CONFIG_ARCH_AIROHA=y
+CONFIG_ARCH_HPE=y
+CONFIG_ARCH_HPE_GXP=y
 CONFIG_ARCH_SUNPLUS=y
 CONFIG_ARCH_UNIPHIER=y
 CONFIG_ARCH_ACTIONS=y
@@ -50,8 +52,6 @@ CONFIG_ARCH_HI3xxx=y
 CONFIG_ARCH_HIP01=y
 CONFIG_ARCH_HIP04=y
 CONFIG_ARCH_HIX5HD2=y
-CONFIG_ARCH_HPE=y
-CONFIG_ARCH_HPE_GXP=y
 CONFIG_ARCH_MXC=y
 CONFIG_SOC_IMX50=y
 CONFIG_SOC_IMX51=y
@@ -548,12 +548,12 @@ CONFIG_DEVFREQ_THERMAL=y
 CONFIG_IMX_THERMAL=y
 CONFIG_QORIQ_THERMAL=m
 CONFIG_ROCKCHIP_THERMAL=y
-CONFIG_RCAR_THERMAL=y
 CONFIG_ARMADA_THERMAL=y
 CONFIG_BCM2711_THERMAL=m
 CONFIG_BCM2835_THERMAL=m
 CONFIG_BRCMSTB_THERMAL=m
 CONFIG_ST_THERMAL_MEMMAP=y
+CONFIG_RCAR_THERMAL=y
 CONFIG_TEGRA_SOCTHERM=m
 CONFIG_TEGRA30_TSENSOR=m
 CONFIG_GENERIC_ADC_THERMAL=m
@@ -715,7 +715,6 @@ CONFIG_VIDEO_ADV7604_CEC=y
 CONFIG_VIDEO_ML86V7667=m
 CONFIG_IMX_IPUV3_CORE=m
 CONFIG_DRM=y
-CONFIG_DRM_I2C_NXP_TDA998X=m
 CONFIG_DRM_NOUVEAU=m
 # CONFIG_DRM_NOUVEAU_CH7006 is not set
 # CONFIG_DRM_NOUVEAU_SIL164 is not set
@@ -741,15 +740,16 @@ CONFIG_DRM_TEGRA=y
 CONFIG_DRM_STM=m
 CONFIG_DRM_STM_DSI=m
 CONFIG_DRM_PANEL_LVDS=m
-CONFIG_DRM_PANEL_SIMPLE=y
-CONFIG_DRM_PANEL_EDP=y
-CONFIG_DRM_PANEL_SAMSUNG_LD9040=m
 CONFIG_DRM_PANEL_ORISETECH_OTM8009A=m
 CONFIG_DRM_PANEL_RAYDIUM_RM68200=m
+CONFIG_DRM_PANEL_SAMSUNG_LD9040=m
 CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03=m
 CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=m
 CONFIG_DRM_PANEL_SHARP_LQ101R1SX01=m
+CONFIG_DRM_PANEL_EDP=y
+CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_DISPLAY_CONNECTOR=m
+CONFIG_DRM_I2C_NXP_TDA998X=m
 CONFIG_DRM_LVDS_CODEC=m
 CONFIG_DRM_NXP_PTN3460=m
 CONFIG_DRM_PARADE_PS8622=m
@@ -789,9 +789,9 @@ CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
 CONFIG_SOUND=m
 CONFIG_SND=m
-CONFIG_SND_HDA_TEGRA=m
 CONFIG_SND_HDA_INPUT_BEEP=y
 CONFIG_SND_HDA_PATCH_LOADER=y
+CONFIG_SND_HDA_TEGRA=m
 CONFIG_SND_HDA_CODEC_REALTEK=m
 CONFIG_SND_HDA_CODEC_REALTEK_LIB=m
 CONFIG_SND_HDA_CODEC_ALC269=m
@@ -814,6 +814,8 @@ CONFIG_SND_PXA910_SOC=m
 CONFIG_SND_SOC_QCOM=m
 CONFIG_SND_SOC_APQ8016_SBC=m
 CONFIG_SND_SOC_ROCKCHIP=m
+CONFIG_SND_SOC_SH4_FSI=m
+CONFIG_SND_SOC_RCAR=m
 CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
 CONFIG_SND_SOC_ROCKCHIP_MAX98090=m
 CONFIG_SND_SOC_ROCKCHIP_RT5645=m
@@ -824,8 +826,6 @@ CONFIG_SND_SOC_SNOW=m
 CONFIG_SND_SOC_ODROID=m
 CONFIG_SND_SOC_ARNDALE=m
 CONFIG_SND_SOC_SAMSUNG_MIDAS_WM1811=m
-CONFIG_SND_SOC_SH4_FSI=m
-CONFIG_SND_SOC_RCAR=m
 CONFIG_SND_SOC_STI=m
 CONFIG_SND_SOC_STM32_SAI=m
 CONFIG_SND_SOC_STM32_I2S=m
@@ -1002,7 +1002,6 @@ CONFIG_RTC_DRV_MAX8997=m
 CONFIG_RTC_DRV_MAX77686=y
 CONFIG_RTC_DRV_RK808=m
 CONFIG_RTC_DRV_RS5C372=m
-CONFIG_RTC_DRV_PCF85063=m
 CONFIG_RTC_DRV_PCF85363=m
 CONFIG_RTC_DRV_BQ32K=m
 CONFIG_RTC_DRV_TWL4030=y
@@ -1013,6 +1012,7 @@ CONFIG_RTC_DRV_S35390A=m
 CONFIG_RTC_DRV_RX8581=m
 CONFIG_RTC_DRV_EM3027=y
 CONFIG_RTC_DRV_S5M=m
+CONFIG_RTC_DRV_PCF85063=m
 CONFIG_RTC_DRV_DA9063=m
 CONFIG_RTC_DRV_EFI=m
 CONFIG_RTC_DRV_DIGICOLOR=m
@@ -1046,9 +1046,6 @@ CONFIG_OWL_DMA=y
 CONFIG_PL330_DMA=y
 CONFIG_STE_DMA40=y
 CONFIG_ST_FDMA=m
-CONFIG_STM32_DMA=y
-CONFIG_STM32_DMAMUX=y
-CONFIG_STM32_MDMA=y
 CONFIG_TEGRA20_APB_DMA=y
 CONFIG_UNIPHIER_MDMAC=y
 CONFIG_XILINX_DMA=y
@@ -1057,6 +1054,9 @@ CONFIG_DW_DMAC=y
 CONFIG_RZN1_DMAMUX=m
 CONFIG_RCAR_DMAC=y
 CONFIG_RENESAS_USB_DMAC=m
+CONFIG_STM32_DMA=y
+CONFIG_STM32_DMAMUX=y
+CONFIG_STM32_MDMA=y
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_STAGING=y
@@ -1094,12 +1094,12 @@ CONFIG_TI_MESSAGE_MANAGER=y
 CONFIG_QCOM_APCS_IPC=y
 CONFIG_STM32_IPCC=m
 CONFIG_QCOM_IPCC=y
+CONFIG_QCOM_IOMMU=y
 CONFIG_OMAP_IOMMU=y
 CONFIG_OMAP_IOMMU_DEBUG=y
 CONFIG_ROCKCHIP_IOMMU=y
 CONFIG_TEGRA_IOMMU_SMMU=y
 CONFIG_EXYNOS_IOMMU=y
-CONFIG_QCOM_IOMMU=y
 CONFIG_REMOTEPROC=y
 CONFIG_OMAP_REMOTEPROC=m
 CONFIG_OMAP_REMOTEPROC_WATCHDOG=y
@@ -1135,6 +1135,7 @@ CONFIG_ARCH_TEGRA_124_SOC=y
 CONFIG_SOC_TI=y
 CONFIG_KEYSTONE_NAVIGATOR_QMSS=y
 CONFIG_KEYSTONE_NAVIGATOR_DMA=y
+CONFIG_TI_PRUSS=m
 CONFIG_RASPBERRYPI_POWER=y
 CONFIG_QCOM_CPR=y
 CONFIG_QCOM_RPMHPD=y
-- 
2.39.5


