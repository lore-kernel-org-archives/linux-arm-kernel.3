Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42AADCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 10:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/jVV+BBxiEl5JO7kXaHcz2dOacakc5EkDpjTbukXxvQ=; b=YbBXRnC2nCU+iWEfhYg9pujsWz
	C8T8zcCmphem4xW7++PIIPY8DMcoQrqiwBMnm5Et+KbHf4oGpuvLHioQg/tir7yUM04otd2YVLYnH
	4JoSk1T8v6ZpUVQgKXIbZX6syiO8+B8KRzvRlOhGtYuC6e8fDUWqzCEol10KO/7TPFTfRMT8PRlXO
	Q2jgwdYnogebWCdLX89JGIpfUjM9gqgJ3P8D6264++4l7/70NXIYNJ7Nlkht/3nTz9aGF94r0XoEJ
	1j9FxR4WrTsx8bHVHI1YfZnkOyP6w+GZ/DijY/do/OVizhNp6JqO/LXSJTeg9XgllTPKe9TAuhfvo
	2JHDtt6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1Ls-00000008h73-1VAR;
	Fri, 12 Sep 2025 10:50:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1Lo-00000008h41-2uBg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 10:49:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B73A401A0;
	Fri, 12 Sep 2025 10:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A02B9C4CEF1;
	Fri, 12 Sep 2025 10:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757674196;
	bh=iXfdxi7NTU+LyAxuFNWMuc0/Yz4Vt7OLdRQgeuCuM5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G6HgQC33/g0o1mTr2TIiMT6vdS/Pq//5mMwW64MX6iHJlwTcIXmbHkFGVJlu01GDm
	 b4qXgljYTLIMDhZsMggj5tUNVtwJ0qoPOXFhhm+T9DsAU8CcETxwWRIS+WreqnXQCr
	 /mqHOtZqX4imM4LfGuEyi4Omdx6sbCI2gCxbYOWeSK3hDnPe7pIQKFwX4V7e0zKgP1
	 UbnEqrdG0rN4HSsO/pFUYWgFprl7Ytma8VTpvNuxSg4iVB8r4L9SOgjCIfzkwF60jA
	 4Em1eHMujCZjh6EHy6HKuuyR+ZcnCtKupHSSVgRdRYJ/PoVJeF4uW/IcWS3vBwlTq+
	 DiIGnXHL0NCXA==
Date: Fri, 12 Sep 2025 11:49:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	open list <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Ben Copeland <benjamin.copeland@linaro.org>,
	Shuah Khan <shuah@kernel.org>
Subject: Re: next-20250909: selftests/arm64/gcs/basic-gcs.c:390:30: error:
 use of undeclared identifier 'HWCAP_GCS'
Message-ID: <965c8d7e-c5f2-4bd8-ab7c-c3116632f015@sirena.org.uk>
References: <CA+G9fYv77X+kKz2YT6xw7=9UrrotTbQ6fgNac7oohOg8BgGvtw@mail.gmail.com>
 <1e331ebb-3315-4cbe-b194-ccbeeaded4da@t-8ch.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mSJ2Vs6vpLoMhbcO"
Content-Disposition: inline
In-Reply-To: <1e331ebb-3315-4cbe-b194-ccbeeaded4da@t-8ch.de>
X-Cookie: Your domestic life may be harmonious.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_034956_767613_51A3E36C 
X-CRM114-Status: GOOD (  13.89  )
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


--mSJ2Vs6vpLoMhbcO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 08:30:08AM +0200, Thomas Wei=DFschuh wrote:
> On 2025-09-12 00:48:47+0530, Naresh Kamboju wrote:

> index c99a6b39ac14..816b497634d6 100644
> --- a/tools/testing/selftests/arm64/gcs/gcs-util.h
> +++ b/tools/testing/selftests/arm64/gcs/gcs-util.h
> @@ -26,6 +26,10 @@ struct user_gcs {
>  };
>  #endif
>=20
> +#ifndef HWCAP_GCS
> +#define HWCAP_GCS (1UL << 32)
> +#endif
> +

We're doing that for glibc using tests because there's some unfortunate
interaction between including the relevant kernel header and glibc's
headers (I forget the details) which means that including the kernel
header directly conflicts with something glibc is doing.  For nolibc I
would expect us to using the kernel's hwcap definitions?

--mSJ2Vs6vpLoMhbcO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjD+s4ACgkQJNaLcl1U
h9Bt6Qf/XdB1JDZOdU6heyTp+JQNrJnashNYRH4Aes6zoMxSkpZXP6KwEVScZ33e
mWNgJ1qzjIKi2qhUvTekSbjjhORaUnZm66B5hJtRjAaeYCMd4zLsYoZmawMLWH5T
k8MhocrSVmo3wEqT+ng0zRP0EqmYWDMXXgEurrqyV4BD8x+RI7FW/wNamai1MJpR
QqzhPmHaVmd8Y2IG6r58wUY45CbkUVMj5jvgcFOmUQZacaqmf1SUJqYLT9HkDvxD
JTe57vBvdczjwbucCAzVuNd3jP0unRe65VryUr3sheZEfKWhN6tt1ZzGsRIAIFps
M2x66/eYmn1/M1/5G4T21mA5E+fpLg==
=b3j+
-----END PGP SIGNATURE-----

--mSJ2Vs6vpLoMhbcO--

