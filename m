Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A890CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 18:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDBXBPLLdLFjIbVXesOjP+mL7iQu3zixeHdviRbAGDI=; b=IjNyK7ywTzGaEWPhrM88T8KrNC
	aix+Td4zRiiUOrtK8HfuIX3c6+dc8aIzcL8nqNsK8c0TfnvbpVo4T0AliqARjq05MaPw4ebwAh2Jw
	IgjsqO9FqcwXHx4Z3t1NLycu4JA+FOn816mjYOvfZDc2Zi+UlAIM5z/e5Y3n9YqqvAhN1d5MU10vd
	vXnUxH+WNeoeQYUQvkVC5PnRbVM0vWQWzakJoMV/dwL0/LadXgf1prCYj2aqFCq9dFh+pGFD7dgZ9
	V9WY3XrOGXwJLeYeL7rg9IzjgK1VRP7Gg9tEXTHADV33ijDLRl+wxE7gkGojIIqdShPJqVeFiIZ1p
	5ayQoK9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDoja-0000000GVqM-2eNV;
	Tue, 28 Oct 2025 18:47:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDojY-0000000GVpy-1PeD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 18:47:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AF73F404CF;
	Tue, 28 Oct 2025 18:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C9DAC4CEE7;
	Tue, 28 Oct 2025 18:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761677271;
	bh=RtBcRPxs5jhSayr4jv2pJ0F4FPRtsp+bbhHwArcrVfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IrdQjSnk+vnBYQlVzJOVAV8zLP2mXcG7+J+nl7THYKhMc7Jf43ceP1I6NsbZdvEo8
	 m84ctVJxVGjZTerRPuWxuG/1Vqj1+/BPRKeg65hacDtsexMLi95z2G2WFb00SVFiGr
	 6X6WZuBSTmO51gL7GV7HCmeUfDREjvka+y4Iv8nUIWWn22Tc3IDdqefJzYcLhbFJZh
	 SsynXsWpYIhTJh5v8qNPhq9KVeDFNNL/jq6claAEG4Y5dxF7fBh2ffR9Re7zu+Nh+G
	 dnGmUtIHF1zHMxtSLv0983ptEowPqKPSfVZYMT7oy+PlPQd0nspEuFESWGqCbZBNtT
	 PYy6sIqjitHFw==
Date: Tue, 28 Oct 2025 18:47:45 +0000
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
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: broadcom: rpi: Switch to V3D firmware clock
Message-ID: <25e500c2-3dc1-476c-b6c1-ac4098a0501d@sirena.org.uk>
References: <20251005113816.6721-1-wahrenst@gmx.net>
 <9ebda74e-e700-4fbe-bca5-382f92417a9c@sirena.org.uk>
 <a5e1e279-7e20-458d-a75f-787e0adbc9fe@gmx.net>
 <ad07546f-0c2d-4bc2-b794-755b892c7328@sirena.org.uk>
 <a016e7e1-09f7-4056-a855-6cfaa8d51962@gmx.net>
 <10a4ef77-0e70-4ef2-b1df-535b476d256d@sirena.org.uk>
 <ecd75fd5-3131-4d10-ae3d-b6f608d9622a@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PD0E34RG+MWLrkEV"
Content-Disposition: inline
In-Reply-To: <ecd75fd5-3131-4d10-ae3d-b6f608d9622a@gmx.net>
X-Cookie: Your canceled check is your receipt.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_114752_439232_C40EFB53 
X-CRM114-Status: GOOD (  16.78  )
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


--PD0E34RG+MWLrkEV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 07:03:59PM +0100, Stefan Wahren wrote:
> Am 27.10.25 um 17:51 schrieb Mark Brown:

> > > Is there a HDMI cable connected?

> > No, the boards only have ethernet, serial and power connected.

> I switched to the same Raspberry Pi firmware 2023-10-17 and added U-Boot
> 2024.01 as second stage bootloader, but still not able to reproduce.

> Looking at the LAVA output, I'm seeing this as the very first issue(s):

> [=A0 =A013.480675] platform wifi-pwrseq: deferred probe pending: pwrseq_s=
imple:
> reset control not ready
> [=A0 =A013.489095] platform bcm2835-power: deferred probe pending:
> bcm2835-power: Failed to get clock v3d

> Are critical drivers like clk_raspberrypi and resert_gpio listed in lsmod?

Looks like it:

   https://lava.sirena.org.uk/scheduler/job/2017219#L1616

though I don't know what else might be critical.  Note that the probe
deferral sorts itself out, there's a check for any deferred probes
pending which passes:

   https://lava.sirena.org.uk/scheduler/job/2017219#L1677

> Is there anything special in the config.txt?

Not to the best of my knowledge, though I don't know what'd be special
and it's been some considerable time since I set the boards up.

--PD0E34RG+MWLrkEV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkBD9AACgkQJNaLcl1U
h9A5+Af/ThVnDEmyBERvHHXtD8jT5+qKB2bnXYO6OjMEkO8Fn05xHK7SAOGnN1aF
KsQMWRJpT3bM11qB4bhNL7AMCcNtIMNEwW1dh45et415h3seVMCLaUTgMuMHfo9D
ugCfXrp4BwDEb6ETPrqjKBxTCpeuXAl6my1ismHJ6VmHZpbE6O5Y0SeEV9j9KHgB
pgmkz8UXCWbHqlTDZhoIGh1FVvrYJ03cZJt0yFv02v2eUDFo0MNN9jwSS0MR4DtN
SrXvfcSuU/wpOrLCVS2xL6ulAqqV9jQH/8Dvt0zf6/Cc+iPmIGaPcgaMqylPSjr3
Y7jP4B6wEbpTDsX/e3BfM3uizCxZtA==
=ADDM
-----END PGP SIGNATURE-----

--PD0E34RG+MWLrkEV--

