Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082F1C55167
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 13:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPMt+aR9T4Y+jxBcYLYdMo+Qb3zQCW13YSvAT1bAsYk=; b=hSDezV/KMVPj30gFZS00YgMoIo
	0M9l0fPVdYKU1a+8b6MolyxqtcMmlAnkdV1tBAS/Jn+BLRxVpvlY0b/74YQc/DctCy69F31Uigp7I
	UMCDlF9IJhCjvLueAWRG4DgncBqtQ7JXErtDr6aIS35Cw47tO+QzUXE/UfbW8/rNm1rzfO6lcih01
	zc5dN3Y/5GnOTQOW61h9M3Nw1Jcvjyz7ymjRR24Z30SmtE75BncduxS3x+V418Pgsx775dKhUt6fF
	CIUmu320PPTAZoMJJM7qE6MqmDrEO63BLiLnpJ2w4hocx13yCDiJFCsZUB5K2wYzdQb4pEDZEoBkm
	dFi+LtJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpR7z-0000000Aebp-1Frc;
	Thu, 30 Jul 2026 13:48:51 +0000
Received: from out-184.mta0.migadu.com ([2001:41d0:1004:224b::b8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpR7j-0000000AeOQ-2kp2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 13:48:37 +0000
X-Forwarded-Encrypted: i=1; AHgh+RptHRzJADoUoCWTfkVKiABLQg1OORjSV9e4SA2tYjloYqnh5xYHfpgu2VQ3g+JEBShJjUZ2LYAvn30RkLBAKdTY@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785419308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iPMt+aR9T4Y+jxBcYLYdMo+Qb3zQCW13YSvAT1bAsYk=;
	b=sybCidbx0kHtpnsZDBQG4E154zF7QbDMrb3v4RftmAIXimW9aZ2TxE9g1e59Lt1c2V5Ej3
	+vVZUEEzf73rcvdKkW/Th5Kx0FekgQBRb3ZBea5eY94RHEGZ9nOfRs6nO8L9vLEXnHNAOe
	UYr1rg/kdqvvh4oTWsTfkhMzlnlE6a4=
X-Gm-Message-State: AOJu0Yz3DUcO9LEBYus/18vvadnAMHWj44sNBVmuxJ9geNV7N5HwrPeA
	J5ncLXJwF+y4tgZUAPbGsd8FZu2fVLPKhLMaolR7fehlbypdNieA90TN40hZO6poyUiz9n9EqOL
	DUb3avGCrfm0PaXjJ5uHBPur5a4ujZe0IkYMc0n1t
X-Received: by 2002:a05:622a:5506:b0:517:5e32:2d14 with SMTP id
 d75a77b69052e-52b42890329mr1575781cf.10.1785419298935; Thu, 30 Jul 2026
 06:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260720161343.1367007-1-fuad.tabba@linux.dev>
 <20260720161343.1367007-10-fuad.tabba@linux.dev> <86jyqcd55u.wl-maz@kernel.org>
In-Reply-To: <86jyqcd55u.wl-maz@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 30 Jul 2026 14:47:42 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwT38rV0DQKW7R0=ZVHvQU0jnvJbjDBqnpmNgu34biuMA@mail.gmail.com>
X-Gm-Features: AUfX_mx9CQmsqra9xcBkaqo79ZBW6DENHL3Zuxa95e-ym6s_uC8W9VwDyVSlgQo
Message-ID: <CA+EHjTwT38rV0DQKW7R0=ZVHvQU0jnvJbjDBqnpmNgu34biuMA@mail.gmail.com>
Subject: Re: [PATCH v1 09/11] KVM: arm64: Type-check hypercall arguments at
 the caller
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org, 
	rostedt@goodmis.org, mhiramat@kernel.org, alexandru.elisei@arm.com, 
	vdonnefort@google.com, joey.gouly@arm.com, seiden@linux.ibm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, qperret@google.com, 
	ardb@kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_064836_086902_EE0645C9 
X-CRM114-Status: GOOD (  18.97  )
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

Hi Marc,

On Thu, 30 Jul 2026 at 13:37, Marc Zyngier <maz@kernel.org> wrote:
...
> > +/*
> > + * Generate a typed stub for each declared hypercall. kvm_call_hyp_nvhe()
> > + * resolves to the stub, so a call with the wrong argument count or types
> > + * fails to compile instead of being silently truncated to an SMCCC function
> > + * number and a pile of registers. The stub inlines to the same SMCCC call
> > + * the untyped macro used to make.
> > + */
> > +#define DECLARE_KVM_HOST_HCALL(ret, name, x, ...)                    \
> > +     static __always_inline                                          \
> > +     ret nvhe_hvc_##name(__KVM_HCALL_MAP(x, __KVM_HCALL_DECL, __VA_ARGS__)) \
> > +     {                                                               \
> > +             return (ret)__kvm_call_hyp_nvhe(name,                   \
> > +                     __KVM_HCALL_MAP(x, __KVM_HCALL_ARGS, __VA_ARGS__)); \
> > +     }
>
> One thing I find absolutely horrible is to have to specify the number
> of parameters here. It is already bad to have to comma-separate
> everything, but having to count them is too hard for me ;-).
>
> We already have facilities to count the number of parameters to a
> macro (see the COUNT_ARGS macro). You could make use of it all over
> the place.

Will Deacon mentioned the same thing yesterday (offline). I'll drop it
in v2. The count was only there because the macro that walks the pair
list is a copy of __MAP() in <linux/syscalls.h>, which gets its arity
from the SYSCALL_DEFINEn name. No better reason than that.

COUNT_ARGS() does work here. The list is (type, name) pairs, so it
counts twice the arguments, which the ladder absorbs by being indexed
on list entries:

#define __KVM_HCALL_MAP2(m, t, a, ...) m(t, a)
#define __KVM_HCALL_MAP4(m, t, a, ...) m(t, a), __KVM_HCALL_MAP2(m, __VA_ARGS__)
[...]
#define __KVM_HCALL_MAP12(m, t, a, ...) m(t, a), __KVM_HCALL_MAP10(m,
__VA_ARGS__)
#define __KVM_HCALL_MAP_N(n, m, ...) CONCATENATE(__KVM_HCALL_MAP,
n)(m, __VA_ARGS__)
#define __KVM_HCALL_MAP(m, ...)
__KVM_HCALL_MAP_N(COUNT_ARGS(__VA_ARGS__), m, __VA_ARGS__)

DECLARE_KVM_HOST_HCALL(int, __pkvm_init,
      phys_addr_t, phys, unsigned long, size,
      unsigned long *, per_cpu_base, u32, hyp_va_bits)

That drops 40 hand-written counts from the declarations and 40 from
the handler definitions. __KVM_HCALL_MAP_N() is for the handler side,
which truncates a fixed list of six argument registers, and takes its
count from COUNT_ARGS() as well.

I diffed the preprocessed output before and after: token-identical
apart from the __LINE__ values that shift with the declarations.

Cheers,
/fuad


>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

