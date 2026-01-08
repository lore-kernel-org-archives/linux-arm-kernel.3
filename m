Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640CFD1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 19:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xTYPYEZSyUOR4owbPfE3fSToiJ/CPOSgdHTNpnvRAc=; b=E3bmjDd7FCmgnzB4Vuf4+jdGaO
	duCq2vm7df3Oe/0xLNPrXbhtRPMViKxTNS03p1imNLJs9rIEfxR8Wc1ux+G5ttcAuVN5QqWd2Y7my
	ALw06nisCXq+lDbtTRx1rgKfnP5nU86vb6JbV95UF6R+VwhqMaBGc1qSm/6bepbTRWgpuEnM93Ch2
	PRV+ql6VTBBSuujNAX1JzPCqatoNzGP84uxoYDW7UbaVRoq87JhE7DrcLBR28YGeCd7no493McnDx
	oJgWFXNuM72xP/SxRzJacmmmB989ZxX3nKyaYtQd5Kt0N5vBnFmUsNbECbLrAzc4pqBk/n6fntaHo
	mkVQ3hRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdvIn-00000000hSf-1MrU;
	Thu, 08 Jan 2026 19:04:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdvIk-00000000hRp-26d9;
	Thu, 08 Jan 2026 19:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=0xTYPYEZSyUOR4owbPfE3fSToiJ/CPOSgdHTNpnvRAc=; b=OZcb6i7Kq0PC81CDhI9KMTImkq
	NobBuzSsnV6t0TfjHzeNm+x67CZVPP5uBcyHc0kSLopeR1utT7FGxlTDD8uG8NbSSAS7gWhAPWpKx
	FuJVPHFhrQQl/VUhczvxZkbK50oKF2E3eRdOwLyuyO/CxV8LEDjMGguYoFPbqVXKoPMdr2nMvf4U1
	JpJ2XUYL9staaJyK8EbqDYTfCkJereVgwZHMq7DZxumaGSv6K544FBd7EvrA9HrT+EVPOsWgK+1Hu
	lyOIpQI6HjfPQxhhqDk21aqx70ZH3dYd8SBa+K4F/fNkXDpCi5Dd3lQwE4IJ8xQZzxQZP5/furfah
	GZD4Zn4A==;
Received: from [192.76.154.230] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vdvIU-001XS9-BV; Thu, 08 Jan 2026 20:03:50 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Chaoyi Chen <kernel@airkyi.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH 8/9] drm/rockchip: Drop ROCKCHIP_IOMMU depend for DRM_ROCKCHIP
Date: Thu, 08 Jan 2026 20:03:50 +0100
Message-ID: <4072834.X9hSmTKtgW@phil>
In-Reply-To: <20251106020632.92-9-kernel@airkyi.com>
References: <20251106020632.92-1-kernel@airkyi.com>
 <20251106020632.92-9-kernel@airkyi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_110406_586602_E764CFD8 
X-CRM114-Status: GOOD (  17.63  )
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

Am Donnerstag, 6. November 2025, 03:06:31 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Chaoyi Chen:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>=20
> On the RK3506 platform, there is no iommu hardware. And even on
> platform that have iommu hardware, it should be possible to use
> VOP without enabling iommu. In this case, a contiguous memory
> space like CMA should be used.
>=20
> So this patch removes the dependency on ROCKCHIP_IOMMU.
>=20
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  drivers/gpu/drm/rockchip/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/=
Kconfig
> index b7b025814e72..a056d419190c 100644
> --- a/drivers/gpu/drm/rockchip/Kconfig
> +++ b/drivers/gpu/drm/rockchip/Kconfig
> @@ -1,7 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_ROCKCHIP
>  	tristate "DRM Support for Rockchip"
> -	depends on DRM && ROCKCHIP_IOMMU
> +	depends on DRM
> +	depends on ROCKCHIP_IOMMU || !ROCKCHIP_IOMMU

I don't really understand this yes+no line :-)

Can't you just
=2D drop the dependency altogether
or
=2D do a depends on ROCKCHIP_IOMMU if ARM64


Heiko

>  	depends on OF
>  	select DRM_CLIENT_SELECTION
>  	select DRM_GEM_DMA_HELPER
>=20





