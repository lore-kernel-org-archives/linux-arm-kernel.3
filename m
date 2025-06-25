Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A359CC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 09:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ox2aO9Oz8YUG4xiGCpP2rMX08fRhy2wV6nIxc/v7S6s=; b=ev3WPvkNJX4y47oNS0KKpOVkwT
	P25qpNOgtOA1+SDkOzHZ3CBQm63MJdcwzXVkPAyPSLSfvyMoeuDWawCngyd5NAHpDc7dkhB8uar5h
	OTIT9lm2zirRTjOWkTkILz0SsgLIWcU+rX4LvtF+sTKzKpP9COmHmhdVZN+7n8moRFSiWFXoRCIMD
	lOtlgzoJf/hSNq1YnJe7nrA1goI3e7gWOd9eFpm7tmz/AwXebgJ4D442lyFPXGz7mNuLH6UXfvk7o
	7kMdTtBWNh+1ggeni2vhkwY4K6zZaFuQUcLFw5dLJ8FUbuPomNxjbTARkvgc3qNo3QzaeF+xrj6Qu
	g/6Q+EHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMlo-00000008Bfv-1oJK;
	Wed, 25 Jun 2025 09:50:20 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULmb-0000000819M-2Xpp;
	Wed, 25 Jun 2025 08:47:07 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 830E51F00053;
	Wed, 25 Jun 2025 08:46:59 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 2153DAC7A5F; Wed, 25 Jun 2025 08:46:56 +0000 (UTC)
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id B42DBAC7A56;
	Wed, 25 Jun 2025 08:46:54 +0000 (UTC)
Date: Wed, 25 Jun 2025 10:46:52 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Parthiban Nallathambi <parthiban@linumiz.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 10/22] pinctrl: sunxi: add missed lvds pins for a100/a133
Message-ID: <aFu3fAMa8KPwjPbX@shepard>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
 <20241227-a133-display-support-v1-10-13b52f71fb14@linumiz.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eDJzuACllP3V3fib"
Content-Disposition: inline
In-Reply-To: <20241227-a133-display-support-v1-10-13b52f71fb14@linumiz.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_014705_954039_8E383064 
X-CRM114-Status: GOOD (  18.22  )
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


--eDJzuACllP3V3fib
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi and thanks for your work!

On Fri 27 Dec 24, 16:37, Parthiban Nallathambi wrote:
> lvds, lcd, dsi all shares the same GPIO D bank and lvds0
> data 3 lines and lvds1 pins are missed, add them.

Would it also make sense to submit device-tree pin definitions here?

Thanks!

Paul

> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/drivers/pinctr=
l/sunxi/pinctrl-sun50i-a100.c
> index df90c75fb3c5..b97de80ae2f3 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> @@ -256,72 +256,84 @@ static const struct sunxi_desc_pin a100_pins[] =3D {
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D12 */
> +		  SUNXI_FUNCTION(0x3, "lvds0"),		/* D3P */
>  		  SUNXI_FUNCTION(0x4, "dsi0"),		/* DP3 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 8)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 9),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D13 */
> +		  SUNXI_FUNCTION(0x3, "lvds0"),		/* D3N */
>  		  SUNXI_FUNCTION(0x4, "dsi0"),		/* DM3 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 9)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 10),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D14 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D0P */
>  		  SUNXI_FUNCTION(0x4, "spi1"),		/* CS */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 10)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 11),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D15 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D0N */
>  		  SUNXI_FUNCTION(0x4, "spi1"),		/* CLK */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 11)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 12),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D18 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D1P */
>  		  SUNXI_FUNCTION(0x4, "spi1"),		/* MOSI */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 12)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 13),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D19 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D1N */
>  		  SUNXI_FUNCTION(0x4, "spi1"),		/* MISO */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 13)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 14),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D20 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D2P */
>  		  SUNXI_FUNCTION(0x4, "uart3"),		/* TX */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 14)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 15),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D21 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D2N */
>  		  SUNXI_FUNCTION(0x4, "uart3"),		/* RX */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 15)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 16),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D22 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* CKP */
>  		  SUNXI_FUNCTION(0x4, "uart3"),		/* RTS */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 16)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 17),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D23 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* CKN */
>  		  SUNXI_FUNCTION(0x4, "uart3"),		/* CTS */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 17)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 18),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* CLK */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D3P */
>  		  SUNXI_FUNCTION(0x4, "uart4"),		/* TX */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 18)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 19),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* DE */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D3N */
>  		  SUNXI_FUNCTION(0x4, "uart4"),		/* RX */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 19)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 20),
>=20
> --=20
> 2.39.5
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--eDJzuACllP3V3fib
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhbt3wACgkQhP3B6o/u
lQyEFg//TrQuoq7rBWw2GiGLkr841GKFMfwbOgCvkZ1O7uCpLuCvW5wITVjF4qW8
flSBcs6qcLbz66ZXQS/86ukYfNUAvm1r4vfhJ3Ptf7m3ko5sCrkCNC3jtlukzG+k
Eq4GzElnseT7TosPmjtImNkDjp3u/Vh/pxOdRnUHzi6N7+jGWLvU72LcF6LJKq4d
ftamg9783Xb1QAjNnot6b+fLooAtozg34ftrIe2SE2KXt+U7qeiXtrxNerNAd6Br
Ld34QB2oMk23sar7GQTPgvoJRCiLUNEV3hJexXf/FNHz9OviwE8irhf6BBjNz7eQ
XwnsDeqkt5p2IF/ClwfrlsviI8HRAzqX1G7WDtuPqHTsDm67QJb8LztQ4hAUqpmS
hUjh+BowsXfez8fVAqyp+onplRVK07SebprsBd026Uhb/cG5kBMtg3Z5H+ENCFXg
TDLc46jsp32Mplo6wP3CVFHz0qurThqF6L8XyzIn6VoreU5uX/FRkN8jAuWtmXup
rYNpDSE54yEL5c5P0bO1fLMtwBNKZlHEhgxHlZJCNvxgegJrtXT9hDJfYC0cnCoa
mjeOwFuo2wZziH22TX/5QxhZzUZzOVR0CeMPn+TjJhX/qgTRXwS4DO8RexsKHHm2
u2Fj8LAaR6bglReFWl4F+LKIeo2AswAzTyS6581R7n62JhNuXGk=
=9BCo
-----END PGP SIGNATURE-----

--eDJzuACllP3V3fib--

