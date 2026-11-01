Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85C3606A325
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 13:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J2XBu5hB;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dkJvDY39
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4FoSNuo4120zGj2L29GeDCwMhfV0RCk5eABERU3r5fE=; b=J2XBu5hBB80nTi
	wYCQbvCVDEuGUXDuZ5G3aWQ+C7x1pRjNfg6m+DUQQKoLSLYhtxPfCcjYfWndxGof6ft1K/oKphMgj
	hixGF/3LS3a5tnhu+mxJs3mvx3VPgejC7JnZnF8s5aU7QSrFV0j0XKC8ELpyDaxagdkZsvnmuEwFy
	extvRqOQcvDxKLoVkcYps3Z3UB08og9/syVrOf8Bs0ybYHu5/onZBRnixh9F6XsmOedJU0VYMvzk6
	3/dEulEOOfOnP0I/PKlEi1kJ0SWYprPg3m6CdcI8/bghvRUNGjhWjbo0n0GMSSIc7Z0Qe0kFyvaOM
	RL0XIjvGNhNhcqbpbSJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNVhE-0000000EXSN-2cdE;
	Sun, 01 Nov 2026 13:34:04 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNVhB-0000000EXS2-2g2V
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 13:34:02 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-170135e43c7so338596c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 05:34:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793540040; cv=none;
        d=google.com; s=arc-20260327;
        b=df20Gtex500dc5WeWwbLg9mn1bJrZK0kjmnzMP9mTqXP2RksbUWopZWTD5ArICKjy5
         FRK5OAdgSwQ4k8Teme/4Y7nQBUniOsI+/xocSnJAi/ukgUITeOnJ2XCru4jDNYFbAavo
         TMzfTP+fwlLBtWUOQzGkuHwqupbK4qTWjkhC31nyXZJvew3eCN6Di8eAXePaxq80SRCk
         ZnO+9+rWuNzBh9N5XDd8MOuDcoCEdpZJF9b0glFQllgg0wYsJv0sPt82aRzVsD4xdW7g
         36njK2+XmO5PcHhN2rsZOwMapneD9qqabqtGd18F9nXjJ/WZYAk9pNog/VjB7LK8UQSY
         ZScA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4FoSNuo4120zGj2L29GeDCwMhfV0RCk5eABERU3r5fE=;
        fh=0M32uPVRSgjGteE49t4fF6O/27QMnPP3BRIiW2rOH4w=;
        b=sFJM7KWi10cZCniDsnDiciYr6jy40O8c2YkVMK3nlAA/2g8pJx/9hrpsb0jxE7oVTQ
         iyQtapvwRHxxWzYxox7Zxi62Sd/oKGiuOYqF4f5bvMD+N1MT9C2H6ijEd4hBtkBVVahe
         JD/zwY3rpeoFHqFD51yKsQo/O5FE/qOgwuuqqhKJ5/2kv+wrFUCD7ufKSZbmW52sFF4N
         08IrLN9sp1jfhifl4rg6vzAvp0mZjU8FDyOSoq/9WISio6SMO/unym6W6Qipmmmm2ym0
         Rl9RdiOzmsndQtjpIXcrfteFoiXt32un4da8a8om/GG82+gsiSbudFJDqYGBhQoRiGoC
         euXw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793540040; x=1794144840; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4FoSNuo4120zGj2L29GeDCwMhfV0RCk5eABERU3r5fE=;
        b=dkJvDY397SmoWjvSDKBRjpZLsHNIzKhUYvoIF3P5oCdEM5LCm/jQgp01sZSvNb0jTV
         VdFPbqAaycgY/7V5V75nf7HdqrTNSxsfIekFscdpL452HRnS3V0F+VxG9bspb2UMHoqV
         p3PaOo8zUz9KCEmbSGnTm8b4nxdE2rjCtcr00uYvDA0vyiolT9j2yUTSG49VlvKxg2f5
         eWMahlSZLffySPwrTZbuXB3waGzNtCe8GvjfR6fyTqta03eZQ8sDeczZu8y716HXGeKX
         af3Fs6orl9qb6dv6LWJoVOA5EbjaACSXGiM0U0mv7Zc9vvpvFbqr4XDnCo2k8ztO8UYA
         Rc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793540040; x=1794144840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4FoSNuo4120zGj2L29GeDCwMhfV0RCk5eABERU3r5fE=;
        b=eqjc6RYF/Npwwv57lxnBQnUwlH72MN9+i9aJs2v46atEH8gvp9FpHwLClmYncz8DNh
         BvnCUbeV6Pv7PjLfSo08Ibp9fknI6kGobKK+1Xp6HLBPVY/ACoekVozuapqGJyCTLCoX
         EE0//lmT99qNSeTW0SEr1Z4YmzQenL4ZAhmEjrvN+RT5QANLAFAEtYlcVsd0j0HNYMfB
         AO7W1lffyPHmT//AQtL6Ui0IYeFDFonx2gMEdo9pHq1Quu61Feh6dRpJqfxN4clV4fEv
         7WNwu/uqHrlJO0KdjWG76RtN2OP98YdTeZJRUYShGLp6kAF7k/qk1dIWZZYcOF4pj5pT
         RxVg==
