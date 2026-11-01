Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D9C606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 18:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HYU5/Wc/;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Ce70ou7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mlISQOHGH/cpnL0817uRuQcIGOT3seVGDHgC8ES2oDk=; b=HYU5/Wc/e5CJz8
	g4KZ5xjzMnuXrns/rI0y62RePMEEW7K3ogLOrg/8HZlHqT5OkNhewJfUHjK3pPHh3n2+cJj7GCc4y
	Br4eHSZ2XmhigzgB/tiPSy99ISYtmaRxdQUkt3bJsSwQLyGXoClL+Yu3j06BuJRU8HaBz2Wz1ijtM
	vhgz+PHLn4NTy7Ceqnm3QlgWD8SqOkwBghclFfSYjsGbmu/5kfOsG4hVZA49nPH8JhiLyUZ/9Q0op
	RJPCjz84jkKDSbA40C4nIKDwJ6ew5UStBRhhO5ZEdj5L0sBF1F8PEH6EvGF+x8Ay7pN6aLSwWHHDK
	6kwZl0vprhx5wwlNFfBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNaBy-0000000EkgR-2ERw;
	Sun, 01 Nov 2026 18:22:06 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNaBv-0000000Ekg6-2oec
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 18:22:05 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so13445205e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 10:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793557321; x=1794162121; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mlISQOHGH/cpnL0817uRuQcIGOT3seVGDHgC8ES2oDk=;
        b=0Ce70ou7H65qOPVx32jQKFb/yFDaMLokr7S0kV3FNMR/1mxu8Pk7PMveB5t4WECNyn
         ZPjv+yS7hbMgZmg0vyVJBmS9YZ/ckDIwnR2yB6UXVmZrRHBbUcWWZnx2/rt3absYeNw0
         WTBeZTDUTbrfEdXrqDDQiU8wPHTQFOy89qFuKW8U1+tlef01tEgZ56mA2+41knDdVf7m
         kRWh6yNFDU5Z+gxiRl98qO1XBsOpJ8S7l400P2l/9o0GxKBSriL99AAkj1sFk7sZfnQ2
         isiDUtHrwGz/KLIBr+JExySqSdtDhm8ZLrZS5MDr6IleTX/8UjFrFt72zIEpO95RooAs
         k+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793557321; x=1794162121;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mlISQOHGH/cpnL0817uRuQcIGOT3seVGDHgC8ES2oDk=;
        b=nqnqXNNx4937YMivzdJeHZeSgwKY61a7izG5mGqlZ/ZzR1OF0PlpcT202r9QeXjtU6
         zdsqlxIOkRGZqRsZ2ifRgFZacl3UideKc7bS/R1hq7/WXjTqAqQ3yYsD4QpkPnalVd/v
         jKLDGt5aagBtWXk8ZoBJnTQNjcitDOxUhKjFjqPDqTXtHbI2Cm/AQNihTw5Q1MkDkGCe
         d4XqnGo7P7T2vJcP1qGWXnOSltFUwcISxteTyZUcKmRrSB4AsGSpmN5N9cUM0YMwdwgC
         3ZF/k/wj1pBrlaKC4qMf8V91Cof2d14wmZFhVyFbTCGtWoOCnE9UVmBApLGgwe9eJ4SR
         ykfA==
X-Forwarded-Encrypted: i=1; AKwUvBwR5/azN1HXSiH6Q9Af4sJWPCbsqksRe1n/AroLMF+g3O7m0i8ZQljd8rbcRU9XMZDgQXAoyDwBGz53qYxNPHNx@lists.infradead.org
X-Gm-Message-State: AFq9FYKW2ftoIa0cqw7kikGt3bH0BdCsuhDEKVYHVpll6/yk1rKLck4D
	Cae5B2bRxqZXW/Px/ZFsrLuai3ISvpdjpw2cmWK/YWb5c9C745p4m8GC
