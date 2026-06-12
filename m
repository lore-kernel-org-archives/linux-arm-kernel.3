Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DA0CD4F2C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 08:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uysIVLJZCztAEjwOmQ1P4sUtYrAXTBRfvn++kKXbr/I=; b=4G0MGoqrfFw7JnYDDaSAZnNxqY
	GOs8OlWSUlKr4OgHE8vt7tshQ6/nohtEtP/wxtFQmt/GQieqKtgWBhgTXnpQsvgoaGRO45X22tIkD
	EfOu75mHjqaFerUMtcwZ3iKe/oeFgPB3vklQgVJafg7R9etd8iBdxjKceAXl0LieripQEjv+4BCf6
	b5kGaubF4uv9s1b/JjQR/5qOZI3OMcMoncGvDpdXeFi4jTNon+UrcFAfy2NmldG80ZFRxamqGakpT
	DJYMesktpW8qh1DQ5FV4XS93I7OAjHwz86UyiUpU169ybcDPBfEoACzmXvpdmxL+AjP7wMZCICTBI
	iVZQCsHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxKY-0000000AaQj-3qtu;
	Fri, 12 Jun 2026 08:33:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxKX-0000000AaQb-1n9w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 08:33:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3CC536001D;
	Fri, 12 Jun 2026 08:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E86C1F000E9;
	Fri, 12 Jun 2026 08:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781253211;
	bh=uysIVLJZCztAEjwOmQ1P4sUtYrAXTBRfvn++kKXbr/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pclsxn2qV8+X09bknAUQ+SrEdIONPw23DIvncL0pKNQ6Lvsfnkie5q+iJBNC5tu+Z
	 0SgziNuq1XJ+JLTjJvFbGeL/fjiLeu2swLvvqbCCr+qqkahDHvz5r2i4AvaBc7V5wf
	 UHYboANEP6oQL0a0Y79g32gAMyDntBIyi60WpZjORQncNfU5wXLXS7Gt4niJ3TQRgP
	 vplhb78u06EcUozFmGQoXxOIlGrj/43+D2df+UuhkOwEU/903DodMxugcha/b7nqGy
	 U4GbjzXcppTMJ6Oi4+sK7R48rU3421nWbtzrJ2zobIsAsWhMIXY8Kbf3lC66+BNFXP
	 9yaZHSRMzK93w==
Date: Fri, 12 Jun 2026 10:33:29 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	Andrew Davis <afd@ti.com>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable dma-buf heaps
Message-ID: <20260612-indigo-sparrow-of-action-d2bcbe@houat>
References: <20260527084135.842736-1-mripard@kernel.org>
 <422d7885-67bf-485b-b2fc-f0604a2213db@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="k6fbkuxqftgx5kce"
Content-Disposition: inline
In-Reply-To: <422d7885-67bf-485b-b2fc-f0604a2213db@app.fastmail.com>
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


--k6fbkuxqftgx5kce
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable dma-buf heaps
MIME-Version: 1.0

Hi Arnd,

On Wed, May 27, 2026 at 10:50:02AM +0200, Arnd Bergmann wrote:
> On Wed, May 27, 2026, at 10:41, Maxime Ripard wrote:
> > Now that the system and CMA heaps can be built as modules, enable both
> > as modules in the arm multi_v7_defconfig.
> >
> > Suggested-by: Andrew Davis <afd@ti.com>
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
>=20
> I'd like to wait until we have resolved the build regression
> from the earlier patch[1][2]. I don't have a strong opinion on how
> to resolve it, but at least for now Christoph is asking to have
> your change reverted.

I believe it's now fixed, even though not through a revert, and is on
its way to Linus:
https://lore.kernel.org/dri-devel/c7a9dbb0-a5c8-4e67-904e-1a52b3de9bb4@linu=
x.intel.com/

arch/arm doesn't select ARCH_HAS_MEM_ENCRYPT afaik, so this patch can be
applied as is I think?

Maxime

--k6fbkuxqftgx5kce
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaivEWAAKCRAnX84Zoj2+
dhbrAYD57eZvBH+cq/9LQsd4gJLdQvbsUYv+8mvuMwFJqmH29XiZIYC2+xR9vKBH
kYgzUY0Bf3dDq0Lq213J5Koi7mI204icy6ip1jDzU6Gtbio65G6J5VFQUjBMY9yA
XCBekGbweQ==
=H72z
-----END PGP SIGNATURE-----

--k6fbkuxqftgx5kce--

