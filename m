Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDF4CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 06:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYvlTdTkI8iTFk+/aWNvdop1BELaOWjR9XgqorfHy0o=; b=4V2sev58/ds4i1OVv08tgdvrXJ
	vrTEw2fBROgMuWyFsCFMU/G9ifyBEcxlV9DHFEEjyvqLXFPuClqR8OOcxlPol0Ax+PisOsNyAy/XJ
	6RkoMdyJmU+SgzvdcFfeedDxeiW7zDjZfVtePfw3tN8dyWdDnaPGkHxsoo8zb0KqLz2f5nRuSuofX
	qxXzACV/JyuD3oCYd0P5sN2lE0RMkGs2poYR3NTJ78QhNvDWeUu4uj6t/gEJpA5jZiZVavF+IK8WM
	dE16cOrruT6CI4E9UR+EwL5voSQJfHwCfEYqnn0gISwf9Tqe9blf+NiV10G+XQxNg522XOkI+BeP3
	UtJCmKgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ0wv-0000000DhEr-3bBX;
	Mon, 15 Jun 2026 06:37:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ0wu-0000000DhEf-0rXl;
	Mon, 15 Jun 2026 06:37:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 49904600AB;
	Mon, 15 Jun 2026 06:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 539C21F000E9;
	Mon, 15 Jun 2026 06:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781505451;
	bh=wYvlTdTkI8iTFk+/aWNvdop1BELaOWjR9XgqorfHy0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KWVdxXcMy5KN4BO2w3B22IRJrWNfqThxDyUC0W8HUkClZuh2P9N9iWaBPIZoBlaRt
	 boUKjMI3L5d9spGYBtbMPEIGbNBJE5swnZVzIYy/27dOv9HGs+M/7a9cxebTCsvk84
	 vJ9Mwq2PqNQ3q3zmKQFAZekSsQ9/Fa4iQc7mAkms/aSStQtJdzXrkjCAj5lgJmiE1r
	 EwMu4BrlqhYYlxZy0YuDxkTVikIdxwekAwj/Us+diEjiAc7i380cKyY0CWrfDUwOvS
	 RliT5chIFPkzKkYZV36iTCzJJR1EB2htPdsDeH4dYYCDEen4Mb6GQwL92UvXY+XUak
	 vNF6so87QfGjw==
Date: Mon, 15 Jun 2026 08:37:28 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: Andrea della Porta <andrea.porta@suse.com>, linux-pwm@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Naushir Patuck <naush@raspberrypi.com>, Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com
Subject: Re: [PATCH v5 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <ai-dNlC1_nbQTy5Z@monoceros>
References: <cover.1780670224.git.andrea.porta@suse.com>
 <f8dd46a553351adaf9d29fbba9f98e803b672fe7.1780670224.git.andrea.porta@suse.com>
 <0b6a7f41-b753-48dc-b46e-77aaf0e999f4@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ajhov2qxsz3lss5g"
Content-Disposition: inline
In-Reply-To: <0b6a7f41-b753-48dc-b46e-77aaf0e999f4@gmail.com>
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


--ajhov2qxsz3lss5g
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/3] pwm: rp1: Add RP1 PWM controller driver
MIME-Version: 1.0

On Sat, Jun 13, 2026 at 01:27:49PM +0100, Julian Braha wrote:
> On 6/12/26 15:01, Andrea della Porta wrote:
>=20
> > +config PWM_RASPBERRYPI_RP1
> > +	tristate "RP1 PWM support"
> > +	depends on MISC_RP1 || COMPILE_TEST
> > +	depends on HAS_IOMEM
> > +	select REGMAP_MMIO
> > +	select MFD_SYSCON
> > +	help
> > +	  PWM framework driver for Raspberry Pi RP1 controller.
> > +
>=20
> Hi Andrea,
>=20
> Selecting REGMAP_MMIO is unnecessary here since you're already selecting
> MFD_SYSCON.

IMHO selecting REGMAP_MMIO explicitly here is fine because at least to
me it's not obvious that MFD_SYSCON enforces REGMAP_MMIO.

Best regards
Uwe

--ajhov2qxsz3lss5g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmovnaUACgkQj4D7WH0S
/k6rsQf/UOXqKwIUO7qhgK9i5TY4JtULpUGRl6MSYUIchZKFq4oJExnI1G1PeqVe
B5QU11I7UGYCjLgU8TBxtxpajjDFLxl+9c9a+AgJNftMMlSXV4ow8aaE9f3ejLFd
71RW8KxSTWSmXioUKYFklPhx6PaKSaob6D3tE78UBsm95+m8RNQPGFNjus73flHZ
RYJU+Kw9oFjKhrYWD628kCEED5GjMK6xvExvq33NP6RNi8nFvsLlcB0kbC/89esk
SWE2CiR/4hGygS1KtKNMA9WjLxxVSCJWeWPv024Fb06m83lBiOJfImYHZyFt2PPQ
hmyOo+L9FLZ2rshpaiIaqAZgYZarhw==
=s2AI
-----END PGP SIGNATURE-----

--ajhov2qxsz3lss5g--

