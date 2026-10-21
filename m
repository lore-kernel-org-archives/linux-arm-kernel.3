Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2F4606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 22:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kL/qgr9m;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=q3adiN1Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zovsq29UQ2TeLumV7ABI3SWyvg5qGuaPKJLreulBem8=; b=kL/qgr9mdUN90l5gbAK6K0OQEc
	iVaq8clSidrB45z+H+4eJJ68xlCZUEzerfL5DsIOXgoFVhSeWubb5NXc6ksui9bJLa/ymzdpJneyO
	j+6zw0XBIY5jHdR+bJMQX3YjT4J0cc5jLBuJGlIDmgbu/WUwnOqJFuiisx+YBRB22FpWba4DdwVrx
	U77RfXG4My7pczSlzHysyEQb41Qvg7qG88m2y+i5/vXDW2sdRLbV0swqU+JM9JXtLeQvbKSKG0HMl
	JsIeupo93ZTAgeVdgvhT2EOeAhJikxIrWL4wXlT/kMErnjE/slUgn+N5imSoqw2OJGMCmj57VMIKV
	CIKxshJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJeMM-0000000CxlL-2wUR;
	Wed, 21 Oct 2026 22:00:34 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJeMJ-0000000Cxkl-3kiC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 22:00:33 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c445c95d553so158156466b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 15:00:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792620029; cv=none;
        d=google.com; s=arc-20260327;
        b=ocBJXeoobV/FK+0JC2SKkqKprZq1Lx//xO3DZRTt4C36PVaSCzpg02bWowM1dsnDg9
         bFnLFMe1uNhzxDJWWPGhfyxy14BKwbpWI3GNJy44FmR/QzpemBtnpT31tB6NxGF/Hp1d
         nyrGyzJBEdamkPybLd6seORCQd/utHpDP9fQ56wFzzwmEpi/WWvVKZZkdaQvl1MN1uv8
         4aQjudyZ2pXfvIJNDkTb+jGVqqCsOsR4o8v8prkqVzShIoJVfc/BSgu3gHoZ4k4HvXWu
         Bzy511HPKIiWgxETmluWHzv/k7dEgD4875P34lujZLgx8yepacQioQ+ORGBc9bSmw0Pt
         TrCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zovsq29UQ2TeLumV7ABI3SWyvg5qGuaPKJLreulBem8=;
        fh=orxA8CEMUkzY6uHdeqQemrMjdzlLdd943k2AS9pLB6A=;
        b=XrDiR7WgHtBngosixFkjDaqfujz1W0vW7PaBVLo76NCYJgadquWemOwuLLebTZGMKB
         gNCEPUQdz7hidbVT+VmsJFNOLaOWyNk1ekIQkT3leDLRdbwZ9aAOSyDu2epqRpimRise
         ubz5c2C/QxjEJojZK1iCGd3mUqWgFASpKT3Ddfy65+I2mYnlLtTrzouDQsqJuibZjkHm
         djRZcXhbyh9kUZrKxrsrktdqyAluzaP0KAIMUUmmW1Al7Dd6BEv+Lst7Q5uNsfxUrKeR
         qweN9IQABjlMtwu6ym5lZmayzrDOxI4ysvAPjGmRB/LZ1mFYrMzf+DRQw4GmrSpd+KSg
         Kc+A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792620029; x=1793224829; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zovsq29UQ2TeLumV7ABI3SWyvg5qGuaPKJLreulBem8=;
        b=q3adiN1YtBhNhuLrUXJCgEx2aU/t84ECgCl2lJfHmeciQFsNVbevW1mP3COiL35VhJ
         A2cxw3ExT41HsfgR0MvzK9+RvtOJMPqoBcpRVr4m81AKKxFvJgEcYc9axAVvWTsJLkKt
         Cm9aTK8M+xrU3pANMzTaVPeuqp9YBh/0tfTT09OAwZPQUBwsXY5B/duuRYfGFV5LfOvh
         aVmJaEoGUBN+Y0wlirM0HHdzeAXhju+wa6a+wn3XnaPn9blSM/bogbPaCG2TMHqjhGAa
         ht4x57lX7J8gHvRSmhCOwAbxIvG0OA5pUzVLPZdClu3IUQIiNKNR6cJgIzV/mW4tjrxc
         cJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792620029; x=1793224829;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zovsq29UQ2TeLumV7ABI3SWyvg5qGuaPKJLreulBem8=;
        b=B0eFMj/q1SGLYB8y+PKKcLR2KrZrBFFvzTjomnQtuV4WUZDO+2csRR6MKK9roU/uCJ
         DBQm960PUsqMCwY55qlRegEY99ky9LGj9KCvb2HdO0/M/K528njJgwaBKuhLw3YX/4/e
         YRA0havJdVbUVTp7qNkG8kR96CB2D9aAL81YK6lNq+itcFLnDQZAQ0UJlK95RUSP6sgt
         8+Cq8KBAaBuMjRRnmCFLFZous6xtloBPd+FiAbexRYmB8bTKFpiyVYmNWG9XQVaPSl6o
         nSGwUC+W/akxz3dwofRMEK2+E16nxvsLkHh95v34AaC3DPL4SimsgTCOZSoW/MwbCLWD
         EpfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYXHWmisBT2xctXUUN2Pm1qZzoYbNX651CyUV4oRfb5WZ/WF33Qav8QiZjFCCciTn/orcTA2mfVdcrJjslVx+0@lists.infradead.org
