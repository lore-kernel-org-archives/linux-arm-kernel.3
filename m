Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E34E606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 17:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T/yuQqvH;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=d2+6BqND
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Q/kJZkRDh+A2dbcPNuvHi4UCiR28b887/rQN2752RCM=; b=T/yuQqvH3rS2hb
	0iyLhPI74PGzGshZtAQv9adgln/s+cTExWPp9QMDBCbhXUV3DxWawCne5zPWZ7TqsyHLCJCQl2CFX
	u8fiSCb3z2DGkaxBFoKKMMi02ldPqQOv86tuh3tfDpLWdndAnmmvqMrkwobqEBctDAwGio0URFvHZ
	68NYrVJLiN7DXtpFX0hHg57Dii7zHtExIQtqQjf/0gufwYRVgPLvTnSfCWruFdJPnPVNhP2XI4SXU
	nerKT9QjNFl4cDzHZvO29C1ZLIyJzd/CeqglXX8GXV4087ucPbN57ZIeOo4R7Ymbc3GbqufTZQFoU
	Hr6aSwv+fQDxXRaaWE6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwr8-0000000Ed0l-2ZTR;
	Thu, 22 Oct 2026 17:45:34 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwr5-0000000Eczx-2UtA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 17:45:32 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c2055573c8cso8344066b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 10:45:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792691127; cv=none;
        d=google.com; s=arc-20260327;
        b=EzWhv3wCAqLR41N+EovlRvG5JWU604xpJwVv9kRFkyZUXzBWw4+FYaMCIxW4xDt8Pq
         vlcB0NzuCUU00sxphcICL8NM+PGgG9HmdvjBqosLch8cemr+t0BrFNhJz4lrUKak/rQj
         oZuReR4uzJlpG0sLa56KLPcikX+/OmAiTBbTP5O6epcz4THbSK8FdFOrrftRbcGyBXSF
         lKvnnGNt3mwbUb18GbgNRmBlB/uZfXGSJ/BGTIKlKs925DGYRlm4lPkeT7gxJcBRQXDe
         0nnTosVyeidrRGXuuKpwHMroFKlDwYjv6y1j6lIwCt/U419AWhtXeAW0tBFyukX4VB2i
         6atg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q/kJZkRDh+A2dbcPNuvHi4UCiR28b887/rQN2752RCM=;
        fh=709Pezl1SYIosdZW/xuwnQXYguie3O6+xff/Ns+2w/s=;
        b=Mb5ywiW7Y/BReYoTgkHaQLfwrL6adlH69pVjfcebvgH2Qw2WjCJN+0Dd2moo9zWBvA
         TMe+LcG3Iox0vBD2Pt/i5OcVBOYNBVrGf9x3bxaXAbNMIdJ3E9E0rCKCN2413bdfii6W
         jTW+Y0k4rh8eg62DPHG9kNzWCssOkUgS6p+pQ9H3nN2gNKBSa3rCsbve3HzLnTysyVHA
         VlIa/9wUIDx8CtxVXcqgBRYL1mr1Gn8piVNRv4+cIna7q3LLFW1jnFcdPcq6gQoe0eAW
         /gPCA2k1xQA+Rfoc9EXqEujyA0tDydNAoNm34ySwOiTwqaXvCYQenHJRNRwXINsEnlni
         IbVA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792691127; x=1793295927; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q/kJZkRDh+A2dbcPNuvHi4UCiR28b887/rQN2752RCM=;
        b=d2+6BqNDgc0VtDxT5+xSW9zUuCelkFdrH2s9y5hKLYmpnCEjIEP+JA7ZzxK1/ZGFrT
         XhuY2ccAb0+BAjFkZBYglgh7ekJrDEj9lPzEb2zgb8Uafy067KkHy2pXyzZ43DmQ+Rni
         BqYbL8yOeMZWy9EqLdIpyDHJqyw+mXhsT3nC+DM6mrCKxB/NMyeydBb89tgj2X1z7/rq
         bj1rMK+4mupWQkoyZWY2WyPKxIjiGgsijKOebxk99Sahg1CLzWjJm+XhhwGgTESNcvXJ
         dTPmlZtvg7nU0tFxLT9DmUstLhcVwrfHZWqlfKF6Fs+PzuCds4EXUnlIlGqFOyORVc3N
         EYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691127; x=1793295927;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q/kJZkRDh+A2dbcPNuvHi4UCiR28b887/rQN2752RCM=;
        b=pEs8FD676lURkk63xUUco9ZagmldT+Hu/mFWG72dz7F+FxvNpPSkyrkNY2R/Y/C6nq
         D1nes/xKdksLx1dGwCGE45PwIjDt+iPZ1XPdZ5R46mSVQGXZrjd/B9QSnVf0YNgcRhIm
         fzhD0sdbWKfo+r9CGAu31t+R0oB14dnpfs1DnacTO8j/vc/ay7NLRa3HRpZWkBtiesdj
         +7kTIvxvuMVrylmSTtdK//BdPxoBsmqc9HXvEVMrsfUqScQGxHdDkMddUE47/nm6GPOC
         6y2JIVjod7ab3BY+fjqQ3xAuyBp9RN4Ma6zprNDitMX4QyUW6Q8sWjQJ+CTsI2zMfl40
         IMOw==
