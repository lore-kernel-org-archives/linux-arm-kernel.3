Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8748C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 19:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dgj9CZu7zXIogkyD+jX4DSWTvh9FYVRAGZAzj5lgs2g=; b=f7BBEwkA01+CB/OoAFPmvfRDrb
	qCYZyeRSdtRMhpooyAtAqhSKKm6n/NQOBNUSFFsxIndKAjP0yJ78OpWCEBhGBMnrq1s5PV3FZWGSn
	MLicVxPGIPOraw976n58qo35Lv9nUGA2yulrKJJAd2m2tigkwTVlG+wPlM98cdaIpqI1JN9KeaDZr
	RlVkvE0qnqy/CJtR/5a9NS5JjYMxH0RrA8AoBxh+y/Wk/4O/pbjB0t1+rQLQhXo1KENMnvZ1n1sWr
	HpAmOOqXMXbhra5Wv6b59AhcS7N7fod/uawRFmv1HsoVOSzXdYub/5RypQjCW00Soo7KCiOmaU9ES
	2N6WW6Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIGj-00000008cI6-3C6Q;
	Wed, 12 Feb 2025 19:19:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIFJ-00000008c4I-12pe;
	Wed, 12 Feb 2025 19:18:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0D40EA40F73;
	Wed, 12 Feb 2025 19:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE9DC4CEDF;
	Wed, 12 Feb 2025 19:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739387884;
	bh=KE8NFBZhke42TjOODGp2XRVLni+shJE2sRyusGK/pag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B5ynI4nwc6w1XNI9qPwckWeV4YuE4E65ocyJWXxfyjAmbKPlnB8qJgHRCG3LYBig1
	 6bGafsyrO2f8/XyQwSaoPiVaQ53Xic3ygFkdmOmHeH9sKpvHpowLJ2sOR62m87jPtY
	 mKavz+BbG7/j0p3ItzfZXC96KbYPTGRyvjfMmCafzxtYRN/H5dm+v09dn7FwKX4M8f
	 MpYAb24OGkh8+kOl/YNvzBBmVw1bg6U2zQq6loB9xTpiuuy4PERbVpIhOLlpntqTMm
	 IC7qm+ycr3pr/rQBStyhe7F7Gbv120TcdHY8uEln7YyhARZv2wz1KeGBH4vJKCbjPP
	 g8pB07jSEpYCQ==
Date: Wed, 12 Feb 2025 19:17:58 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	geert+renesas@glider.be, u.kleine-koenig@baylibre.com,
	amergnat@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	kernel@collabora.com, macpaul.lin@mediatek.com,
	pablo.sun@mediatek.com
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: mediatek,mt8188: Add
 VDO1_DPI1_HDMI clock
Message-ID: <20250212-arming-gyration-103e42b94ed6@spud>
References: <20250212100342.33618-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LekUKq0CadfRs7yd"
Content-Disposition: inline
In-Reply-To: <20250212100342.33618-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_111805_353064_FD23283A 
X-CRM114-Status: GOOD (  14.69  )
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


--LekUKq0CadfRs7yd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 11:03:41AM +0100, AngeloGioacchino Del Regno wrote:
> Add binding for the HDMI TX clock found in the VDO1 controller.
> While at it, also remove the unused CLK_VDO1_NR_CLK.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  include/dt-bindings/clock/mediatek,mt8188-clk.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/dt-bindings/clock/mediatek,mt8188-clk.h b/include/dt=
-bindings/clock/mediatek,mt8188-clk.h
> index bd5cd100b796..0e87f61c90f4 100644
> --- a/include/dt-bindings/clock/mediatek,mt8188-clk.h
> +++ b/include/dt-bindings/clock/mediatek,mt8188-clk.h
> @@ -721,6 +721,6 @@
>  #define CLK_VDO1_DPINTF				58
>  #define CLK_VDO1_DISP_MONITOR_DPINTF		59
>  #define CLK_VDO1_26M_SLOW			60
> -#define CLK_VDO1_NR_CLK				61
> +#define CLK_VDO1_DPI1_HDMI			61

Acked-by: Conor Dooley <conor.dooley@microchip.com>

btw, I see the mt8195 has this same CLK_VDO1_NR_CLK define in it, if you
fancy getting rid of that too.

--LekUKq0CadfRs7yd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6zz5gAKCRB4tDGHoIJi
0lA+AP9ZvwrE6cb7EIWC6+imuEZ4+HNaO4ihg1Gx2VOD2gTcogD9EUucq+I84ADz
YOvqTsY6j0BbiLvG+Hw8gfslDBKozAI=
=Pmfl
-----END PGP SIGNATURE-----

--LekUKq0CadfRs7yd--

