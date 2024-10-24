Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE815CE8E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S4ma5PqzGpYXA9ZL/1yHMcqZGKkIrNKXr07w3l0E4I4=; b=dr1EbxbqqZ/g0BW/jEF4mjORtN
	mA/lHyKyRoqavar2mDxNhA+18qTaFEfyPsT8RfC2dEhjB5oHfObCNS60aYZ//4ZK641/BX4S2Liti
	Ulsa0wmEH9WUPdHgFeGIQ4DsPzUa2vRy8rt+ObDgBe25jKlH0XIAvW7AP21fzVyQ1tUU9g/KXvgHJ
	r0pjNLvxdM2U3K3c3vnH5d9PkyRSX/F6sE3VZtSbiXep+cexVwe1s17KZ0dgwD6/oS8JUfoHEaPOJ
	pEH9WYPLf2K7gT4TRtI1sM2R1ICvx+pw28mHFuo0HUUQPGYlviZHuV/k8LZQ9cPumUBLhbDQ8cdzq
	XTyx9NwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40Tg-000000013Mu-0c1q;
	Thu, 24 Oct 2024 16:14:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t40Rq-000000013Ce-08uf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 16:12:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E7C03A4289F;
	Thu, 24 Oct 2024 16:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE647C4CEC7;
	Thu, 24 Oct 2024 16:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729786347;
	bh=0pWcFGTWUI42+0oL/sufKdtun9LyhaKE0N8zfH69DyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TjUa+QWI0wYWVPm8j0H5EV4hvSZaacCpGkhrTBB32AASacSyvkL40+ypLJUwE1Zhw
	 46pIH0TScLjMczQR/PHzIj/UqZXWmV2WJAhZkkLDpsIBv7FTjR1QuPhSPDOUGrssXs
	 3ANBV1wxi/rxo6uEeZ9agrYpOxpjbH5KBgBqUaDNrSjah/cJo2f+cbPS14sQwnb2rv
	 QGfHOBX6HaKrl/RKbPVkSYCnj8d/VA1iZru5oGUBwzL4owFWLh/brIom/LonP+veIG
	 CRz3sgiWq9wXk4Bf3bUCwEhxlye2Mlam/6anHh6tDAvfZemCig2DEQuZGSO4u9mZ7l
	 J9aWAu0UchKjw==
Date: Thu, 24 Oct 2024 17:12:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>, stable@vger.kernel.org,
	Alexander Potapenko <glider@google.com>
Subject: Re: [PATCH] KVM: arm64: Don't eagerly teardown the vgic on init error
Message-ID: <3f0918bf-0265-4714-9660-89b75da49859@sirena.org.uk>
References: <20241009183603.3221824-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R3Gd0kDeZDpf0DlW"
Content-Disposition: inline
In-Reply-To: <20241009183603.3221824-1-maz@kernel.org>
X-Cookie: Absinthe makes the tart grow fonder.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_091230_272109_90663E02 
X-CRM114-Status: GOOD (  14.73  )
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


--R3Gd0kDeZDpf0DlW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 09, 2024 at 07:36:03PM +0100, Marc Zyngier wrote:
> As there is very little ordering in the KVM API, userspace can
> instanciate a half-baked GIC (missing its memory map, for example)
> at almost any time.

The vgic_init selftest has started failing in mainline on multiple
platforms, with a bisect pointing at this patch which is present there
as commit df5fd75ee305cb5.  The test reports:

# selftests: kvm: vgic_init
# Random seed: 0x6b8b4567
# Running GIC_v3 tests.
# ==== Test Assertion Failure ====
#   lib/kvm_util.c:724: false
#   pid=1947 tid=1947 errno=5 - Input/output error
#      1	0x0000000000404edb: __vm_mem_region_delete at kvm_util.c:724 (discriminator 5)
#      2	0x0000000000405d0b: kvm_vm_free at kvm_util.c:762 (discriminator 12)
#      3	0x0000000000402d5f: vm_gic_destroy at vgic_init.c:101
#      4	 (inlined by) test_vcpus_then_vgic at vgic_init.c:368
#      5	 (inlined by) run_tests at vgic_init.c:720
#      6	0x0000000000401a6f: main at vgic_init.c:748
#      7	0x0000ffffa7b37543: ?? ??:0
#      8	0x0000ffffa7b37617: ?? ??:0
#      9	0x0000000000401b6f: _start at ??:?
#   KVM killed/bugged the VM, check the kernel log for clues
not ok 10 selftests: kvm: vgic_init # exit=254