X-Forwarded-Encrypted: i=1; AKwUvBwDec1YyOFTRdgy4slR75AJggsYK4BZkVSSOe/Q6s9Nm1NPhHRIjacN+ER8B6rZm4yzyD0VCdMLHWuaOjWgE1H3@lists.infradead.org
X-Gm-Message-State: AFq9FYJ7j/iITjc7jxFoKCjmarvfZKGoNy9g5N4fgbZSOWKdX+GHjUvo
	4Lgv4E7Nm2whaM8cBBWycI8ODN2Em/xEg+Kd1S1yjmulvK3TaXORsaR3C6LHBvlhqxajKt2iRMn
	sno0c4weyJBpsvXArLTjk1cm1Gb7Gy7ZLk2c3vlcH
X-Gm-Gg: AYBFou0Bb6ptItZB+tC1Q1ezgrP+SDYNaPnDJJ11YopswB7wTn7d0VuPnYWW270MVZw
	YQ0D3Bu1Ljg7k2Wc1cvxvrX80Vo+jBi8cFrG3zKJUDYm0kaJOhToo6A8D6l/IS0bQK69Cuo9VbQ
	+rx//tWIgFqPl0UwR2iRq/9hyospJbO/Nk2Fty8SA7zUUOS2/OhXgAakUl5V+8u1Z1J50dGnv0c
	eNciThr08g7M8cdkvKljyQgw1+JOMQL+cLCXJtP7rTZmb33vR4Gq0uyeexQyIQkvqTae4F4Qbyw
	P9k0jZ7GlhhtlypNOxsiu9SjjCefhXE2XEauNRxAIeGhOBbJ1a2Bdx/B7vTq+KRFqL13VSmrc44
	ue9o45teAya2HX3HXWO6CrVcWzigVtmVszUDQMcehLGPuXPB+R7pFHJKUdcdjJqtqntmp673Niq
	/4nMVDpgOSstHPjAqM2+aOnb7Bjcxg69evRgp03kBKA2FJdjcNHlRcZR0CVDrVgBj7NbU5gTZ2p
	gcr0P/k
X-Received: by 2002:a17:906:d553:b0:c26:1649:47ad with SMTP id
 a640c23a62f3a-c467976e841mr649670766b.35.1792691126016; Thu, 22 Oct 2026
 10:45:26 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
 <20261003002123.505555-4-jthoughton@google.com> <B8A44041-1516-4405-976D-534AA2412A49@linux.dev>
 <CADrL8HUOJwEgjUzefxSUa=AZHj4JO7koonj2_-WYhcL8QcXPZA@mail.gmail.com> <440A9FCF-2B5D-43A9-9B02-C32F5955AC82@linux.dev>
In-Reply-To: <440A9FCF-2B5D-43A9-9B02-C32F5955AC82@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Thu, 22 Oct 2026 10:44:49 -0700
X-Gm-Features: AclHuK8OCQjsmkJ8ztkh2B9wQVyT8iKcOFLwut_LnlB7__hy8ym6E5QTYBptOqc
Message-ID: <CADrL8HWNaurYHGnpvC9qwr6bVU74YhhucCuhoVYcvqmSX+R6+Q@mail.gmail.com>
Subject: Re: [PATCH v2 03/20] hugetlb_vmemmap: Always flush TLB if needed upon
 PTE remapping
