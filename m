Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB71E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 15:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YI3oGQ7vs2h9/hP9cweXHKZWPzAJTS24HL89TO1xJnM=; b=4orNGRq9gH/4VqEltBVQELBMKn
	uY6kTBOZuwc7Ux2dw50wPpf7ShJRpUOsYoujCUoM4vKgGWjOJ7KyuR/pds0H7ULfgG0rxDUbvsUQ0
	CdlkgsoiBQ+KxqZ2lPXo2xwd/6RIc6Hdlae7Cccajhy4D5xl9Y2ooC33/nlgrvhFhiOjcG7dT68xY
	TA86jOTytVZUs8/QukssyCWZEnGwJ+ZUhXTVDbpDgo86PAKDWhSVddu7nt9ZJju5aBWXU2Ksluoju
	MKwGDuwnCGPiIrMiH4/d+/mNkp7srl/UyTIq6DaipkfM2Nvoza1uDxckf5tlWXfM7QH6+j+a3X/56
	HSsBQBFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoun-00000001jyP-2zWQ;
	Mon, 06 Jan 2025 15:21:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUotd-00000001ji3-0feG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 15:20:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 96545A419D4;
	Mon,  6 Jan 2025 15:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C22C4CED2;
	Mon,  6 Jan 2025 15:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736176800;
	bh=UkdUQEPRT6i+uYaYiBtXiQpMuazGQOuxcBrbiT0G75k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FuzifQjTQOs1u1UrAgrBNuZt+jDfroiJRBhZHjDsp8pnecPNE187xQcU18Es8aPHJ
	 F7x5K3fqndbEPi1HLBklJDcbrkec8A1qFParGUziTh1dX9Zkc/4CkPXA1VhPNyqFFG
	 ZTSbGtPk2v6zRK1bq8JDhDEYwtq2TbIzQSCxp0CJsHLF3AT9mQpGWO3e4XcF4lZZOi
	 gI660hmJ9zoDoTWv+JFvQWP2QxqqZpNfCFkGoTptilObuoKNecei3MndNLaDHPomMi
	 JuYJak83wgku4GUXV41XqCxF1/XjQqL0aSyoWH/DTxTmxawJhkI0l4FUSZY8J3CKcE
	 ir11btL1tkdhA==
Date: Mon, 6 Jan 2025 15:19:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2] arm64: Add basic JSON register parser
Message-ID: <63543c41-607e-45cd-9266-a60838ff233e@sirena.org.uk>
References: <20250102144339.1564778-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tGudmCzAGUiaRC50"
Content-Disposition: inline
In-Reply-To: <20250102144339.1564778-1-maz@kernel.org>
X-Cookie: Do not pick the flowers.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_072001_261909_9D8A2AFE 
X-CRM114-Status: GOOD (  20.51  )
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


--tGudmCzAGUiaRC50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 02, 2025 at 02:43:39PM +0000, Marc Zyngier wrote:
> We currently populate the sysreg file by hand from the ARM ARM,
> resulting in a bunch of errors being introduced on a regular basis.
> While there is an XML dump of the architecture produced on a quarterly
> basis, the license that comes attached to it excludes any sort of
> open-source usage.

=2E..

> I completely expect this to quickly rewritten by people who know
> what they are doing (I don't) and improved as we understand more
> of the data model.

Thanks for jumping on this so quickly. =20

Reviewed-by: Mark Brown <broonie@kernel.org>

to the extent I understand jq, and it seems to be doing sensible things
for the registers I've tried it with.  This is going to be useful for
getting started and it's helpful to see the feature dependencies.  Like
you suggest it's a good basis for further development, even if we also
get some other tools that won't stop this being useful.

What I was thinking with this stuff was to use something like Python and
parse the files into data structures in memory before outputting them,
then we can hopefully use that for things like diffing two architecture
versions while handling cases where we've intentionally diverged from
how the architecture describes things.  It'd be nice to have something
that'd go through and check for updates to registers we already have
mapped and provide an updated sysreg file.  It might however just be
easier to use something like this and then work with sysreg files using
text processing tools.

--tGudmCzAGUiaRC50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmd79JsACgkQJNaLcl1U
h9CsDQf9EI7wJLaFHE50fuo8Q0mRKjG1NhLb++/W8L9uDimppvyXkjI97a/+gF99
UmA72J0MhrV7PkP2zkZN9+htNH8JxngA5nZ8wVV6mU+zVtQE5bjcG+KPfZC6sTw2
009e9Fn/E2Lzv+zRuByHwcv9U6bh/x1hI66aCqe5XmGgo877Ty19TuHHWqk5EiKO
BLHCmoho03JJKqQBHwiuW09LWPGSKJaOxXeoIS3cuaPPT6BqyOfQ0pJVWYXT3J/p
7gmsCwD5aUt1WUJAVV6OsCBptNKL521EmXu/XgqGaYDA0ob8InyTC3v/nhAd8+7w
Ec10RQbziCCknYNhcAXVnm2wezX7HQ==
=fiYP
-----END PGP SIGNATURE-----

--tGudmCzAGUiaRC50--

