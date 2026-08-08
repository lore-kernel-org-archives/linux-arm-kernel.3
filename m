Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D527C5AD05
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 00:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V3TVaMZssrBMjl62WTlb9YTVVHCLoQByfoQGOVOAKTg=; b=MaJSIfx4DftUlzUOpzErft5/ko
	MeHZ4eQlzL2THZXj3I6si9pktzV6XHYui0pvZPRdZfGNMj3oBrvM5utwNAVyMiS46HGRRtAkMr7ce
	us0sD3PSdm1oaaMoDYiGxsYXh1NyBzT7ronL3Eyx/8v2T61G9fvv73BrP4KIqGLZHjhB87AzeUFv7
	o694iquEjhuQt2uqdViQqFA+V1/LvgxAuz7ITtFRRnEaaLyakcmgUoVCaEBGbxSodXai5FqzoyJn6
	i4swkDwZwxhbZqnUrUo7gSD/YZ8I8Dg4Jf43ZnYpHwPBeSskyI7EgVF+QBG3bepmnN8yz10dymXbN
	Zsa4Hl8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsV9K-00000008vg1-0VEO;
	Sat, 08 Aug 2026 00:42:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsV9G-00000008vfL-32oE;
	Sat, 08 Aug 2026 00:42:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786149767;
	bh=DPJWc5LLnfBOgsLYxHBXQR+txSIQtgzzVgAXoE+jDSQ=;
	h=From:Date:Subject:To:Cc:From;
	b=mTlvNCEpU6XFMLapHS/Zo2pal7dNUwmejL0UwP02HMRYMiP4wFqUmhbvdKLOthst7
	 YqJPngGdBZtil+UA3SUs15B+u3uR1dJEJKD24XoO8+S3rhf+HKPmTaLa4OaSVGTb+I
	 1JuExqd1yEC3KfcajpBmlp2qriqGIJ4XfLE3gECfnT5aMmBv/rbClH5/Wo1wT64GZi
	 Fq9DMQgctw3sLcL6Qbo+1MpS9zChFNFaejmC5svGbeF36H3ajA8FaZVlg2R0toOCEh
	 jK5g7KvalaXHEyEIPUw87peNu7KqooW/9fVXSxRR73epyyiWARea4NM7d79NXxNe4c
	 uJIlVP/szCi7A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BB9F117E052F;
	Sat, 08 Aug 2026 02:42:47 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 6BC69480029; Sat, 08 Aug 2026 02:42:47 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 08 Aug 2026 02:42:26 +0200
Subject: [PATCH v3] arm64: defconfig: enable Rockchip Multimedia drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260808-rockchip-defconfig-additions-v3-1-0ed67877e94d@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42PMQ7CMAxFr1JlxihNaamYuAdiSByHGkqDkhKBU
 O9OCgtigfFJ3+/JDxEpMEWxKR4iUOLIfshQLQqBnR4OBGwzCyVVI1vZQPB4wo4vYMmhHxwfQFv
 LY76LUJFr6xpXtlIksuISyPHtpd/t3xyv5kg4zs550XEcfbi/+qmcd3+mUgkSGlPa1mgtjau36
 PteGx/0Ev1ZzLmkPoXrH0IFJaAxLeUn1oaab+E0TU9Qw8H4LwEAAA==
X-Change-ID: 20260806-rockchip-defconfig-additions-3ef855c4d32e
To: Heiko Stuebner <heiko@sntech.de>
Cc: Detlev Casanova <detlev.casanova@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3407;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=DPJWc5LLnfBOgsLYxHBXQR+txSIQtgzzVgAXoE+jDSQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp2e4eDotkv3A7JVcJi7M7J2z/D/46djg/P2
 VhgKChzDviyBIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqdnuHAAoJENju1/PI
 O/qaKQQP/00Jtqb4YOsxU8lRiRqBhJaa0X1EerKVWvvWPSh33wmS05M3xjN/bzkc++6S7geY8sn
 fifLovg6by2Ha1cOuX0sYqlnNA5/PurAs6KqEmBgZVBe67X+FGlH/+TQfPADDGuEJKBz5uo2mT4
 IARtrb8+CCQNvAcv4/ccERkhLHMl5VUHtMWJxlpVWMwCq83xDUlVdSek0B3Hxc7ypgJYYan217P
 SpsoOWALgt5lD3r4/prSoXlQqrsbBeDR6uueGP8pHzsJsqyHjoRv8pR/ApNcO/JvGDCPk0F47EM
 DiwhEc7HGEuJE0gSd5fTo8S3R1/MpAGQO9Gi3pvr5SkCCYARoQ3XSGJkv8BtIECfwwAHfD48zv9
 BfSJ1OAoLDm1iiCMP5eXshzscc5KWdvKBie4hPvO2TnyF+bWac3KU1PnEk6Wy2cROiCWc5VJsTC
 kuLUqLG0AZ2Wh93LSCu6EaWpY71NcfoEXzrNKFmh8CbmbUHdWdP3XogrKUg0NvqKmluDDjr4h0B
 m4EEKQ0lf9sHf+Dd461SUFvrZdiq0NyyInzT7x41LEy+bwBKD3Kyqet6x/jz0WQqpaK5Rq01QF9
 6VV4RQ7UdAcxsEKJ6Z/bl4lrMG/zupozXFxqwnQ57eHjXrCY6hD7wyiufkSipV3oXeVvwBJ6iEB
 UYMJRVYyz03J9flffk4sx8g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_174250_924485_1A2242C1 
