Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2A4C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 02:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBmmhQmBBl2iNbthNCOOWoEGUc+Dk0hMXoF3K6w1bYI=; b=nvqszsfUIaP+VsZconYGqjAUDf
	9Gv7F7GTsf3bIYPFC+Vqcq6ljvEbnK+gohFWVmOeRzgd2jY4zE91etUXua8gUf/VXTcfX7mQ5BR5f
	gvSvDVgboTjbeuJRi5G7OL6a1p8D5NnOKTQy0AhOSiZJ6J84a1Px7G3P7VhoWq3z8uNfn9PkdBQ6s
	Bxk4r36JlzoLWp59yS/cYPIC0nF8oDxaid/ShjssB3NDvLNt5nTaZYCuNqeQEhV+4tg630HNO0RT6
	TzUnI2Ln7N525iVwkVHpE9rjmtE9F/yITICKAUI8XIMP9VKtBhcU7UbzLuzAtdJXhxiXy1P1AGI/s
	CnIfcn9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYFJb-0000000DbhB-19a0;
	Thu, 16 Jan 2025 02:08:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYFIK-0000000DbWh-2Oyo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 02:07:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3FE8C5C5EAF;
	Thu, 16 Jan 2025 02:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D48C4CED1;
	Thu, 16 Jan 2025 02:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736993259;
	bh=bIQuumN+xjpRhSpU6FAGqXcZE4gaNsA+9AWnS+qkMag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VDdA4bhCaFQN938xyG5K9xbPX6zfaxxk3LYhilVx1siRD29CXojMrawd6ispSQjB3
	 A+mPYt1XYZSiEffkCYQ+gqgN/4Xpwa4TjhglNAhNKI3ljCfKoe8PGvY/ThU0UbcZhH
	 im6rJWL05Tl7HCWR77Xgo3kwxgYDrYNZieQzolvqPtkW6AJxQ4mMJThMzg4+rQcXw2
	 +FPvYGwMXjpTtWDCVeW9ETMFsia9dtRVdeMmFUN5s2D2zrycWXFGwkPaWSr3xo4ofG
	 tjd45TbCTNzz8UyZEULJnPKzLF88XzGRAvv8hwZqrk4Pzjd+sTlC5s+bpWEGAhrHEz
	 TxV0VZG+peRfA==
Date: Thu, 16 Jan 2025 02:07:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	maz@kernel.org, oliver.upton@linux.dev, suzuki.poulose@arm.com,
	will@kernel.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH] KVM: arm64: Fix the upper limit of the walker range
Message-ID: <Z4hp6L718H4v0pEy@finisterre.sirena.org.uk>
References: <20250114145050.563658-2-sebastianene@google.com>
 <14cce00c-29bd-4feb-b7d0-7aae6e948d1e@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NSco27IjI1efaI3G"
Content-Disposition: inline
In-Reply-To: <14cce00c-29bd-4feb-b7d0-7aae6e948d1e@sirena.org.uk>
X-Cookie: boy, n:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_180740_702164_086EC5CB 
X-CRM114-Status: GOOD (  13.31  )
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


--NSco27IjI1efaI3G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 01:16:40AM +0000, Mark Brown wrote:
> On Tue, Jan 14, 2025 at 02:50:51PM +0000, Sebastian Ene wrote:
>=20
> > Prevent the walker from running into weeds when walking an
> > entire address range.
>=20
> The KVM page_fault_test selftest started failing in next-20250115 on
> at least n1sdp and TX2 in VHE mode and a bisect seems to point to this
> change.  The bisect only just finished, I've done no further
> investigation.

We're also seeing pKVM fail to initialise on a range of platforms with:

[    0.156289] kvm [1]: nv: 557 coarse grained trap handlers
[    0.156984] kvm [1]: IPA Size Limit: 40 bits
[    0.182467] kvm [1]: Failed to init hyp memory protectionV

Full log at:

   https://lava.sirena.org.uk/scheduler/job/1067264#L743

bisect log:

git bisect start
# status: waiting for both good and bad commits
# bad: [e7bb221a638962d487231ac45a6699fb9bb8f9fa] Add linux-next specific f=
iles for 20250115
git bisect bad e7bb221a638962d487231ac45a6699fb9bb8f9fa
# status: waiting for good commit(s), bad commit known
# good: [7b90deb712bbacdf8aa1fc01bf155cab5c21d98a] Merge branch 'for-linux-=
next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
git bisect good 7b90deb712bbacdf8aa1fc01bf155cab5c21d98a
# good: [5f78eb69f34a94a82ff763b0eae49b6227b0b298] Merge branch 'main' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
git bisect good 5f78eb69f34a94a82ff763b0eae49b6227b0b298
# good: [825975f20474f1a6d68c0338d832ac5adaeed8b7] Merge branch 'master' of=
 git://git.code.sf.net/p/tomoyo/tomoyo.git