X-Gm-Gg: AYBFou0ANa6aQF7JIdcMilFB9HWH2qTiIY75+eZQ9/9m9Y6BWtcc02tiUXZim6bYoZd
	XFQ+6rWp+d9esQnJauWoo7SbcA7nOfuq8f5Bo5w+S+9cLLooksU+SiwSOeqEi2lz66FKXBaWsgO
	JeX9L93L+hUryWgHcubDvPZnDMW/AIHKMVVgl4SjOVE4AP+xiVE33oLLnf6caPtYZSI8PWjBXEG
	+dB8EDbzfx7lYXOpswniK18VMbzufBs/LFrCDadmfDPfxb0ZeWcPsb9eZizkRx7QvOMMazUVcSN
	mR9GqGGtbxCM3l2hW2z+iveqtxf0M1mKCwtjlP+Rd3373notdu2Wf4RLNKzTbRxlQo2/c+GUh0B
	zuLdKzmfbtGX9WHrrtFYiZ8jOZGnJfFbP1Iw31fPdmqbPcsolfvnBK7cYjPIuifPmIhaBmXEALA
	YJCT/XKbPxL7QvjdMFhjC20BZoDwL2FbDQc/LOfmyPdricLx2DSR8tJQKzS3FmcSBtJkHrKbyyS
	KnD3erMtx3v3sIARGjJ56Sl/PlotHTvca2HZGEL0PG4u/GsHYO0SUjIVNcjpaTsNVTTYYh14B/t
	MZfr6AV4OlIERCdHN+n33wUZpLCrZoevldPJ640DQjCXjplRYmf7YyM4KpHOXU6E
X-Received: by 2002:a05:600c:b8a:b0:4ab:c447:49df with SMTP id 5b1f17b1804b1-4ac182dca8emr181298545e9.23.1793557320864;
        Sun, 01 Nov 2026 10:22:00 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf368bff7sm216805675e9.2.2026.11.01.10.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 10:21:58 -0800 (PST)
Date: Sun, 1 Nov 2026 18:21:56 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Demian Shulhan <demyansh@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Biggers
 <ebiggers@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Marco
 Elver <elver@google.com>, Ard Biesheuvel <ardb@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, David Gow <davidgow@google.com>, Brendan Higgins
 <brendan.higgins@linux.dev>, Nathan Chancellor <nathan@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kunit-dev@googlegroups.com, netdev@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
Message-ID: <20261101182156.380dbaf6@pumpkin>
In-Reply-To: <CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com>
References: <20260927131838.6774-1-demyansh@gmail.com>
	<20260927184414.6c0c8867@pumpkin>
	<CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_102203_748149_CFAD3A8D 
X-CRM114-Status: GOOD (  37.86  )
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
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 1 Nov 2026 14:33:49 +0100
Demian Shulhan <demyansh@gmail.com> wrote:

> Hi David,
>=20
> Sorry for the delay, I was in the middle of a company change.
>=20
> You are right about SG and TX csum, but only when the traffic goes
> straight to a NIC that offloads them. There is another side: software
> GSO (skb_segment() with !sg && !csum) hits this path on 100% of TCP
> payload over WireGuard (wg_xmit() -> skb_gso_segment(skb, 0)), and on
> drivers without SG/TX csum (u_ether/f_ncm, cdc_ncm, mt76, rtw88/89,
> ath9k).
>=20
> So in general the software copy+csum path is still alive.

I was partially worried that someone had just looked at the code and
noticed that arm didn't have the code to do checksum+copy and decided
to write it.

David