X-Gm-Message-State: AFq9FYJdn9TzHiRXNcTvsOTysYAE5cjOHZ1suJzE9cnl0fgIVn1duuA3
	np39aZY0x4jDZDBIfa93zaseRmP9Jvdr1318nyPOJ1lmEfAJrFOQXwl4DoKyw/0A7wU3SCfggJR
	19Y2eQpo+flGFKrS5gWCGGDNUYdZDtBmyKcuUKbxt
X-Gm-Gg: AYBFou2ZmtIQ6wUbfCcr7hEEL92XxqX12e/3T2rjkZDuIu6PmVJPbS/Tpo6qvd5XgXe
	veE6c+i8kZpg7gjp4zdILV/K/M8BtTwajZuAG2hCtBuFalmrmpHE7OVXq6UFxVQRX9CqihQjPXQ
	TO2G5ma5pgpui6pn7tZhwyxfJp415eqPLfGCDIS3s97JwUKa83e0XwWPhx2IT77DOTKLNAbKVI1
	l3rk7h2WqENPSI5DX50KC+WUTpShngjl7JfhbXfbW6HAXPFLh+RBJu8W6RwfGbiuZHjhWentcnd
	EG86tY5lLGZ1vTIPwfULTKUWBM3Yn9u2YU0QLWuhnKvqaFG7TSlj+P/TdyyOrEV80hziUlfkSZs
	qFfoFE1bTGy66Tmj8llwMYj2mvWjbez7ti5TrWDsXFG//YQ0qV2Q99uQNNL81oc7buMduZY1/Rv
	HWAQqFc2YV9x6Eoin13/p6DfvgIsiZJ4oUbF9ppzm+Dpa005/PVMFu3fJo2mjMx6ZYj/g4Gz1rY
	vXZl/BR
X-Received: by 2002:a17:907:7208:b0:c31:7495:e57 with SMTP id
 a640c23a62f3a-c4679a0bcd0mr297358566b.44.1792620028316; Wed, 21 Oct 2026
 15:00:28 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
 <20261003002123.505555-4-jthoughton@google.com> <B8A44041-1516-4405-976D-534AA2412A49@linux.dev>
In-Reply-To: <B8A44041-1516-4405-976D-534AA2412A49@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Wed, 21 Oct 2026 14:59:49 -0700
X-Gm-Features: AclHuK8yX8_UlxZwp8Wau4tISOxPTXz9_QA6ij9ZqSUUyry48bT72riHBjGZz-Q
Message-ID: <CADrL8HUOJwEgjUzefxSUa=AZHj4JO7koonj2_-WYhcL8QcXPZA@mail.gmail.com>
Subject: Re: [PATCH v2 03/20] hugetlb_vmemmap: Always flush TLB if needed upon
 PTE remapping
To: Muchun Song <muchun.song@linux.dev>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Oscar Salvador <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_150031_963736_C5F4F03E 
X-CRM114-Status: GOOD (  32.13  )
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
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 2:54=E2=80=AFAM Muchun Song <muchun.song@linux.dev>=
 wrote:
>
> Hi James,
>
> > On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> wrote:
> >
> > vmemmap_remap_range() can potentially leave the vmemmap in a partially
> > optimized state. In this case, a TLB flush should be done if the walk
> > caller asked for it, even if the optimization was not fully applied.
> >
> > A follow-up patch will more completely deal with partially-optimized
> > folios.
>
> Why are we dealing with partial optimization cases right from
> the start?
>
> I know that in patch 12, you try cmpxchg 16 times, and if it
> fails, it leads to the partial optimization state. What I want
> to ask is, why do we limit the maximum number of attempts? Is
> it because during testing you found that this kind of failure
> is very common? If we did not limit the number of attempts,
> was it because during testing you found that the scheduling
> latency caused here is very large? Or is this just defensive
> programming? In my view, scenarios with such intense
> concurrent access to these struct page structures should be
> very rare.

This was done defensively, yes. With 16 retries, I never hit this
without fault injection. (Perhaps I should try with no retries...)

> If your testing did not find any problems, my suggestion is
> not to set an upper limit on the number of cmpxchg attempts.
> This should be able to simplify the design of the initial
> version of the code to a certain extent. If we want to
> determine whether an upper limit should be added in the
> future, I think we can add timing monitoring in the arm64
> try_update_vmemmap_pte function and trigger a warning when
> the measured time exceeds a certain threshold. If someone
> reports this kind of warning to the community in the future,
> then I think we can improve it at that time.
>
> What do you think?

From userspace, you could use kpageflags or page_idle to continuously
access a single struct page over and over again. I think that's a
pretty good reason to have a bound. Also, the AF can be set even
without an architectural memory access (so a mispredicted branch can
still set AF, for example); that also makes me want to have a bound.

Catalin also said wanted a bound here. See the bottom of this reply at [1].

So I think we should leave it in. The extra complexity is pretty much
entirely in patch #4[2], and I don't think it's too large of a change.
I hope you agree. :)

[1] https://lore.kernel.org/linux-mm/aoRn3Fn1dhTdsk6d@arm.com/
[2] https://lore.kernel.org/linux-mm/20261003002123.505555-5-jthoughton@goo=
gle.com/

