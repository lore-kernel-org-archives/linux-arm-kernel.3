Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C03E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 16:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+cJUiJj038UIYv7/f4a2tUHNdJn78yma3r2X1ZmrcQ=; b=dwOiBjGpBLCGEyOhFcPux2twmq
	0kZXILizOCND2GZaQp5B/UGd6J890/gSyRrz/jXNbYdIfCg26bpI75mpki9y7Eu2Gcx7iW5Fblw6S
	uV8Q00SdhbuOhU8OCdGZeV9sQzYEyet2A4zF1p0pnRXtuFF+y3ilkzWTIgL0aJFG6qneHwYirYTfi
	qzHXoQ5Go5gREp1LiYmkX3PH2VGlQuzkc/hZPjBdKQnsXzLVfx4tSciQT5nXMBwiJU1TOdfG1jTaK
	OEV1y8C7qXE1jlyAq8pZzZMDbexjBloG9KH7UF+9ExVsu1TG0cDTUS3nbA6W/mWmKFkq80mV/tVpa
	GZ0NxYfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3Xj-0000000CB2b-1Z5p;
	Tue, 10 Dec 2024 16:57:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3Tm-0000000CAJ2-3QrU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 16:52:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C7EFC5C5E84;
	Tue, 10 Dec 2024 16:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF91C4CEDD;
	Tue, 10 Dec 2024 16:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733849578;
	bh=bt7l9QQFX2W1SBnh7LutyXggXBhQo8Dk1+MzlBzfQjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ujJozhiHKizSCMhx02HN0yPwCGKv5N4q+Hf8gguWZaYdrJN3Th8BjVxC3EpCQ6I2N
	 NPAfxb2Mcttztz8xo1wjtRNrW0oao6+6jrtZlKLIq29pC9bwTTC2S9LgjaCbbSYn3u
	 O79g7VKiPAAwR/toZKo6uxrMWYTZmZ/Z+rpbb/JHxw0hzgD96aN7GuY+G8XQEKNb+5
	 up6UBRW6tBUTzdj8GqgpMY+7IWtgSuqiBZSyMF9st9buHicP7CiR76Iys5f7Hr1gzi
	 0V+3J1XjN3rLV/I5GsI6VEkenY0Kvrt7x7GoZ8AjYR120ggJmDwAqN2eWRTiLFjVir
	 c/P1YncOkq6cw==
Date: Tue, 10 Dec 2024 16:52:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] arm64/signal: Silence spurious sparse warning storing
 GCSPR_EL0
Message-ID: <6d839dfb-0a85-44c5-90cc-2b2426353a5f@sirena.org.uk>
References: <20241210-arm64-gcs-signal-sparse-v1-1-26888bcd6f89@kernel.org>
 <Z1hU0Ii-Sm9NHnhj@J2N7QTR9R3>
 <20c12aac-193e-43ae-9418-39db1af4ede9@sirena.org.uk>
 <Z1ht7X2LRw34pMJK@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4GnNgA4R5gHCruw/"
Content-Disposition: inline
In-Reply-To: <Z1ht7X2LRw34pMJK@J2N7QTR9R3>
X-Cookie: Leave no stone unturned.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_085258_941983_0FB53134 
X-CRM114-Status: GOOD (  24.71  )
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


--4GnNgA4R5gHCruw/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 04:35:57PM +0000, Mark Rutland wrote:
> On Tue, Dec 10, 2024 at 03:44:29PM +0000, Mark Brown wrote:

> > The spuriousness is arguable, from my point of view it's spurious in
> > that we don't have the type of the system register we're writing to.

> All that I'm asking for here is a trivial rewording; make the title say
> something like:

Yes, I had already removed the references to spurious and false positive
locally and changed the unsigned long cast to a __force u64 cast.

> > I find it both safer and clearer to keep values which are userspace
> > pointers as userspace pointers rather than working with them as
> > integers, using integers just sets off alarm bells. =20

> Having casts strewn throughout the code sets off more alarm bells for
> me.

With the new code there's only a cast when we store the value to the
register, which is the point where we're discarding the type safety.

> > > Similarly in map_shadow_stack(), it'd be simpler to treat cap_ptr as =
an
> > > integer type.

> > With map_shadow_stack() it's a bit of an issue with letting users
> > specify a size but yeah, we could do better there.

> I don't follow. The only place where size interacts with cap_ptr is when
> we initialize cap_ptr, and there we're adding size to an integer type:

> 	cap_ptr =3D (unsigned long __user *)(addr + size -
> 					   (cap_offset * sizeof(unsigned long)));

Ugh, addr is also not a pointer which I'd not noticed but still.  My
main thought there was to move the cap_offset change to a second step so
it was done type safely.

> I was suggesting something along the lines of the diff below.

Yes, I know.

--4GnNgA4R5gHCruw/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdYceEACgkQJNaLcl1U
h9DMnAf/e7GYV/9VWlVJj2n1GvhEBRh0aqm9VuM+yHZ2lZYm98Zl8gnxzmSS89+Y
VVinFBnogkqH1XWjjH+DFjROYIZROKu0hawHe4sLqcnGiaZL/zVMTIzL5fFKSR4e
xFYjXL8FPrXo7UHiNTlHn1s8EAjgnVDcC1so3Rz0a+ZBVlxNJoxFsiNmGssn/Cyh
88o4ig0epIG7cGSZA8PpCKqfzd0//27M/FZIUjd5dNMtMPiuG2486l28FwOx9I+l
+nGrB5vasHm8QXP+6SnG7zbAsCMoHNnsOGpZ+ECH1x+ce5WgYWVaJ6la3+sYDGgL
A0s2LZR4PuYO7ND3w4jLX/+edR//AA==
=p+xW
-----END PGP SIGNATURE-----

--4GnNgA4R5gHCruw/--

