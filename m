Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B89CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 23:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CAWXuYCd4Mxit3stO2UaprvTXEITxr/acXPbIVjvyX8=; b=gXf7uITGxPILgmmjhh1vf1t9Rm
	kTvnmO23Qq6WLpP0hfXlE6dqG/8UlRSJBMFH4ypVsjxpQ4P1+Go+vC8z/V0RN7FZRFv75QtMXvmCn
	raz29CoQ4zZjz7rAbT4vUHyp9BiQh3ZqzShS8AJiDmcjOaELfljrqOtdgdr9pcC9m0e2bLh9APMQe
	4gETdLgpm8I8DIi42SgDDeHryRdk6WzEdY1JLHqhAWEZ9xUMxn6Q7FVzk2l0uRGZtROZUMs2xaUrx
	uoJxI/x4ypM5AubzAnDGW/515e1YHcFYyeVxLXoJN/fuPy7fVVdqiHUljLQJ7jSrTvu8Jj+aTEzL7
	OzZbWHOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upEWC-00000000udY-1fGa;
	Thu, 21 Aug 2025 23:16:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up9Hp-000000005oX-3vWs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 17:41:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9DFA843A65;
	Thu, 21 Aug 2025 17:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1BB3C4CEEB;
	Thu, 21 Aug 2025 17:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755798077;
	bh=CAWXuYCd4Mxit3stO2UaprvTXEITxr/acXPbIVjvyX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CSbKPInArKsR9+zoj4UVdZ1fiuC8qoawUivQ7VUo914bHpR6dD8zrXdynLRIBeBtx
	 fA52iZLeub51h9F9/xcAi8cObAX6dOJvr3KKR59D0dO/tG33Uhpe7WrbwL9gXlsMLf
	 wXfTYZH4VUbm99nmkl38U9XLgKR70fjSxGgWOPcPp4QQiTwciEC26zP6QmhFiT3ZZy
	 x101BoKJm6t3jkSwRywQbq8PhoUgWvbgfvdn7Ti0ElZr7H3YpQbz4VFQfCOMLMo83S
	 yB//WekiXgSGszYsHzpPMVkf8LDcBdKCUwgk9zfLtAIrGswIseK3Yzy0FL/6iBvnB7
	 S/TzldLgtuhAQ==
Date: Thu, 21 Aug 2025 18:41:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Willy Tarreau <w@1wt.eu>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 6/7] kselftest/arm64: tpidr2: Switch to waitpid() over
 wait4()
Message-ID: <faa9a64e-0324-4021-8cc3-ee7e88ae5888@sirena.org.uk>
References: <20250821-nolibc-enosys-v1-0-4b63f2caaa89@weissschuh.net>
 <20250821-nolibc-enosys-v1-6-4b63f2caaa89@weissschuh.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6VFHNtdRTkHby4tZ"
Content-Disposition: inline
In-Reply-To: <20250821-nolibc-enosys-v1-6-4b63f2caaa89@weissschuh.net>
X-Cookie: Warp 7 -- It's a law we can live with.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_104117_993631_8265EF7A 
X-CRM114-Status: GOOD (  10.15  )
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


--6VFHNtdRTkHby4tZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 05:40:37PM +0200, Thomas Wei=DFschuh wrote:
> wait4() is deprecated, non-standard and about to be removed from nolibc.
>=20
> Switch to the equivalent waitpid() call.

Reviewed-by: Mark Brown <broonie@kernel.org>

--6VFHNtdRTkHby4tZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAminWjgACgkQJNaLcl1U
h9AkxAf8DNXB1lNBp13/JD1lfTcxFMkTYH2jPiYINWmsx/3T8WKpgUKg/9EoTKwb
XHVd4bt+u5gN5OhBE1qKj8//1dBG7eWSvQ/WB9DltiVdLXP+6XxEg47j900N9Ie6
f0m0NiPISvpfWZkB/HorljMZeCd+sBqFs/aMBNJLbMLaHx2mqG289r+6W0tZV5AL
jLsvk9Ia+u4FVeQe3a4jrlRuoEzZzP6IvVsdcMtldsmxTe6vK/ZdLfRhVEOPXAlB
A9tPn6sAr8waVqRIPC14/KdIZkiB8P+Q2RJYZod5ax7pZZ+61nPLITRarj8ACiyL
+dVHJg5EOkBUAxetRbtgWyt4nFVN4w==
=wYJg
-----END PGP SIGNATURE-----

--6VFHNtdRTkHby4tZ--