X-Forwarded-Encrypted: i=1; AKwUvBzuF+p3LCfnrTNUYaCs2EHv6ZPkajk0J/uFTB62HY8kKCVZwCjRaTiypwanfKPcPxxyPZwmWuiY6xzeFEW73qV7@lists.infradead.org
X-Gm-Message-State: AFq9FYL6INBbhwIA/4/NImU38qQ/yNaRjc+oS37uCLQNgxZNlIk2sxau
	lbZTmRHrpfkpm8t7tBianJ36rotUgcC6Eu3da/wFa5ys5qOiv4bwJYR9zkazot90BLnudwbYse+
	GdMCX+d9zPHMpyVnICsWCNZjp7hEisOc=
X-Gm-Gg: AYBFou2xQQzqcwIYGD3/EGHwkyMF/j3XwrgnFrWYhZsgs4InbIvMRZcPgxWdGESLP17
	Zc7vsz1VKKhukfBb91JAfj744w/6b6MU8p185h/2sKI9O+hksqaK6avU/a+2nT3oPQm5l0cfyiw
	jYBLVxUpAWOphfG2qJX4Sg4pX3t4OgjBxt/ktAiIsw48AfoqOIGgKx8dXvSfSZz5mknyKSWwkY7
	SJs7/C2I8sGk+eSR1Q0pPk+vg1CTL7paSJlZJ2q7cITyQhoZCN0aLwpFi6voJZxbsnaJ3xQlSs9
	yeZ76J+kB5EN+Z6Vh4LIjFliaK+V9MlkvgNlXxRckyJH1ENRJb+ew0HP5lopyjUOHuGno4aOySG
	4aPbsjn5yquIBbpPjrdNpVjWwK1DJ26zOOnuDStIoa/fuORurXT5Sk7zYiV1AanzCw17eErK9
X-Received: by 2002:a05:7022:b047:20b0:1a3:bfb6:44ad with SMTP id
 a92af1059eb24-1ac5da797d4mr12358096c88.32.1793540040375; Sun, 01 Nov 2026
 05:34:00 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260927131838.6774-1-demyansh@gmail.com> <20260927184414.6c0c8867@pumpkin>
