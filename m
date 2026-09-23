Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB78C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 12:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LiwqucL+kKkfewVxHL3Ys40QpkTVafZgydC3I7lW70o=; b=tSj8Q4hRTAQd2xqG4CuPLxM8l6
	TmBTzDiQ86+DKNx7nNNepWvLttLqDDenMrUxZB9IePJdqLBEmlfH5aFufGG7HfDUZbCi1LKjoij9U
	kbZz9/rSZznVFpGCUVE45MhPf6uhV0TOw66zEEqUz0kX/Ci7YDT1tbRxIEm2wXOMUCzbw9CP97PqM
	8Xxk31QczG8BoOExpJnUuAiC2V7DtN9bJdaR6k2BA2qaJyyhQzcOMGHFsoWnN/KC18tNqSc5zTeyX
	zpyBN5UKV6YMi8SIC6AYsRIsVpdNMZ5WnqrTUz40MqkHZ/qW2QB8TmUPy6J2JWrwHqM+dgCJ/vaZo
	0i0oigyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9M27-00000008F5A-2eVT;
	Wed, 23 Sep 2026 12:25:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9M26-00000008F4j-1IIg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 12:25:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BE1CF4325A;
	Wed, 23 Sep 2026 12:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C961F000FF;
	Wed, 23 Sep 2026 12:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790166305;
	bh=LiwqucL+kKkfewVxHL3Ys40QpkTVafZgydC3I7lW70o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TRJ9qmxcGPvpSsc0buv/SlcBc0cW/NbwRsNyGaaFLyJRSH9R+9kJymp8L3Xoxn4MP
	 mp5wXCkBEEUxvmsH/fUetvB/RB7dEkhorbiDpn7+yIXCCm+WGdzfnGnOtIjR2LThi8
	 l8Oq1YkcAdizIcyJ1ivsqmpU/2hI0dJNnMhf7Nf/CPM08gl7Ed8j94kdFaKVhhI2U2
	 JDY9BWYwWm2LIp6gGlbTRHis3YjNmeHAnXoBtB0Zbp8rrjBLO5tNnA7rPJf8htkovD
	 eNvDfEFTPjPOrw6xjGytWxeQO+OuZnvC5cZac/tbIIS508M8NMsYZvAk9mNLvfNLRZ
	 hhXmQscJUVNmQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id D949B1AC5739; Wed, 23 Sep 2026 13:25:00 +0100 (BST)
Date: Wed, 23 Sep 2026 14:25:00 +0200
From: Mark Brown <broonie@kernel.org>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com
Subject: Re: [PATCH 2/2] spi: ma35d1: Add Nuvoton MA35D1 SPI controller
 support
Message-ID: <arPFHNrYR_kWl8vs@sirena.co.uk>
References: <20260923041926.425551-1-cwweng.linux@gmail.com>
 <20260923041926.425551-3-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZB52rXGD0UANJKv6"
Content-Disposition: inline
In-Reply-To: <20260923041926.425551-3-cwweng.linux@gmail.com>
X-Cookie: Too clever is dumb.
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


--ZB52rXGD0UANJKv6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 12:19:26PM +0800, Chi-Wen Weng wrote:
> From: Chi-Wen Weng <cwweng@nuvoton.com>
>=20
> Add support for the SPI controller found in the Nuvoton MA35D1 SoC.

This looks pretty good, almost all of the comments below are just
stylistic things due to duplicating work that the core already does but
there's one query about possibly excessively turning the controller on
and off.

> +struct nuvoton_spi {
> +	void __iomem *regs;
> +	struct clk *clk;
> +	struct device *dev;
> +
> +	/* Protects read-modify-write accesses to the SSCTL register. */
> +	spinlock_t ssctl_lock;

It's not clear what this is protecting, all the users look to be called
=66rom the SPI core in a single threaded way.

> +static int nuvoton_spi_set_speed(struct nuvoton_spi *nspi,
> +				 struct spi_transfer *xfer, u32 speed_hz)
> +{
> +	unsigned long clk_rate;
> +	unsigned int divisor;
> +	u32 clkdiv;
> +	int ret;
> +
> +	clk_rate =3D clk_get_rate(nspi->clk);
> +	if (!clk_rate) {
> +		dev_err(nspi->dev, "failed to get clock rate\n");
> +		return -EINVAL;
> +	}

You probably don't need to do this on every transfer, the driver doesn't
change the rate and it's not the cheapest call.

> +static int nuvoton_spi_configure_transfer(struct nuvoton_spi *nspi,
> +					  struct spi_device *spi,
> +					  struct spi_transfer *xfer,
> +					  u8 bpw)
> +{
> +	u32 speed_hz =3D xfer->speed_hz ?: spi->max_speed_hz;

The core will ensure the transfer has a speed set.

> +static int nuvoton_spi_txrx(struct nuvoton_spi *nspi,
> +			    struct spi_transfer *xfer, u8 bpw)
> +{
> +	unsigned int bytes_per_word;
> +	unsigned int offset;
> +	u32 val;
> +	int ret;
> +
> +	bytes_per_word =3D spi_bpw_to_bytes(bpw);
> +	if (!bytes_per_word)
> +		return -EINVAL;
> +
> +	if (xfer->len % bytes_per_word)
> +		return -EINVAL;

The core ensures these too.

> +static int nuvoton_spi_transfer_one(struct spi_controller *ctlr,
> +				    struct spi_device *spi,
> +				    struct spi_transfer *xfer)
> +{
> +	struct nuvoton_spi *nspi =3D spi_controller_get_devdata(ctlr);
> +	u8 bpw =3D xfer->bits_per_word ?: spi->bits_per_word;
> +	int disable_ret;
> +	int ret;
> +
> +	if (!xfer->len)
> +		return 0;
> +
> +	if (!bpw)
> +		bpw =3D NUVOTON_SPI_DEFAULT_BPW;
> +
> +	if (bpw < 8 || bpw > 32)
> +		return -EINVAL;

Again the core is checking this stuff.

> +	ret =3D nuvoton_spi_enable(nspi);
> +	if (ret) {
> +		dev_err(nspi->dev, "failed to enable controller\n");
> +		goto out_disable;
> +	}

Do you need to enable and disable on every transfer, or could this be
done once per message?  If you need to disable to reconfigure it's a bit
more complicated, but otherwise it's overhead to bounce the controller
on and off.  Potentially it might glitch the data lines.

> +static int nuvoton_spi_probe(struct platform_device *pdev)
> +{

> +	ctlr->dev.of_node =3D dev->of_node;

The core does this for you.

--ZB52rXGD0UANJKv6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqzxRsACgkQJNaLcl1U
h9Dowwf+P5lvGbuT1j6bl3yknYnmKZn1hPviVZUoXiZIZMyBnPWYZZx5j34x4i8G
cQlZFx6Yfp6DYVlnEdC+XLdiehKa/ziNdPl5ibnbaZSi1a+WgqRfeU9Zc1pWNIzq
pMSA80n12/V/LfaWwIoGY2YGG4Si1r6FgxvAfWYbabcammdwmpv2BMZVAxoPbrvt
D6qOgQiEvtn0Ps3GsLRanO7uFJFplK/LBF3ldamkv/c2/Vjr91UcfA2nqrD42Irl
h6H6HzutJmlVGh4WHbmWjMh5XDkKh7MbfgsijrhGSUzAgvRu40W26w9ASf3/IiSb
6wF/X0XJdCwnKjOWfwmE/YcgDxW8Pg==
=b4vA
-----END PGP SIGNATURE-----

--ZB52rXGD0UANJKv6--

