Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471AED0C600
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 11:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Cni+U9Ht3YIcjvI3tU8FsAPMkJqiUaLawl5zQliesI=; b=Go/pJvc/w7mQxkfuphI4EEXGLp
	yXg1CWNTdg1YUmanVOcqZ/FA+CbsmkA1H/5ASN58hfAWEf4ILTOngEjKLGcSYts4NHmYKkxlL4Rnv
	5zmtZ5Av3lTsNZPBZAalNnhoHWY4lHsVZDzP/d07mvl170KBkDaOrceuHs8pfqtigGWZBuaGq4mqe
	I68A7TSE6XiK67A0N+am8ebgx3yGCMQlFo34mWuSQJSp4rFeDyXMYJNarobuO2LVzmJYl1z/ZUs+r
	xqNSbGBhJOgCpQIeLN86tpEJdfXVuWSzmFxseA4KNdvDqblbf4hmRrC61hfofwo7cEXVy86gCCrbo
	5TatRAdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IDT-00000003SvJ-21vo;
	Fri, 25 Oct 2024 11:10:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Hxr-00000003QUn-3NiP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 10:54:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F0DE65C5F3B;
	Fri, 25 Oct 2024 10:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 220ACC4CECD;
	Fri, 25 Oct 2024 10:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729853682;
	bh=NMrbIE7m12dPqV1Z3n/gS0Txjw3cXnFgI8+kZXLcLB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R2whcWvDR/PCSSP4DjUDcLxYQdy/95WyWAkhc5q3+TQ6tALzqIP6huUkRUJCA0RUi
	 6T/DCTxM9DKTKhzd6/QegR6t07huOMNYy0cTugylMk9jyowm4Aj6pAwzZnNI9lR9B2
	 +NT8XthWH++muZKV+CNzrbc5W7b30PlegnbYiFxW5JVl99hyLpSkcxd5S6XnAKJTzt
	 kch6zq9zjDVBH1PPbUYnhzendmzxaeAr/0IWU7JE8VO0/+s/9AzGCxehHLhRno7N7Q
	 a3l7QQoCCLSlheLjBrhJPxAG56oRGBoNF+ykK7U7QD2UtHmMVV7fe8Qssn52NpPRgn
	 ZCkR+vgbEv8UA==
Date: Fri, 25 Oct 2024 11:54:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>, stable@vger.kernel.org,
	Alexander Potapenko <glider@google.com>
Subject: Re: [PATCH] KVM: arm64: Don't eagerly teardown the vgic on init error
Message-ID: <eb6e7e29-b0a8-47b1-94c4-f01569aa55cb@sirena.org.uk>
References: <20241009183603.3221824-1-maz@kernel.org>
 <3f0918bf-0265-4714-9660-89b75da49859@sirena.org.uk>
 <86ldyd2x7t.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f1SfmhQ4GPa7UgZL"
Content-Disposition: inline
In-Reply-To: <86ldyd2x7t.wl-maz@kernel.org>
X-Cookie: Often things ARE as bad as they seem!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_035444_003291_2820956D 
X-CRM114-Status: GOOD (  18.23  )
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


--f1SfmhQ4GPa7UgZL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 24, 2024 at 07:05:10PM +0100, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > # ==== Test Assertion Failure ====
> > #   lib/kvm_util.c:724: false
> > #   pid=1947 tid=1947 errno=5 - Input/output error
> > #      1	0x0000000000404edb: __vm_mem_region_delete at kvm_util.c:724 (discriminator 5)
> > #      2	0x0000000000405d0b: kvm_vm_free at kvm_util.c:762 (discriminator 12)
> > #      3	0x0000000000402d5f: vm_gic_destroy at vgic_init.c:101
> > #      4	 (inlined by) test_vcpus_then_vgic at vgic_init.c:368
> > #      5	 (inlined by) run_tests at vgic_init.c:720
> > #      6	0x0000000000401a6f: main at vgic_init.c:748
> > #      7	0x0000ffffa7b37543: ?? ??:0
> > #      8	0x0000ffffa7b37617: ?? ??:0
> > #      9	0x0000000000401b6f: _start at ??:?
> > #   KVM killed/bugged the VM, check the kernel log for clues
> > not ok 10 selftests: kvm: vgic_init # exit=254

> > which does rather look like a test bug rather than a problem in the
> > change itself.

> Well, the test tries to do braindead things, and then the test
> infrastructure seems surprised that KVM tells it to bugger off...

> I can paper over it with this (see below), but frankly, someone who
> actually cares about this crap should take a look (and ownership).

I'm not even sure that's a terrible fix, looking at the changelog I get
the impression the test is deliberately looking to do problematic things
with the goal of making sure that the kernel handles them appropriately.
That's not interacting well with the KVM selftest framework's general
assert early assert often approach but it's a reasonable thing to want
to test so relaxing the asserts like this is one way of squaring the
circile.

--f1SfmhQ4GPa7UgZL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcbeO0ACgkQJNaLcl1U
h9CYWggAhZeL7arTcbfSYjm9iBbxz0wTjV52BOyL0NAmhjGaHipkl/iNLk65tjuu
Ru0565ygr7xFQCbadPpkVsbn4KKaeHo+3cqtlPR45eShijH8TY81xIw8lp1uNYVh
4uy9zhIzL0YLuiXrpI+wQ/FW4C1bnXCh3CsBhm2SvPzZpj51nzwnZgEfROJ2BCPc
i75RPztWPmmce2XDSWLP/j967nI87+fhUdBQbjlRN82B0OHtNrAmXer5b6Qh17U0
YPKMiyGnUayJ5U/vTHngRy4cJGnaYmb1w/Vvst5SqBjmhwf9pPbZgp4oZf5mL9MT
8qxWB/NhANiYbf6pilkXli/hSwDhBQ==
=Bczd
-----END PGP SIGNATURE-----

--f1SfmhQ4GPa7UgZL--

