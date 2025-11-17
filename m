Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903A0CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 17:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPpowp5s4cCgPqPs5Seek2e/RjhHjB5CsKosHVwoQBo=; b=h8D0pjpyC5CljDqXH8BWiAXAF0
	cEw/5Srs2I5X55jPk/pxD6cqSID/ZOGkOLNP1ydKp2YPxcyZW2ts1WATclpFXNXdh8NFbxG8LxGwX
	/Sg/3Sk+SWlSbh21MtTL5j4pshHBBBSCcQ5pmd6VW8dWNxw/ZDjakxcquGAdlbnWwgzOIfrfFB/+2
	DhUpUp5PftgqsRaJJZt1mzJv+g1NkpbqsHsFd0WqfqExpouofxxv78VrDNDsCiAYhYNMf+gipelwD
	mFAd5rcsjogyKZeSKMv2Brdtk+aP97cDfgjsnL7luqP25ee8ZihbAUAyl9wp7I2ZtaYJojnJtjtZA
	x/SBF9gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2zO-0000000GX2v-2Dme;
	Mon, 17 Nov 2025 17:26:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2zK-0000000GX2J-3KX8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 17:26:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC839418CA;
	Mon, 17 Nov 2025 17:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07559C2BCB3;
	Mon, 17 Nov 2025 17:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763400359;
	bh=yKuOcA1E6JYLWEtbHHE6NrpR/zqdElFzEm6ItyaPGGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P4SpzHryZiMx3688QfU+siCjFVkFAEXdYqon6LXmIkdT3zsRi0txqCbzoQeYsN16D
	 C0kUZ1Ixmb/l85+Zz6Y/vUs8QSuwog9vbMMPPBesMuIbvthyTIBbtQpkyJORRsF+lb
	 VPKc26BqXvzieshaQ0HlGMW76CIBF4HLMqSYF3icQHmD/9QmeWFpfUfliYCigVCeku
	 zUgOkga2daiCwo42Sq4JpE/HrrnIS22zqOXUzYRZcEOjctdoasyjI2fTyxMxUp5M/x
	 aMtCjW4rLte0x5aq24yGkgnj0go4mmNx2ccqeV/tn1VX3QbntUi5LKSWzo1nU12lXV
	 mRmxo8hh7Thgg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 5CDA01ACCCAA; Mon, 17 Nov 2025 17:25:55 +0000 (GMT)
Date: Mon, 17 Nov 2025 17:25:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Han Xu <han.xu@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-spi@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] spi: add driver for NXP XSPI controller
Message-ID: <aRtao9FoPug78T93@sirena.co.uk>
References: <20251117-xspi-v2-0-e651323993fe@nxp.com>
 <20251117-xspi-v2-2-e651323993fe@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rwvwRa94OgcAe6fn"
Content-Disposition: inline
In-Reply-To: <20251117-xspi-v2-2-e651323993fe@nxp.com>
X-Cookie: marriage, n.:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_092602_897094_5569E496 
X-CRM114-Status: GOOD (  20.73  )
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


--rwvwRa94OgcAe6fn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 07:04:25PM +0800, Haibo Chen wrote:

> Add driver support for NXP XSPI controller.
>=20
> XSPI is a flexsible SPI host controller which supports up to
> 2 external devices (2 CS). It support Single/Dual/Quad/Octal
> mode data transfer.

This looks pretty good, a couple of small points:

> +static irqreturn_t nxp_xspi_irq_handler(int irq, void *dev_id)
> +{
> +	struct nxp_xspi *xspi =3D dev_id;
> +	u32 reg;
> +
> +	/* Clear interrupt */
> +	reg =3D readl(xspi->iobase + XSPI_FR);
> +	writel(XSPI_FR_TFF, xspi->iobase + XSPI_FR);
> +
> +	if (reg & XSPI_FR_TFF)
> +		complete(&xspi->c);
> +
> +	return IRQ_HANDLED;
> +}

This just unconditionally acks interrupts without checking if there was
actually anything there - that means that if some design shares the
interrupt or it spuriously fires then the interrupt core won't handle
things properly.  The driver should really return IRQ_NONE if there is
no interrupt pending.

> +		WARN_ON(!(reg & XSPI_FR_TBFF));
> +		if (i =3D=3D ALIGN_DOWN(op->data.nbytes, 4)) {
> +			/* Use 0xFF for extra bytes */
> +			left =3D 0xFFFFFFFF;
> +			/* The last 1 to 3 bytes */
> +			memcpy((u8 *)&left, buf + i, op->data.nbytes - i);
> +			writel(left, base + XSPI_TBDR);
> +		} else
> +			writel(*(u32 *)(buf + i), base + XSPI_TBDR);

If one side of the if has { } they both should.

--rwvwRa94OgcAe6fn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkbWqIACgkQJNaLcl1U
h9Cj1Qf/R8qxjz0qsI4C3BoN6FDOe28ICoQTHqVmPLMIpfom3TcZClQiO7IVXRUk
W8dFn7GPJqSo5ZhFrPceTTFMUVUXqXu+/QQwChY52k+7kIGfnVIUDBDZH0nQ+P7n
W1LRdzEW0cVyHFWE7M2KZXLV4Ff3b3DugtyEklo1sWSCB9VHzqJMU+gInqxQPkBX
6LWXKffPhTbOiXK2zbIr2GIECTRj16EI9K8OxKVI1Nn7t9rMHX4bxAu/D3CJ4CcS
LAjvJFFnFvOFrG4OcXhK5ed2EV1bTilll1Wzbg+H11QmcfFeVmkz6EmDAvaskaYH
q841AnbKzH5h/s6mjO7Ts88s1OYEWg==
=7syi
-----END PGP SIGNATURE-----

--rwvwRa94OgcAe6fn--

