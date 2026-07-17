Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D454CC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 17:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ShA8ha2RsOTrblPpWwY1VDb8OkXyTZdwulAiu6ek85M=; b=yXOn7Y/vbnfhqclUVQhngQ9nw+
	qW/ToaqpJaLLRteXWhglUED45Hd/yTBMdROcE9qwVSVfDSOdf1AzdyUHe8xFEHyLU1mhZiLeOn/Qh
	vW2jCGG2UBvRzhN0tFQIXVcH6E3UEPnVh/DuXQYVZz0JgzuQvY5rRLYmPYEtEE+RJ5mJ3vjDiZdne
	tlUjlTRiBQ0psTLf181DSlaZFpZs+cqxHeJ+2wTvy4VYtAySmroYwxZLTj4efxjhmvpkfJS27xWVV
	6Le9P0LRBFvjyyZXUsxc0EpFV/T/sO13vc/bElCHsyQdYLTHK3qeL++nGPzCeJtcGVesDSCWgGy96
	tzHUct+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkm92-00000002qOw-09CM;
	Fri, 17 Jul 2026 17:14:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkm90-00000002qOX-1Mwa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 17:14:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 84F9660A6D;
	Fri, 17 Jul 2026 17:14:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B6AF1F000E9;
	Fri, 17 Jul 2026 17:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784308477;
	bh=ShA8ha2RsOTrblPpWwY1VDb8OkXyTZdwulAiu6ek85M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jka5/NwdvOlxJIwP2LdUA6w2WBo7YHmE+elR9r2+FEtwniYjcyJexTiVOxphX2jXe
	 gUa/ESM7HrtkpAeNqPGjg3W7XNJ/H9jE7yF1uSg0DkforttUjHNGLBwL72DdXHTUAM
	 HfojhPSmoZ9G81oM4qyyF+MAktY47TgHcPlUeIYRWLEEYGTDZ+gbW4ay4HeAEDEnJg
	 pA70r2uBcPgbnUkMk1w3OFecWpAmMAvasVjQtjWVQquE400P34qUVsewnoLEkO3Rwd
	 MnICcWAr3ed2w8npV4EKjtcDDnceQ/iwm7vfbQVl4DlV0QayHsQlYHyNeyN45GVJXJ
	 xuIcc0RJ12BnQ==
Date: Fri, 17 Jul 2026 18:14:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/defconfig: Restore built-in 9P rootfs support
Message-ID: <feec0cf1-2d9c-4074-a56c-ee91bee9080f@sirena.org.uk>
References: <20260716100243.1604526-1-anshuman.khandual@arm.com>
 <2fae9ef8-2ec1-48ed-9b25-8526db625732@oss.qualcomm.com>
 <cd8cc649-c4e9-4868-b68a-6a9de72b32fe@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wsbshrmdiP+ZxJyY"
Content-Disposition: inline
In-Reply-To: <cd8cc649-c4e9-4868-b68a-6a9de72b32fe@app.fastmail.com>
X-Cookie: Be cautious in your daily affairs.
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


--wsbshrmdiP+ZxJyY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 16, 2026 at 01:31:17PM +0200, Arnd Bergmann wrote:
> On Thu, Jul 16, 2026, at 13:01, Krzysztof Kozlowski wrote:

> > You fully control your software, so just build initramfs which is
> > absolutely trivial and we all moved on to that for arm64 long time ago.

> I still regularly boot KVM guests on arm64 without an initramfs,
> but I just use 'make kvm_guest.config', which turns on all the
> commonly used virtio drivers as built-in. I wouldn't call
> 9pfs root trivial without initramfs, configuring 9p built-in
> is already complicated enough.

> So I agree we don't need this patch, but there is a trivial
> workaround for Anshuman in case he wants to avoid doing this.

Though watch out for the fact that this currently disables KVM which
isn't so helpful on the multiple architectures that have nested guest
support.  I'll send a patch for that.

--wsbshrmdiP+ZxJyY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpaYvcACgkQJNaLcl1U
h9CRDQf+K1s1ACZMwVyZfy/tOmgrX1oNtzuiOrBuA2wF3OxkPirIIC6kBmbeQmvV
8gtU+Qpe9AlP8/8lfVQOG8VW70sQ1XtxHInm5a7UnbG+C4uuX5Qr9Pws/cfY6qUn
pG3FSY5dnI6/eIvWjCKK4ExeWywWJ12gihEmqrTq+/ast9Va38iU7eVsygsLFxpj
a8IqeYs4OqhFYsQeQg1C+LoNFGSfW0e1rXwLBekN/KC7CapvBUY9i4iHMbMHf9/P
RKqdmFCMYYhVW1hCzQomIFGD7eb62S1unrgr76HvAQ7RXBmmZgRD9G8CKRV1Sfqs
HGbmhzO/nEUeJQprCXIVu+ue0K4OYw==
=82O0
-----END PGP SIGNATURE-----

--wsbshrmdiP+ZxJyY--

