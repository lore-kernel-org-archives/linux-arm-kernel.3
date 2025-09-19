Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92DECAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 13:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ibYmE2c5M3NgxmUOwRdDFk5cC2rztRoRsEoywjcKAMQ=; b=qBlbiinXCS8ema2viYf+HzXHpO
	H4Yg7Zq3SUOylG7EY65rZ+yCGa0VXTqKR9XwymHGSmG8dkrmbSWaX6dinf0/tvwzzrwBXK6iiUz0q
	HrGQFX1+uDXoGMM9Epx4lC0XMkmgSGqldLrA6224Kk0dD/cRfbK8wM1i3jwX/i+wtwto5Q/2PajES
	WRlWEQ3NKIuWsiAhf7SxA7lFYaRTvhcuk/WbM03McUokKvo9uA4voLx+Yc5ZxuGvZ+OnxfjTFfxXF
	/Qu5zr3Bp9i7zl0T++9HHdluv2k8IWkrUnkNrMwjnTBv3JDMnPyD8tQ/AI7wXqqaFXiwJnMTmaI+I
	7ENrTd7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzalP-00000002vQg-0Aax;
	Fri, 19 Sep 2025 13:02:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzalO-00000002vQW-1oT7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 13:02:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D748860140;
	Fri, 19 Sep 2025 13:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DEEDC4CEF0;
	Fri, 19 Sep 2025 13:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758286977;
	bh=ibYmE2c5M3NgxmUOwRdDFk5cC2rztRoRsEoywjcKAMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r/e3udmLj860i+05ckqO8nQvBT79iD52i+tZNxoFDRrsFNkGLSi5Gv33SC+M1pXe3
	 cq3Cl8UFAFviE4KDMbF2gjWY0arWyXk4Jww1eJNKGK8bHQ7yTT9eDtajeG3tz9saqL
	 JjZtgMZExYZ2AqWRaVMAcOkK8Fr1IdO2dPuZOIVizFvHC5jX2hp8sXG4FmWhyZXvGQ
	 qr4g4gKjynLjoMZpjo/sLfoCDO7HC4T/BZXYkK12BsHVE+E6js2QC+4cR56F4zxcDR
	 yikESUKUNJfhY/qJLQDCzuvniHkRuUC5f80UZjuyo7NYVjiyqkbopMkI4GAUM+EVmq
	 k3csGPdgauMLA==
Date: Fri, 19 Sep 2025 14:02:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mikhail Kalashnikov <iuncuim@gmail.com>
Subject: Re: [RFC PATCH 4/5] mfd: axp20x: Support tri-phase setup
Message-ID: <024aab2f-6ede-4fc8-ac13-195a8038c365@sirena.org.uk>
References: <20250919000020.16969-1-andre.przywara@arm.com>
 <20250919000020.16969-5-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QEwzfm6fqE7756VS"
Content-Disposition: inline
In-Reply-To: <20250919000020.16969-5-andre.przywara@arm.com>
X-Cookie: Don't read everything you believe.
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


--QEwzfm6fqE7756VS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 19, 2025 at 01:00:19AM +0100, Andre Przywara wrote:
> Of the PMICs that support multi-phased regulators, all but one just
> support a dual-phase setup, with exactly two regulators tied together.
> This allows for a simple data model, since just two is somewhat of a
> special case.

Oh, and:

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--QEwzfm6fqE7756VS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjNVHoACgkQJNaLcl1U
h9BKiAf/Wfi4z0/1wQlJeEAkzU+AA3Az2DHqSd/9A2+/XEzSHToQ06Xl1pyTQuwW
2CQ0DXfwYG0hTC8JpVdj/bibLHQxj2pgHTJPDeg4nNzwEiP1xj+imFfpOTYI0Hhe
oWcJ+tKBBqQbMaOXESqZF9Qt2J3wpB5F7XivX03+jCPL8/nQxGkZB3SiwiHrxrjy
vsRWdMjKDpNvvNHRYnzfFCX6gY8rtajCLjzoEpAUVzX/b0HIzw2OnXr5E44qsjSa
uiyIibxcGqPjhLqmDuFs7g5BzBNEuKVDFcTsSwd2kVBDA39CO7SxbEkiXCVpcKRG
A5cJCrY0PNQfgc50w9aOgorckZemmw==
=ugUS
-----END PGP SIGNATURE-----

--QEwzfm6fqE7756VS--

