Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0DBC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 14:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=waw2BSc2rK4fE6vHftqqmjjVsYKGU+32Y8VhnQZmzyA=; b=TUbAKNl/PGA485Ce3x3t3Io7Uu
	YFi6/IIed9PDFjOyiIF9IdRbggLgIumorALgy7P5OqewgUbGLLsgUp/7aNqYoHZplIZYiuebJJCdE
	XUcNe1RMBqL28D4uyoVh0I3D8ImcCvbS2K3SW2UydcwNXQwiRxdQ7MMm+e4LGok2fyITYJTrE3noI
	5rWDVqJxcRG8Iux9pMKveQ1AXYBEao8leT4tbl8vFosDVs4ehElvViD0PEmE4dK7qt3NWB9Fq4A5d
	a3Ni4GfOvmkSp9zucfIjfHrE4RTojwZrfjKDcnNb+i3VEBiGdyZQHn/AbNvpL9Enw2eL8fldnASLJ
	On9TS9mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXqU-00000006AXy-1b5m;
	Tue, 18 Mar 2025 14:23:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXom-00000006ACf-1bpF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 14:21:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E1E605C0F79;
	Tue, 18 Mar 2025 14:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ADEBC4CEE3;
	Tue, 18 Mar 2025 14:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742307679;
	bh=Ih+kjkB7HKftfOjJe1nJYGQMWvErtDZ2Ypbjozb7+Yg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tTOZSFIYyX4n2viWiXOPRLbe7cOlKQoYEyx4++tXXnSh11s2TIgIG9lTrVI/dOW0T
	 CqNIrmtree5/5qmJp22ICP3ZbHhS79vd816AstF39zWWRz8skAc2mboh7dyE8lKRCU
	 BIa07t42gaVyx2LIG8htwSy8y7FiSwFDUqbDvlWWdw6TBJQyn+kYJG4iQs+wyOCz45
	 0/0C0XPuLXI+4wGkfq0GZ57h057HQ83ELNJERjyHuXMNaOizlrvqvzs8GDm/o0khpy
	 ciqrOrpMHNLOq2eJHUQRO/HYeg2yJLvpQcPyb+yjyjHsAPZNX6yKOiIMgn9KikRyQc
	 dCGwl0xt/RhxA==
Date: Tue, 18 Mar 2025 14:21:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] arm64/fpsimd: Avoid unnecessary per-CPU buffers for EFI
 runtime calls
Message-ID: <5c025dd9-8a4a-4ebb-a2ae-ef55538cd39a@sirena.org.uk>
References: <20250318132421.3155799-2-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D4TwUy0V5R+g16wD"
Content-Disposition: inline
In-Reply-To: <20250318132421.3155799-2-ardb+git@google.com>
X-Cookie: Swim at your own risk.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_072120_462973_51A86C0D 
X-CRM114-Status: GOOD (  16.80  )
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


--D4TwUy0V5R+g16wD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 02:24:22PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>=20
> The EFI specification has some elaborate rules about which runtime
> services may be called while another runtime service call is already in
> progress. In Linux, however, for simplicity, all EFI runtime service
> invocations are serialized via the efi_runtime_lock semaphore.

> This implies that calls to the helper pair arch_efi_call_virt_setup()
> and arch_efi_call_virt_teardown() are serialized too, and are guaranteed
> not to nest.  Furthermore, the arm64 arch code has its own spinlock to
> serialize use of the EFI runtime stack, of which only a single instance
> exists.

> This all means that the FP/SIMD and SVE state preserve/restore logic in
> __efi_fpsimd_begin() and __efi_fpsimd_end() are also serialized, and
> only a single instance of the associated per-CPU variables can ever be
> in use at the same time. There is therefore no need at all for per-CPU
> variables here, and they can all be replaced with singleton instances.
> This saves a non-trivial amount of memory on systems with many CPUs.

That makes life a lot easier all round, and like you say the memory
savings are nice.

Reviewed-by: Mark Brown <broonie@kernel.org>

> -		if (system_supports_sve() && likely(efi_sve_state)) {
> -			char *sve_state =3D this_cpu_ptr(efi_sve_state);
> +		if (system_supports_sve() && efi_sve_state !=3D NULL) {

The change does remove a bunch of these likely() annotations, though the
chances that they were ever having an impact seem minimal.

--D4TwUy0V5R+g16wD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfZgVkACgkQJNaLcl1U
h9CldQf9FlFtjzkirikfCb0Vd42eMQeijVyahtTwrU87pGcUvnxsvvAWDpXfP9G/
hWwlxfclGwHVdBTWm3gbvS/iuUTR8oL1SDlw9/dIPjgO8AWVsx62UWZGQjC0llLm
2ZIAlszTrGNMwuygljlt34KnKUucNXAis9CDXwfX+rfs2/SHXLH0YjBA390NqSUx
I3UJJvAJperIRdmf1fvGY91OZX4Hmj46NtOXOIcB53Edi0RPTGBEFe015XNLUOe3
CcHduHg2hOWWIPnoDk/6NxP1KbG6Z2yQ7fwwFRk37NFlg3stm1y1YozeqX3wtJLy
bybq3apM5TvtBtPrmfcCYYZnO6qEXw==
=tgZs
-----END PGP SIGNATURE-----

--D4TwUy0V5R+g16wD--

