Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BCACCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 17:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XsiTGDp45+d8REu3L6sx1lSo7GE9fyB7bHGlv479Ljo=; b=U/0oQXlZJnP0d52Vaon94nqWE2
	yNCJ5AeGIpI7vANwiOvqlPx+uc93PF0/cLScjUshsNoy9l3lh9flzAxXFQIuG0Uj2Mu57NEDL2m5n
	kMWzoOBu2CiS8jB6jy5brOlxRyrhwetpDHtq/iW1TZ/pkembMM+iL3z0TImrF412ilNk3PzoT6JhV
	J/68MgVaCSipw8cvLy5qzSkKqUrS+rNu1djOs4nPpXBpDcB1xswanLItGFliD6oK5Rzzmeq0PGOCk
	CHXqzK9SF3ND1pnXkwD7puO/B1ThnvYPYGGnjXv2pBYjiWQLHmXd3jufVXZeLS2kC/4/Q526mtm/K
	p0AafiLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7HOw-000000097EE-2yII;
	Fri, 10 Oct 2025 17:59:34 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7HOu-000000097Dq-26MV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 17:59:33 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-798920399a6so3155333b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 10:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760119171; x=1760723971; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XsiTGDp45+d8REu3L6sx1lSo7GE9fyB7bHGlv479Ljo=;
        b=l1XLJk9cqr5gQn57qpGmDtK00E/NeIIKLQAFYVL7EwSoz10qHuMSNWZPM0dCa33Wrw
         Accxo7dvM9zniaTpe3DhownY7wKvAA6dxy5woNcycOIQxy44jncKiPznTdMFzdqthie4
         9uzPt284phxCPIe3udsQWqG/fioYyNN4brY6GPdppP8ZuSEiPy22vVAxX/1st85FsHIL
         fXftGIvZRVBQXSqTON7jlNE0L5TAuM4Ro+5rLfksgGPpx1c9EYUKZqF2MWGKjc8gvx2b
         oIbguB5fUv4vfYNVeimX7N+BTm0of2MkbyFJKZUG2UqIOhx9GVaUSZc057Tq18iM8rfU
         UH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760119171; x=1760723971;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XsiTGDp45+d8REu3L6sx1lSo7GE9fyB7bHGlv479Ljo=;
        b=Ed2g7SuixEbRF3dsH5UGUXUSR+AaS8bubfJ0jvYz8wGfCUnawYBXhCvbpk69ji8mpv
         3iNyeXXDBx9BOWL1FaWUqIOWf86DjLkl6rOqcmAiFQqVtch5w8YcSyn8Gb9/Yi7Z0Wau
         HdvN8pKegIjUUuqKP99eGL+dM3dlUn5M2lBT30kAb6Am+vah+ELg33FzfGvQrQvjx+Sf
         nXPsKsH8+n3xLjgFt6TgZXUEVY0aQmGEyRHmrsCYrSJ+bufh/ohwZ7tqpfYbu6YkOU5I
         fatdAyiSz+3W4c8qImRrmrMiwq22ijwVfzIDFvZSL44+EwPn3Spo46gAtl5dgKsjhC9W
         1oig==
X-Gm-Message-State: AOJu0Ywi35d9FLzgIKyDyeqjUKqnE41NpiTfw7Vu/Ws9xsn51E5weXYU
	Suv7tZ+eshgpZ8rmpD5VOGB3bLCOUArFDEmIL3FcNEBrXUsjinyeSxMMVn8AaobCotaCrnqVPe7
	drZgNHmJCcg26J9fbJb2udKNilw==
X-Google-Smtp-Source: AGHT+IFFulhZ6XtWtUEt5DU+FzApmeb72eQ72O6ZaO2RaynTOo8A78bn76Qqn2PHdxN8Dmi5RIdQ4MD/+FcahKppIg==
X-Received: from pjca12.prod.google.com ([2002:a17:90b:5b8c:b0:32b:35fb:187f])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:6d93:b0:2ca:f345:5673 with SMTP id adf61e73a8af0-32da90145fdmr15350975637.27.1760119171293;
 Fri, 10 Oct 2025 10:59:31 -0700 (PDT)