To: Muchun Song <muchun.song@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_104531_673383_74B815BA 
X-CRM114-Status: GOOD (  46.96  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 2:18=E2=80=AFAM Muchun Song <muchun.song@linux.dev>=
 wrote:
>
> > On Oct 22, 2026, at 05:59, James Houghton <jthoughton@google.com> wrote=
:
> >
> > On Wed, Oct 21, 2026 at 2:54=E2=80=AFAM Muchun Song <muchun.song@linux.=
dev> wrote:
> >>
> >> Hi James,
> >>
> >>> On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> wrot=
e:
> >>>
> >>> vmemmap_remap_range() can potentially leave the vmemmap in a partiall=
y
> >>> optimized state. In this case, a TLB flush should be done if the walk
> >>> caller asked for it, even if the optimization was not fully applied.
> >>>
> >>> A follow-up patch will more completely deal with partially-optimized
> >>> folios.
> >>
> >> Why are we dealing with partial optimization cases right from
> >> the start?
> >>
> >> I know that in patch 12, you try cmpxchg 16 times, and if it
> >> fails, it leads to the partial optimization state. What I want
> >> to ask is, why do we limit the maximum number of attempts? Is
> >> it because during testing you found that this kind of failure
> >> is very common? If we did not limit the number of attempts,
> >> was it because during testing you found that the scheduling
> >> latency caused here is very large? Or is this just defensive
> >> programming? In my view, scenarios with such intense
> >> concurrent access to these struct page structures should be
> >> very rare.
> >
> > This was done defensively, yes. With 16 retries, I never hit this
> > without fault injection. (Perhaps I should try with no retries...)
> >
> >> If your testing did not find any problems, my suggestion is
> >> not to set an upper limit on the number of cmpxchg attempts.
> >> This should be able to simplify the design of the initial
> >> version of the code to a certain extent. If we want to
> >> determine whether an upper limit should be added in the
> >> future, I think we can add timing monitoring in the arm64
> >> try_update_vmemmap_pte function and trigger a warning when
> >> the measured time exceeds a certain threshold. If someone
> >> reports this kind of warning to the community in the future,
> >> then I think we can improve it at that time.
> >>
> >> What do you think?
> >
> > From userspace, you could use kpageflags or page_idle to continuously
> > access a single struct page over and over again. I think that's a
>
> page_idle does not support HugeTLB pages, right? We should only consider
> /proc/kpageflags; reading this file requires privilege =E2=80=94 unless a=
 privileged
> user intentionally creates malicious software.

Oh yeah, page_idle only uses LRU pages (which HugeTLB pages are not),
that's right.

For kpageflags (and kpagecount and kpagecgroup), I still think it is
"bad" to provide a mechanism that allows userspace, even privileged
userspace, to permanently freeze a CPU. Fuzzers could find it, for
example.

I wonder what Catalin thinks about my reasoning. :)

> > pretty good reason to have a bound. Also, the AF can be set even
> > without an architectural memory access (so a mispredicted branch can
> > still set AF, for example); that also makes me want to have a bound.
>
> However, I don't think this scenario would cause a significant amount of
> concurrent reads.

The fact that AF can be set without an architectural access means we
can't really reason about what may or may not set the AF. It
definitely seems implausible for the microarchitecture to continuously
attempt to set the AF for a generally-unused but valid PTE many times
in a row, but it isn't forbidden (as far as I can tell).

> >
> > Catalin also said wanted a bound here. See the bottom of this reply at =
[1].
>
> I see, but I'd still like to explain my reasoning and see what everyone
> thinks.

Thanks, yeah I'm curious what others think too. I can go either way really.

> >
> > So I think we should leave it in. The extra complexity is pretty much
> > entirely in patch #4[2], and I don't think it's too large of a change.
> > I hope you agree. :)
>
> Because I personally feel that having only part of the vmemmap optimized
> is a somewhat awkward intermediate state =E2=80=94 the all-or-nothing sem=
antics
> seems more natural to me. At least until a clear problem actually arises,
> I'd prefer not to consider it. At the same time, we can also keep the des=
ign
> simple.

Yeah that's fair. Thanks for your feedback, Muchun.

