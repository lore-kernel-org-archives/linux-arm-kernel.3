Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DF3CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 21:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSyeYHQmZZ7wNP3F4o3DPNNkfAwh+uWUd+UPeikfXiM=; b=xOKS3qa+pxGTy51dCru7PCm2ck
	/m+vEdYdjKlJfw9c8sS0If4zqRkdyrOruhofutphRhLEmUIROQ5eTmP0PmtQxBe5gcIREPlUQUCG4
	hzm9uTfNJTqNssefs1zZNI13qpvlOJ7SLtCMQ1RDH7gTPzJ3Crk1LUPF1nIQ387PNOr0DW5urXlph
	TppTV9CAL4UFZonYujIbyNKvPAQ2MUtdRA6NgFimsvfVqZwH+UxhNblS4TUtBxgq6EqbzHP3kHG3/
	O2aXuD/iPQ3gw7iLUu8d0q7v8gPzc61qXeBLrNXQOxeUwYM+lfI8t6KK6abG9arPmI9xRDdPgyYfN
	Q4nkEzng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwoQR-00000005MIe-0PQL;
	Thu, 11 Sep 2025 21:01:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwoQQ-00000005MIB-0yks
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 21:01:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F745601DE;
	Thu, 11 Sep 2025 21:01:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B037BC4CEF0;
	Thu, 11 Sep 2025 21:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757624509;
	bh=TnKAQTc7XGro9Bv4vH66mq9n6MJAi4rgkbNv8BEGp+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AN10WaBmgi+RXVhno4BE+S55iu8EnUJWANOscD0dQ6FBxV/ctEQVofudWCJwFvmYz
	 yHPg5tSaSWUx6VV0B9WLKe/r1DEIB/s/ZQzAYrLYI+9MYzktAza/scMSJPqdAShmcD
	 FjvHHKPc2HInQOfx8yNRu5co5MSNyDCw1nlwlRtmn6mWypUk0rA041rgWjLVzVHzVU
	 qB+YNPEfYu7Nmx09q/in82XKv8qqYdWxMUGlH662MHmpSEY9L8iTa7ikRtEuayM39v
	 tIsr/voF7PQtSbBM9rqYsf0uaB8mQTyPY0bibuuwH4xta1CG8bj4iosC3tDqwWQIf/
	 5vtty7su7aKYA==
Date: Thu, 11 Sep 2025 22:01:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Ben Copeland <benjamin.copeland@linaro.org>,
	Shuah Khan <shuah@kernel.org>
Subject: Re: next-20250909: selftests/arm64/gcs/basic-gcs.c:390:30: error:
 use of undeclared identifier 'HWCAP_GCS'
Message-ID: <a275fc97-24d8-477d-b7aa-79c2d61d93ad@sirena.org.uk>
References: <CA+G9fYv77X+kKz2YT6xw7=9UrrotTbQ6fgNac7oohOg8BgGvtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vzK/nDSaTzO/04Bu"
Content-Disposition: inline
In-Reply-To: <CA+G9fYv77X+kKz2YT6xw7=9UrrotTbQ6fgNac7oohOg8BgGvtw@mail.gmail.com>
X-Cookie: Your domestic life may be harmonious.
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


--vzK/nDSaTzO/04Bu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 12:48:47AM +0530, Naresh Kamboju wrote:
> The following build warnings / errors noticed on arm64 defconfig
> with clang-20 and gcc-13 toolchains on the Linux next-20250909
> till next-20250911 tag while building selftests/arm64.
>=20
> Regression Analysis:
> - New regression? Yes
> - Reproducibility? yes
>=20
> First seen on  next-20250909
>  Good: next-20250908
>  Bad: next-20250909 till next-20250911
>=20
> Test regression: next-20250909:
> selftests/arm64/gcs/basic-gcs.c:390:30: error: use of undeclared
> identifier 'HWCAP_GCS'

This will be due to Thomas Wei=DFschuh's nolibc changes which went in
during that time period and did change the program to use nolibc's
getauxval, presumably that's broken with this clang version or
something?

--vzK/nDSaTzO/04Bu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjDOLcACgkQJNaLcl1U
h9BI/Qf9EK0NgoUZ4q96FEARPBhR/Va4JSSHIcl2WyWNfMuLGBi4fv3F6r3GQlnS
/pv7buWYB/3owgjNjmJTDIjTCuqoaGSyoAsIQJCac6gAi1Fn99E6XQ6fP8dGHNAd
A1H/dQsANu/5zzLxFZe2AHwBL9xrvWr55ZnhoL7R9C0eU+u3HbNzoiTr0sJvtOti
vxDis4GP1Jc2b7W9R/t9iE7czTRIDSM3CbCzWn4PwSm5AkifhWzvgV18719x+NQB
Sx/0X+5x2BcGr5a7RTc+3BhJvFg59eRvi6MrPHHTvGbebxSJ1Y0M6Jucix8WMQEI
oUOM7SJHlvm4AIZS+P2HD2EsCC5Yuw==
=zR3h
-----END PGP SIGNATURE-----

--vzK/nDSaTzO/04Bu--

