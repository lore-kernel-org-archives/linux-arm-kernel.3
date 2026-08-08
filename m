Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421ECC5AD48
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 14:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ebnFlhGfPY/u8sqmzY0u9+7RW6uNfi/nEVHqXeV5ng=; b=l/mQZNCS6oB1omKTUSy1l/Q+Rx
	H+9r/DtBSk2//NBiIaUP22QgQVtznvjW9EjRSdg7uwKxvmtsFhsUwGSWU4gwO90QyjYNTR2cotBGz
	/ahulGspJlfT5z+iIh/3CZomreLkj0CVBC8kqhslXwMLxIjNMquWekr1KGqatwg4TV9IWDBxqWqjR
	KkboEPkuM1OaN+xhioOOddnM4YG2Hz/wKUrich7nykDQE6y2P7WLqGlWUxbSxPgIAiXeZQxDE/rvX
	FuLVJbndEpsJgr6uXDBNFQeCfSpUDrTmvTAaAnjfnAhCTBXMBhI6zBmlNNevTHNGp13fyA503SHWj
	5z0hMyBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wshgu-00000009QvK-3Rmm;
	Sat, 08 Aug 2026 14:06:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wshgs-00000009Qur-2QEo;
	Sat, 08 Aug 2026 14:06:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=5ebnFlhGfPY/u8sqmzY0u9+7RW6uNfi/nEVHqXeV5ng=; b=qXcQILVo27/aWkFhjRyOiOsi4X
	Bxp+PI/tUnmsvz8qbQSBSczRY0vpvQz6ccaImBh4pUoW8hptHAn+lHTi0MetWpJZwlQy4ms13g9kO
	dlZ255191DZ2xwu0xH0vv91XLso8gMjnO/zPmPJg91YRQifZUedm+KuAbcQ/KOM/A4Ka20LisKqgb
	lrv8GD+U39CECg4hGIOeFkAKyUwkF7VX4mlBYSTPrOmrFjupWDJ/zXNT/NNqxz3f91AbK7kqCy07z
	GgLRJ0mtoY6j5m6OaBdbc26cX8tnwqzibO8Ll3B/7mFxNf5nkSApGwB5ZnxGQNVbUnEXSNZLDKDor
	htlq0zvQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Michael Riesch <michael.riesch@collabora.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3] arm64: defconfig: enable Rockchip Multimedia drivers
Date: Sat, 08 Aug 2026 16:06:03 +0200
Message-ID: <5738059.NG923GbCHz@diego>
In-Reply-To: <20260808-rockchip-defconfig-additions-v3-1-0ed67877e94d@collabora.com>
References: <20260808-rockchip-defconfig-additions-v3-1-0ed67877e94d@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_070622_677338_4DA5E7DE 
X-CRM114-Status: GOOD (  19.24  )
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

Am Samstag, 8. August 2026, 02:42:26 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Sebastian Reichel:
> Enable multimedia related drivers used by the Radxa ROCK 5B (used as an
> example, the config options are relevant for most Rockchip RK3588 and
> RK3576 boards), so that all hardware is supported by the default config.
>=20
>  * Synopsys MIPI CSI2RX - RK3588 CSI2 Controller
>  * RKVDEC - RK3588/RK3576 video decoder for H.264 and H.265
>  * Sony IMX415 - Sensor used by the Radxa Cam 4K module
>  * Rocket - RK3588 NPU driver
>  * Verisilicon IOMMU - IOMMU used by RK3588 AV1 video decoder
>  * Innosilicon CSI D-PHY - RK3588 CSI PHY (one of them)
>=20
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

I'm not sure what the actual rule for defconfig changes is.

In some past thread I remember (hopefully correctly) Krzysztof saying
that the arm64 defconfig is not supposed to be a distro-config, so
enabling each and every driver was not the goal.

On the other hand, he did not repeat that in his reply to your v1 ;-) .

We're at -rc7 tomorrow, so it'd be 7.4 material anyway, so enough time
to get "complaints" I guess ;-) .


Heiko

