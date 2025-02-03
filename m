Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C674C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 21:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=poQ92LcpcXEaspRp/grbZSU2QATF1dA3ftvSiGMJuvY=; b=prdMRuz7TL9kSQpZCZvWnZIUvd
	Nw4WHNFsuVbkh+nt+CmIvtxRJ479jkQCKq/NoWo3rPci1pDC3xTqQspRSzpBVMVfKdD5XzqeXJdze
	CyY4zi54x9PV9gMV+eBhKSnxgwhWIQP1vShPZJulZQZpPZMpyW+OE9HCpu9cxgusodOtao4Gz85S+
	+ucRbe71SXov5yDgdjsb4ERCgIKBzSMPORwCitXrIMQdFUcmr9mPglgAaXB+4JyGv9YqGP0ChnvOb
	DEam9sJ23O+03Wiqd4hYJgKPJHPA8phDeCysDh4ZyEeARRcl7EyiReNqBHFJw5FXUaCDjZlhyifOG
	zV9wzgCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3Yp-0000000GbW8-41G6;
	Mon, 03 Feb 2025 21:00:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf2TB-0000000GUYW-2uHK
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Feb 2025 19:50:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=poQ92LcpcXEaspRp/grbZSU2QATF1dA3ftvSiGMJuvY=; b=Zd+GxzwxBdB2ErWztaSgJWsJlY
	/ro8WzG52md20YSmJdfNEj8j5KxAsSCYrAreP3FI/FT7RDbCWTcArukogOYDeddNl8O4oUDW0QTZ1
	iAFAHPbWC/CdNxkOHS454Ng06rv+bovONBGV4A8B8y1ooFTF4DP3Qq7DmT6eQhaczx32kYewn1lPC
	DLBW6Fo6NATtlue8H+CG6I4MkYmfQ7RhNpridrkkCiQCch1tsJb/dErHepRlkh2UOUOmwjuTBa01e
	5do4V4drHelyeBGrvKY7FdefoIgUBAX0/4WSsReYw7dbixvikK+qGHagxN7wk6xhLQzY4x1oW2RC5
	t/QHWa7g==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf2T7-0000000G9iM-3v38
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 19:50:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 99610A41CD8;
	Mon,  3 Feb 2025 19:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0FB8C4CED2;
	Mon,  3 Feb 2025 19:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738612250;
	bh=XGTTmaTbuMSIUnCt/V5Tc/8kvFz5nJOKfbKLcWa9s3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bAXZqrDiQryC0tZT1Jvjwk0Hug2a/rdR9Nw+kTstb0+BCXLrUOuSQbo1lVNQ2vmSi
	 K1tImNuPQdfBlAMkQL6jOnwINQ3bYRrRJT3pqTwxAwuS8kfwiNUXlcwlhNgNOLgj11
	 +MWeuhHdpwvVW+kzNtlI3ZE1qn26hGWUmJzyiNyyUVcp63QMwW3b+S0jmYc/5g4Ay2
	 tte+dvrLu3DOqnqk0g8fgdWQZpfjbS2KE7wNbHASFpK8NmqSwoCxbcwqIrK4IdMg+D
	 n8yL1s/oeiWuWMr66w06GKok5qw1gS8x8m4DJgyReEPoMOMWeR2ydjXhSHWq0NwYTs
	 D1QGf0cmG5mpg==
Date: Mon, 3 Feb 2025 19:50:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 09/18] KVM: arm64: Introduce __pkvm_vcpu_{load,put}()
Message-ID: <5ca7588c-7bf2-4352-8661-e4a56a9cd9aa@sirena.org.uk>
References: <20241218194059.3670226-1-qperret@google.com>
 <20241218194059.3670226-10-qperret@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ANfi4BZEZ3mG3n3g"
Content-Disposition: inline
In-Reply-To: <20241218194059.3670226-10-qperret@google.com>
X-Cookie: Happiness is a positive cash flow.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_195054_195458_A79CED41 
X-CRM114-Status: GOOD (  11.37  )
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


--ANfi4BZEZ3mG3n3g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 07:40:50PM +0000, Quentin Perret wrote:
> From: Marc Zyngier <maz@kernel.org>
>=20
> Rather than look-up the hyp vCPU on every run hypercall at EL2,
> introduce a per-CPU 'loaded_hyp_vcpu' tracking variable which is updated
> by a pair of load/put hypercalls called directly from
> kvm_arch_vcpu_{load,put}() when pKVM is enabled.

Current mainline crashes when running the arch_timer_edge_cases selftest
in pKVM mode on a LibreTech Le Potato board, with a bisection pointing
at this change.  The system dies like this:

# selftests: kvm: arch_timer_edge_cases
[  130.599140] kvm [4518]: nVHE hyp panic at: [<ffff800081102b58>] __kvm_nv=
he___vgic_v3_restore_vmcr_aprs+0x8/0x84!
[  130.603685] kvm [4518]: Cannot dump pKVM nVHE stacktrace: !CONFIG_PROTEC=
TED_NVHE_STACKTRACE
[  130.611962] kvm [4518]: Hyp Offset: 0xfffeca95ed000000
[  130.617053] Kernel panic - not syncing: HYP panic:

