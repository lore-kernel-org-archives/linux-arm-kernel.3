Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F74DC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 09:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbXgzBPP3AOM0okOBh5EVcfxYwZ2EKnB5rcudXGXFuw=; b=LNG2j3+bK8i4VWu6KdqhZBer1m
	wj+ijm74r60e3rEW1rQtXWb6+/jt+32JKkX2Vbb3Yi6RoUcfAwLLowvacWTvMaPfW64/0peZGRnsH
	tmnS2hVGktXBJf5OFDT9megCmiahfveH18n1AQHCvdk5+n2FPoLIkJWIDCzepSWp/VD+iCzIA1lTs
	MBauKAJsi8jaDIHuZtlIEHKs/Vqr+mz1BNumxF7aEHZDmx9uuvrI6lo/y8Et75vVh2SkrNRjK7qpA
	Y+ldPDxK2Au/52v8694CgA4biw7PnF7E8KgjsHgZ10dPlyaMyGUAro0tVH2ZRPgXMRKggsZ5zckY1
	kSU27rIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOaq-00000003tGS-0POO;
	Tue, 04 Mar 2025 09:29:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNQy-00000003aSE-2je4;
	Tue, 04 Mar 2025 08:15:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 431935C5417;
	Tue,  4 Mar 2025 08:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69211C4CEE5;
	Tue,  4 Mar 2025 08:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741076123;
	bh=ROr73SuXPD7t0E018Wl3IA3cdu0dJBkX02y9QuFH4LY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XeL+6AeYsJEJT5Q4dBoeCG4RWDoZPd2OkGpIABG6LjSXAhf3dz3nAU71u50aQ7Yvl
	 +w/lHl5yrfoLuAwkUTim7UX4n9RKtyDdc3UC+NxCHFUP38UJEova69tZuKX5riffi2
	 a0R+h+xNA5rD3cnzzymwFv+fZVBzCNWxl7WLrCx0kwSSWETPJ70kH0cUcP0zznuOEe
	 dIpE97J48JFwhXq9wG1JuC2oXL2aNxQ++hUiDglWi7QpaYx4gI01ZE5fT/F5EFNUWN
	 USCRmtp7XpMPwr/0GE+ybLbcTjOttl03bdzUUrTB9k5zvusa8ysMyY8CI4wMQBHK/h
	 n9z0SNrR+3Sag==
Date: Tue, 4 Mar 2025 09:15:21 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 07/12] phy: rockchip: samsung-hdptx: Setup TMDS char
 rate via phy_configure_opts_hdmi
Message-ID: <20250304-turtle-of-serious-aurora-2b0bae@houat>
References: <20250304-phy-sam-hdptx-bpc-v4-0-8657847c13f7@collabora.com>
 <20250304-phy-sam-hdptx-bpc-v4-7-8657847c13f7@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="533yzwzphi6h55mu"
Content-Disposition: inline
In-Reply-To: <20250304-phy-sam-hdptx-bpc-v4-7-8657847c13f7@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_001524_789066_13B7B567 
X-CRM114-Status: GOOD (  23.24  )
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


--533yzwzphi6h55mu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 07/12] phy: rockchip: samsung-hdptx: Setup TMDS char
 rate via phy_configure_opts_hdmi
MIME-Version: 1.0

On Tue, Mar 04, 2025 at 03:44:06AM +0200, Cristian Ciocaltea wrote:
> The current workaround to setup the TMDS character rate relies on the
> unconventional usage of phy_set_bus_width().
>=20
> Make use of the recently introduced HDMI PHY configuration API to
> properly handle the setup.  The workaround will be dropped as soon as
> the switch has been completed on both ends.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 54 ++++++++++++++++-=
------
>  1 file changed, 38 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/=
phy/rockchip/phy-rockchip-samsung-hdptx.c
> index 2bf525514c1991a1299265d12e1e85f66333c604..7e1d1c10758249aa5bbddbdaa=
e0108bba04f30df 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> @@ -394,6 +394,7 @@ struct rk_hdptx_phy {
> =20
>  	int phy_id;
>  	struct phy *phy;
> +	struct phy_configure_opts_hdmi hdmi_cfg;
>  	struct clk_bulk_data *clks;
>  	int nr_clks;
>  	struct reset_control_bulk_data rsts[RST_MAX];
> @@ -1409,19 +1410,25 @@ static int rk_hdptx_dp_aux_init(struct rk_hdptx_p=
hy *hdptx)
>  static int rk_hdptx_phy_power_on(struct phy *phy)
>  {
>  	struct rk_hdptx_phy *hdptx =3D phy_get_drvdata(phy);
> -	int bus_width =3D phy_get_bus_width(hdptx->phy);
>  	enum phy_mode mode =3D phy_get_mode(phy);
> +	unsigned int rate =3D 0;
>  	int ret, lane;
> =20
> -	/*
> -	 * FIXME: Temporary workaround to pass pixel_clk_rate
> -	 * from the HDMI bridge driver until phy_configure_opts_hdmi
> -	 * becomes available in the PHY API.
> -	 */
> -	unsigned int rate =3D bus_width & 0xfffffff;
> -
> -	dev_dbg(hdptx->dev, "%s bus_width=3D%x rate=3D%u\n",
> -		__func__, bus_width, rate);
> +	if (mode !=3D PHY_MODE_DP) {
> +		if (!hdptx->hdmi_cfg.tmds_char_rate) {
> +			/*
> +			 * FIXME: Temporary workaround to setup TMDS char rate
> +			 * from the RK DW HDMI QP bridge driver.
> +			 * Will be removed as soon the switch to the HDMI PHY
> +			 * configuration API has been completed on both ends.
> +			 */
> +			rate =3D phy_get_bus_width(hdptx->phy) & 0xfffffff;
> +			hdptx->hdmi_cfg.tmds_char_rate =3D rate * 100;
> +		} else {
> +			rate =3D hdptx->hdmi_cfg.tmds_char_rate / 100;
> +		}
> +		dev_dbg(hdptx->dev, "%s rate=3D%u\n", __func__, rate);
> +	}

Some story here, I can't make sense of a variable in hHz. If it's
actually needed and not a bug, this should be very explictly documented.

Maxime

--533yzwzphi6h55mu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ8a2mAAKCRAnX84Zoj2+
ds5qAYDpYVQTakrNhdGZ31K2GrtIRiMUrxHtJV1CVxnsJ3BRW0eXDADFpRFQQZm0
Zaz4nXQBfiEBJBCeYXsv8v88Z/vOFFs1XoYBQs/YzCyGz3n+L9hjusKYEPel9EMs
agEDj+TQcA==
=TaF+
-----END PGP SIGNATURE-----

--533yzwzphi6h55mu--

