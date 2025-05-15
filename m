Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD27C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 09:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pYwv0J+O3bU1brnjALwRXOAvL3GliS9WhDVU8kUHoLI=; b=bL5PaUU0OIRx8VvsHdecRC54QZ
	UBqj87NRk3LLFTpqV0NeN2/3wpEf2jjHzeCcfzqmJmkmRcq+npXw2tMUKNPt4KndHW5M79iRubLZ0
	IBkI/G4T3Ial+o+5aPW0KgST7rrv5xcfPrLg4rqcPyQLCDcDhUgLSwzlmcGHTkYuf+dE9rI0bbrKi
	UhYDbra5cv7ExRonsjoWdjFpT+LGgtjrjViPO/Dyc5XaWqBeGb8dak+G5kZDh+5DwkJE+UuVNZYfQ
	oAR/m7LhQpeU+R7DzrKYKtqb6ig+RQCL2YwR1LsKTFmGe6wTQs6txUyEWBCKSAMEovO+q9K+tI9RN
	6CHRIUcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUvV-00000000ACr-1kOs;
	Thu, 15 May 2025 09:30:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUnd-000000008zK-0fS2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 09:22:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2BD45A4DB62;
	Thu, 15 May 2025 09:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF4DEC4CEE7;
	Thu, 15 May 2025 09:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747300963;
	bh=09psgg/FDIgxF3WszEeFUp1upo+WVfhoS0WFJ5ThPzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BTauZgz0HZn5DsUlIaSxS6Xagzd8AziP1XStFm3Jt2dV4YjGOu9KP03KWV4m6zbJ+
	 gqotrf1hy/DvzOr0lZM+qJqdGHXc7Ba6/mpIYabCJ6C2+7Wq20OLC4PgviEMxPTgDP
	 jW4nVGr0cnat8geUD0HXFabpdw/rlcUWoWPzg3nS98yclZsWwJe7NA78HZjk1po9wD
	 9MEcTnDm/CAXzP70gJ8W91+zk6bKs9bomcr2TYd3IhN/8gfMzPTu9/teIkz1Jtt8SG
	 ydnVS1OhJZHd4YSgFgLI5Zi/fONKW2vnuOoJ6XxyXptZLg71PyXThuRKnHD51rN1Sp
	 E2OG/W1aflNVg==
Date: Thu, 15 May 2025 11:22:38 +0200
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Vinod Koul <vkoul@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: Re: [PATCH v6 0/2] Add `devm_dma_request_chan()` to simplify probe
 path in atmel-quadspi.c
Message-ID: <aCWyXsJ2iRXRUmOi@finisterre.sirena.org.uk>
References: <20250515083132.255410-1-csokas.bence@prolan.hu>
 <aCWpjplhAXUvr9fj@finisterre.sirena.org.uk>
 <e4e6c7a9-9b7a-4012-8bda-75804229ec95@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lsS54prYZ+c1tDdi"
Content-Disposition: inline
In-Reply-To: <e4e6c7a9-9b7a-4012-8bda-75804229ec95@prolan.hu>
X-Cookie: Well begun is half done.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_022245_268208_79580F48 
X-CRM114-Status: GOOD (  19.50  )
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


--lsS54prYZ+c1tDdi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 11:14:22AM +0200, Cs=F3k=E1s Bence wrote:
> On 2025. 05. 15. 10:45, Mark Brown wrote:

> > I can't tell what the plan is here, or what the status is for the first
> > patch (since I'm not CCed).  The second patch depends on a new API
> > introduced in the first patch so it can't be merged independently.

> Yes, the situation is a bit convoluted. Obviously 2/2 will be applied aft=
er
> 1/2, in a similar vein than the former PM series.

> So what I was trying to say: Vinod should be able to apply 1/2 to his bra=
nch
> (dma/next) right now, which can then be merged to spi/for-next. This merg=
ed
> branch should be able to then cleanly apply 2/2.

I wouldn't expect to pull the whole DMA tree in, that'll have a huge
amount of extra stuff in it - if I was going to pull something I'd
expect a topic branch.  Wouldn't it be simpler for me to just apply both
patches at this point if there's no conflicts with the DMA tree?  We're
at -rc6 now...

--lsS54prYZ+c1tDdi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmglsl0ACgkQJNaLcl1U
h9CkSQf/aHhDgShaJOuGnP6gxQePQyEyifKpyjggCAaRO0Sesc+kJpLP+WmA0tu5
zR8dncLAeFAWIhOnoiv/TvWp37UG0ZMzmoMeVYSzQNijpT1i3K3Hj59K/7Xj7pOY
DfM+te9RzU6zFCqQCBsG/HzrtmN135ZWSITtrqSZIMerQPzwj1gRxn739aVsdeEu
uMpbZiLJ5kCiQrzKGo8Ixui87RlSho7whEs38ryCVpHsHdKIqHhu6KdqbAIdtbse
o9sgfNAOjjua7YHhcNiEqCmUoj9cbzMjXA8YAYuWXfJwj4w8bys8xRCi3nGF7zXc
nVbkjKLI5vJuum8GbeDZrTefcfktBw==
=bjGy
-----END PGP SIGNATURE-----

--lsS54prYZ+c1tDdi--

