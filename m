Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E77CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 18:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4fIk62b9tX8cuFnX3IXU8b8kQDW97QC3a5jEYNR86AA=; b=YixkAapmQ3ns237bs6UvnBdUyP
	Qn+hRZ//zEgC3QyCyZuO0tqwQ2tmffru9rZK/FGA1whh9dxHixdkPdq8g+fNgCKeaXI6i7Z8fwgVp
	/+r63kEXiDRYgvk777rtntdjqmPOCEV72/swKS4MAy3JsDgjeHFeVaD6BnhEWWau8iL32R8aE+JDo
	qfy/uGiJtW733vOtDDAlOI4tvvDbr1tsxuOcSupe7+uBMWmEMF1SwsEVv+vRqDDHs3Eyf+cD4am9r
	scfWalvihGpUclDnPwDacNnXc0f/gFRTQ/qhpEqb2oGWfPAMV9ezZt1IP1i89tfrT+EXG/24YxFX/
	04NmcFXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uonIg-0000000EeUv-3YGr;
	Wed, 20 Aug 2025 18:12:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokIZ-0000000EAog-0oPk
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 Aug 2025 15:00:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4fIk62b9tX8cuFnX3IXU8b8kQDW97QC3a5jEYNR86AA=; b=ePVgcxw0dV9DvDD1oxvyPv2AiH
	/r6YmLih21J4SU0y96dH4xJT+tFeFmG1nEYnLpUHDHFClGGFEq+hPsVx30Af6JMd6JbsSZEZVwCDO
	gZZRseUDHHXZsQ8/ZLSwPhyEG9KGjc5ss/P9lcxzrVkN/PINXqhcgwaytwS8zdY8MNBLkRHGny1qi
	1YF6PCbHbnCXBVCN4nY2Yrb6yivJ3eBV/C0cPGp3u4Vfb/JVQBMRAVj7a6V+2+yMEjqe9li3Mdr8K
	qm7K2OGSUJKZg7wfEY7O3JuCSXNgM6+uS6gmtTAdVtIa41awmviyxFzjEnYrkrG37pqmUsFEwmoOr
	6CZZailA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokIW-00000000LqW-14Ay
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 15:00:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A8B175C65EC;
	Wed, 20 Aug 2025 15:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27167C116B1;
	Wed, 20 Aug 2025 15:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755702015;
	bh=HQ5b81Apoab6czGcXH0vKrkZjdSXVB5vGQChQZigfGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WZJH9/EH88gSyhql/auK4PWa7AtEO2Igy0GRER4LLH7ThQiHl0XH6BnCy5/NN3PMT
	 RFjDzlxjxBrucO8iCpfXpZD76n+Jm+rOfMI+VGnnDiT6/srjtvkUYGOax/5UWOxpbK
	 64tLdCgCpiXUAhq8NfP1OK6R24kUspG7B7i6j1GQRJ8kZoYvs0yKtNtcAG7pTsJy3Z
	 oXGXc9x484fXChvSvNbcBYhewPk+SLQnaSdOFV1agHVRLoBNL3ao0Wjj/0LmdTQe95
	 pIJiD4uEDJiHNf7o6jJB1oMItVzWHJZkZbFFK+W0g97QucjyTUS+eTaY2fWfejq6Wg
	 MAXxr90IR5uPg==
Date: Wed, 20 Aug 2025 17:00:13 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: Chen-Yu Tsai <wens@csie.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	"open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/sun4i: Replace redundant return value judgment with
 PTR_ERR_OR_ZERO()
Message-ID: <20250820-skilled-dragonfly-of-symmetry-b4f4dc@houat>
References: <20250815133727.418204-1-liaoyuanhong@vivo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="su26l5zhm5tjwxui"
Content-Disposition: inline
In-Reply-To: <20250815133727.418204-1-liaoyuanhong@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_160020_518697_62825235 
X-CRM114-Status: GOOD (  16.41  )
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


--su26l5zhm5tjwxui
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/sun4i: Replace redundant return value judgment with
 PTR_ERR_OR_ZERO()
MIME-Version: 1.0

Hi,

On Fri, Aug 15, 2025 at 09:37:27PM +0800, Liao Yuanhong wrote:
> Replace redundant return value judgment with PTR_ERR_OR_ZERO() to
> enhance code readability.
>=20
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>  drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c | 5 +----
>  drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c     | 5 +----
>  drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c  | 5 +----
>  3 files changed, 3 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c b/drivers/gpu/dr=
m/sun4i/sun4i_hdmi_tmds_clk.c
> index fbf7da9d9592..c90dd0ad040f 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
> @@ -229,8 +229,5 @@ int sun4i_tmds_create(struct sun4i_hdmi *hdmi)
>  	tmds->div_offset =3D hdmi->variant->tmds_clk_div_offset;
> =20
>  	hdmi->tmds_clk =3D devm_clk_register(hdmi->dev, &tmds->hw);
> -	if (IS_ERR(hdmi->tmds_clk))
> -		return PTR_ERR(hdmi->tmds_clk);
> -
> -	return 0;
> +	return PTR_ERR_OR_ZERO(hdmi->tmds_clk);

The readibility improvement is very subjective, and this makes it harder
to extend later on, so I don't think this should be merged.

Maxime

--su26l5zhm5tjwxui
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaKXi/AAKCRAnX84Zoj2+
dm+UAX9RCkx9gaut6YQRzmpPslaiJ2m2jmUpynn6QC21/IDDMsYsSM6cisPFTO21
AMJZZp4BgJ+CB1UtTTi+hgvHJSfJvEL0psMKwkK1KB/+wu91d4SMqbEVnzCyIbxY
+wBkUAEZIQ==
=93ng
-----END PGP SIGNATURE-----

--su26l5zhm5tjwxui--

