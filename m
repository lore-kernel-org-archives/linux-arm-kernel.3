Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A183FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kd4NBNv+JPrGPrHCy95MEswdC92ezY0vpr9w627tsCU=; b=Y8TohfcZPJwIx1GIiziMN7mn+N
	9yqoVej6zbdsejxlqdp+DAOapncHntw6FRGkADvFwmxDxAFN+6QtQHCUAMM84DHiqhSIfioT0FyQc
	E6gZIoZ/ONbf9Fl2zpNFQJwfiSgZ+qeZo8jsgZ2sTqwpJnL2SwQJCyKHl9zi/q7mAiQG+LWdo2a2r
	O5dEMXvsdoATU2e3SEUxxTbpzjzKjWce2JtC/+R7bh5m+uVKgnEZB3972ld9mHxSBo9Yb1BkbgxrA
	ar2i64Y1XQznGWimXjJ84TK4cKW6YJBYZf1/0tSXIPGbZe+2fuimKoFIkG+t3o4N32m4g7bxfGig6
	SLJ5Qt6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnuE-00000002Ppz-1MdV;
	Thu, 09 Jul 2026 12:31:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnuD-00000002Ppe-14eK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:31:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 837646001A;
	Thu,  9 Jul 2026 12:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C981F00A3A;
	Thu,  9 Jul 2026 12:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783600264;
	bh=Kd4NBNv+JPrGPrHCy95MEswdC92ezY0vpr9w627tsCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IqBGz4IRXoPI1GqtYy4ej7mhohuF7hXU+ywvU3KVqJUSgsDxB3f8AxrgBQz7RGdae
	 N3Mlz5IS9f1Z8arSR6nDyraxM28Hlv7RKB9JJaf+jylKQoxUmOpZVh2DaEZsqJYjRh
	 pclSTKi9yqplC6gXRzS23XpORP1YW3+h+3TzvqhRrN/y3/DqwKI3kEc6A3eAyKFHNp
	 h5i+azNE9Y46sabrdwNNlAbOFI4BI1ux4TdrzIwR36JL9d3UtItKpZYMluTBf8rwwg
	 ionXCRs9AS5qoWlHaC8atr343NYCQo3nJhIYaYTgTlt0wXddKAMh9udL2xrvVIzayc
	 QwZ4qwknK3JIg==
Date: Thu, 9 Jul 2026 13:30:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, tudor.ambarus@linaro.org,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com, luka.perkov@sartura.hr
Subject: Re: [PATCH v2 1/5] dt-bindings: spi: Document LAN969x QSPI
Message-ID: <d151cc26-aabe-44df-8b55-d830af97bd43@sirena.org.uk>
References: <20260709112006.390742-1-robert.marko@sartura.hr>
 <20260709112006.390742-2-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mH7z/dQ9Z33mkKO4"
Content-Disposition: inline
In-Reply-To: <20260709112006.390742-2-robert.marko@sartura.hr>
X-Cookie: MS-DOS must die!
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


--mH7z/dQ9Z33mkKO4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 09, 2026 at 01:19:07PM +0200, Robert Marko wrote:
> LAN969x has 2 QSPI instances, so document their compatible.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--mH7z/dQ9Z33mkKO4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpPlIIACgkQJNaLcl1U
h9B7SQf+JYxR2E+1y6DqzmpAzovfm06hV1X8TJjOX6tLg5si37+iBMlnh5VUfFFq
Cf1BRqbzyROuW3Fa2Bo0Ts9zpa+aGOgFfoh/6LNFwlKSzJKKOIWhA8Vuhz6e7ICR
r374LLQs4yu60/qN126W+ejhmlNvTHHny98QUePxUJH3pOD7kc/3aeDb9RP+mIle
Zt9VtHxV6lM2PhVfK2SLAprun0SmAUHhYBHGrJOR74GZHZIcBHpEzwXxpzdjOq01
c+qhyF6cifUbWH3MVKdYLrUh9esvLIbqOY+YYdYRBZTqZn9+z7DtvL0oMPhNSumz
dX3h+uQfSD70qOswhszqHGdXfMOTUA==
=f3gd
-----END PGP SIGNATURE-----

--mH7z/dQ9Z33mkKO4--

