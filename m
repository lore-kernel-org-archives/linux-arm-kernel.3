Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2244AC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Jun 2025 22:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=prd3tOf0SvXuPF48qrLMv5PQGW/Mf3lzY1R4U3NkFk0=; b=3afjig89qkDdN51qdxPzto4/l1
	+288em4zswJgSxC9uhGf70ZI0llv7cmU6pgZ5d2Ru5Sz0L5Toxn9ckmgeOPb0/q2dP7itIF5l/uC+
	QoT/V/IG3SwHyISSczPBNsHgg1jLlGVdZBSUASMNnimR5w3p0KuKdfsNXnv68pdr4YzjvX8eoLSo9
	6tncEpC6H+NquoJXv4bH0wbanIFIaBQRAeIQvBrdUpbf2MD0DsQi7KnwNegioLay7Kkn0OcnjYL/f
	MLLjJAsqw41x6p2YBWVQDBGRXnKMOmo+N8pgRV6hy3IXbNfJIzWHKqQLhOwuxTJOmAwdAivP0zwZh
	hl0LGdkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOOfl-0000000348V-2UQe;
	Sun, 08 Jun 2025 22:39:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOOdd-00000003437-3Tmr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Jun 2025 22:37:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4DE1A450FC;
	Sun,  8 Jun 2025 22:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6B95C4CEEE;
	Sun,  8 Jun 2025 22:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749422230;
	bh=prd3tOf0SvXuPF48qrLMv5PQGW/Mf3lzY1R4U3NkFk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b6f0QvfTENNe2lj6vYHStzImiG9HrzHWnlqyEJ420vpn8n0w8blUTtZPEKRaGltMW
	 NxAVlwAW9CZdIKXF5vkM7yHa2eJYB0sbiy5IAIBKANbgiBQJJVAxwgOdgG7ciP7VHQ
	 VTHr+86dU1atQTlicC9EZtRCTGAik/MkTZS9xP0ZE6kmwspomju0Dwbu+4OmM+JRXL
	 7y61yy9WhMRskuXXoaf7I0be3uk4NlSwD1BMwWAuA5Tw5SACSeKZQPCY3o9uEUSmBD
	 labfMYt1W5X+3Y8xrD4Gfr2i6ryR4PQxI3zOVFIFZJBBJjcQpqHAag7KxYg89lenN4
	 IdUzP4DowUfjA==
Date: Sun, 8 Jun 2025 23:37:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v5 2/2] spi: atmel-quadspi: Use `devm_dma_request_chan()`
Message-ID: <77c38cda-7ad0-4893-b16d-33a7a55d1080@sirena.org.uk>
References: <20250505184936.312274-1-csokas.bence@prolan.hu>
 <20250505184936.312274-3-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xpRD4nOZFRzRxibN"
Content-Disposition: inline
In-Reply-To: <20250505184936.312274-3-csokas.bence@prolan.hu>
X-Cookie: Body by Nautilus, Brain by Mattel.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_153713_908675_D5FB78A4 
X-CRM114-Status: GOOD (  10.07  )
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


--xpRD4nOZFRzRxibN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 05, 2025 at 08:49:34PM +0200, Bence Cs=F3k=E1s wrote:
> Leave releasing of DMA channels up to the devm facilities. This way we can
> eliminate the rest of the "goto ladder".

This doesn't apply against current code, please check and resend.

--xpRD4nOZFRzRxibN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhGEJEACgkQJNaLcl1U
h9BGBwf/U0uYeO/irhlkSLmI5OrYjwEiPAKVvSh1CMw103wqerGcpcr81zg0To40
7/gK2xMK4ZpdhYOuapd4KCSWYW3A7TH9xEau1K1VVpgg/ZrH4Fuai/avuURweqWF
464v9g5PhimDB5dWYO0r9OE6kqTqYBsgXEYV+WgrJS2FuJo0pt720XbKzg14Q4NZ
6ruL3Va6C3kkjfRnfncGfoonyXVohdF06RHe5FckHYEruxTr2BNk+71xVed04ZKI
sh2qqcVBXneHQHgEoUeeyVnj5ywtEWI3KhE5EpF02k/N+KFGCRmop+BsWogo+U0+
DufDwXMnnYsabXtCbT1eQVXuQitZpw==
=mwQ7
-----END PGP SIGNATURE-----

--xpRD4nOZFRzRxibN--

