Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CBFC5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 16:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8aoQP1ke55o7ZlnsPRPy19/NwxfeReydZilR+JtUt1E=; b=L+4uHbcysNsiR1U2LGo1EdGBws
	jc6oDjU1PvTJffikjTf14YyH1sPGFlyieaqls2UDtGgnpNjzj+rtssmBO0KLin/EbdBwBKH5XmobU
	h/+HAnPMdNnVsfWMJr1rhGGa27LpajZIZq3yI/W8Znn/BrtBZZCbWcczMd45brccv9bvBiWOTYfjO
	/brKtQew+IdF+9ijItIxJvn+8gYpXYj4tqQNxJDYhzLN0f49Uu7KbbnPyOJ2jUO99AsUezI6nbU4k
	sClYhgyd3mWT9WZViA+9ANatPm5HT9Efp+VTdiy03u3kRgRYJ4xbYstxTHKB3+qIEH+ckI0CtXgmw
	YTWzAkOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5Pf-0000000BsNf-0rdB;
	Thu, 20 Aug 2026 16:14:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5Pe-0000000BsNT-0DRt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 16:14:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 631434141C;
	Thu, 20 Aug 2026 16:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D767F1F000E9;
	Thu, 20 Aug 2026 16:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787242481;
	bh=8aoQP1ke55o7ZlnsPRPy19/NwxfeReydZilR+JtUt1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C6W12qPzFrERIpBztgTsYtgb3Uh69b9peGeyZF9Mbo541mJOwfc2j8pa9pHRTRRMN
	 r+/ogc9G45BbjsxnXG8gov3xHqiYGLGkJ5rKnR6S+a/inMCrhjlI6qn3xSU895nOnD
	 RhZQwP+F9VgF76i61o6Ve39G1WmiJLKHy4S4xvPmsN8ewPJ1m/NYm1Oj+W/Si8JvbV
	 fKo+qBD6wJgj2vdODMF7ciAno4vqJvz1gttcosT4j9e6FAL0GDfpa1dLdGh9cyQnTb
	 oF97ALgaSTOLk3zvyP5i+/QKHnb93IYlmEqMueUlxpnfpk6KaiR0W9J81J9lWanrcB
	 dKMuZWwaoPieg==
Date: Thu, 20 Aug 2026 17:14:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 3/4] selftest/arm64: Fix MTE prctl TAP plan
Message-ID: <d2ec01fd-9137-4c54-910b-e8b1f79baae1@sirena.org.uk>
References: <20260820153331.2448875-1-usama.anjum@arm.com>
 <20260820153331.2448875-4-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Zzm5Gqxb7iIxOy2D"
Content-Disposition: inline
In-Reply-To: <20260820153331.2448875-4-usama.anjum@arm.com>
X-Cookie: Happiness is a hard disk.
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


--Zzm5Gqxb7iIxOy2D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 04:33:25PM +0100, Muhammad Usama Anjum wrote:
> The MTE prctl test emits one result from check_basic_read() followed by
> one result for each of the seven entries in mte_modes[]. However, the TAP
> plan only accounts for the array entries, producing:
>=20
>   # Planned tests !=3D run tests (7 !=3D 8)
>=20
> Include the basic read check in the plan so that all eight emitted results
> are declared.

Reviewed-by: Mark Brown <broonie@kernel.org>

--Zzm5Gqxb7iIxOy2D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqHJ+sACgkQJNaLcl1U
h9DiEQgAhDv5tY97vPZ4VNlLZxKM+QVdGlhLUQV+Xw5939EP40d52n/RFYhwaQRQ
gv6YhqY38VwV6/ndUohwwrMbZm5XZh1gk+YK1FI2abn7GuAYa9mN6lfVGEjnqXJs
kA46IxRctrhTGVY52OOPiV2FRAGtb9jdtfdXv8Cy6o0wpXZi/aKm6rwQfybARHBj
F0rqHJff5IoIxszX47u/N/HIUOGLKKG5UigmzklTVpd0UoVwTwh1N0etkZExFtY0
/8OnNtvphgNzHHT/F9vNriKGFEkyARcIghWIDuFdy7k4hDt2wRz6MGBRE4TCCLo5
SapBsgoVvtHgdrzkR4Mz5NQVavo9Ow==
=yMPo
-----END PGP SIGNATURE-----

--Zzm5Gqxb7iIxOy2D--

