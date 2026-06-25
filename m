Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2F7CDE001
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 18:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s6mEgn6hx3YYtG/JOj5EMTIBHv8Bw1q4wB55mfRavqg=; b=0uDNDNefVptEO/qmn7mpg5Uy0h
	zg/0WfbwP5dAQ5JE3FnHzO6VNXsgMngB4PNugZV8WliLMR4lUphe7vY+Zv+zbXH4IWcIx95qg8hB4
	HBmQmCwkHNlcfo6Itw71lrs8K4MIiQE12Ewm9R7cRgcMtcDnCzzdSIDK4lq1LL5or6yki3mBFd4Q7
	S6XiLVfd7vCJVW6hzbBvVXA2nzuN88bx+5XP2fG0KF9cFNBBYcYeStwO63lS6ddUK1QG/z/24RYlq
	43nJ1XRRWizJ1mhB11XNjW6xobZcVMdgYjVuj4AN11z2EdrRZ4NbTBIeW+5LN3FDxYp7jjCSSfGa9
	UkWJDMEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcodm-00000009fa9-050i;
	Thu, 25 Jun 2026 18:17:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcodl-00000009fZq-04j9;
	Thu, 25 Jun 2026 18:17:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 58FCB44316;
	Thu, 25 Jun 2026 18:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCEC31F000E9;
	Thu, 25 Jun 2026 18:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782411448;
	bh=s6mEgn6hx3YYtG/JOj5EMTIBHv8Bw1q4wB55mfRavqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HbAoazxd5IEBVgCuq1esnBFRb0rxwbOgFtOvpDC22TDW/dA6lIIsKk4y3t9hXfawo
	 Y4hOuh3r8nIOWOuqSw+CbZKMWBs5SJ/CsC7pbY1gNNGxCyKtV5kIEuwHDYHssbp26s
	 IrsWno0qqAR/rNoL9kBrLmKqLjHJk5pOYXFKcCGG2g3t88Ou0CywtQgMhE9plnUBCh
	 gP6vCiJODpDSuD2lwWmqWT3mmyDMWL7+GATbzrLxTjZA0wIOgdXUOc2cXzGGdCLrxM
	 pmkymEH0gEAyybeSggic3JE2SKJBP6bAANc2cvwSCwxfQYi9fuv4Q3za5usN461aT1
	 paDsizejtwYTQ==
Date: Thu, 25 Jun 2026 19:17:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: mt8516/mt8167: Move
 compatibles from mt66xx to mt6795
Message-ID: <20260625-unearth-suffering-e2c59d39da0f@spud>
References: <20260625104742.113803-1-l.scorcia@gmail.com>
 <20260625104742.113803-2-l.scorcia@gmail.com>
 <20260625-cameo-siamese-cd78c349519c@spud>
 <CAORyz2JHj7i6VhKom+tVd8PWBjM=TFhbr8-mOy3GH6eDYu4WPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e4IrXTl/Pn26GWFM"
Content-Disposition: inline
In-Reply-To: <CAORyz2JHj7i6VhKom+tVd8PWBjM=TFhbr8-mOy3GH6eDYu4WPw@mail.gmail.com>
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


--e4IrXTl/Pn26GWFM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 06:47:32PM +0200, Luca Leonardo Scorcia wrote:
> Hi,
>=20
> > I've not done a very through analysis, but this seems like a massive ABI
> > break.
> > The change you're trying to make here will mean that new kernels will
> > not work with older devicetrees AFAICT.
>=20
> Correct, that's the reason I sent it as an RFC (I mentioned this in
> the cover letter). I am new to kernel work and I'm not sure how to
> deal with this change. On one hand I am almost certain now that the
> upstream driver has never been used in actual devices, since the older
> code was only partially merged and also, as Sashiko correctly pointed
> out in [1], it had serious errors when matched against the data sheet:
>=20
> Sashiko:
> > Does this configuration cause a regression in pin multiplexing across t=
he SoC?
> > The legacy driver used a 4-bit shift per pin to pack 5 pins per 32-bit
> > register. By passing 3 as the width here, the framework calculates mode
> > offsets using 3 bits per pin. This causes pinmux writes to align with
> > the wrong bits and can overwrite the configurations of adjacent pins.
>=20
> Data sheet here clearly shows 3 bits per pin are used to choose the
> pin function.
>=20
> On the other hand I know that breaking the ABI is a big no. But what
> would be an appropriate solution? Maybe duplicating the driver with a

If you can substantiate a claim that the current setup doesn't actually
work for these devices (which seems plausible), you can justify changing
the ABI on that basis.

> different name, something like mediatek,mt8167-pinctrl-v2? Is there
> another driver I could have a look at to learn how to approach this
> problem?

Usually when making ABI changes because something was inaccurate (but
not wrong to the point that it didn't work at all) it's possible to
support both new and old ABIs at the same time because of new properties
etc. This is a difficult one because it's using the same properties in
different ways. A new compatible would definitely be required for a
genuine fresh start while retaining kernel support for the old mechanism
in this case.

But as I said, if what's in the kernel right now does not work at all,
then you can probably just rework in place. Your commit messages will
have to be very clear about why what you're doing is okay however.
It'd probably be best to try to detect the old devicetrees (if that's
even possible, will be tricky unless the devices you're moving are the
ones that need mediatek,pctl-regmap) and reject probe.

> Sashiko also pointed out some other minor issues with the register
> maps I already fixed locally after confirming with the data sheet, but
> did not provide clues about how to solve the ABI breakage.
>=20
> [1] https://sashiko.dev/#/message/20260625111629.6CD701F000E9%40smtp.kern=
el.org
>=20
> Thank you for your time!
> --=20
> Luca Leonardo Scorcia
> l.scorcia@gmail.com

--e4IrXTl/Pn26GWFM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj1wsAAKCRB4tDGHoIJi
0rCoAP4zcExKZkvJe5fjuE8AteJE2DILt37x+38necRJf2oztgEA9VoeHBrOzCjO
Af8S/cjdnOJ3G3AHEZM3GMutSHIMBwI=
=PEqZ
-----END PGP SIGNATURE-----

--e4IrXTl/Pn26GWFM--