X-CRM114-Status: GOOD (  10.72  )
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

Enable multimedia related drivers used by the Radxa ROCK 5B (used as an
example, the config options are relevant for most Rockchip RK3588 and
RK3576 boards), so that all hardware is supported by the default config.

 * Synopsys MIPI CSI2RX - RK3588 CSI2 Controller
 * RKVDEC - RK3588/RK3576 video decoder for H.264 and H.265
 * Sony IMX415 - Sensor used by the Radxa Cam 4K module
 * Rocket - RK3588 NPU driver
 * Verisilicon IOMMU - IOMMU used by RK3588 AV1 video decoder
 * Innosilicon CSI D-PHY - RK3588 CSI PHY (one of them)

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Changes in v3:
- Link to v2: https://patch.msgid.link/20260807-rockchip-defconfig-additions-v2-1-cbb8eef87be6@collabora.com
- Also add CONFIG_VIDEO_DW_MIPI_CSI2RX=m and update commit message

Changes in v2:
- Link to v1: https://patch.msgid.link/20260806-rockchip-defconfig-additions-v1-0-6b1d8baa0bf5@collabora.com
- Squash all patches (Krzysztof Kozlowski)

The Verisilicon IOMMU defconfig change has previously been sent by
Benjamin as part of the IOMMU series, but did not reach upstream:

https://lore.kernel.org/all/20260415072349.44237-6-benjamin.gaignard@collabora.com/

The Synopsys CSI controller defconfig change has previously been sent
by Michael as part of the driver series, but did not reach upstream:

https://lore.kernel.org/linux-rockchip/20260522-rk3588-vicap-v5-0-d1d1f5265c56@collabora.com/
---
 arch/arm64/configs/defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 654a102cb5bc..49f836ba67a5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -915,6 +915,7 @@ CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_AMPHION_VPU=m
 CONFIG_VIDEO_CADENCE_CSI2RX=m
+CONFIG_VIDEO_DW_MIPI_CSI2RX=m
 CONFIG_VIDEO_WAVE_VPU=m
 CONFIG_VIDEO_E5010_JPEG_ENC=m
 CONFIG_VIDEO_MEDIATEK_JPEG=m
@@ -939,6 +940,7 @@ CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_VIDEO_RCAR_DRIF=m
 CONFIG_VIDEO_ROCKCHIP_RGA=m
 CONFIG_VIDEO_ROCKCHIP_CIF=m
+CONFIG_VIDEO_ROCKCHIP_VDEC=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
 CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
@@ -949,6 +951,7 @@ CONFIG_VIDEO_TI_J721E_CSI2RX=m
 CONFIG_VIDEO_HANTRO=m
 CONFIG_VIDEO_IMX219=m
 CONFIG_VIDEO_IMX412=m
+CONFIG_VIDEO_IMX415=m
 CONFIG_VIDEO_OV5640=m
 CONFIG_VIDEO_OV5645=m
 CONFIG_VIDEO_S5KJN1=m
@@ -1063,6 +1066,8 @@ CONFIG_BACKLIGHT_GPIO=m
 CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
+CONFIG_DRM_ACCEL=y
+CONFIG_DRM_ACCEL_ROCKET=m
 CONFIG_SOUND=m
 CONFIG_SND=m
 CONFIG_SND_ALOOP=m
@@ -1611,6 +1616,7 @@ CONFIG_ROCKCHIP_IOMMU=y
 CONFIG_TEGRA_IOMMU_SMMU=y
 CONFIG_APPLE_DART=m
 CONFIG_MTK_IOMMU=y
+CONFIG_VSI_IOMMU=m
 CONFIG_REMOTEPROC=y
 CONFIG_IMX_REMOTEPROC=y
 CONFIG_MTK_SCP=m
@@ -1785,6 +1791,7 @@ CONFIG_PHY_RZ_G3E_USB3=m
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


