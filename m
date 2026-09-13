Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65ADC88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 11:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqmYMNWXm2PS32PWATDXedLh2UIRpr7LtOC/6nDcHj4=; b=wSorBMtjUq7TqITJPaY59jxft9
	+Q16Xg+kEvqDd17V2jpHv9mDFXg6SxzykR9I9py+JfSJY0YmDTw4+KsX4J4opW2pMxpaEnIpnyMdD
	2Vkwkpj9OlneqW8NJM8bRaLPADuCctv9RuOBkMJC2BllQ+GmQ2akxArB9Uxbk3tO/oahlenXM753G
	P3Js9KR0FB3fnCdOz+mpgzRODDpTWpmvycivj9fIDjzbD69ZfWnmEKlRgytNDl2o1hv0t5hWfTEOG
	HL4qJdbx17m8Wta6TreTdbHXKwJrOhuoIOniUxirJ2YqA/NqNRg2DEzI9J/MYyZ1XgpzQsL2jguUy
	iNjbnuOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5iTc-00000001ccJ-0iSW;
	Sun, 13 Sep 2026 11:34:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5iTa-00000001cc9-0nKE;
	Sun, 13 Sep 2026 11:34:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BBEC844855;
	Sun, 13 Sep 2026 11:34:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8237E1F000FF;
	Sun, 13 Sep 2026 11:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789299263;
	bh=eqmYMNWXm2PS32PWATDXedLh2UIRpr7LtOC/6nDcHj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aRVLq5JFfmgQKaElgN9hARd2PubXgi6NeRv/TslJWttkklDgADNXdjSt9xm2uuuY7
	 81s3CAWyI4DwWKC3npVWoo+KgwQvw/sGscw9tR8i8v+We5Z3vWgYjJaRzd45KXI24D
	 Dvf7AXCH9Y8ZSObDY061Tbk7f+Y3xtY0AfQ385ilASDCaaWuyGHyr1qWOxbDVD5CQp
	 pc1A8Ut9y2SgUWJYsBdtl+Ew6pK2SWyJ4QxomjdPpDsv6kAXBt6h2xNh1ayyzbJIHv
	 0BbaaqFN9QuGlkmsh3tMHpI0Vpa8lCUf8LLQHd4fj4ij52IVzjfSx6hJGLSYJjq44J
	 SoMhGNHysk4qw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id EF057E0EC90; Sun, 13 Sep 2026 12:34:20 +0100 (BST)
Date: Sun, 13 Sep 2026 12:34:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH v2] spi: rockchip-sfc: skip DMA cleanup in PIO mode
Message-ID: <aqaKPEFt7fQe8QQp@sirena.org.uk>
References: <aqRM17TZ0-5pd6Y0@sirena.org.uk>
 <20260912190056.42192-1-mhun512@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BYqHUzUgRwUKZNts"
Content-Disposition: inline
In-Reply-To: <20260912190056.42192-1-mhun512@gmail.com>
X-Cookie: Orders subject to approval.
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


--BYqHUzUgRwUKZNts
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 12, 2026 at 03:00:56PM -0400, Myeonghun Pak wrote:
> With rockchip,sfc-no-dma, probe skips allocating and mapping the transfer
> buffer. However, controller registration failure and driver removal still
> call dma_unmap_single() for that nonexistent mapping.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--BYqHUzUgRwUKZNts
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqmijUACgkQJNaLcl1U
h9CwIwf6A+Mv5erq9BOAGamYCRiq0f2YOtNdxCsprU4hUbNYwPzZgQCAmGAZhjr/
ORtTTFeMpKTizo2EekSAvp83S2VL9dxe1BhUaQoerKnG4MIqirlduo003OZ/gKtM
89/BUKPy6WqkW3A+nQ81bAglYptFyX8qo5FQzTb/cyyf+uzdxd5+xh5n98k0WS5s
SNR89mnwLzTyi0pmvALL7VmFl806G0KpMKPnowxT7PbjK54tboXHqO2BtCJEYk31
9Obbw0U7ogp3P+iV8nlQ30ZrZfb+MRCip9C4g27hJxcj69T3a4GbXySG9rJw7qid
YPCNkqKMNPhB6SoN6x0xYTwx4pg7cQ==
=X0/3
-----END PGP SIGNATURE-----

--BYqHUzUgRwUKZNts--

