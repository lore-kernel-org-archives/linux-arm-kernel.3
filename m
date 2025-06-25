Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397CAC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 11:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJdvpVITRwF2XMxNNMeLPGgw5FgCEDZPTublYeuAlVY=; b=XdgVOrE4W/W8E2HoLV0wLsvbzS
	tMAtYbpyxqJma7ahGy7VpD2UG4n8kX4QXz2j+NO7UjMxZ/mFM5YnXofjqktf08FF6ErhYFmCfAQA6
	WslJsq234S3pOPIaVUSZC+IhQH4ok/Dh4cYD5xS1EQ2yB2biRDe3y9dcPc00BFpLKUGAiFlUENPhT
	rTGzdgpD4G4oyYUNshfdYhPmiqRgtldx93hMUS/7XUI7yG5orK+cULWjSeypjwn1rmkM8Rd86hAG5
	d7c/5yRQNki8N5XCxVkxI0U5CW1sZHBYiQ+5tlt/EttiX0Tr8F/NRlv8fcVCIfhhWWWDtivq86RBx
	65KKWFnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUO3o-00000008RCZ-2aUU;
	Wed, 25 Jun 2025 11:13:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNJA-00000008IsT-3TS4
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 10:24:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QJdvpVITRwF2XMxNNMeLPGgw5FgCEDZPTublYeuAlVY=; b=AZsBDd6DK9VIw44F0bPBNpObtd
	mdl6E1Hwy7CYTblBoAT5vSdU1S9Fe8SUihkYuGPhb41UBTkJlSubqAiikxUxSux9ZMvUZXPKzlUIy
	BvyaMxP3yiqGTFfPSs1fKTWw+sOam0OPnH3XpcMA9O8SuSLvj4iEzCHrGkw2Bwb/j2QjfqtSyFaTi
	03GgcfE4TGULIiaC1aOjk15WrcmoyYWYg1JfbZEFP0shWl8Q1XbKhZzujhFDoS4SpCXJ7SjyZVT0e
	FOKO0gOu58D3PMBYnI132fjyznhogcCx5GtDilZMCUSsdzvkoY5q71/98hWo8t5+zzo/Dgv0HHzdP
	Od9WtzeQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNJ8-00000005mVa-0TdE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:24:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E98A49E2C;
	Wed, 25 Jun 2025 10:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B991EC4CEEA;
	Wed, 25 Jun 2025 10:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750847075;
	bh=jQKiZvyPyPPSuFSDfrH9+KNEHhw/SGeXba4D7QcIO88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E7kfdUAKilCSEJO33iTRF0Hck5tE46oWeICVFdeY6HhZK7AvRWfxk/Rw0Cl6uq0xa
	 0qOMYkw/ERvrz62II+mdfKWdJwni0MYFmlw/WGBKOe5KxowTLiYbV+0eYPT1QCiuFJ
	 N5LVaOM5AjPiCjYJMvv0UJ+82xMperwZlaYojEZjyB/URlhNK3vtC6AtR5Ig0WSR7O
	 lpo3oS0q06uKDvaGJPcA0JZe4TC30uYtqxuDxgCxl+qGt3iWMxc7l4Bw9kTYO4/lhs
	 32YZwf0in6VpXfY5MavxnvauIzv0FtEV1NSqtvZNpUxibd0o4e0PMwjaYGLjsiepMw
	 YuKiIopgtpWFg==
Date: Wed, 25 Jun 2025 11:24:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/arm64: Prevent build warnings from
 -Wmaybe-uninitialized
Message-ID: <dd3dee5a-b030-4658-8cef-c777928368d4@sirena.org.uk>
References: <20250625020138.3777454-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uTSVuHLcUzAyoEkz"
Content-Disposition: inline
In-Reply-To: <20250625020138.3777454-1-anshuman.khandual@arm.com>
X-Cookie: He who hates vices hates mankind.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_112446_382384_DF36A7A7 
X-CRM114-Status: GOOD (  13.67  )
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


--uTSVuHLcUzAyoEkz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 03:01:38AM +0100, Anshuman Khandual wrote:

> @@ -96,7 +96,7 @@ static int write_sleep_read(void)
>  static int write_fork_read(void)
>  {
>  	pid_t newpid, waiting, oldpid;
> -	int status;
> +	int status =3D 0;
> =20
>  	set_tpidr2(getpid());
> =20

This will shut the warnings up, but it's a bit of a heavy hammer that
means that the warning can never trigger warnings for that variable
being unused.  Is it possible to fix this by updating the control flow
such that the compiler can tell that the initialisation follows the use?

--uTSVuHLcUzAyoEkz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhbzl0ACgkQJNaLcl1U
h9Bc5Qf/W9ejrLs4QXMHndtRwtXhav2EyIBFrqlAGpdfTSQIyTff+wqdpaLDyMmR
ZmeGDrmoynYVNNalZNSICMSbUkLZFXSoO7J02n9wXXZTsHUaq+AOSatlg4cTRRQK
QavCYs4U6IrW3sz+31z8jLXv9RnGOCsZdLCLo7rpigfCgtVOEYdX4CyGDAkD5rus
x94lBlvq4OBAUw50U/UYZOaYMr25Ish02IHxQa1egeIS+mZE+ygBAB8mqcKa7hfs
z2Ub9sLvk/7JwfJy8wp8ADaMhpDHjbxVSx6kDOU3lsSVvL2drEQBUKee750BWDvj
2sX+mYH15Tg9qEnY64cdqqQ4WEPqhQ==
=lo/L
-----END PGP SIGNATURE-----

--uTSVuHLcUzAyoEkz--

