Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90926C56203
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 14:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DrAD/l2W3pDFDdNotuFQKMEYng5kWHMdz+63uk2gtSI=; b=zHXfdH/28NPVRWA8ULBiIS0ZxN
	eeUyS3gXD1jxqMrYP50Q2EaYcG5iURYqA5nggJdWHkY/kGGU9jzxmjT6TDo1w9NI1qkKNbfUbInx+
	8ydyEPb0vRD7xqPatACZR6r33FT+v8pYu7sVtOFHUB9zbpTDFPbkvDnnRBnVmqbf8GgS3D4mfP/Mf
	fPuFWfmrOB6B8q/X6I1T6xppPLufGXKVX2AC+da6m/xRyk/OQaHNjw6VRjgrVVZJL5/lDWAEjrr5y
	u7kS8/3qDKj926WVhmDLAraOyfDsmkZOBC+Y0ON+XI5QkDLS/0bv++iwcpEmNYHtXz2jsvXH7SnyR
	qnpUyc1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRaC-0000000EqMx-2iW2;
	Fri, 20 Feb 2026 14:34:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRa9-0000000EqLf-3fYE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 14:34:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AA9B843D2F;
	Fri, 20 Feb 2026 14:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359EAC116C6;
	Fri, 20 Feb 2026 14:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771598052;
	bh=H2glgXGi8ew0rS095E/wPam+wCVqVDqHYxDUo/pLibY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YIkIxbaCExZRwhMTdU1+xIWwENavPq8JUigvddzjD0v4qDohg34NCh0OXEvkIk92L
	 Wic+51+wHJQbUBycjF8VNBJ898QyoXhVFeNXTnJKihM5rM/aBEnF8bG3hqLy76ZOTB
	 /S67buIP6307GuC/jmhjUuJ/3KxgjJ9rYhxB3+Aqqmy5r9WVUU6Gi0Y2YkUUlaolzt
	 SkizSBWdp3ddDKsAR88BFWn1l64Z+rDjDlRRL5BGjNSvAc60hqlBpjuQUaUh7R1UXZ
	 C+Q0ld4ZUKLeUU3n6sp70V6ENKZLUKeUtb2KW6djpckaCDxxSrw4Lap+YTJ1Qcij+r
	 JEVqWfh6wRMhA==
Date: Fri, 20 Feb 2026 14:34:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Emanuele Rocca <emanuele.rocca@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 3/3] arm64: gcs: Do not map the guarded control stack as
 THP
Message-ID: <18352353-8760-404b-a981-b0a5ac067b6c@sirena.org.uk>
References: <20260220140532.285011-1-catalin.marinas@arm.com>
 <20260220140532.285011-4-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X0wWBB44M07ApJer"
Content-Disposition: inline
In-Reply-To: <20260220140532.285011-4-catalin.marinas@arm.com>
X-Cookie: Booths for two or more.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_063413_929212_16ECF26E 
X-CRM114-Status: GOOD (  20.34  )
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


--X0wWBB44M07ApJer
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 02:05:31PM +0000, Catalin Marinas wrote:
> The default GCS size allocated on first prctl() for the main thread or
> subsequently on clone() is either half of RLIMIT_STACK or half of a
> thread's stack size. Both of these are likely to be suitable for a THP
> allocation and the kernel is more aggressive in creating such mappings.
> However, it does not make much sense to use a huge page as it didn't
> make sense for the normal stacks either. See commit c4608d1bf7c6 ("mm:
> mmap: map MAP_STACK to VM_NOHUGEPAGE").

> Force VM_NOHUGEPAGE when allocating/mapping the GCS. As per commit
> 7190b3c8bd2b ("mm: mmap: map MAP_STACK to VM_NOHUGEPAGE only if THP is
> enabled"), only pass this flag if TRANSPARENT_HUGEPAGE is enabled as not
> to confuse CRIU tools.

I agree that this is sensible however I'm fairly sure this will also
apply to the other shadow stack implementations so I think it would be
better to either do it cross architecture (ideally factoring this out of
the arch code entirely) or put a note in the commit log that it's likely=20
going to apply to other architectures.  There's a bunch of stuff that we
should start factoring out into common code now that RISC-V landed and
it looks like the clone3() stuff ran it's course, we should make it as
easy as possible to understand why any divergences we're adding.

--X0wWBB44M07ApJer
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmYcN8ACgkQJNaLcl1U
h9Bnugf/TbUwTzk0U7Rhn2LZsamhL6ANKsJx0b4VhUfl9cS4KcFcOp+0/blkOQgT
/u0UcMxm3qGeVmoEY1uX3f1pzyiYQND3zZNMim8fSRlPz4J6JgFNWBYNX+eHl9HH
KTDcAL2gr/zIsfrHql5xpvCS8m8QJAqZ7lxq8/moCKHNIQp5nXRdhj21pIU1NjZm
9UZYjdITZ0SLr85I2GOmsKdRMXp/tLE6oTVriRVjUBH2yZp+leEV4xhI/QrvFjRh
wc+vBPiKTSwneLqV+gg8i1mQObru38s5Tot/PatI6J2vDhLtsi6xwHFb1BuHbmCs
8ZWfpOqniOsoldS5fesf2nbAtHQWsw==
=MKC/
-----END PGP SIGNATURE-----

--X0wWBB44M07ApJer--

