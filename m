Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78991CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 14:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/lwe4bBNGbmwOLj/aSyvSOfhYpsQSpCFu1iB10dYJ5M=; b=oIm6nhnryGkskXdqcXLSsLV+ZE
	cxDgUprjoGYnwL+0psW26Wqpr6bYIz7vTGHhScSj02ZjnUZjm1mlsZMG+iL311nsmS41QUgtJzjPr
	kc52ylDRflqOxHQRyNl/APN5Zx4xQG5eYKAEOdkrqN2ISeLIaLB+FY6sK+LBtEkg8YXne75hcB3oO
	ewkeaQKYdyqHp1A849VarHiEJQcXk1j81H9qVcHfmXW1nloM2ZaGdntlIFbdTGg7RGsEmVFtuFxVk
	vtKXRPnAzEHxrWNJbAMk9v/P4tVczXftdC3ANclFDe7+ixVP8k0/C2Gl+DYKRnjkOhmNRgEdo6AIE
	kcjLNaKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8g77-0000000Gda8-3rGi;
	Tue, 14 Oct 2025 14:34:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8g74-0000000GdZW-31Yj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 14:34:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E086443F0A;
	Tue, 14 Oct 2025 14:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11803C4CEE7;
	Tue, 14 Oct 2025 14:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760452493;
	bh=/lwe4bBNGbmwOLj/aSyvSOfhYpsQSpCFu1iB10dYJ5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jZbMVIs/IksDzior41uQK2lxjETy9hEn0Gk3zH9KaijQ77s67yqdhCQbyGHbfATTj
	 vA1p4I7opvaEfjIawS+/1fqltHOAXKaTuo7rh/gWcXITQn1arxpRnoUkEtj48XOqux
	 lt4GZaB+3ocBZ1Ana9y1vrz5R1dq1O3wjT8nrpPnNJXegsIL5YLzjaFHgo7Xf49Vg1
	 Y8NH5Ad2Aj71NJswQVcdOHNjTzicapwyoNE7OFpPm+RryOzytR6DI33WyzdyWeeedu
	 lhN3agIVA8vihVjwfVy5VhWdJjAHE8bHxVrJ5D4wFPkyYCz5VwLoMx7bnhXVsUUAqD
	 I3n7Oii7NWp+Q==
Date: Tue, 14 Oct 2025 15:34:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
	linux@armlinux.org.uk, Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kees Cook <keescook@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v2 02/20] arm64/simd: Add scoped guard API for kernel
 mode SIMD
Message-ID: <efbfbfcd-7d95-4e43-9865-78c8d9a8fd50@sirena.org.uk>
References: <20251001210201.838686-22-ardb+git@google.com>
 <20251001210201.838686-24-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="02Yxb3u4Ew/O+JwJ"
Content-Disposition: inline
In-Reply-To: <20251001210201.838686-24-ardb+git@google.com>
X-Cookie: Go 'way!  You're bothering me!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_073454_923828_06917BE1 
X-CRM114-Status: GOOD (  10.98  )
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


--02Yxb3u4Ew/O+JwJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 01, 2025 at 11:02:04PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>=20
> Encapsulate kernel_neon_begin() and kernel_neon_end() using a 'ksimd'
> cleanup guard. This hides the prototype of those functions, allowing
> them to be changed for arm64 but not ARM, without breaking code that is
> shared between those architectures (RAID6, AEGIS-128)

Reviewed-by: Mark Brown <broonie@kernel.org>

--02Yxb3u4Ew/O+JwJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjuX4cACgkQJNaLcl1U
h9BAAwf8CA3K6Ur/Nh5fwGjvhkHn3b4xWxNa4Hm11X9JbQjcJn18J8OEm1EM8j/T
+4t11OSLoOJ82for53Qq7/V++GamQLPEL91L2BFiVFTVPDW2YGP5vKnkVQaYoBuH
p4YtTN5YMQat0Yc3+jI2SZBOmYcNLjyw3LY9iagySCaG8iRzNppaSvxOZosBP+mv
RHovVCbiY2xy18tBr/VWPtZqVL6G+ZosUvaOXild/UEx/CpWu1v5kbfPv+hNjUI1
qXwl4+5LDNxDR4f/Zg+AUzA0BiUczGzlCCo1ZV3RaFCZIBoWa1TS5K0Yf72cONHX
9lc+3Mor7fhw7eOfDdfjvZ+z7DGVVQ==
=GLyn
-----END PGP SIGNATURE-----

--02Yxb3u4Ew/O+JwJ--

