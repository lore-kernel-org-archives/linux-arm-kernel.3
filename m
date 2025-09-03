Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BD8CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 14:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOenNhon7WaisY3VTWVx6XvzUrCIft1GDsFy/zuDvrw=; b=1OymIK2I38J3dl7inVLjIEGJKK
	58l18k17URO5gcx2ZG++9lad/q+Q66xSdUiyDVDhV+T49XvCwVO6CFCj+wfNV1wClZTpbXBKccdKD
	9/s5clmYZpH/zi2/uCvJIZcTrC8AikwiSSumh+8Ar1fExdLvL79hJQvE7+thaIezPLv+uBuMBSxeK
	VI5OEfZtsg7I31asXpFCO7Oo5P8QkfgfCN2U3dB6R/JweQ5H7d10jvLnG/HVPXzFR+OECDnKDkkrI
	8eVZ/ZQ4H/V9Z33OwjIq6oswNDIOnVVy3dN1gmpI+6XTSXdma6zH4TTlp1epH4NNe7tcLgYzzkwCN
	A1uXy4PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utomI-00000006lAv-2Nt4;
	Wed, 03 Sep 2025 14:48:02 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmHN-00000006L18-0ybU;
	Wed, 03 Sep 2025 12:07:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ZOenNhon7WaisY3VTWVx6XvzUrCIft1GDsFy/zuDvrw=; b=iUJ9ElgQf60LxlCjHOOQ1c/Fd7
	BYiUf3C0Qz/+VRgXBlKyU2e9nV844hAstYooKL2/Ld44LHRv7wUCqAbEFRxleYnsUwXWdpjZ0MoGe
	55qrbCHIjwf7FI/WBm98PFYOW7NFhpbdHbZvQnMu/cxIbKUMDsPtmanc1GPLl3O8A9JU0gjrCtjSi
	BM18wN5K4mjCJXjG/le0ylwp3EqWJiWTBcjIQw8/HReyuAyqlHPYUO3EnImQ1++WYpvJwlP0uo84y
	RmBjcI6PoJHz4qwEVUMK3cgvGg3h6mc4L29EB6bi7uvoa5a2wqU6Wpqj7cduk/8xpdNoglutCCThY
	6/M5rA8Q==;
Received: from [213.70.40.217] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1utmHI-0001wC-4F; Wed, 03 Sep 2025 14:07:52 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: robh@kernel.org, WeiHao Li <cn.liweihao@gmail.com>
Cc: hjc@rock-chips.com, andy.yan@rock-chips.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-clk@vger.kernel.org, WeiHao Li <cn.liweihao@gmail.com>
Subject: Re: [PATCH v1 1/7] drm/rockchip: dsi: Add support for RK3368
Date: Wed, 03 Sep 2025 14:07:50 +0200
Message-ID: <42028191.XM6RcZxFsP@phil>
In-Reply-To: <20250831104855.45883-2-cn.liweihao@gmail.com>
References: <20250831104855.45883-1-cn.liweihao@gmail.com>
 <20250831104855.45883-2-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_050757_269224_5F21F705 
X-CRM114-Status: GOOD (  18.55  )
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

Am Sonntag, 31. August 2025, 12:48:49 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb WeiHao Li:
> RK3368 has DesignWare MIPI DSI controller and an external inno D-PHY.
>=20
> Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>

as a general remark, this patch will likely need to wait for 6.18-rc1,
because a big update of the HIWORD_MASK macros was merged [0].

So introducing a new user now would cause havok :-) .

Also when sending a v2, please base it on top of that changeset, or
just take linux-next [1] as a base.

Also in a separate patch, please add the needed rk3368 entry to the
devicetree binding [2], this will pacify the bot that checked your
devicetree changes :-) .

Please also make sure that relevant additions to the lists below
are made (the binding contains specific settings for some controllers
furter below) .


Heiko


[0] https://lore.kernel.org/linux-rockchip/20250825-byeword-update-v3-0-947=
b841cdb29@collabora.com/
[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.ya=
ml

> ---
>  .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gp=
u/drm/rockchip/dw-mipi-dsi-rockchip.c
> index 3398160ad..5d76e3e04 100644
> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> @@ -162,6 +162,11 @@
>  #define RK3288_DSI0_LCDC_SEL		BIT(6)
>  #define RK3288_DSI1_LCDC_SEL		BIT(9)
> =20
> +#define RK3368_GRF_SOC_CON7		0x41c
> +#define RK3368_DSI_FORCETXSTOPMODE	(0xf << 7)
> +#define RK3368_DSI_FORCERXMODE		BIT(6)
> +#define RK3368_DSI_TURNDISABLE		BIT(5)
> +
>  #define RK3399_GRF_SOC_CON20		0x6250
>  #define RK3399_DSI0_LCDC_SEL		BIT(0)
>  #define RK3399_DSI1_LCDC_SEL		BIT(4)
> @@ -1530,6 +1535,18 @@ static const struct rockchip_dw_dsi_chip_data rk32=
88_chip_data[] =3D {
>  	{ /* sentinel */ }
>  };
> =20
> +static const struct rockchip_dw_dsi_chip_data rk3368_chip_data[] =3D {
> +	{
> +		.reg =3D 0xff960000,
> +		.lanecfg1_grf_reg =3D RK3368_GRF_SOC_CON7,
> +		.lanecfg1 =3D HIWORD_UPDATE(0, RK3368_DSI_TURNDISABLE |
> +						RK3368_DSI_FORCETXSTOPMODE |
> +						RK3368_DSI_FORCERXMODE),
> +		.max_data_lanes =3D 4,
> +	},
> +	{ /* sentinel */ }
> +};
> +
>  static int rk3399_dphy_tx1rx1_init(struct phy *phy)
>  {
>  	struct dw_mipi_dsi_rockchip *dsi =3D phy_get_drvdata(phy);
> @@ -1693,6 +1710,9 @@ static const struct of_device_id dw_mipi_dsi_rockch=
ip_dt_ids[] =3D {
>  	}, {
>  	 .compatible =3D "rockchip,rk3288-mipi-dsi",
>  	 .data =3D &rk3288_chip_data,
> +	}, {
> +	 .compatible =3D "rockchip,rk3368-mipi-dsi",
> +	 .data =3D &rk3368_chip_data,
>  	}, {
>  	 .compatible =3D "rockchip,rk3399-mipi-dsi",
>  	 .data =3D &rk3399_chip_data,
>=20





