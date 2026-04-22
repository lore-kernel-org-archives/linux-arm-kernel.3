Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290B7F9EDF3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 14:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ws0ZM5/Brw4eQIV/pqVljvjR0BIV7bljMPmymDwQ7w4=; b=iiy4GlpNqN10mr1lOyy10mWU4y
	tyiFkl+xdLrfgrTSpewh21ENMtkA8NxwBwRVDFk4zirndMtjoNypE1R3v+jAkTRK25wzThKGQApc+
	Lxg4/78klof+Nb+7tQhHFW4cthV9yco2jTau9Z/0jpvGLVwiB6rWTCAKqdcWnzY8Jp16niFKajwEg
	2Ak64/CY38HJMbKmougfjoUhcByFgBJJw3+bGINTCjWE69nTgGy2isHXxnRvDun2MuAO1TdEy6VQy
	/P4CasikLunmZa5ZZYatxjFt/mfxgLQ49mxQAHfm7LM4KvyttCFUo0zs3Lk5xgMTN1tZhQ1geD0sS
	4eczTyCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFZ0n-0000000AOar-2Gsk;
	Wed, 22 Apr 2026 14:57:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFZ0l-0000000AOaH-15bn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 14:57:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 84902417D2;
	Wed, 22 Apr 2026 14:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA9DC19425;
	Wed, 22 Apr 2026 14:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776869826;
	bh=U7K2QAfNkxfrOrOoAR5/bJnJnEMsRVeWUSWDvn0eC4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D8zIYnXqB4exHC3F0lWnq4YrUp412dFlNTa471sejPAAaib2sozTnEWsKLFG8xzc8
	 O6drvbLDo/33vvRJ25SD69hkyFXpFveJreYj+EMgZiXSpxraoMIdlJwV9weNVgf3sD
	 uSMpDUUzuccrY7rlx0EEUbmN6l0JZ9Lud4ogmIj7Yz71LrFJWDU/0h3oYBBDFiymcd
	 iCt8vMShvPq8qVgSuU3d1/MQkAhmkIHC58hY1IauwiNOZeHFagUJ9GYlATjfHUUaoh
	 9p2vMj9lKx3qS6ANzZWHOPUlOsZp7jIeriDvmj0tF3l6l04/+ns2Fe744JBI4eMaEt
	 KwOdHUTZEg52Q==
Date: Wed, 22 Apr 2026 15:57:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Kevin Mehall <km@kevinmehall.net>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Mirko Vogt <mirko-dev|linux@nanl.de>,
	Ralf Schlatterbeck <rsc@runtux.com>, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: sun6i: Set SPI mode in prepare_message
Message-ID: <66909301-ed23-4b36-8955-a69b64eed9a1@sirena.org.uk>
References: <20260420164755.1131645-1-km@kevinmehall.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Iahe586F9WozlOdH"
Content-Disposition: inline
In-Reply-To: <20260420164755.1131645-1-km@kevinmehall.net>
X-Cookie: I'm definitely not in Omaha!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_075707_362673_32D78D9B 
X-CRM114-Status: GOOD (  13.95  )
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


--Iahe586F9WozlOdH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 20, 2026 at 10:46:04AM -0600, Kevin Mehall wrote:

> With a GPIO chip select, CS is asserted before entering transfer_one.
> The spi-sun6i driver previously configured the SPI mode (including clock
> polarity) and enabled the bus in transfer_one, which can cause an
> extraneous SCK transition with CS asserted, corrupting the transferred
> data.

> This patch moves the SPI mode configuration and bus enable to the
> spi_prepare_message callback, ensuring that SCK is driven to the correct
> level prior to asserting CS.

> +	/* We want to control the chip select manually */
> +	reg |= SUN6I_TFR_CTL_CS_MANUAL;
> +
> +	sun6i_spi_write(sspi, SUN6I_TFR_CTL_REG, reg);

Might this cause the native chip select to get asserted, we didn't set
up values so it'll have defaults if it wasn't previously configured?

--Iahe586F9WozlOdH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmno4b0ACgkQJNaLcl1U
h9Ae3gf8DdM01ZWjlXH76yDmuyz6xhrdHq7cc8WLh4FWwUbviuZ3Tkfs3DPg+IZq
45tDrBu0yXCxiVN9ejLHMR7mI1aFF8aO/3OU13o849g6suL+O6P8Hw/eGWKnQ3z/
RIK/Q/CrdAsosbv9oxwA4QmJ/C4RkIcOcyjfB6jnp8uc8CVCZpyy1zke5iRGiKeX
Ys+egdMfPJRaehp23q5vhCWu4n6ObdRs6foZ3hP+ZfixLkWPZ0iJScfUmf0klPTH
JW+az9ccEZcQYE71xIvlH4Ahn7NhqEKe8mq2ERoFa3IN8rGHFKNCqD07/eTX2L9w
T0j4AZFhYf2my8B1QPo3/OO97qpz4w==
=xnVK
-----END PGP SIGNATURE-----

--Iahe586F9WozlOdH--