git bisect good 825975f20474f1a6d68c0338d832ac5adaeed8b7
# bad: [f8ea9541257c3f2de0e6024aa4f7f9b2ba374e9e] Merge branch 'usb-next' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
git bisect bad f8ea9541257c3f2de0e6024aa4f7f9b2ba374e9e
# good: [9b8df195bf092153caa81b40160a0f4a766471e2] Merge branch 'non-rcu/ne=
xt' of git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
git bisect good 9b8df195bf092153caa81b40160a0f4a766471e2
# bad: [24808e495053d0fe90b27eef1f0d3cc8a3db5445] Merge branch 'for-next' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git
git bisect bad 24808e495053d0fe90b27eef1f0d3cc8a3db5445
# bad: [a8293f931a58022b9e6ac7a45718bee25331cb87] Merge branch 'riscv_kvm_n=
ext' of https://github.com/kvm-riscv/linux.git
git bisect bad a8293f931a58022b9e6ac7a45718bee25331cb87
# good: [e880b16efb78f9c7449239a76814aeb015daf2a1] Merge branch kvm-arm64/p=
kvm-fixed-features-6.14 into kvmarm-master/next
git bisect good e880b16efb78f9c7449239a76814aeb015daf2a1
# good: [a1caf40a7a2c732cec1a33ec7e23d816e9103ac7] Merge branch kvm-arm64/c=
oresight-6.14 into kvmarm-master/next
git bisect good a1caf40a7a2c732cec1a33ec7e23d816e9103ac7
# good: [a066bad89c6c79890bb8f45aef8662dcd0562a62] Merge tag 'kvm-selftests=
-treewide-6.14' of https://github.com/kvm-x86/linux into HEAD
git bisect good a066bad89c6c79890bb8f45aef8662dcd0562a62
# good: [af79caa83f6aa41e9092292a2ba7f701e57353ec] RISC-V: KVM: Add new exi=
t statstics for redirected traps
git bisect good af79caa83f6aa41e9092292a2ba7f701e57353ec
# bad: [f922030f1c8541f76a103fee39ce38f15ba00c93] Merge branch kvm-arm64/mi=
sc-6.14 into kvmarm-master/next
git bisect bad f922030f1c8541f76a103fee39ce38f15ba00c93
# good: [36f998de853cfad60508dfdfb41c9c40a2245f19] KVM: arm64: nv: Apply RE=
Sx settings to sysreg reset values
git bisect good 36f998de853cfad60508dfdfb41c9c40a2245f19
# good: [0b7ff31fba40a61cfb341c8eea1540aaa6f256b9] Merge branch kvm-arm64/n=
v-resx-fixes-6.14 into kvmarm-master/next
git bisect good 0b7ff31fba40a61cfb341c8eea1540aaa6f256b9
# bad: [bc9e4ec6e98838314c07575a5fbc06755d21913c] KVM: arm64: Fix the upper=
 limit of the walker range
git bisect bad bc9e4ec6e98838314c07575a5fbc06755d21913c
# first bad commit: [bc9e4ec6e98838314c07575a5fbc06755d21913c] KVM: arm64: =
Fix the upper limit of the walker range

--NSco27IjI1efaI3G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeIaeUACgkQJNaLcl1U
h9DDcwf8CoifvEfmG8T8ErhKGZtOj8hgJelZjAQnp/ce1i/mYPONUNyqVLl/SOlV
fEPuwCPfA1WJJxHWyai3GP49IOz+jreud60UY7iLi90BrQsq0L8MWylAbPYuaDD7
4nshMYB54qixYY7Y87tK5EEI6s9Fgo3j0UHQ6QOZCvpbVP6VBVa/sVMuaXX8xOna
jVZX821RWimaa27qQTdVKp0GlxNnEu69ePwYHfbLIhgJYtyimfyJtitKYwvb9q1p
BruKkb79Gn+JqUu/angAeU2HxSZg7F01p3A+20J3vSo3I3FRl24+apzRNxawJqIt
7aAT6B59HjMImjY1mm4CKf4pcx8ouA==
=HvuH
-----END PGP SIGNATURE-----

--NSco27IjI1efaI3G--

