Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4C9CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 14:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXJhzbZGnX/X/2hDE6shccsmWnwIw++Ael+vCxiOaAg=; b=uLXc+fHhINrQ/dMp8tCiCbIcrt
	iKvrBMLbnRpfzdCkn/JLR4cyax4e8j20Qlu52gttNtpqILvDIwTsxlwgy4a7k+NPaWNRYZx7KA90V
	P4tl9z3KuKYiXRuH303+sh/f2FZtLCbgTPbK9GvnTfvJyGbHRlIOVfYgIKH2YMIJN8jfYAztNBSA8
	EEhqKqRMVy3Tzcig6bhSsXPx3VNzDo1484RDqZq7I6MZQk4JBWCTddArkUj1qR5yXhh1pqad3urOj
	hndimGvwSGqvk9c+p93dbRWsUYpoRPDk6aq9ChVj3UZSE53C11e+Ty8V39MMvkwV+IFK+8JdbCali
	xaroFmHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOY1-0000000E9zZ-1cl4;
	Mon, 27 Oct 2025 14:50:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOXz-0000000E9zN-3VPS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 14:50:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F17A560590;
	Mon, 27 Oct 2025 14:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A201C4CEFF;
	Mon, 27 Oct 2025 14:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761576610;
	bh=FE3hWpfbYIAESQkCdu8paBkJdZ3DdO9pXcI6pCl6tOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IcalxHsvXSgErORlqVI3RUUOSmgY9D3IyGJsIkB4moAiYgwYmTxPHLwPtfUk0n2OL
	 5y6rtH7GtfFFSxXxdDuioyGhvOXmZpKWhXUnXpGTvN6etosNcams+0KeNaSIKqnOEE
	 GzxpYkPoVskissdwGhNd8AZMSf24d0wQR+ZmUYqw9HVcp47S3nkz6z4kHPxN/9k7G+
	 uJ3n30FUUr18ng60PjJvBufjo7kKFr1XhS+xjtRI5yTy7IAZus4DbgBPUuNlNnq3F5
	 vo1LNJj3vrcdYS+JfWKnbvBCGBDIYuvV1uzP6bkRk7I646+/i2DendFjoeUdpjbAfw
	 P61k8Iw3Bcjqw==
Date: Mon, 27 Oct 2025 14:50:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Melissa Wen <mwen@igalia.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Maxime Ripard <mripard@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>, kernel-dev@igalia.com,
	kernel-list@raspberrypi.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, soc@kernel.org
Subject: Re: [PATCH] ARM: dts: broadcom: rpi: Switch to V3D firmware clock
Message-ID: <2458083f-25a9-41a5-a2a6-2343e7402701@sirena.org.uk>
References: <20251005113816.6721-1-wahrenst@gmx.net>
 <9ebda74e-e700-4fbe-bca5-382f92417a9c@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uyIigU5Jew+IUWXr"
Content-Disposition: inline
In-Reply-To: <9ebda74e-e700-4fbe-bca5-382f92417a9c@sirena.org.uk>
X-Cookie: How do I get HOME?
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


--uyIigU5Jew+IUWXr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 01:09:49PM +0100, Mark Brown wrote:
> On Sun, Oct 05, 2025 at 01:38:16PM +0200, Stefan Wahren wrote:
> > Until commit 919d6924ae9b ("clk: bcm: rpi: Turn firmware clock on/off
> > when preparing/unpreparing") the clk-raspberrypi driver wasn't able
> > to change the state of the V3D clock. Only the clk-bcm2835 was able
> > to do this before. After this commit both drivers were able to work
> > against each other, which could result in a system freeze. One step
> > to avoid this conflict is to switch all V3D consumer to the firmware
> > clock.

> I'm seeing the GPU start to fail probing on the Raspberry Pi 4 in
> today's pending-fixes:

> # # v3d fec00000.gpu: probe with driver v3d failed with error -110
> # not ok 1 +platform:fec00000.gpu=20
>=20
> which bisects to this commit.  I'm not sure if that's just a preexisting
> issue which is now being properly detected or if it's an actual issue,
> I'm not testing the GPU at all so I couldn't tell you if it was actually
> working.

This issue is now present in mainline.

--uyIigU5Jew+IUWXr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj/hpsACgkQJNaLcl1U
h9AMdAf/aU3Ii257L2u1kqcyUERQx4ZKdMtKxsYKCxqla7DPkzrEMiqFMlwLsBj0
KdRyRCklCX1o0DXb/evMro0kMjmVDKVFnUvofZqAzNn2yXNTmtl0sNtmDC6cP4cR
UhvDkCpM/eWE/A84r4i0SvX/cATbGIQ8u7dfGb6HWc2vNwuu1GpQMf/brOqkGEbB
84ELNH+hsji1BYetV+1cuE+7K6RnhfLkRtiArRuSQK2XcIv1SNmMzCgILY73b56Y
xdzjnCjFWpemIWP1ONuZEtttzqSn3YuEOashCmYPofVZB0TLeQTaSSUEBSNXsjfJ
hReuwEPZTI4FOERo3wcqn9roGDmdsA==
=vhsL
-----END PGP SIGNATURE-----

--uyIigU5Jew+IUWXr--