> ---
> Changes in v3:
> - Link to v2: https://patch.msgid.link/20260807-rockchip-defconfig-additi=
ons-v2-1-cbb8eef87be6@collabora.com
> - Also add CONFIG_VIDEO_DW_MIPI_CSI2RX=3Dm and update commit message
>=20
> Changes in v2:
> - Link to v1: https://patch.msgid.link/20260806-rockchip-defconfig-additi=
ons-v1-0-6b1d8baa0bf5@collabora.com
> - Squash all patches (Krzysztof Kozlowski)
>=20
> The Verisilicon IOMMU defconfig change has previously been sent by
> Benjamin as part of the IOMMU series, but did not reach upstream:
>=20
> https://lore.kernel.org/all/20260415072349.44237-6-benjamin.gaignard@coll=
abora.com/
>=20
> The Synopsys CSI controller defconfig change has previously been sent
> by Michael as part of the driver series, but did not reach upstream:
>=20
> https://lore.kernel.org/linux-rockchip/20260522-rk3588-vicap-v5-0-d1d1f52=
65c56@collabora.com/
> ---
>  arch/arm64/configs/defconfig | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 654a102cb5bc..49f836ba67a5 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -915,6 +915,7 @@ CONFIG_SDR_PLATFORM_DRIVERS=3Dy
>  CONFIG_V4L_MEM2MEM_DRIVERS=3Dy
>  CONFIG_VIDEO_AMPHION_VPU=3Dm
>  CONFIG_VIDEO_CADENCE_CSI2RX=3Dm
> +CONFIG_VIDEO_DW_MIPI_CSI2RX=3Dm
>  CONFIG_VIDEO_WAVE_VPU=3Dm
>  CONFIG_VIDEO_E5010_JPEG_ENC=3Dm
>  CONFIG_VIDEO_MEDIATEK_JPEG=3Dm
> @@ -939,6 +940,7 @@ CONFIG_VIDEO_RENESAS_VSP1=3Dm
>  CONFIG_VIDEO_RCAR_DRIF=3Dm
>  CONFIG_VIDEO_ROCKCHIP_RGA=3Dm
>  CONFIG_VIDEO_ROCKCHIP_CIF=3Dm
> +CONFIG_VIDEO_ROCKCHIP_VDEC=3Dm
>  CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=3Dm
>  CONFIG_VIDEO_SAMSUNG_S5P_JPEG=3Dm
>  CONFIG_VIDEO_SAMSUNG_S5P_MFC=3Dm
> @@ -949,6 +951,7 @@ CONFIG_VIDEO_TI_J721E_CSI2RX=3Dm
>  CONFIG_VIDEO_HANTRO=3Dm
>  CONFIG_VIDEO_IMX219=3Dm
>  CONFIG_VIDEO_IMX412=3Dm
> +CONFIG_VIDEO_IMX415=3Dm
>  CONFIG_VIDEO_OV5640=3Dm
>  CONFIG_VIDEO_OV5645=3Dm
>  CONFIG_VIDEO_S5KJN1=3Dm
> @@ -1063,6 +1066,8 @@ CONFIG_BACKLIGHT_GPIO=3Dm
>  CONFIG_LOGO=3Dy
>  # CONFIG_LOGO_LINUX_MONO is not set
>  # CONFIG_LOGO_LINUX_VGA16 is not set
> +CONFIG_DRM_ACCEL=3Dy
> +CONFIG_DRM_ACCEL_ROCKET=3Dm
>  CONFIG_SOUND=3Dm
>  CONFIG_SND=3Dm
>  CONFIG_SND_ALOOP=3Dm
> @@ -1611,6 +1616,7 @@ CONFIG_ROCKCHIP_IOMMU=3Dy
>  CONFIG_TEGRA_IOMMU_SMMU=3Dy
>  CONFIG_APPLE_DART=3Dm
>  CONFIG_MTK_IOMMU=3Dy
> +CONFIG_VSI_IOMMU=3Dm
>  CONFIG_REMOTEPROC=3Dy
>  CONFIG_IMX_REMOTEPROC=3Dy
>  CONFIG_MTK_SCP=3Dm
> @@ -1785,6 +1791,7 @@ CONFIG_PHY_RZ_G3E_USB3=3Dm
>  CONFIG_PHY_ROCKCHIP_EMMC=3Dy
>  CONFIG_PHY_ROCKCHIP_INNO_HDMI=3Dm
>  CONFIG_PHY_ROCKCHIP_INNO_USB2=3Dy
> +CONFIG_PHY_ROCKCHIP_INNO_CSIDPHY=3Dm
>  CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY=3Dm
>  CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=3Dm
>  CONFIG_PHY_ROCKCHIP_PCIE=3Dm
>=20
> ---
> base-commit: 2d578cd590adc2133aa24496afcd7c3f7f9ba36a
> change-id: 20260806-rockchip-defconfig-additions-3ef855c4d32e
>=20
> Best regards,
> -- =20
> Sebastian Reichel <sebastian.reichel@collabora.com>
>=20
>=20





