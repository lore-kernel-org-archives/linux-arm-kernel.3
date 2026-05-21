Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AD4CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 09:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxMOs4dXD0pN1U9+9L/WIABEp5JlmFEPKJTJy5jes9s=; b=w525rZtC/qXab4ABjfyvLjqyEz
	uDB1+3IEtXk5js+bK0K9JFuxCYoSbidfmxRwXG9QI7DhHJhubUIG/E58sxxJ78CNk3q/SN8jDW8hu
	1QBoNHl+2JLn8+AYxwuWHQ646uL4ugMfRPd4g9QXgeipywr4gw8tJHgO9CzzcVglL2k7rrEo4Z3CO
	ChTLZZr1luFJg1uD+cvP1MJseBz4+tvvFWiPGQZA+BM9uVoWAMYNXQYMbtMIzQx4kDQ4YvgPgbcyZ
	aunFsJypvmDgGdrl6HbTlli/x7dQyaRkly7X7vwz8QVI/PymR7CJk67mJ4ev09NiX5nG9wUeNPFuH
	OkDDxwzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzMQ-00000007FMB-2zrL;
	Thu, 21 May 2026 09:06:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzMO-00000007FLE-1iNi;
	Thu, 21 May 2026 09:06:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=kxMOs4dXD0pN1U9+9L/WIABEp5JlmFEPKJTJy5jes9s=; b=MeioAS9DTu5IYnt6P16wWIwEbV
	O1lzZIcq3aPJXnIb1w3JxeLGVULUrwITtkN5eTFgaXIiNsVtQ2PGhAQXAZqCU9I3+56T4jHvuVfBT
	ywE270IiPQDw6eZMtk3jIuhz2kw5lMs9pGXGvQhp4g4ksVoitkItqRKECkoNT0vFnr8lzKonzv4Jj
	bSPgx52zBiuRIylfVOMY6yl3/K6C+NsiZBl8NgpGlHVb0TWs836bHSvuOhDy86M0Z9mqjyHpkTKhX
	FyM7prAKoDq7wWHD8DP+4RuUnhu3I1I54AQTxowOX1x3oNnkX0brQD37HsdY/br150JBVWumq79Sz
	/TP49C0A==;
From: Heiko Stuebner <heiko@sntech.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Vinod Koul <vkoul@kernel.org>, Chaoyi Chen <kernel@airkyi.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH 3/5] phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
Date: Thu, 21 May 2026 11:06:12 +0200
Message-ID: <7886213.zQ0Gbyo6oJ@phil>
In-Reply-To: <20260521032854.103-4-kernel@airkyi.com>
References: <20260521032854.103-1-kernel@airkyi.com>
 <20260521032854.103-4-kernel@airkyi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_020632_541017_67F6083C 
X-CRM114-Status: GOOD (  18.31  )
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

Hi,

Am Donnerstag, 21. Mai 2026, 05:28:52 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Chaoyi Chen:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>=20
> Using the DRM_AUX_BRIDGE helper to create the transparent DRM bridge
> device.
>=20
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


@Vinod:
could you give this patch an Ack to go through the DRM tree please?

It is independent of any other phy changes, but needs the drm-patches 1+2
from this series, so ideally would go through the drm tree together with
them.

Thanks a lot
Heiko


> ---
>  drivers/phy/rockchip/Kconfig              |  2 ++
>  drivers/phy/rockchip/phy-rockchip-typec.c | 13 +++++++++++--
>  2 files changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfig
> index 14698571b607..9173d3b4fef4 100644
> --- a/drivers/phy/rockchip/Kconfig
> +++ b/drivers/phy/rockchip/Kconfig
> @@ -119,6 +119,8 @@ config PHY_ROCKCHIP_SNPS_PCIE3
>  config PHY_ROCKCHIP_TYPEC
>  	tristate "Rockchip TYPEC PHY Driver"
>  	depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
> +	depends on DRM || DRM=3Dn
> +	select DRM_AUX_BRIDGE if DRM_BRIDGE
>  	select EXTCON
>  	select GENERIC_PHY
>  	select RESET_CONTROLLER
> diff --git a/drivers/phy/rockchip/phy-rockchip-typec.c b/drivers/phy/rock=
chip/phy-rockchip-typec.c
> index d9701b6106d5..48070b50416e 100644
> --- a/drivers/phy/rockchip/phy-rockchip-typec.c
> +++ b/drivers/phy/rockchip/phy-rockchip-typec.c
> @@ -54,6 +54,7 @@
> =20
>  #include <linux/mfd/syscon.h>
>  #include <linux/phy/phy.h>
> +#include <drm/bridge/aux-bridge.h>
> =20
>  #define CMN_SSM_BANDGAP			(0x21 << 2)
>  #define CMN_SSM_BIAS			(0x22 << 2)
> @@ -1162,16 +1163,24 @@ static int rockchip_typec_phy_probe(struct platfo=
rm_device *pdev)
> =20
>  	for_each_available_child_of_node(np, child_np) {
>  		struct phy *phy;
> +		ret =3D 0;
> =20
> -		if (of_node_name_eq(child_np, "dp-port"))
> +		if (of_node_name_eq(child_np, "dp-port")) {
>  			phy =3D devm_phy_create(dev, child_np,
>  					      &rockchip_dp_phy_ops);
> -		else if (of_node_name_eq(child_np, "usb3-port"))
> +			ret =3D drm_aux_bridge_register_from_node(dev, child_np);
> +		} else if (of_node_name_eq(child_np, "usb3-port"))
>  			phy =3D devm_phy_create(dev, child_np,
>  					      &rockchip_usb3_phy_ops);
>  		else
>  			continue;
> =20
> +		if (ret) {
> +			pm_runtime_disable(dev);
> +			of_node_put(child_np);
> +			return ret;
> +		}
> +
>  		if (IS_ERR(phy)) {
>  			dev_err(dev, "failed to create phy: %pOFn\n",
>  				child_np);
>=20





