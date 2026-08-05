Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C4BC55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 15:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+WIUjDOLWA2cmNsrMJ3COyrPfHejs0/NnuALvN954yU=; b=AhqM07jHpenNvC+EHydwjznUgV
	EYr/NvsahI+0zDpR8IDNuzoNAE+8yXT9NDGS0uD2y6PZPJxfYQtEx+jySpyAojZIWFceLFNVhiQku
	GHnGu+KfMNKHO6W3g+ZULP/mAbqFYdg6mTNsim6wULur3NHGR5TYY5K2zUHVUZ/0TxJZ2fvmwbMb4
	7JpR0KkHcRztpi3HbmoW7/M65GxXuMeF+Tv5cMF4nIjkWCEzj+tpz9ZcJJNPpD2hUXe1zT4ZvRWWU
	i+SoqJfk7S9AjuLSNP22pymvENfg5HD3jjbmZOjdY6NrBTGUDB9LO3R4ii+xW4uwHD48xPsziaVL+
	G3xb8NnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrdAg-000000048md-0TE1;
	Wed, 05 Aug 2026 15:04:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrdAf-000000048mI-0DVi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 15:04:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 81E7842E9D;
	Wed,  5 Aug 2026 15:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4D81F000E9;
	Wed,  5 Aug 2026 15:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785942280;
	bh=+WIUjDOLWA2cmNsrMJ3COyrPfHejs0/NnuALvN954yU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bAawcvZDCXe2kUmxFtde0kLLp6v+k3gUDQVU/+tjpWkoziwMUz7ymP/z/AauaQFFa
	 pAQfjdFzJjaJH1L67n1PEEKqhHtGvXzrX93VIo/wn6x78fyTyyaI/UPBBgDOtuLHIB
	 Jc8mfZOyQCgRfRYj66Wv8+nbWfGL2Az6LwVlHon3d5IrXeBlCUjuOuAuoMWRYX0S8r
	 V28TeVHvkVay/dhARgUwXredKx9HGe6tHXwWzveYx/5Ip7djKJ8qTw1sYZXs5vIAfP
	 C1tN9POIqI2wiBr8vr4SYN2CVl/g4j0eHUMm3xdZ7tERcYxEiXFYJR0NZ39G9uJbR9
	 sIV0BbBpp+SvA==
Date: Wed, 5 Aug 2026 16:04:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v3 1/2] kselftest/arm64: Add seccomp ptrace x0 bypass test
Message-ID: <a9ef63ac-6012-4788-8fd7-5902b6448484@sirena.org.uk>
References: <20260728021122.2640104-1-ruanjinjie@huawei.com>
 <20260728021122.2640104-2-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dp8bJ/aSpXY72ubm"
Content-Disposition: inline
In-Reply-To: <20260728021122.2640104-2-ruanjinjie@huawei.com>
X-Cookie: Apply only to affected area.
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


--dp8bJ/aSpXY72ubm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 10:11:21AM +0800, Jinjie Ruan wrote:
> As Kees suggested, add a test that verifies that seccomp observes the
> correct first argument after a ptracer modifies x0 at a syscall-enter-stop
> on arm64.

This change is now in -next and is breaking the build on Arm's internal
KernelCI instance, the same thing can also be seen on at least upstream
KernelCI mixed in with extra issues due to what looks like a
missing/failed headers_install - I'll report the infra aspects of that
separately:

  CC       seccomp_ptrace_x0_bypass
seccomp_ptrace_x0_bypass.c: In function =E2=80=98do_child=E2=80=99:
seccomp_ptrace_x0_bypass.c:67:28: error: array type has incomplete element =
type =E2=80=98struct sock_filter=E2=80=99
   67 |         struct sock_filter filter[] =3D {
      |                            ^~~~~~
seccomp_ptrace_x0_bypass.c:68:17: warning: implicit declaration of function=
 =E2=80=98BPF_STMT=E2=80=99; did you mean =E2=80=98BPF_STX=E2=80=99? [-Wimp=
licit-function-declaration]
   68 |                 BPF_STMT(BPF_LD | BPF_W | BPF_ABS, offsetof(struct =
seccomp_data, nr)),  /* nr */
      |                 ^~~~~~~~
      |                 BPF_STX
seccomp_ptrace_x0_bypass.c:69:17: warning: implicit declaration of function=
 =E2=80=98BPF_JUMP=E2=80=99; did you mean =E2=80=98BPF_JMP=E2=80=99? [-Wimp=
licit-function-declaration]
   69 |                 BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, __NR_write, 0, =
3),
      |                 ^~~~~~~~
      |                 BPF_JMP
