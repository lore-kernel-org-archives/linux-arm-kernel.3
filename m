Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D46CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 15:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6xrjUZaPkObB5e5LvGd2y7iteUF8K4EbZRVC2hY0NE=; b=Yxt87wE1OINGJF++fHW4rAa/CW
	Wv6qxOe6xILMJiA9dbMCSMTDMRNJ3+V/0pWExRc26QMMe0Ew9pWyZGz/fDODuD5QbK6POoru2+lHj
	PItqweivvJKcBkGuUVmZU5zKSZXSRas9GPH1h/2hQRryOuRTLK5icu0rUrBf/s2oTs2oFtziXSB2P
	S9AuzWDIW8Wyepts/EP+iZaevjeLiehIDzht1pi2+c7JDMKT/O0XmeafjLoc21uum08rdpP7Ehmrk
	AqjoLzd+PS4G+IFpoGqx26VvCceYFv3e+jUKLzVH4g2y1JmK7FQtNe2PtSri3ar0G0wgow299iMTL
	4Ij1B0FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2Ql-0000000Bz6b-20pQ;
	Tue, 10 Dec 2024 15:45:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2Pb-0000000Byr3-1KgX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 15:44:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1FA99A419AB;
	Tue, 10 Dec 2024 15:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73B8C4CEDF;
	Tue, 10 Dec 2024 15:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733845474;
	bh=QnOwJAo3qEIG/EbKUjinI5a+rADGWNu6gqAoQZuMGaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XbeFBcL2tSMPjXMptCmCaVOB45UyG/n/NNJfg9GgcAblNy6z3IZ1i4AAcF9jFw4oT
	 7LsYFW8RRzMX0sIATSoGaXFXOukkvT8+0jCmmLNUzaGC7o+y1UF3Ec/oBVnnuEdzeJ
	 1oGu9E8HvqOVzIWWVJtQFpYd36m/S7Ug9g1aR+J2ZOyGQKRvsmyFIvxyQkzhQtk2vX
	 ErJXZV+XXBRzX6NHFfiMPBj0M0ESe7Df0zZ0C++jArW8RIZH6RALH9o3I/qBK6bD3r
	 bRhlJ5IIt/uTUNRTXCrTyZ1ndSgF5nj94uHUDAkFaLcL1a4crOJHU+ZugniJ4JnzR4
	 bSvUuAxJ1vTkg==
Date: Tue, 10 Dec 2024 15:44:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] arm64/signal: Silence spurious sparse warning storing
 GCSPR_EL0
Message-ID: <20c12aac-193e-43ae-9418-39db1af4ede9@sirena.org.uk>
References: <20241210-arm64-gcs-signal-sparse-v1-1-26888bcd6f89@kernel.org>
 <Z1hU0Ii-Sm9NHnhj@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x8GGSUOpIkUcP8JD"
Content-Disposition: inline
In-Reply-To: <Z1hU0Ii-Sm9NHnhj@J2N7QTR9R3>
X-Cookie: Leave no stone unturned.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_074435_418852_86D07463 
X-CRM114-Status: GOOD (  17.67  )
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


--x8GGSUOpIkUcP8JD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 02:48:48PM +0000, Mark Rutland wrote:
> On Tue, Dec 10, 2024 at 12:42:53AM +0000, Mark Brown wrote:
> > We are seeing a false postive sparse warning in gcs_restore_signal()
> >=20
> > arch/arm64/kernel/signal.c:1054:9: sparse: sparse: cast removes address=
 space '__user' of expression

> This isn't a false positive; this is a cross-address space cast that
> sparse is accurately warning about. That might be *benign*, but the tool
> is doing exactly what it is supposed to.

The spuriousness is arguable, from my point of view it's spurious in
that we don't have the type of the system register we're writing to.

> > +	write_sysreg_s((unsigned long)(gcspr_el0 + 1), SYS_GCSPR_EL0);

> Only one line here wants a __user pointer, so wouldn't it be simpler to
> pass 'gcspr_el0' as an integer type, and cast it at the point it's used
> as an actual pointer, rather than the other way around?

> Then you could also simplify gcs_restore_signal(), etc.

I find it both safer and clearer to keep values which are userspace
pointers as userspace pointers rather than working with them as
integers, using integers just sets off alarm bells. =20

> Similarly in map_shadow_stack(), it'd be simpler to treat cap_ptr as an
> integer type.

With map_shadow_stack() it's a bit of an issue with letting users
specify a size but yeah, we could do better there.

--x8GGSUOpIkUcP8JD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdYYd0ACgkQJNaLcl1U
h9BJngf9EZ+7dJoTevRJcuZEVo+biv2jW0Dp3rEnaTFnZbcN3AmR7R4gFeuEdJIi
v2uoHPbHGqXQIjDpu52mNwGUFhzjUCb0TOyA1hxr1WEGdZIQ8hHbQv1FanC6G97T
MAb6MgA8xdc3KHhNO3RYYWHFkOBApX4FV/X8JLSfFWVuGkG1zSBbBK8lEIJZfQkH
bWrtDnX+7ySd9zUrKIq3BfInOwHwCH1EKcVd3Mi2pQL7AO1AJfKWSUVo1tiE+QoV
6YKXoMahnnkF0Af+fARiCpOXi4+5vg4kj6pBh48M2etz+AkTe0PsmaqBAbBgcXxm
JauRjQeO7p+2jj5Gu/3cd/aOQw3ozw==
=FjKv
-----END PGP SIGNATURE-----

--x8GGSUOpIkUcP8JD--

