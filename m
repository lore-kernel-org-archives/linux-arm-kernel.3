Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031D0E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 15:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OiyGwEploJpWK5LYAxMEo5MF9D7kstmyquVknK4+Ves=; b=3f+lQ+NdhAgWrvv8wdq1CiG6J5
	WVRlkG0fBFFpnekkAIyXPU1+B5nSpzYEMjXlPiA3X2OlA1atPjZWAq3pP65lY5IZi7YGKQXoJdobE
	Q1sE4dEnFAqJhC6UOsl0PK9i0uqYS55+gjuG7GNk/kq4wx1Y/rOje4wmxyiDtEpxT/o1wIOL8zqSR
	60ojTv0v+BuN9IwsPb0+80FMujiZkt+DcT1c7c//+Sjv2YGSrTPvJjdPmSsiDIoFT4Gmo4JmTzCJk
	yec6n5MBRDh9AaFMvx2NymjCOLyAD5b7z1DBZkJ/i6AiAj+O0K+BufA2R1BSBf3G1vzVJN0K19BAZ
	a2LJ1zIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZdF-0000000Dz4X-0Rcn;
	Tue, 17 Dec 2024 15:37:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZXB-0000000Dxt5-0afL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 15:30:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 808005C61F9;
	Tue, 17 Dec 2024 15:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 116FAC4CED3;
	Tue, 17 Dec 2024 15:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734449452;
	bh=CIAcHeU4KM0O0CufWD9C+h0Wc+x23DDtuyagNJApBrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fHdjj97sxjzlNB3JK2Jpom62ElP+sskc6RpMxqUzFdy1MJIU8pdwrzCKmlqTxphtu
	 wZZYcZTr+b2roHFxNbQJ4PO3P+qWN+wcxgmSlFv/7fCBKCCISumweHZYvtzfy56fcv
	 TlGM1WzXWB06WMZiqF6m+tDkA3B0QiN3mKueXZniKxvmIwVpupZMhQYe8L5hWnKxZr
	 KmnzAza4mhqx0NKquNEaPmQn9KW3m95hs8MnGP07ejynBmVLG+x3BwsxU4zeI3Vn6+
	 wT8rtjDt+H8xxJ4u63aivg44oL2q52v7ek98DnJJynhJrcBpiozTK2AGttBDSM8Zc/
	 XtEFj9XkVyyBg==
Date: Tue, 17 Dec 2024 15:30:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH V2 18/46] arm64/sysreg: Add register fields for PMUACR_EL1
Message-ID: <a442bca4-d1c0-4f3e-ae13-4836caec2da9@sirena.org.uk>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-19-anshuman.khandual@arm.com>
 <20241216231505.GA601635-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dR49XDTrrQMzBub5"
Content-Disposition: inline
In-Reply-To: <20241216231505.GA601635-robh@kernel.org>
X-Cookie: The sum of the Universe is zero.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_073053_217337_5ABD5EDC 
X-CRM114-Status: GOOD (  11.72  )
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


--dR49XDTrrQMzBub5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 05:15:05PM -0600, Rob Herring wrote:
> On Tue, Dec 10, 2024 at 11:22:43AM +0530, Anshuman Khandual wrote:

> > +Sysreg	PMUACR_EL1	3	0	9	14	4

> I already added this and various other PMUv3.9 registers you've added=20
> here in v6.12 and v6.13. So are you on an old base or the tool allows=20
> multiple definitions? If the latter, that should be fixed.

The tool is written in awk and hence *really* dumb so it's not going to
notice this, and so long as the resulting definitions are identical the
compiler won't either.  It would indeed be nice if the tooling were able
to detect this.

--dR49XDTrrQMzBub5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdhmSUACgkQJNaLcl1U
h9C1zwf/eDf1On3DPPEQMj1fRbUgVwTEP7S7Jc5mAoMoX8wBFrshSjIwgW9wg3B+
DS6A3ns+eySSevDhGpLNhRhuWchooLog1sTGI5O97W/nRI58uuoWyks9j3+AEVwz
ML8wD+D6C8gXRdid6N7Nd2zhiOFHa7A2L2KxDr0lxR3IrODIZKpgm3RhUo5v6jdy
OqLG2rOjBZVdK0wTiJyUwvYLMeNxu1Hc0d7qRfwHcLIVvUj5OlSxvZ3/YeYE0i8W
+0E8PlHFs7iRqOJ+vBpH8Ksp7SWkmwFNrT9yW/Qis8dJe3RwPmVLOXf6+prZNh9l
DRTSdF21zIoBq2h5t3q+3oCUyUgWPw==
=Opzu
-----END PGP SIGNATURE-----

--dR49XDTrrQMzBub5--