Date: Fri, 10 Oct 2025 10:59:29 -0700
In-Reply-To: <20251007221420.344669-10-seanjc@google.com>
Mime-Version: 1.0
References: <20251007221420.344669-1-seanjc@google.com> <20251007221420.344669-10-seanjc@google.com>
Message-ID: <diqzy0pifxj2.fsf@google.com>
Subject: Re: [PATCH v12 09/12] KVM: selftests: Use proper uAPI headers to pick
 up mempolicy.h definitions
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_105932_561335_D0F2B71B 
X-CRM114-Status: GOOD (  21.80  )
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

Sean Christopherson <seanjc@google.com> writes:

> Include mempolicy.h in KVM's numaif.h to pick up the kernel-provided NUMA
> definitions,

mempolicy.h was actually already added in the patch before this, maybe
rephrase as

Use included mempolicy.h's definitions

> and drop selftests' definitions, which are _mostly_
> equivalent.  The syscall numbers in particular are subtly x86_64-specific,
> i.e. will cause problems if/when numaif.h is used outsize of x86.
>
> Opportunistically clean up the file comment

This is true

> and make the syscall wrappers
> static inline so that including the header multiple times won't lead to
> weirdness (currently numaif.h is included by exactly one header).
>

The inlining part doesn't appear in this patch, I think it was already
inlined right from the introduction in patch 6.

> Fixes: 346b59f220a2 ("KVM: selftests: Add missing header file needed by xAPIC IPI tests")
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  tools/testing/selftests/kvm/include/numaif.h | 32 +-------------------
>  1 file changed, 1 insertion(+), 31 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/numaif.h b/tools/testing/selftests/kvm/include/numaif.h
> index aaa4ac174890..1554003c40a1 100644
> --- a/tools/testing/selftests/kvm/include/numaif.h
> +++ b/tools/testing/selftests/kvm/include/numaif.h
> @@ -1,14 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * tools/testing/selftests/kvm/include/numaif.h
> - *
> - * Copyright (C) 2020, Google LLC.
> - *
> - * This work is licensed under the terms of the GNU GPL, version 2.
> - *
> - * Header file that provides access to NUMA API functions not explicitly
> - * exported to user space.
> - */
> +/* Copyright (C) 2020, Google LLC. */
>  
>  #ifndef SELFTEST_KVM_NUMAIF_H
>  #define SELFTEST_KVM_NUMAIF_H
> @@ -37,25 +28,4 @@ KVM_SYSCALL_DEFINE(mbind, 6, void *, addr, unsigned long, size, int, mode,
>  		   const unsigned long *, nodemask, unsigned long, maxnode,
>  		   unsigned int, flags);
>  
> -/* Policies */
> -#define MPOL_DEFAULT	 0
> -#define MPOL_PREFERRED	 1
> -#define MPOL_BIND	 2
> -#define MPOL_INTERLEAVE	 3
> -
> -#define MPOL_MAX MPOL_INTERLEAVE
> -
> -/* Flags for get_mem_policy */
> -#define MPOL_F_NODE	    (1<<0)  /* return next il node or node of address */
> -				    /* Warning: MPOL_F_NODE is unsupported and
> -				     * subject to change. Don't use.
> -				     */
> -#define MPOL_F_ADDR	    (1<<1)  /* look up vma using address */
> -#define MPOL_F_MEMS_ALLOWED (1<<2)  /* query nodes allowed in cpuset */
> -
> -/* Flags for mbind */
> -#define MPOL_MF_STRICT	     (1<<0) /* Verify existing pages in the mapping */
> -#define MPOL_MF_MOVE	     (1<<1) /* Move pages owned by this process to conform to mapping */
> -#define MPOL_MF_MOVE_ALL     (1<<2) /* Move every page to conform to mapping */
> -
>  #endif /* SELFTEST_KVM_NUMAIF_H */
> -- 
> 2.51.0.710.ga91ca5db03-goog