which does rather look like a test bug rather than a problem in the
change itself.

Full log from one run on synquacer at:

   https://validation.linaro.org/scheduler/job/4108424#L1846

bisect log (using a current mailine build of kselftests rather than one
matching the tested kernel to avoid the build issues):

git bisect start
# status: waiting for both good and bad commits
# bad: [c2ee9f594da826bea183ed14f2cc029c719bf4da] KVM: selftests: Fix build on on non-x86 architectures
git bisect bad c2ee9f594da826bea183ed14f2cc029c719bf4da
# status: waiting for good commit(s), bad commit known
# good: [9852d85ec9d492ebef56dc5f229416c925758edc] Linux 6.12-rc1
git bisect good 9852d85ec9d492ebef56dc5f229416c925758edc
# good: [a1029768f3931b31aa52790f1dde0c7d6a6552eb] Merge tag 'rcu.fixes.6.12-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux
git bisect good a1029768f3931b31aa52790f1dde0c7d6a6552eb
# good: [b1b46751671be5a426982f037a47ae05f37ff80b] mm: fix follow_pfnmap API lockdep assert
git bisect good b1b46751671be5a426982f037a47ae05f37ff80b
# good: [531643fcd98c8d045d72a05cb0aaf49e5a4bdf5c] Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
git bisect good 531643fcd98c8d045d72a05cb0aaf49e5a4bdf5c
# good: [c55228220dd33e7627ad9736b6fce4df5e7eac98] Merge tag 'char-misc-6.12-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
git bisect good c55228220dd33e7627ad9736b6fce4df5e7eac98
# good: [c1bc09d7bfcbe90c6df3a630ec1fb0fcd4799236] Merge tag 'probes-fixes-v6.12-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
git bisect good c1bc09d7bfcbe90c6df3a630ec1fb0fcd4799236
# bad: [5978d4ec7e82ffc472ac2645601dd10b09e61b0f] KVM: arm64: vgic: Don't check for vgic_ready() when setting NR_IRQS
git bisect bad 5978d4ec7e82ffc472ac2645601dd10b09e61b0f
# good: [6ded46b5a4fd7fc9c6104b770627043aaf996abf] KVM: arm64: nv: Keep reference on stage-2 MMU when scheduled out
git bisect good 6ded46b5a4fd7fc9c6104b770627043aaf996abf
# good: [d4a89e5aee23eaebdc45f63cb3d6d5917ff6acf4] KVM: arm64: Expose S1PIE to guests
git bisect good d4a89e5aee23eaebdc45f63cb3d6d5917ff6acf4
# bad: [afa9b48f327c9ef36bfba4c643a29385a633252b] KVM: arm64: Shave a few bytes from the EL2 idmap code
git bisect bad afa9b48f327c9ef36bfba4c643a29385a633252b
# bad: [df5fd75ee305cb5927e0b1a0b46cc988ad8db2b1] KVM: arm64: Don't eagerly teardown the vgic on init error
git bisect bad df5fd75ee305cb5927e0b1a0b46cc988ad8db2b1
# first bad commit: [df5fd75ee305cb5927e0b1a0b46cc988ad8db2b1] KVM: arm64: Don't eagerly teardown the vgic on init error

--R3Gd0kDeZDpf0DlW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcaceYACgkQJNaLcl1U
h9DxvwgAhRPO3/Xq4JlWVbJBTEKaksaqBrD5n9A/J+0OjI2tN9wWuwm5iY+MrBHe
A489my53v0OMHNw/cKBcd1dLpTuW/ZBLF0bC2GZr5sArJ5PpMw3G2Dju6vFBNo6w
M3mwkW2YR6WExTZ39NbNZNL2VrubJNb8jb57ww74hGw8lOoCDBZDX0Yo9lnd/UMf
Kiqlmo/laa+QNR5JkVket0P4p471WFhFTXr+jzbpFWG6mJoJxNBOFjYGVGtC9Qki
2C6r4d/4D+hN0iQISQS6CNFFhKScNxomyaUno9Fa4EdWDl0HZkcPWjrPq/cGXNyK
va9pUOXiVU98+2SGW8/0Ekr4AtlghQ==
=EFMf
-----END PGP SIGNATURE-----

--R3Gd0kDeZDpf0DlW--

