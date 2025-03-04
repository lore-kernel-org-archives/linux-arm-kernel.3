Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F228C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 08:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+EpRNkJnxsFm4mCw5h+bvHMFD8+udBSpaIShFXnxngM=; b=3awUOjtpzJYfNQCiII51SpOmW2
	9F/sOTJQJYkRWQPwdTBtANkYyzOYskcS1B2itUycZ5GgrIDc3jxXZk8iDsj/2JUjCH3Q8Pq1e4vn9
	kFDzfWm8Ur8JGK3eU2yw+eFP+UWD0mrpg1HHRnog36K4LIAfAaP4gKihbVgcVJZwTPEpOsKKwCwzJ
	+0Ifj9f/tYXxLFPXL94ahVjsdggdR3AVNe5eDAv0/+8m32TpkuqaUvWtWdQC0wS51YPd6xW6SD/0z
	mGM/x5+D0nHjMa6tcGHfsMzdcpOYvD3xXYtQ2X70w4vgzO9sjx9DK9l1meHrFOjaRL+xjyGHoATRo
	jV90BtqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNVr-00000003bXB-2Sqq;
	Tue, 04 Mar 2025 08:20:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNTv-00000003b9p-1Ymz;
	Tue, 04 Mar 2025 08:18:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D3F8B5C575E;
	Tue,  4 Mar 2025 08:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01DF5C4CEE5;
	Tue,  4 Mar 2025 08:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741076306;
	bh=K+EQRdXLdswE5q4qdxOmVemAWUmg9DNaKbmghLm+Syw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rB9WrLFkQHDOWK9Ngi9JWbm/75eJ4vcchC1p5i4LSobT3xc0fwVkyJSs8aMzsmB87
	 a6ht+z5nFiSmLZbTEVphEZAIYgY1w0QZp+Qc0UR/4FYRDgVoo3C/8by3nlA6hJrDse
	 bCb3HjTpv5UvfoRVf7FjaqCFrqOfH/5TcA2WOee1u3iquYQRFuaZ8dAPRBim1NG90x
	 V1OuOHwHmFgq1NDJcnC6jFALtFH+EiqnOJVqRo1H7YB6uTFxGmGZTNTqjupOgRtxzj
	 SQVh3VTuajtEE4VOo4hgf1+pABdhaSmalOztKYwuyJ4Nlq2CBjoj6UZ51civohdh12
	 jBFC4tbyor9Fw==
Date: Tue, 4 Mar 2025 09:18:23 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 08/12] phy: rockchip: samsung-hdptx: Provide config
 params validation support
Message-ID: <20250304-romantic-truthful-sambar-deaab1@houat>
References: <20250304-phy-sam-hdptx-bpc-v4-0-8657847c13f7@collabora.com>
 <20250304-phy-sam-hdptx-bpc-v4-8-8657847c13f7@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="rn7v6jqgd3bpl5dn"
Content-Disposition: inline
In-Reply-To: <20250304-phy-sam-hdptx-bpc-v4-8-8657847c13f7@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_001827_457711_03BCCFD6 
X-CRM114-Status: GOOD (  15.61  )
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


--rn7v6jqgd3bpl5dn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 08/12] phy: rockchip: samsung-hdptx: Provide config
 params validation support
MIME-Version: 1.0

On Tue, Mar 04, 2025 at 03:44:07AM +0200, Cristian Ciocaltea wrote:
> Implement the phy_ops.validate() callback to allow checking the PHY
> configuration parameters without actually applying them.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 23 +++++++++++++++++=
++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/=
phy/rockchip/phy-rockchip-samsung-hdptx.c
> index 7e1d1c10758249aa5bbddbdaae0108bba04f30df..47db1395051f5d90019787169=
4bab90ca4d6e38e 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> @@ -1482,6 +1482,17 @@ static int rk_hdptx_phy_verify_hdmi_config(struct =
rk_hdptx_phy *hdptx,
>  	if (!hdmi->tmds_char_rate || hdmi->tmds_char_rate > HDMI20_MAX_RATE)
>  		return -EINVAL;
> =20
> +	u32 bit_rate =3D hdmi->tmds_char_rate / 100;
> +	int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(ropll_tmds_cfg); i++)
> +		if (bit_rate =3D=3D ropll_tmds_cfg[i].bit_rate)
> +			break;
> +
> +	if (i =3D=3D ARRAY_SIZE(ropll_tmds_cfg) &&
> +	    !rk_hdptx_phy_clk_pll_calc(bit_rate, NULL))
> +		return -EINVAL;

What are you calling bit_rate here? If anything, I'd expect the bit_rate
to be a multiple of the char rate, not a divisor.

Maxime

--rn7v6jqgd3bpl5dn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ8a3TwAKCRAnX84Zoj2+
dvpGAX9bDdjDCQlX5ExGLNaf6qkQldDC7lWTbvEti8PUmg+VDUvIdSrkZpoAQS2+
3dO/nzUBgNk0Ta+qCJav/lhbrS3jWgRSx4xNWdbC5Z0LX4HAFh3UxYHwRpM7ZzOI
Pe8MOnuW4w==
=6k8M
-----END PGP SIGNATURE-----

--rn7v6jqgd3bpl5dn--

