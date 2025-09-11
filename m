Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3D3CAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 08:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJUXPxCcIdLyjtfU8oLHAw5Mz9mWtXhRUXrgxmlyQhc=; b=KOoULKVcxkRX4TwptEMKtRqaNg
	+8sOOspv/K7KYGjDj1zy/Ct+U7NsTveQr1QfouNPscl55ZXRCqjwRaOCLCyrsky1686P/yVyJiAb6
	7k99Lj2NW+IbcHWSDUXjtImCvvbp1gBxMOE3iptupaVJrHJRnWVKumxbOjxBCeHC8bdDjv23SHylF
	vbtexDdsLZGTiyW+OrURUX5yVRP7pzxgsTZNnqcU/nnN3FcDTaS1BzR+3LmcDMLFZoeYo+TqpmHsD
	ypc4qSwfNdNwc1E9+mjz4nLrm3FkLiklBbk3mImrrxbwl/RSETUTKfRv9yXczTV+xJDFBW0KQmZYD
	6sunB6UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwd5R-00000001wbG-0I6m;
	Thu, 11 Sep 2025 08:55:25 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwd5O-00000001wZa-3AxX;
	Thu, 11 Sep 2025 08:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=XJUXPxCcIdLyjtfU8oLHAw5Mz9mWtXhRUXrgxmlyQhc=; b=0xaqUZmpSGMQIauSG4v6OVj8wQ
	nJBIJCrzyCZnP+OiqdAhDNBV2UZaxsXE1tmicZyPcqv+ZIsLDMz1abLeXGBzuJphRChOLxz0kYAnT
	19z9Fp4PcdDQg0UcdQhT7pGyfHvYZFYrUfv6t0UxmJSZoTpT1Rwmk+cnoSnvFxnDW59RTiIjyeBge
	2ANVCgC9Z190tSoopNSXKZ3kdWBiDw6ITGvr8vUbH+Np0VZAz2YXd6bSR9bUnnnwhAEA8kiEFzlES
	204E4h4Zj/ENbZyWSZrPLWxXNSyu4aXaMXWaUCqglQoGZGviuz8If38m2Qm8kshvJTR4Yj6bUo8GZ
	jgytAELg==;
Received: from i53875b0e.versanet.de ([83.135.91.14] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uwd5K-0008SP-Jd; Thu, 11 Sep 2025 10:55:18 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yao Zi <ziyao@disroot.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH 1/1] phy: rockchip: naneng-combphy: use existing DT property check
 for rk3528
Date: Thu, 11 Sep 2025 10:55:17 +0200
Message-ID: <2049032.8hb0ThOEGa@diego>
In-Reply-To: <20250910122000.951100-1-amadeus@jmu.edu.cn>
References: <20250910122000.951100-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_015522_802398_BEAD4AA8 
X-CRM114-Status: GOOD (  16.81  )
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

Am Mittwoch, 10. September 2025, 14:20:00 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Chukun Pan:
> The naneng-combphy driver already has DT property checks for
> "rockchip,enable-ssc" and "rockchip,ext-refclk", use it for
> the rk3528_combphy_cfg. Also aligned the indentation of the
> rk3528_combphy_grfcfgs parameters (using tabs).
>=20
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers=
/phy/rockchip/phy-rockchip-naneng-combphy.c
> index a3ef19807b9e..ad6c8a11951b 100644
> --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> @@ -518,7 +518,7 @@ static int rk3528_combphy_cfg(struct rockchip_combphy=
_priv *priv)
>  		return -EINVAL;
>  	}
> =20
> -	if (device_property_read_bool(priv->dev, "rockchip,ext-refclk")) {
> +	if (priv->ext_refclk) {
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_ext, true);
> =20
>  		if (priv->type =3D=3D PHY_TYPE_PCIE && rate =3D=3D REF_CLOCK_100MHz) {
> @@ -543,11 +543,9 @@ static int rk3528_combphy_cfg(struct rockchip_combph=
y_priv *priv)
>  		}
>  	}
> =20
> -	if (priv->type =3D=3D PHY_TYPE_PCIE) {
> -		if (device_property_read_bool(priv->dev, "rockchip,enable-ssc"))
> -			rockchip_combphy_updatel(priv, RK3528_PHYREG40_SSC_EN,
> -						 RK3528_PHYREG40_SSC_EN, RK3528_PHYREG40);
> -	}
> +	if (priv->type =3D=3D PHY_TYPE_PCIE && priv->enable_ssc)
> +		rockchip_combphy_updatel(priv, RK3528_PHYREG40_SSC_EN,
> +					 RK3528_PHYREG40_SSC_EN, RK3528_PHYREG40);
> =20
>  	return 0;
>  }
> @@ -571,7 +569,7 @@ static const struct rockchip_combphy_grfcfg rk3528_co=
mbphy_grfcfgs =3D {
>  	.con2_for_pcie		=3D { 0x0008, 15, 0, 0x00, 0x101 },
>  	.con3_for_pcie		=3D { 0x000c, 15, 0, 0x00, 0x0200 },
>  	/* pipe-grf */
> -	.u3otg0_port_en         =3D { 0x0044, 15, 0, 0x0181, 0x1100 },
> +	.u3otg0_port_en		=3D { 0x0044, 15, 0, 0x0181, 0x1100 },
>  };
> =20
>  static const struct rockchip_combphy_cfg rk3528_combphy_cfgs =3D {
>=20





