Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A87D37E39
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 14:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQ7K/itTe3Cgkb2uvgi/Az1tyA7bic8QfYs7zqcvrkU=; b=UTWi4G2miw2Hp+mG1aVInEPKFP
	QXh2v1uoWZpckAj1WA6lKZVLrPMRmBBzWXkaHrXMIZZospdEOW33x8FELMHORprpFw8fn8nDfhDmG
	yfskHliotCGtgeUNxoQjFTU8q9mfZGkrq16l4OQOgVcgdj/DN6QtVaI0E1V5lspjsWfaNraECJ086
	q5hVh0BvPx7WJtnzAAbqkBnIplDvh5bgqHKZDXAPuJb6LYLQ6q+PRkS8C0nIIngVt/jruFN0sgzlb
	wdhAxQYrpFxZH0pJbK+R/J0ksGKa1L1WTRZo+ybCGYFg9DHHsjOdBZTLYC+UxMUPBBKX1u/3lm7i5
	awVMYykA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1fz-00000009UCH-1IEK;
	Wed, 14 Jan 2026 14:16:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1fy-00000009UBf-26vb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 14:16:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9DE266000A;
	Wed, 14 Jan 2026 14:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C263EC4CEF7;
	Wed, 14 Jan 2026 14:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768400205;
	bh=XrqqcmRsyZwRmeY/OgsS8oou1an44/FjjqRcXEmPp1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BLu5cszkj/qDoM0fUCiBAB/fwApjXi2cTZ3BA6KfsdtvRmO/3dMzC8qxZIo4esxqY
	 0F1XBDX7+BtrFZ+CiJ6XKS6RB2PAMfOzxeMcuKeOc8vDS5CpaSSqjDrj580DNcYtEn
	 I1s1jwEvEsvKkUdERrlMiRlR0ZfC9oV0PVEXSeXYU1NbLa+jnSQvvkGhnUJq6Lgf0k
	 5UGqy8cgkzg2fX2LAYbyyczccVJgo6Tbc6LoWuWFm4S8YrR/ng8CDZGIs8HmUOvw0H
	 JEgnbIBqwWI+AQ0DPzQC+sNGUcBIvaMJ0CCHh8/50lIvUl9lh4wndW/+a6QNFFY/pv
	 +4KINxvSfUMcg==
Date: Wed, 14 Jan 2026 14:16:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: Jun Guo <jun.guo@cixtech.com>, peter.chen@cixtech.com,
	fugang.duan@cixtech.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-spi@vger.kernel.org,
	michal.simek@amd.com, cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] spi: spi-cadence: supports transmission with
 bits_per_word of 16 and 32
Message-ID: <0dbf3a5b-6a60-46d8-a358-61b8d527a8da@sirena.org.uk>
References: <20251031073003.3289573-1-jun.guo@cixtech.com>
 <20251031073003.3289573-3-jun.guo@cixtech.com>
 <fu4ujdxwlhyhuwjtsiebje5pyc32rfs52vo2gyy7nay2krkxeh@wpls44xdfgy4>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QTaNkFSiAOD+g0pr"
Content-Disposition: inline
In-Reply-To: <fu4ujdxwlhyhuwjtsiebje5pyc32rfs52vo2gyy7nay2krkxeh@wpls44xdfgy4>
X-Cookie: Absence makes the heart grow frantic.
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


--QTaNkFSiAOD+g0pr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 14, 2026 at 02:14:35PM +0000, Rodrigo Alencar wrote:
> On 25/10/31 03:30PM, Jun Guo wrote:

> > +	if (xspi->txbuf) {
> > +		switch (xspi->n_bytes) {
> > +		case CDNS_SPI_N_BYTES_U8:
> > +			txw = *(u8 *)xspi->txbuf;
> > +			break;

> > +		cdns_spi_write(xspi, CDNS_SPI_TXD, txw);
> > +		xspi->txbuf = (u8 *)xspi->txbuf + xspi->n_bytes;
> > +	}

> cdns_spi_write(xspi, CDNS_SPI_TXD, txw) needs to be called regardless of xspi->txbuf.
> Otherwise, there will be no clock for the read operation to work.
> This is a bug I am seeing on a Zedboard running on 6.19

So the device needs to be flagged as SPI_CONTROLLER_MUST_TX?

--QTaNkFSiAOD+g0pr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlnpUcACgkQJNaLcl1U
h9AykQf/fa08uztzIN9yVJs4AA58mWTVqubsPzSh3dnOVMLV7izelhCJFicPBFxl
eShEt7Cze9aeJnFVU/cQQTJBSRj/HhyKqjiO9ZaW4yeVwpdC0qWeiFOgiElLyHSv
bCCoSc+66mkIAJO2LraXGxuioDncWszN0BU1rSj0bTwOJuLTaPPnbs4D6SrJTQO5
3De10i9Vg3KI6O+Jv57oscDmI8aPuJOlKHJMr4z1a+aCCGjJEp6Vgf8ogLLiKll3
/jTIuOo5239aqPxFmWXLe+il/N1tG/u6qsnnc8AUvSz4vByZJqRDy83e0i+Q5eON
Ktd0aGNIEwAeNDElb9J/638PyXOhVQ==
=NTct
-----END PGP SIGNATURE-----

--QTaNkFSiAOD+g0pr--

