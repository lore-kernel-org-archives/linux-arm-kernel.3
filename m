Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6609D606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 22:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yoHKl+I4;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UQh3D98n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OruVHMwaVYca+pt7spuiusVmVidIFTPZ1qPgeij7xYw=; b=yoHKl+I4c/HwyOjjga268KwQ+y
	jzmoqh7Cz+eJhY/599/JX36oQ2K8PG0QaO506n3ZDyXiEiqiqW3DYOQvTBKzpmLtG5SA8RPGt1c30
	ch8eunWmr5MeFAHFxShieIeyBURJFlkGLTgjpvouYgKQmh9CIOj6Wtv+hIbWnopSZH925U37oFj9f
	adltYb1RZtvtfDDA4U/owfVgekBbvQpHP2qcZJy7PCdUKycLB3ujeEAZoQHs5bC9WS7q44pbNuqc/
	txE/oQzYfzJwt+n1tBg9nVj0nJSfjGSicyq8J/8f03Xa5TB4r5XdZYztPGvYD0S1RomBDTToyw5Id
	MT4DhTzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMYjT-0000000ATx8-2tsE;
	Thu, 29 Oct 2026 22:36:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMYjS-0000000ATws-0JTs;
	Thu, 29 Oct 2026 22:36:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8DF5E600E4;
	Thu, 29 Oct 2026 22:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0901F01824;
	Thu, 29 Oct 2026 22:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793313384;
	bh=OruVHMwaVYca+pt7spuiusVmVidIFTPZ1qPgeij7xYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UQh3D98n2z0QrJMhUs8LDSx06tdIV+9WJNQ+utaqCcBNoc4roNiFGATOk5K+bo7Y0
	 EI6PX+xS7pZxQ1bLrse2E3AAciLkjGkcZHMd4rDrqeoVrRlGOytlvryol1bALpvuCm
	 bT/5qdbXFQKS7PBKHfK0XMc+dFmvjPSNzAT5dCTXZ19esJVmxhKf9uaJVy3YT3f4Td
	 YYArgjWsdE7xFbwDYG2+G87WjV7p9zkv/aNDRnY1Ldl7L7RbSgSZ4VIachMzUxiNYg
	 s+pDqETZeW1oJpgjtzaiSsLZcZdIDQEvgGk+m53Dr4OGpaDVYHjXnhIvRZaKefh5Cp
	 Zn3IWMp2PMAHg==
Date: Thu, 29 Oct 2026 22:36:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: =?iso-8859-1?Q?Iv=E1n?= Ezequiel Rodriguez <ivanrwcm25@gmail.com>,
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Deepak Gupta <debug@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 1/4] arm64/gcs: release GCS on failed fork
Message-ID: <94f6e809-2a89-41b8-80b7-5f580c154858@sirena.org.uk>
References: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
 <20261028154315.1272705-2-ivanrwcm25@gmail.com>
 <auOtXvGD1RHsU-dy@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zwt295GGKfUega3/"
Content-Disposition: inline
In-Reply-To: <auOtXvGD1RHsU-dy@arm.com>
X-Cookie: I have a TINY BOWL in my HEAD
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--zwt295GGKfUega3/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 08:32:30PM +0000, Catalin Marinas wrote:
> On Wed, Oct 28, 2026 at 12:43:12PM -0300, Iv=E1n Ezequiel Rodriguez wrote:

> > x86 already does this via exit_thread() -> shstk_free(). The separate
> > x86 TLS leak is different: copy_thread() itself fails after the
> > alloc, so copy_process() skips exit_thread().

> Is the x86 TLS leak relevant to arm64?

That was in response to me querying if they were affected on prior
versions I think.

--zwt295GGKfUega3/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrjymAACgkQJNaLcl1U
h9BBOgf/VWlnK4mad4KibAkY4/so13xBR4n7xrgeGHR8thlB1Mr/L+Scb+2iQkTF
g0qbnACHD3kfNuyiV+7rwrdLUBZQZ9ZnpUrXDepYI4uzbxXtCT16hivhz29nkUPj
1ZGIL1PspxrSro0U3+Jjrmfns/UIkk3AAjYyLTs4V5CPiBZ/k7UEuHjDhdm2qx8B
q/izPRgrgPzLJSiHiBtOJDnSmP61hTLL2y4NAc5e3BCirC/FkHzkF2drdCXb1wGD
X3iGddlphek6yNTYi8s4K84ArSD70/VNMzdf6vvNvPQwxvronfxBwc74HLk5O+zt
AMWfKkXv0N3FIhsJEKZKiJ6czwP6Nw==
=rBVK
-----END PGP SIGNATURE-----

--zwt295GGKfUega3/--

