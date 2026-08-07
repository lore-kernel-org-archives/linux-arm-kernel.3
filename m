Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DDAC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 16:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c86M41eUOipoZeZOJw0RAJnO4yuFTkQfc33NEXiojJE=; b=BHsmYp/4PrVlRgUl3sb5hn4G4e
	+lYacqhqHxfHqboPz7yKeVZtb4uReXYJBjV4dhhZR2bta9f8qjuvf5tCtmNtcYV1dJVAzd6sx5tHP
	wUt9sKSfNeng6kVpkYvHYCADRYLBUIe9yQ8i6w9vGef7rqM4eX9ADT63CwH66ITa5TYNfdM1gXUMM
	osY0dAL4VwSMzU7b0T9YJgDc3TsYJtru9vsQ9C1JwfU6DuWLbp1s8nHVK5ebn8uhAMNJ9lpLIaEnz
	Pm1rRaARIHPI70jEdUzk02mlfWG+Oug79j4/O8Ea2zA16acLiZDcn4/OaT3YQ/YRjrhgRJHkupsYA
	XY/V6HcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNae-00000008REP-2y3t;
	Fri, 07 Aug 2026 16:38:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNab-00000008RDZ-3cYZ;
	Fri, 07 Aug 2026 16:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786120710;
	bh=tLm0zigixPAVvP3oK+s64VXFhk0oX1AZNsKqugMnHKc=;
	h=From:Date:Subject:To:Cc:From;
	b=mVmzX/avb8gOJbXIFfcRmkjiLyvtsAbDpVM4nu92apRen/k3ewBcz8yYfGXbw7DRu
	 IDrRGZDwawffWBJ5C8/ehScertL46TvD6nAj4yzp1hNmHEsDrDTSY9qU87oBWQcj6k
	 qVk4R2msy+AHo2tq7tVRam9JCabD6JXHNUBtwvWrc2tZNaGXR1zcr2YMzFk6g+MdYr
	 oYaqAu83wW+Idk5m8cIKZnlfjIq0YPnCU37R4Ah7LvcnM0Z7bNslAJoBPaFt8LJbnq
	 ZfcR82JHqlzeW7UU0fWs4MRpgSp5xnOCkyH8xVtfxhu4zJUXzeCGr1OhZSpe/odI2u
	 AUTw+ZkhJnzug==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9C2B417E0075;
	Fri, 07 Aug 2026 18:38:30 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 511A9480029; Fri, 07 Aug 2026 18:38:30 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 07 Aug 2026 18:38:19 +0200
Subject: [PATCH v2] arm64: defconfig: enable Rockchip Multimedia drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-rockchip-defconfig-additions-v2-1-cbb8eef87be6@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0JmbU0pQogr70FYtNMpjCIlLRIN4
 e4WvIDLl7z//gqRAlOEa7ZCoIUj+zGBOmWAvR47EmwTg5KqkrWsRPD4wJ4nYcmhHx13QlvLc9p
 FUZCryxIvtlAEKTEFcvw+8k374/gyd8J5b+5Gz3H24XP8L/nu/Xm15EKKyuS2NlpL48ob+mHQx
 gd9Rv+Edtu2L9TmaV7eAAAA
X-Change-ID: 20260806-rockchip-defconfig-additions-3ef855c4d32e
To: Heiko Stuebner <heiko@sntech.de>
Cc: Detlev Casanova <detlev.casanova@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2589;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=tLm0zigixPAVvP3oK+s64VXFhk0oX1AZNsKqugMnHKc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp2CgJb4Bp6++MC8TzrUoo6SauZjzNjme8rS
 XYXSEF7SKkqz4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqdgoCAAoJENju1/PI
 O/qaNkkP/R7NRhzL/J34VCyrymq6xoJX+uU5pGeKgsleFRnp9vAZDWsL0hv51LpuISMXHfOcUEh
 tS1m4o+yqJJA+2frPykseduoRalKQShUm0PmvPB5D4wiy+eR0m0QHK4bOPh3fL0BU0iEMt5ow9J
 DEmIYGH9YohRzrMe+qm+LtRZsWphxzuz9XE4dkjja4DUwm3FU+NGzZN+JjeBQ4OaFLAWg8vrGZg
 oY2ktvzV6gBNBF+7F6IvPbOkVDCOZnEW6r0q8uQkbzd9oR9i7QJZco2rGrRS8y9z0fJulLpBDDv
 5MOcMdSFxmwu+kGJjlBRaBJFOa/f67h4nRJ4eyEuXf6VeJtIQHC5/SPRAP3JhztRS+X3RiAMuAJ
 wRcSqzxkwdmSVXGpAdARtpxLY00xxJUcJjLrmcdt0CM11n6TTXeHq5LGoMRLwooiXK20OTtHsQl
 tWEAfWysvKk4RCdMTSWoSg3/dqUPQRK70Panl5/MHTNrKfVWpXGR+NuTiyMiUo+tdLaAUOau1QX
 93T9P1Drwz4y0Vq1ZjPVNRQSfSJllQbqBlxr+pU1CZEbgKLopDBQDmjLmFQDiEvdSN33PlOY7u5
 UBmWHpYMQJqWIxUhMV1RKY9QoUiUkcYv853a8s/EMp+Uy8U3xD61daCBm8pZ52OhVvV1lFnsxgO
 ieQlJd3hGNvClrbdwz4wqdQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_093834_054254_4966CEE9 
