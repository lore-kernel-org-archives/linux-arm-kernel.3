Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2403ACA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 17:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJxP02jgtsYKvx2G2NNGwZtK03ROopISrRswIgnOLg4=; b=M4i0YfAg1iCUriE4kvxsHY+3UT
	kDZr+yqXJi9gJ1xLUwaZ15yAvLhkhmh2utkAfBY/SuVTgzAoVK3hg8xIv80P/iqrdUedD6nIcAUJs
	uyB/su182UkLcX9Ohwd7Fti89611M5Y9CgnCwMea3KskWtrGYeaqVz2gk5y3xIss1mUYnqxYQVg+x
	IyZ2dh0nc2uKfTrZ9Gwfm1ZQnp+DbZGNGCaU9Pl3jYRUWFbKbJYdQLoFe70iQvhHZpZiLAP2VqcxD
	2qaY0z4KmzFB9hVJwZcN0x4kr+0Yp8hb8hUXQYJLh5/mmjy31KVYhcd9m4l88rM/g9vPJ3blde/oh
	fyF+oi6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xByIV-00000006tS7-0wKt;
	Wed, 30 Sep 2026 17:40:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xByIT-00000006tRd-1r7j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 17:40:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9286160233;
	Wed, 30 Sep 2026 17:40:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405CD1F00899;
	Wed, 30 Sep 2026 17:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790790048;
	bh=pJxP02jgtsYKvx2G2NNGwZtK03ROopISrRswIgnOLg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mEt7auJdWJUg5J4oqGJ2f4A0mfumXKjZmabsGsBBUteaFnfqtPvpZKtBFwH9UyYp7
	 bcPXNFOyJ3QRNegNFvBCKJcfsgTxBiMGMiUrDrv1ri9eZ6u79p4vMGP/x3zXaUR1qr
	 Ff1JW3ph5GmwUZp3W/1BTDVm25dTpdKsBEBBshkAEu54gxLbXSC34+9BvI33WOKYWm
	 2iRPuaIV9fUtUKU2RurSggm7CK0Mg1vxfQsSoj9RUBwvwOLZU/2OQdHAlXEtoNuXSg
	 VtvyVweIeEVf0PGQIaSnXjS88RxMQMuNPACKeMNPPHLrc4stAurlwhnkddei1deHAd
	 4MsXVgJD/5hoQ==
Date: Wed, 30 Sep 2026 18:40:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Shih-Yuan Lee <fourdollars@debian.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v17 3/6] spi: pxa2xx: acquire active PM runtime reference
 in interrupt handler
Message-ID: <2070ad49-b017-4caf-822d-0ad8ef520f79@sirena.org.uk>
References: <20260930160629.1822-1-fourdollars@debian.org>
 <20260930160629.1822-4-fourdollars@debian.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GTUHbOsFbl4ZReX2"
Content-Disposition: inline
In-Reply-To: <20260930160629.1822-4-fourdollars@debian.org>
X-Cookie: (null cookie
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


--GTUHbOsFbl4ZReX2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2026 at 12:06:26AM +0800, Shih-Yuan Lee wrote:
> On a shared interrupt line, ssp_int() can be invoked while the SPI
> controller is suspended or transitioning power states. In ssp_int(),
> evaluating device power state without acquiring a reference before
> accessing MMIO registers is not atomic: another thread executing
> pm_runtime_suspend() can drop the last reference and gate the clock
> immediately after the check passes. Accessing unclocked registers then
> leads to PCIe Completion Timeouts and system hangs.

> @@ -1464,22 +1481,31 @@ int pxa2xx_spi_probe(struct device *dev, struct s=
sp_device *ssp,
>  		}
>  	}
> =20
> +	ret =3D request_irq(ssp->irq, ssp_int, IRQF_SHARED, dev_name(dev),
> +			drv_data);
> +	if (ret < 0) {
> +		ret =3D dev_err_probe(dev, ret, "cannot get IRQ %d\n", ssp->irq);
> +		goto out_error_clock_enabled;
> +	}
> +
>  	/* Register with the SPI framework */
>  	dev_set_drvdata(dev, drv_data);

We need the driver data before we request the interrupt, the interrupt
handler does runtime PM and the runtime PM operations use driver data.

--GTUHbOsFbl4ZReX2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq9SZoACgkQJNaLcl1U
h9Cs3Af+LNc0+SJ5Y6YknMd3CLLOdUOalJr8UqvKUwpHVit5RsQkYbKXimsWEmFP
k1lEO3dyX+h0QhqFL3txzMQimFFnnfHTZAhXhDEVl8999xlNFmW+1k0Bwk6xesxd
StLhG6GcLi1zPl+8VAkYq5MJzxy8fxBwjO3umEzlcnLaw3c+t9Y/IVmTrY9SKaU3
hpir4cMgqB9pmtC84uegwD4jzZmvjBGkIsV+NwkkEP6DI9TjJQvnEHY0cqkiyLZh
kLww5lxAs5xzfeLshBt9WVgNJx3kn1AmRMmUyIjZ+BksvEr/IYkQDu6n4RkcBY17
a6jYxCY3E6mrmrkqTvFfQrf8MG2sgA==
=vbC9
-----END PGP SIGNATURE-----

--GTUHbOsFbl4ZReX2--

