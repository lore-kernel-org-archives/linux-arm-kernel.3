Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AA8D5C0EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 15:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kNvCE5NE1w++YNzJaQ/ei9gGVgmfEl1ypo/XAS/wvrU=; b=F8gf3It57R8Rz7fJTfc0waGWB7
	QlWaRO/D9s8OWPPnDOHLSPNXVT8z0xK5vPwfcCosRNZVQ5C3fKeB1MrxeRmn0Us+tBHGcXIbsBzm7
	o3lIy8hJepaSOQerG0OaMct4CNmRdcFUElk5If8r01uOb32kxY8FoXw9wfK0+CX9sicQaiACTxLcl
	IuXZP+WHQnRSzBbQ/jAvX90w42SAL33iUiD15KPp6hhxKKI5P/TLH6KEV78hyhEI3N5qTVPpY0xmp
	eM1f+9a7XIPSo3kkuwsd8t9vbgtBzXPgJ0FexMAc3F/ZOSArJkjEBYahkmWsuVHT0831bLl8H3khe
	TB781qHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9R60-0000000B4Cy-3Fo0;
	Fri, 08 Nov 2024 15:40:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9QRb-0000000Aw55-3eUW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 14:58:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B71735C5B7C;
	Fri,  8 Nov 2024 14:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C94E6C4CECF;
	Fri,  8 Nov 2024 14:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731077919;
	bh=jujS6TcdXPOdfGkk9xmtfjYfLPjdbGSKT0owvz7WSsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ho6yILlHLvJ7XoyQfmnZ2LqtK8/5jEj4+mQ4uqi7un9CKLX+8sg2s1scE4mSwmcDJ
	 PxZxdYc/aye7SNp/VpCcJEFImw7URFfuWqfMitehn7QPXlpnZyAg9xN6uD8ITfc75o
	 BTX7RNrZwOyzN7qxilNeN8kROohTAHf4h0prSUow1VxQgwZ/szBO4wkgl1jQO2KPEJ
	 L//GptjEHXYw0NUFQPctnOVVk7h1BigJQ+gIBa6A0TIyZt15+G3u++/twyUNeH3ETD
	 ik5Zbf0KeTyD1g3uu4cKsHlkFrQGXP98gZzgMWjpy798Z/g2+zRDhOmTr3YJpg7Whb
	 d2ysooApkOLBw==
Date: Fri, 8 Nov 2024 14:58:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/4] kselftest/arm64: Fix compilation warnings/errors in
 the arm64 tests
Message-ID: <3f0b7891-7f67-441b-8ba9-ab302ac57792@sirena.org.uk>
References: <20241108134920.1233992-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0+KMOfvkan29Cw6V"
Content-Disposition: inline
In-Reply-To: <20241108134920.1233992-1-catalin.marinas@arm.com>
X-Cookie: Do not overtax your powers.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_065839_974109_335243A0 
X-CRM114-Status: GOOD (  11.30  )
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


--0+KMOfvkan29Cw6V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 08, 2024 at 01:49:16PM +0000, Catalin Marinas wrote:
> It looks like people started ignoring the compiler warnings (or even
> errors) when building the arm64-specific kselftests. The first three
> patches are printf() arguments adjustment. The last one adds
> ".arch_extension sme", otherwise they fail to build (with my toolchain

Unfortunately there's a lot of toolchain variance with these warnings so
a lot of people simply won't see them, you need a fairly fresh toolchain
to see them, and IIRC GCC and clang warn about different sets of things
too which doesn't help.  If you look at the set of tests you're updating
they're all fairly old so will predate the warnings having been added, I
doubt anyone touched them recently enough to see the warnings.

--0+KMOfvkan29Cw6V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcuJxoACgkQJNaLcl1U
h9AU4Qf/T0cpTyGvK9q5oQGeP1KN/h24qt3oFB/Gg4vEveomB39oGOuWLh0+sEC2
TQgDJTFbu1Pf7qYXBjvyiLXQaC8wKbaDroO/bbHHzxOKelDOLsw+2hHm2W34jfhD
FcVDAP8Tp0MvrWA0RB/yU58O9+UEGsnzbnwig/HT+lAeLpAC8p/7/0xeMGZJWsuF
LDirrv70ZRsNHI7LyHcTiZurfiwg5gFmTnQvOHzwmT9HM6bSh1WXdxQtqH6TRgvF
ujVCdNbmVYb4lmF/z8W8jC/bueyaqzDpAc0uhoHWHFvi/S/8VVBycRs20m0GTpwV
Z7/qhqakltR6iDsZOprngtDiEKD/lw==
=XZcB
-----END PGP SIGNATURE-----

--0+KMOfvkan29Cw6V--