X-CRM114-Status: GOOD (  10.95  )
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

Enable multimedia related drivers used by the Radxa ROCK 5B (and most
other RK3588/RK3576 boards), so that all hardware is supported by the
default config.

 * RKVDEC - RK3588/RK3576 video decoder for H.264 and H.265
 * Sony IMX415 - Sensor used by the Radxa Cam 4K module
 * Rocket - RK3588 NPU driver
 * Verisilicon IOMMU - IOMMU used by RK3588 AV1 video decoder
 * Rockchip MIPI RX Innosilicon D-PHY - CSI PHY

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Changes in v2:
- Link to v1: https://patch.msgid.link/20260806-rockchip-defconfig-additions-v1-0-6b1d8baa0bf5@collabora.com
- Squash all patches (Krzysztof Kozlowski)

The Verisilicon IOMMU defconfig change has previously been sent by
Benjamin as part of the IOMMU series, but did not reach upstream:

https://lore.kernel.org/all/20260415072349.44237-6-benjamin.gaignard@collabora.com/
---
 arch/arm64/configs/defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 654a102cb5bc..5faccf00b897 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -939,6 +939,7 @@ CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_VIDEO_RCAR_DRIF=m
 CONFIG_VIDEO_ROCKCHIP_RGA=m
 CONFIG_VIDEO_ROCKCHIP_CIF=m
+CONFIG_VIDEO_ROCKCHIP_VDEC=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
 CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
@@ -949,6 +950,7 @@ CONFIG_VIDEO_TI_J721E_CSI2RX=m
 CONFIG_VIDEO_HANTRO=m
 CONFIG_VIDEO_IMX219=m
 CONFIG_VIDEO_IMX412=m
+CONFIG_VIDEO_IMX415=m
 CONFIG_VIDEO_OV5640=m
 CONFIG_VIDEO_OV5645=m
 CONFIG_VIDEO_S5KJN1=m
@@ -1063,6 +1065,8 @@ CONFIG_BACKLIGHT_GPIO=m
 CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
+CONFIG_DRM_ACCEL=y
+CONFIG_DRM_ACCEL_ROCKET=m
 CONFIG_SOUND=m
 CONFIG_SND=m
 CONFIG_SND_ALOOP=m
@@ -1611,6 +1615,7 @@ CONFIG_ROCKCHIP_IOMMU=y
 CONFIG_TEGRA_IOMMU_SMMU=y
 CONFIG_APPLE_DART=m
 CONFIG_MTK_IOMMU=y
+CONFIG_VSI_IOMMU=m
 CONFIG_REMOTEPROC=y
 CONFIG_IMX_REMOTEPROC=y
 CONFIG_MTK_SCP=m
@@ -1785,6 +1790,7 @@ CONFIG_PHY_RZ_G3E_USB3=m
 CONFIG_PHY_ROCKCHIP_EMMC=y
 CONFIG_PHY_ROCKCHIP_INNO_HDMI=m
 CONFIG_PHY_ROCKCHIP_INNO_USB2=y
+CONFIG_PHY_ROCKCHIP_INNO_CSIDPHY=m
 CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY=m
 CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=m
 CONFIG_PHY_ROCKCHIP_PCIE=m

---
base-commit: 2d578cd590adc2133aa24496afcd7c3f7f9ba36a
change-id: 20260806-rockchip-defconfig-additions-3ef855c4d32e

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>


