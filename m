Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4797ACD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 18:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CjmyUoSgWGPF4zvVWfGOycyI7trdqjygTmFFY0Eg8Ok=; b=G9W1D1r8ixefOQcmr9stETh8UA
	S1gY1ycR2jDDxkBwWOOh4+zDVZ8Z0XaLJODMOzzhPwqTcZslcTOPWkpFn5PBeot5RH9wkKi7E8srj
	ZrSFugsVK4FIWyWHRhxBox3B/qQdLJYSqsQCy5Frrc/gsfQ/bDTQUwCr6x2J7JNudsum28K0yqT6N
	thKx4g9sdWOuI/F01+nE/szLezaobzrCl4EiggiMEBdd3LBnlW++PhLhPtPTE8D0F/XjrTixIJpoR
	eRM7N86z1YqI+HcSqwuLHHyFZRqoWwnw5F+XAQCKIvLcP9KOkD2h1IYcChS2H66RmUH+eNcQlmgHk
	FbEvuM1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJbe2-0000000AuAr-0o4f;
	Thu, 13 Nov 2025 18:02:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJbe0-0000000AuAK-0lHa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 18:02:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 47F1A438A3;
	Thu, 13 Nov 2025 18:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B45C4CEF8;
	Thu, 13 Nov 2025 18:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763056923;
	bh=pefRbuYJ4cIwww2DTcSFGlDLKpPtGWwLfORT21um08k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qRYJZsx2w43hy0S+72gbKKMc/zciGp0kmjazlFFcrbx4ca7kWF2USySYUFmicDs/7
	 a4O8H2EMZa9pMbwGypr3qrmOCgzTS4X25nEI/JcGnuCT0kMf4QaE8HKf0CXCN2rmqU
	 RGvGNlwE1L2JLWVvWyBhg0+13XN6dHkbMP/9pCtr8viqDFhLBszebnitjHqMcE8WwH
	 FG2Nxsop+q/ZdZGgd6nUt7AOd5mFEL757RjwvHkaBDtN1YDK5lEl4/aEEtLg38IdZn
	 NMQvgwfLjOJZnysAhU7ttmwj6yqS1wgNmaYbIM/qbE2mAHSFBwuEYzeo/M37UJd9jC
	 52yHrUb4EvuEQ==
Date: Thu, 13 Nov 2025 18:01:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v2 04/45] KVM: arm64: Turn vgic-v3 errata traps into a
 patched-in constant
Message-ID: <72e1e8b5-e397-4dc5-9cd6-a32b6af3d739@sirena.org.uk>
References: <20251109171619.1507205-1-maz@kernel.org>
 <20251109171619.1507205-5-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4mHS3LPUsnt5TA9O"
Content-Disposition: inline
In-Reply-To: <20251109171619.1507205-5-maz@kernel.org>
X-Cookie: Live Free or Live in Massachusetts.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_100204_265854_9F5F495F 
X-CRM114-Status: GOOD (  14.97  )
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


--4mHS3LPUsnt5TA9O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 09, 2025 at 05:15:38PM +0000, Marc Zyngier wrote:
> The trap bits are currently only set to manage CPU errata. However,
> we are about to make use of them for purposes beyond beating broken
> CPUs into submission.
>=20
> For this purpose, turn these errata-driven bits into a patched-in
> constant that is merged with the KVM-driven value at the point of
> programming the ICH_HCR_EL2 register, rather than being directly
> stored with with the shadow value..

We're seeing the no-vgic-v3 failures in -next with slightly different
symptoms to those that were seen in mainline and fixed with Sacha's
change da888524c393 ("KVM: arm64: vgic-v3: Trap all if no in-kernel
irqchip").  That change generated a conflict with this patch which
Stephen resolved in what looks like a reasonable fashion tactically but
I suspect needs some wider changes.  The test now fails with:

# selftests: kvm: no-vgic-v3
# Random seed: 0x6b8b4567
# =3D=3D=3D=3D Test Assertion Failure =3D=3D=3D=3D
#   lib/arm64/processor.c:487: false
#   pid=3D2080 tid=3D2080 errno=3D4 - Interrupted system call
#      1	0x0000000000413d27: assert_on_unhandled_exception at processor.c:4=
87
#      2	0x0000000000406c1f: _vcpu_run at kvm_util.c:1699
#      3	 (inlined by) vcpu_run at kvm_util.c:1710
#      4	0x000000000040308b: test_run_vcpu at no-vgic-v3.c:124
#      5	0x0000000000402253: test_guest_no_gicv3 at no-vgic-v3.c:155
#      6	 (inlined by) main at no-vgic-v3.c:174
#      7	0x0000ffff9dc17543: ?? ??:0
#      8	0x0000ffff9dc17617: ?? ??:0
#      9	0x000000000040242f: _start at ??:?
#   Unexpected exception (vector:0x4, ec:0x18)
not ok 25 selftests: kvm: no-vgic-v3 # exit=3D254

Log showing the failure:

   https://lava.sirena.org.uk/scheduler/job/2079953#L2994

This is on i.MX8MP-EVK, 4xA53 and a GICv3.

No bisect or anything, between unrelated DRM breakage in -next and the
same test failing in Linus' tree in -rc3 which the kvm-arm tree is based
on it's a bit of a mess.

--4mHS3LPUsnt5TA9O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkWHRQACgkQJNaLcl1U
h9CkFwf7BHSBpu13Gl2dKmMGEJ2tarZfJaanGVTIuXwd3MufzE8sMiFiUs9RDduR
K6xSxs+YogP46QjHrhJn6PkamnE9JsJ7AWCbuf5mkw74ON7ROFXcuCqBXlSxL8w/
l2jFp2sBgQRLYhMPJAnrIoVDgRhmPfnHVtafsg4vutmLxRcN4+wOQuL21J578KDA
M2Id7VjL0JupztKELzp9pbVblX65VJgu/nFduWrn7qPbdtF5LLPvotyXRp0MoAHn
yb1RdvDkjyasDHHuJSMXtX1COI2oTRWgky2VifAh2gTLVtUy9GKQC+ki5pLGgehs
S+j6wno6JUxOJXzCBkr6A8pwb+3wtA==
=waEM
-----END PGP SIGNATURE-----

--4mHS3LPUsnt5TA9O--