In-Reply-To: <20260927184414.6c0c8867@pumpkin>
From: Demian Shulhan <demyansh@gmail.com>
Date: Sun, 1 Nov 2026 14:33:49 +0100
X-Gm-Features: AclHuK-VTVK2Zx9itCVd1q2fYcmda4QQ21q-m0eczAKCyG7Q3SKFRADCEFBZaD8
Message-ID: <CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
To: David Laight <david.laight.linux@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Eric Biggers <ebiggers@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Robin Murphy <robin.murphy@arm.com>, David Gow <davidgow@google.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Nathan Chancellor <nathan@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kunit-dev@googlegroups.com, netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_053401_685705_EEFA98D9 
X-CRM114-Status: GOOD (  30.73  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi David,

Sorry for the delay, I was in the middle of a company change.

You are right about SG and TX csum, but only when the traffic goes
straight to a NIC that offloads them. There is another side: software
GSO (skb_segment() with !sg && !csum) hits this path on 100% of TCP
payload over WireGuard (wg_xmit() -> skb_gso_segment(skb, 0)), and on
drivers without SG/TX csum (u_ether/f_ncm, cdc_ncm, mt76, rtw88/89,
ath9k).

So in general the software copy+csum path is still alive.

On the other hand, NEON is useless here. skb_segment() splits GSO
packets into 1-MSS segments before copying, so on these paths calls
never exceed 1448 bytes (1368 on WireGuard). At that size
kernel_neon_begin()/end() costs more than NEON saves, on real hardware
v1 was ~3% slower in cycles/byte than the scalar loop on the slower
cores. So that part can go.

I would prefer to keep only the scalar version of the fused copy+csum.
It reads the data once instead of twice, and on real Armv9 hardware it
cuts end-to-end cycles/byte for bulk TCP over WireGuard by 3-12%
depending on the core (+6-8% throughput). It uses only general-purpose
registers, so there is no FPSIMD state to save and it is safe in any
context.

If you are OK with the scalar path, I can send v2 with NEON dropped,
the scalar path only, and the KUnit fix for the x86 zero-length case
Jakub reported.

Thanks,
Demian

=D0=BD=D0=B4, 27 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 19:44 Davi=
d Laight <david.laight.linux@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, 27 Sep 2026 15:17:56 +0200
> Demian Shulhan <demyansh@gmail.com> wrote:
>
> > arm64 currently uses the generic csum_partial_copy_nocheck(), which
> > performs memcpy() followed by a second pass for csum_partial(). This
> > double pass exerts unnecessary pressure on the L1 cache.
>
> Which workload actually needs this?
> Most modern ethernet MAC support checksum setting on transmit and
> checking on receive.
> So the software checksum shouldn't be needed very often.
>
> IIRC there is also code to defer UDP checksum validation until the
> copy_to_user().
> I'd bet (a few pints of beer) that the complication this adds isn't
> actually worth while.
> Even Linus can't remember why it was done, my guess is it improved the
> performance of the userspace NFS (over UDP) daemon that would be
> doing 8k UDP send/receive (fragmented by IP).
>
> There is certainly still code to checksum data during copy_from_user()
> in send().
> Last time I looked I couldn't see why send on TCP sockets didn't go throu=
gh it.
> On x86 (in particular) copies can be done far faster than ones that
> include a checksum.
>
> David
>
> >
> > Replace it with a single-pass implementation. The new implementation
> > provides a general-purpose register path for short buffers and atomic
> > contexts, and a kernel-mode NEON path for lengths >=3D 1024 bytes.
> >
> > Measured in-kernel on an Ampere Altra (Neoverse-N1):
> > - Scalar path: 1.2x-1.6x faster for lengths < 1024 bytes.
> > - NEON path: 1.2x faster at 1024 bytes, scaling up to 1.6x-1.8x at
> >   4096 bytes.
> > On Apple M-series cores, gains are 1.3-1.7x below 1024 bytes and
> > 1.6-2.4x above. No length or alignment regresses on either
> > microarchitecture.
> >
> > Patch 1 implements the fused routines and the dispatcher.
> > Patch 2 adds KUnit test coverage for the new API and internal paths.
> >
> > Tested: in-kernel benchmark module on Neoverse-N1 with both
> > implementations cross-checked (0 mismatches); KUnit suite under QEMU
> > (with/without KASAN, with PREEMPT_RT), exhaustive and random userspace
> > testing of both routines against a naive reference with PROT_NONE guard
> > pages, gcc 13 and clang 18 W=3D1 builds, checkpatch --strict.
> >
> > Demian Shulhan (2):
> >   arm64: csum: Add fused copy and Internet checksum
> >   lib/tests: checksum: Add KUnit tests for csum_partial_copy_nocheck()
> >
> >  arch/arm64/include/asm/checksum.h |   3 +
> >  arch/arm64/lib/Makefile           |   7 +-
> >  arch/arm64/lib/csum-copy-neon.c   | 168 +++++++++++
> >  arch/arm64/lib/csum-copy.c        | 108 +++++++
> >  arch/arm64/lib/csum-copy.h        |  84 ++++++
> >  arch/arm64/lib/csum.c             |  54 ++++
> >  lib/Kconfig.debug                 |  10 +
> >  lib/tests/checksum_kunit.c        | 463 ++++++++++++++++++++++++++++++
> >  8 files changed, 896 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/arm64/lib/csum-copy-neon.c
> >  create mode 100644 arch/arm64/lib/csum-copy.c
> >  create mode 100644 arch/arm64/lib/csum-copy.h
> >
> >
> > base-commit: 93f51579e7df248780214094418f205253383cc5
>

