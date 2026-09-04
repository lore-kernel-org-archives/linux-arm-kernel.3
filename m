Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2814C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKGcsNhvQvyX65WRsiWMdw7zbIu6Dm+Ns5yHU/Yl7MQ=; b=oqbeTkw1cmEkxZQkJgQpikRoeH
	L4WbLmQBHs06RXPwVPAXvB3iD7jN+7DBKfREOK4rEDOmgxavzq55bgrNJp5yHl5ac/buOcTalMhL9
	O0tbbklvAY0Dj/UtW1ZM3cS0r7Rq4STvvkJ20/qZ50P2fUVbOOHRvS22zadearVDWMNfaWShEIBYG
	twGRa7LZpDp8yzQPKK8/ku4ihX4gv+5jJrYZekgTTlxqNAm13+EZlOjAgbMXrW4wzISFOhyKPSg3b
	stIetXfefHQnmI9p7IppCPAIKQv+YakwsIHlcHtW51M3ZPp6iCbmotCN7eDvKqtEUUrTd5cUsiRZD
	WHLcR+Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RZD-00000001kOu-2lWd;
	Fri, 04 Sep 2026 10:54:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RZB-00000001kOK-3JwC;
	Fri, 04 Sep 2026 10:54:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EB0A4600CB;
	Fri,  4 Sep 2026 10:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD4691F00A3D;
	Fri,  4 Sep 2026 10:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788519280;
	bh=DKGcsNhvQvyX65WRsiWMdw7zbIu6Dm+Ns5yHU/Yl7MQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BZWtsFD0IFC9WfCLXixG8ZwAduj+OUv14NrmjvbHHnXLd/vlwPgJhqIo0hx5YbqcQ
	 d6O4zqymS5/JcqhvzwMOvkEFs6JA8iyNBqTCcFkiBsmdB1AzhcKgMK8EHlCW0zia8x
	 wYYPW137Yg7II5xUM2HeyV4Zwgb6RFfif5WEzhcQjgKAuNNthK5Vtk6MGvdJNvvdeX
	 s1MbVwtUAsMlBD48Syzww/jsZGFRigCw0bIRY3VF2V7V7z9Xc0XyWF2Of2v7kM9m/s
	 SL4tV+MUEWwmil52cuC2/qX8a951HyXMHYCyHG2PnfvqzM8svgSADjJX0gr+2gzX4Y
	 hal71DpIznH8g==
Date: Fri, 4 Sep 2026 11:54:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	afaerber@suse.com, bartosz.golaszewski@oss.qualcomm.com,
	james.tai@realtek.com, cy.huang@realtek.com,
	stanley_chang@realtek.com, jyanchou@realtek.com,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org
Subject: Re: [PATCH 0/3] spi: realtek: Add support for RTD1625 SPI Flash
 Controller
Message-ID: <606e580e-b1d6-4dd3-bb3c-e46d20da78eb@sirena.org.uk>
References: <20260904031252.244280-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tfNF2zAxbgSEaXCh"
Content-Disposition: inline
In-Reply-To: <20260904031252.244280-1-eleanor.lin@realtek.com>
X-Cookie: A is for Apple.
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


--tfNF2zAxbgSEaXCh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 04, 2026 at 11:12:49AM +0800, Yu-Chun Lin wrote:
> Hi all,
>=20
> This patch series introduces support for the Realtek RTD1625 SPI Flash
> controller.=20
>=20
> Please note, this series depends on the RTD1625 clock driver patch series,
> which is currently under review.

This doesn't apply against current code, please check and resend.  I
think it's just the DTS patches - I'd just drop them from the series for
now, it'll make life easier.

--tfNF2zAxbgSEaXCh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqao2oACgkQJNaLcl1U
h9AHVQf/ZGL7zGjqObIWwauUZG3bh6i+a5W+RRbI+yZL7Cp6J9gcBdfMJFPDH22/
zNVUuIVxFYto+MyS0oNEj0/q2QC2fnTxt2IXcYAvKFDswmxKkc77Maoy03sMkRBc
0V6o0JiNz/0T8r3v52ZWncKO4+c5ZMxOay1rUwg5GZ/pTKkvXjTDEp1vT8DsdlXt
lWhkWCdqHksaxa4bijRm85IE7iQw2L4ca1VmDArp5aWMFG6GdkVyYUtu/IJGkKlD
iYXCQG9+wRmvPQXmgYkNpYf4WZQAgPVzaKqN+WzIQPV10whA0jEOvlTGPfjW/0OK
jBaIl4NxI1HvyNEPvcrl/MT+RAwYAg==
=8YF8
-----END PGP SIGNATURE-----

--tfNF2zAxbgSEaXCh--

