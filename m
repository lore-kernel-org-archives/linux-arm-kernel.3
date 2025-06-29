Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA40C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Jun 2025 15:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:From:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQig8DqKUDgYQc5TUxBurAmCLuuco1HaVKaFPcbDts0=; b=DMky3KgSGnaEuc4iapCChZK5w3
	wFxKBDPMfFdEftjUHbFuOYxyJmGjjPDUh/UJtqnwMJbHhPBs0UCqqOIiBhgLxIYxshNP4UDLFnCT5
	atqQmSMtPhlhz+W8tzZWviwfOfZ6LxdbO2jOjW94tZ01O0w8Mgv+RvlB7Lz4k6R9TAKv1da9SJ8ij
	n8hrXtAk9XP5wUcy7aXs1wVX84hcaBnC7Cr5MGmzxeg/xBe6rh76F4rj1BYp/oDxRFNlasPWHdrGK
	N/S/1+J9C1ab3ndWldmUzI1B7/tPHZPrxC6sGfY0uBoN9F/N4cvmPnUtPOMkXAe0mb4Vqpz/ReNpP
	z8OrYF6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVtte-00000000PZ3-2Jpt;
	Sun, 29 Jun 2025 15:24:46 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVtrJ-00000000PUq-3sIz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Jun 2025 15:22:23 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751210519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CQig8DqKUDgYQc5TUxBurAmCLuuco1HaVKaFPcbDts0=;
	b=lwQ6TVbB9kA4v8c+9fEI1MCHKrvlSlCdL2QanaMY1bJs5vKvNM8vHwVXFQJZKZMn+Q7+J+
	VIja3RCvQjYFkgEGgGCVjMM4NNe23F70ba/iR/jZFItleEuPbDcGSGy7G1RiWR4DrLNs7Y
	CXaeF0jiHkvfKHAGfmr3mGD1STZESGdWRQVSl3g++jhZf1ugQQYvlw+Tnqg1WvgBig7ub+
	gqndaa8s/b+xxXCLRyrr80NYCl7ox8/g2Dwf79Rhb4t4UR8WRF8Ik6dQr66l8ogqD9P2Uy
	cJbLEGG/k+VoDqBz0dUaQCfxHAeOhxY60In3k7di9kfQpgLH4JV3n/E9TW9TXA==
Content-Type: multipart/signed;
 boundary=8b0b4523779c4da51aebb377aae00a4fbb05642b98251df13617b5a6d748;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sun, 29 Jun 2025 17:21:42 +0200
Message-Id: <DAZ4BALHEJ9M.10FO1U9IYP4WA@cknow.org>
Subject: Re: [PATCH] rockchip/drm: vop2: make vp registers nonvolatile
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
Cc: <hjc@rock-chips.com>, <heiko@sntech.de>, <andy.yan@rock-chips.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Piotr Zalewski" <pZ010001011111@proton.me>
References: <20250628180914.1177177-2-pZ010001011111@proton.me>
In-Reply-To: <20250628180914.1177177-2-pZ010001011111@proton.me>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_082222_114911_894DCDC4 
X-CRM114-Status: GOOD (  25.90  )
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

--8b0b4523779c4da51aebb377aae00a4fbb05642b98251df13617b5a6d748
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Piotr,

On Sat Jun 28, 2025 at 8:11 PM CEST, Piotr Zalewski wrote:
> Make video port registers nonvolatile. As DSP_CTRL register is written
> to twice due to gamma LUT enable bit which is set outside of the main
> DSP_CTRL initialization within atomic_enable (for rk356x case it is also
> necesarry to always disable gamma LUT before writing a new LUT) there is
> a chance that DSP_CTRL value read-out in gamma LUT init/update code is
> not the one which was written by the preceding DSP_CTRL initialization
> code within atomic_enable. This might result in misconfigured DSP_CTRL
> which leads to no visual output[1]. Since DSP_CTRL write takes effect
> after VSYNC[1] the issue is not always present. When tested on Pinetab2
> with kernel 6.14 it happenes only when DRM is compiled as a module[1].
> In order to confirm that it is because of timing I inserted 18ms udelay
> before vop2_crtc_atomic_try_set_gamma in atomic enable and compiled DRM
> as module - this has also fixed the issue on Pinetab2.
>
> [1] https://lore.kernel.org/linux-rockchip/562b38e5.a496.1975f09f983.Core=
mail.andyshrk@163.com/
>
> Reported-by: Diederik de Haas <didi.debian@cknow.org>
> Closes: https://lore.kernel.org/linux-rockchip/DAEVDSTMWI1E.J454VZN0R9MA@=
cknow.org/
> Suggested-by: Andy Yan <andy.yan@rock-chips.com>
> Signed-off-by: Piotr Zalewski <pZ010001011111@proton.me>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
> index d0f5fea15e21..241060cc24cb 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -2589,12 +2589,13 @@ static int vop2_win_init(struct vop2 *vop2)
>  }
> =20
>  /*
> - * The window registers are only updated when config done is written.
> - * Until that they read back the old value. As we read-modify-write
> - * these registers mark them as non-volatile. This makes sure we read
> - * the new values from the regmap register cache.
> + * The window and video port registers are only updated when config
> + * done is written. Until that they read back the old value. As we
> + * read-modify-write these registers mark them as non-volatile. This
> + * makes sure we read the new values from the regmap register cache.
>   */
>  static const struct regmap_range vop2_nonvolatile_range[] =3D {
> +	regmap_reg_range(RK3568_VP0_CTRL_BASE, RK3588_VP3_CTRL_BASE+255),
>  	regmap_reg_range(0x1000, 0x23ff),
>  };
> =20

I built a 6.16-rc3 kernel with this patch and booted into it ... and it
fixed the issue I reported \o/ Thus:

Tested-by: Diederik de Haas <didi.debian@cknow.org>

Thanks!

Cheers,
  Diederik

--8b0b4523779c4da51aebb377aae00a4fbb05642b98251df13617b5a6d748
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaGFaCQAKCRDXblvOeH7b
blnvAQDRa0zYQCz0TbHhkzDu2IbxQRVxIb6zmpUFwWz5jPwfLwD/T5yIvj+Cmn20
1n04TWUawcOG/GyocXAfoaWpF07LOA0=
=GYzV
-----END PGP SIGNATURE-----

--8b0b4523779c4da51aebb377aae00a4fbb05642b98251df13617b5a6d748--