>=20
> On the other hand, NEON is useless here. skb_segment() splits GSO
> packets into 1-MSS segments before copying, so on these paths calls
> never exceed 1448 bytes (1368 on WireGuard). At that size
> kernel_neon_begin()/end() costs more than NEON saves, on real hardware
> v1 was ~3% slower in cycles/byte than the scalar loop on the slower
> cores. So that part can go.
>=20
> I would prefer to keep only the scalar version of the fused copy+csum.
> It reads the data once instead of twice, and on real Armv9 hardware it
> cuts end-to-end cycles/byte for bulk TCP over WireGuard by 3-12%
> depending on the core (+6-8% throughput). It uses only general-purpose
> registers, so there is no FPSIMD state to save and it is safe in any
> context.
>=20
> If you are OK with the scalar path, I can send v2 with NEON dropped,
> the scalar path only, and the KUnit fix for the x86 zero-length case
> Jakub reported.
>=20
> Thanks,
> Demian
>=20
> =D0=BD=D0=B4, 27 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 19:44 Da=
vid Laight <david.laight.linux@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Sun, 27 Sep 2026 15:17:56 +0200
> > Demian Shulhan <demyansh@gmail.com> wrote:
> > =20
> > > arm64 currently uses the generic csum_partial_copy_nocheck(), which
> > > performs memcpy() followed by a second pass for csum_partial(). This
> > > double pass exerts unnecessary pressure on the L1 cache. =20
> >
> > Which workload actually needs this?
> > Most modern ethernet MAC support checksum setting on transmit and
> > checking on receive.
> > So the software checksum shouldn't be needed very often.
> >
> > IIRC there is also code to defer UDP checksum validation until the
> > copy_to_user().
> > I'd bet (a few pints of beer) that the complication this adds isn't
> > actually worth while.
> > Even Linus can't remember why it was done, my guess is it improved the
> > performance of the userspace NFS (over UDP) daemon that would be
> > doing 8k UDP send/receive (fragmented by IP).
> >
> > There is certainly still code to checksum data during copy_from_user()
> > in send().
> > Last time I looked I couldn't see why send on TCP sockets didn't go thr=
ough it.
> > On x86 (in particular) copies can be done far faster than ones that
> > include a checksum.
> >
> > David
> > =20
> > >
> > > Replace it with a single-pass implementation. The new implementation
> > > provides a general-purpose register path for short buffers and atomic
> > > contexts, and a kernel-mode NEON path for lengths >=3D 1024 bytes.
> > >
> > > Measured in-kernel on an Ampere Altra (Neoverse-N1):
> > > - Scalar path: 1.2x-1.6x faster for lengths < 1024 bytes.
> > > - NEON path: 1.2x faster at 1024 bytes, scaling up to 1.6x-1.8x at
> > >   4096 bytes.
> > > On Apple M-series cores, gains are 1.3-1.7x below 1024 bytes and
> > > 1.6-2.4x above. No length or alignment regresses on either
> > > microarchitecture.
> > >
> > > Patch 1 implements the fused routines and the dispatcher.
> > > Patch 2 adds KUnit test coverage for the new API and internal paths.
> > >
> > > Tested: in-kernel benchmark module on Neoverse-N1 with both
> > > implementations cross-checked (0 mismatches); KUnit suite under QEMU
> > > (with/without KASAN, with PREEMPT_RT), exhaustive and random userspace
> > > testing of both routines against a naive reference with PROT_NONE gua=
rd
> > > pages, gcc 13 and clang 18 W=3D1 builds, checkpatch --strict.
> > >
> > > Demian Shulhan (2):
> > >   arm64: csum: Add fused copy and Internet checksum
> > >   lib/tests: checksum: Add KUnit tests for csum_partial_copy_nocheck()
> > >
> > >  arch/arm64/include/asm/checksum.h |   3 +
> > >  arch/arm64/lib/Makefile           |   7 +-
> > >  arch/arm64/lib/csum-copy-neon.c   | 168 +++++++++++
> > >  arch/arm64/lib/csum-copy.c        | 108 +++++++
> > >  arch/arm64/lib/csum-copy.h        |  84 ++++++
> > >  arch/arm64/lib/csum.c             |  54 ++++
> > >  lib/Kconfig.debug                 |  10 +
> > >  lib/tests/checksum_kunit.c        | 463 ++++++++++++++++++++++++++++=
++
> > >  8 files changed, 896 insertions(+), 1 deletion(-)
> > >  create mode 100644 arch/arm64/lib/csum-copy-neon.c
> > >  create mode 100644 arch/arm64/lib/csum-copy.c
> > >  create mode 100644 arch/arm64/lib/csum-copy.h
> > >
> > >
> > > base-commit: 93f51579e7df248780214094418f205253383cc5 =20
> > =20