Full log:

   https://lava.sirena.org.uk/scheduler/job/1092083

Bisection log:

git bisect start
# status: waiting for both good and bad commits
# bad: [2014c95afecee3e76ca4a56956a936e23283f05b] Linux 6.14-rc1
git bisect bad 2014c95afecee3e76ca4a56956a936e23283f05b
# status: waiting for good commit(s), bad commit known
# good: [ffd294d346d185b70e28b1a28abe367bbfe53c04] Linux 6.13
git bisect good ffd294d346d185b70e28b1a28abe367bbfe53c04
# good: [6250ebe666e425e173df5e11e8a612d57921f48d] i2c: Fix core-managed pe=
r-client debugfs handling
git bisect good 6250ebe666e425e173df5e11e8a612d57921f48d
# good: [647d69605c70368d54fc012fce8a43e8e5955b04] Merge tag 'pci-v6.14-cha=
nges' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci
git bisect good 647d69605c70368d54fc012fce8a43e8e5955b04
# good: [13845bdc869f136f92ad3d40ea09b867bb4ce467] Merge tag 'char-misc-6.1=
4-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
git bisect good 13845bdc869f136f92ad3d40ea09b867bb4ce467
# bad: [9f10e7fb6a06bce4f81de5fd0f2f0390f99e89e4] Merge tag 'phy-for-6.14' =
of git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy
git bisect bad 9f10e7fb6a06bce4f81de5fd0f2f0390f99e89e4
# bad: [58f504efcda54a9079a38203acc088c3354aaa60] Merge tag 'tty-6.14-rc1' =
of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty
git bisect bad 58f504efcda54a9079a38203acc088c3354aaa60
# good: [a37eea94f775132866ecdd466fd88027d7125515] Merge tag 'sparc-for-6.1=
4-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/alarsson/linux-spa=
rc
git bisect good a37eea94f775132866ecdd466fd88027d7125515
# bad: [5e68d2eeac70978a06406c5b156815ceb00437f9] Merge branch kvm-arm64/pk=
vm-memshare-declutter into kvmarm-master/next
git bisect bad 5e68d2eeac70978a06406c5b156815ceb00437f9
# bad: [d0670128d42fa170bf8ba878cd23504c5c5cccc7] Merge branch kvm-arm64/pk=
vm-np-guest into kvmarm-master/next
git bisect bad d0670128d42fa170bf8ba878cd23504c5c5cccc7
# good: [c4a6ed85455979ef3fbadc2f1bdf18734b0ecea6] KVM: arm64: Promote gues=
t ownership for DBGxVR/DBGxCR reads
git bisect good c4a6ed85455979ef3fbadc2f1bdf18734b0ecea6
# bad: [d0bd3e6570aee42766e7bd884734ae078667ea1e] KVM: arm64: Introduce __p=
kvm_host_share_guest()
git bisect bad d0bd3e6570aee42766e7bd884734ae078667ea1e
# good: [5398ddc5c90bd418b90d859e9267aa39399021af] KVM: arm64: Pass walk fl=
ags to kvm_pgtable_stage2_mkyoung
git bisect good 5398ddc5c90bd418b90d859e9267aa39399021af
# good: [c77e5181fed54b25d489eb7d2ccb5c1c72a1063c] KVM: arm64: Make kvm_pgt=
able_stage2_init() a static inline function
git bisect good c77e5181fed54b25d489eb7d2ccb5c1c72a1063c
# bad: [f7d03fcbf1f482069e9afac55b17de3bd323b8f6] KVM: arm64: Introduce __p=
kvm_vcpu_{load,put}()
git bisect bad f7d03fcbf1f482069e9afac55b17de3bd323b8f6
# good: [99996d575ee69d4327bad98a0148729b73dde23a] KVM: arm64: Add {get,put=
}_pkvm_hyp_vm() helpers
git bisect good 99996d575ee69d4327bad98a0148729b73dde23a
# first bad commit: [f7d03fcbf1f482069e9afac55b17de3bd323b8f6] KVM: arm64: =
Introduce __pkvm_vcpu_{load,put}()

--ANfi4BZEZ3mG3n3g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmehHhMACgkQJNaLcl1U
h9DQ7Af+P8sebWSERdjUjYV29cH9b32wtbxJMRD1Dyu0ctLbCzNOmkbja6PAw6gg
WWur9Ds0FBcbMpWutMe3tQIF6r9ZZYobChRBsdqLRjz+hIwngMxicmhhM2vvXc7t
D4Z8ayasEqR7OjLfEHc+lnVsgYtaswDKQq0ABGSWJhEsBSnP45Z1qqslLxiqItUq
L2+OjIgJ0R95hsceAWbBaTmOVfzFhVHkABPqDIVLE/lWTWN+I24DABPW8KdnpGE3
L1D6Cdw2jz2Sbi1/wzs12TorVXKRUmfTPtQtcInQNSdW1RIXeFgtlEY8f2c9fexp
1aJFPcx2HxUBLJGMrnO6kx1IwN0xdQ==
=8hjS
-----END PGP SIGNATURE-----

--ANfi4BZEZ3mG3n3g--