seccomp_ptrace_x0_bypass.c:75:16: error: variable =E2=80=98prog=E2=80=99 ha=
s initializer but incomplete type
   75 |         struct sock_fprog prog =3D {
      |                ^~~~~~~~~~
seccomp_ptrace_x0_bypass.c:76:18: error: =E2=80=98struct sock_fprog=E2=80=
=99 has no member named =E2=80=98len=E2=80=99
   76 |                 .len =3D ARRAY_SIZE(filter),
      |                  ^~~
In file included from seccomp_ptrace_x0_bypass.c:38:
/tmp/kci/linux/tools/testing/selftests/kselftest.h:64:25: warning: excess e=
lements in struct initializer
   64 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
      |                         ^
seccomp_ptrace_x0_bypass.c:76:24: note: in expansion of macro =E2=80=98ARRA=
Y_SIZE=E2=80=99
   76 |                 .len =3D ARRAY_SIZE(filter),
      |                        ^~~~~~~~~~
/tmp/kci/linux/tools/testing/selftests/kselftest.h:64:25: note: (near initi=
alization for =E2=80=98prog=E2=80=99)
   64 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
      |                         ^
seccomp_ptrace_x0_bypass.c:76:24: note: in expansion of macro =E2=80=98ARRA=
Y_SIZE=E2=80=99
   76 |                 .len =3D ARRAY_SIZE(filter),
      |                        ^~~~~~~~~~
seccomp_ptrace_x0_bypass.c:77:18: error: =E2=80=98struct sock_fprog=E2=80=
=99 has no member named =E2=80=98filter=E2=80=99
   77 |                 .filter =3D filter,
      |                  ^~~~~~
seccomp_ptrace_x0_bypass.c:77:27: warning: excess elements in struct initia=
lizer
   77 |                 .filter =3D filter,
      |                           ^~~~~~
seccomp_ptrace_x0_bypass.c:77:27: note: (near initialization for =E2=80=98p=
rog=E2=80=99)
seccomp_ptrace_x0_bypass.c:75:27: error: storage size of =E2=80=98prog=E2=
=80=99 isn=E2=80=99t known
   75 |         struct sock_fprog prog =3D {
      |                           ^~~~
seccomp_ptrace_x0_bypass.c:75:27: warning: unused variable =E2=80=98prog=E2=
=80=99 [-Wunused-variable]
seccomp_ptrace_x0_bypass.c:67:28: warning: unused variable =E2=80=98filter=
=E2=80=99 [-Wunused-variable]
   67 |         struct sock_filter filter[] =3D {


> --- /dev/null
> +++ b/tools/testing/selftests/arm64/abi/seccomp_ptrace_x0_bypass.c
> @@ -0,0 +1,195 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Test that seccomp, tracepoints and audit observe the correct syscall
> + * arguments after a ptracer has modified them at syscall-enter-stop.

> +#include <linux/filter.h>

The relevant definitions ought to be being picked up from here, there's
a copy of a current version in tools/include and has been for a while
(since at least v6.18) but there's no Makefile update to ensure that
gets picked up.

> +#ifndef __NR_write
> +#define __NR_write 64
> +#endif

That's...  interesting.

--dp8bJ/aSpXY72ubm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpzUQMACgkQJNaLcl1U
h9CC+Af/S2JNSN8xqScmGeETq+TDNtps1QwX8hARIuySbPHNluk7tHsqiDMKQISC
kk+xVbZRIisD9UZzbfCyfm4wH6ogqQ6aW5kpl1b2kD1GtbSoJX5Ky5OGveWJhCne
NOc9Wi3qbz+rI1NVUI6SRzlKbPunKDn0rzCKTtMYk2IQ2tsqHA+lyELuZAQAEScF
uCYkF6+61zw9Eo9EJEtw1Zwk0ZoyBYbVhuMiXKguVsHLJgCYzxTRFAvevw8bmMYr
KpSLNPMpnmgA1NtF1552/cv6Q+aR4QZqEDB219mbCvomjYdq2EUfwpapOBfE3a5b
rc3qgensNTkKuxz4i2/E73E3elUjfw==
=yow2
-----END PGP SIGNATURE-----

--dp8bJ/aSpXY72ubm--

