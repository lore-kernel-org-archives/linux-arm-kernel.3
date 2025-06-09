Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA41C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 16:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2g4US5lCKgmSBCmiKFgjXda5JAB+UbMpn/EsWWU+2Kk=; b=N6wsapdlDeR9vcE1eqFfHEPJ4O
	I1eIqYPN+Y2Ra+e/h7yI6et9s7WlFRTuwihqQ/vxsQIu5rs9ptG9p+b15I+M37fWi1UCczTTHN7La
	E/ZGURfralnvs4kGEB0gkxFug/Kw0LK4YDjMY+8JJtVyPRiNDaj/PvC3kcSFxumrUW0ndNOzNWN3d
	KoEp0aWRXj00fqetruQadsuBw+4hDofWOuEUxa9LtMYynASTEtM6zcdkwgU73i8p5snMjiuV6WIpi
	HMYbFW4TtKlECB5WyozyKzzw2GsUd3cDrKfP5rVKkd9UlF+AvSUVuWgiE6+9hD++PdQ1xB2dQFYgn
	17TsZS/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfGA-00000004eZC-1r2o;
	Mon, 09 Jun 2025 16:22:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOefJ-00000004Ybg-1IiA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 15:44:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5D6A6A4E4F5;
	Mon,  9 Jun 2025 15:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C83AC4CEEB;
	Mon,  9 Jun 2025 15:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749483840;
	bh=dUr9fbBYnK9U//jQ+GxgQ2ptP0b04ydOP1yvclyTkg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lk7f97wKxu94/wlyuKasXM1hTREHKY/GkC5ULdl3pQ1Wvrco6Pj2hMrEmZXuJfoGy
	 txUYIIRp7oWe339UGVzYmv/L8hkzWAo2Z9iKZN9pHaD6hSL7ud6E1PBgQby7DktJz3
	 /ZT8pRi+rVcuvkoE7kmJr7Yy37fnunMrTkPXKADoKXH2JhI6k/AdtGz99iBMzFqHyz
	 ss6TqnIK4eqPcnpcVciW8v4C9X1XfI/paZlmqaQzAU9SV0rJhJ0V36KHmZAxA3wHkm
	 HNGz/oAbjfoh1piQ8LTsWBXw6QNPS1yAMaPHo7D4/A9qcnMmwFsJnu8VyZp3ttT7O5
	 m9eRW1FEtcQ2A==
Date: Mon, 9 Jun 2025 16:43:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Willy Tarreau <w@1wt.eu>, Christian Brauner <brauner@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] tools/nolibc: Provide vfork()
Message-ID: <4a4ef323-25e9-4bb5-bde4-9ad740693246@sirena.org.uk>
References: <20250609-arm64-gcs-vfork-exit-v1-0-baad0f085747@kernel.org>
 <20250609-arm64-gcs-vfork-exit-v1-1-baad0f085747@kernel.org>
 <df6f5620-5986-4080-bb00-c7bee856bf66@t-8ch.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W3PoFoJBg17Z0HiP"
Content-Disposition: inline
In-Reply-To: <df6f5620-5986-4080-bb00-c7bee856bf66@t-8ch.de>
X-Cookie: Restaurant package, not for resale.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_084401_421054_000C522D 
X-CRM114-Status: GOOD (  13.69  )
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


--W3PoFoJBg17Z0HiP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 09, 2025 at 05:34:33PM +0200, Thomas Wei=DFschuh wrote:
> On 2025-06-09 16:08:56+0100, Mark Brown wrote:

> > +#ifndef sys_vfork

> This ifndef is not necessary here.
> No architecture has a special version.

Ah, I was adding it defensively in case it was needed in future.

> > +static __attribute__((unused))
> > +pid_t sys_vfork(void)
> > +{
> > +#ifdef __NR_vfork

> For consistency:
> #if defined(__NR_vfork)

Are you sure?  I'm seeing an awful lot of #ifdef __NR_foo instances in
sys.h - it looks like the idiom is to use that unless it either needs an
additional condition (with || or &&) or is an elif.

--W3PoFoJBg17Z0HiP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhHAToACgkQJNaLcl1U
h9Cb1gf/aGZPrO5RgRNjsY5LMdV3U7tfXkLGGF5tbdPIvxxy9J+B+H8Lr/OKF+QA
juIPb1wUYZ0eojfiI9JfA+jSuNBpnYxdjMBQkWxDeRHj+ilkNbA6jCDUQjCQJqxq
r+rBnVw0PxbXBqRZYuMISUZo3eiaK3sTeeD+nVe6UmUiOGFHnIqnJP0/iiMUobtw
exIZ4tQXGAttFhHv0yZhlkZ87miA3dA2amH63gC3ekoJUZXjIFx5bs/30c6oAMJD
NhicK4OfDsRIZ7d4OxKmw5cn40qXvaWwKcWg2ZvEov7suuLiyl4pwY8hP9kIYs4G
eSXUXn5w6QbJKzZYdkpmeaM07D5D7A==
=un9N
-----END PGP SIGNATURE-----

--W3PoFoJBg17Z0HiP--

