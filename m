Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E726606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 18:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=md3okmd0;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aTmUcgIn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AqsM43MOtFOSSZV0EEwrjw089w0rw12SYsGwf7bUH9w=; b=md3okmd0JjU8yZPxPSUe7awLfJ
	FdzHBNQqZAWdbtWXAsmRcOVrKb2fogps9rII3H8AKlAmujc5ZfUQK6OM5BVPvyEyICvJ2n62bI6Xs
	CFm1USItrzj3BsOGasv97YC6F8glhVRfQVGTIztdMpRAH0d6xCqDhz5M4kIByXh9uSRURiYA4EcLF
	UJRRNuyQfkYPY7K7L/N41zRwQHXK9lsCyo+DGUL1BAeSGGS4QhIWWdxSz8RjPwBtpvn/isa11M4ou
	zXl5q7qJHRKLfwhYNNCf2nwQxemcoxwdXRT+V4H1oK3X0mobkKmfCAucRA4MUi89w5TEM1YZi2KoM
	Q0Xnq7tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMrmu-0000000CRDM-4Asq;
	Fri, 30 Oct 2026 18:57:17 +0000
Received: from mail-pj1-x1046.google.com ([2607:f8b0:4864:20::1046])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMrmr-0000000CRC1-28yL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 18:57:14 +0000
Received: by mail-pj1-x1046.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so1074180a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 11:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793386631; x=1793991431; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AqsM43MOtFOSSZV0EEwrjw089w0rw12SYsGwf7bUH9w=;
        b=aTmUcgInJWzGDcA3hBhixPsoo7/pcFOLe2gkbrlA2VVGFh2Cjrl6NL1VUv3GmGHr94
         Pb2mDoXopi4e0069911wwauOZzNlqi5DLSrqaRNc1NFHotcI3FCuBJ7rQ1MN96g9UCxK
         txxd63MRtsUyuoc7aS3d0bR/18XfQzIQgndopwIAKm6xX1VvLLbdqwujnhQwMFlHSSMQ
         sbooExNv4RvxHPjTYmJ8gM5NPqkt/CbAzWSNbwn+kMsRZS1VqPFua6IaxcKDfm7XMdb4
         /EO0Jgb1tbTMeuWvzExe4NOwuVH8yl9k6Jeg1o3qWz3z011zayN4duzg9r4QmjDxWI4T
         tXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793386631; x=1793991431;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AqsM43MOtFOSSZV0EEwrjw089w0rw12SYsGwf7bUH9w=;
        b=RZx2McYuF86zb8ZPG32ECJ/sVCD/OsmvwCsZd1c2+lgyJfNovp2qP2SNXOqZXevue2
         trwQtnF6qYtziCEqYCtQ+BDyhP++VhiAHZiSSQwMdbe7MCMYs/IiMLxvIp54IqvOnRdW
         PA6xQzY6lCcvYb4fXmrv9G8rYXz9+j2fWXw3q1uNNhItcwJesV91wWNHDchP0rB/VwX/
         WJZknvd8Ym52gmUUjQR6WXEZXC1q/M2fSxJlMxEPAejqOKIX/CUJ9CGRfBeWQxNGgGWY
         Me72Lwfr9/V/QWurSGZavsnmr91P96EAPS3z05OQFqz1ohZZXIzhTI9WH3GZwFqn+jXJ
         4voQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9wBM4KJ2c35UGVsT254iePVvIZe1GIlqloHbT+HfFzVtbgYWrqlBkYX8rdr9mrxahBh/tysXF/1h22PkIIL3g@lists.infradead.org
X-Gm-Message-State: AFq9FYJzzaqQXNBVrJFCTIo0PZSGJp/Y024Je38yLY6Knrw/13kDT3Ig
	z0dbTJ/fCjWMKzIhEGFKrXOfZJ40U6kdf78E2eaWZrg66zkCHPGtO17RxhyQN31jf/r7xc9GQah
	oU2q/YQ==
X-Received: from pjbbo5.prod.google.com ([2002:a17:90b:905:b0:3ac:24b3:3484])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c2c6:b0:3ac:b3c7:de04
 with SMTP id 98e67ed59e1d1-3ae897aa752mr1800362a91.34.1793386630946; Fri, 30
 Oct 2026 11:57:10 -0700 (PDT)
Date: Fri, 30 Oct 2026 11:57:10 -0700
In-Reply-To: <auStM0rbFol79h5o@li-fbf77acc-29ba-11b2-a85c-e8e934f50a46.ibm.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261028190259.1819571-1-seanjc@google.com> <20261028190259.1819571-4-seanjc@google.com>
 <auStM0rbFol79h5o@li-fbf77acc-29ba-11b2-a85c-e8e934f50a46.ibm.com>
Message-ID: <auTohixp3V5-vNsB@google.com>
Subject: Re: [PATCH 3/7] KVM: PPC: Explicitly force IPIs when directly kicking vCPUs
From: Sean Christopherson <seanjc@google.com>
To: Gautam Menghani <gautam@linux.ibm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_115713_549152_50BF374E 
X-CRM114-Status: GOOD (  24.30  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026, Gautam Menghani wrote:
> On Wed, Oct 28, 2026 at 12:02:55PM -0700, Sean Christopherson wrote:
> > Explicitly force an IPI when invoking kvm_vcpu_kick() directly instead of
> > relying on kvm_arch_vcpu_should_kick() to unconditionally return 1/true.
> > This will allow dropping kvm_arch_vcpu_should_kick() in favor of
> > kvm_request_needs_ipi().
> > 
> > No functional change intended (1 || 1 == true).
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/powerpc/include/asm/kvm_ppc.h | 13 ++++++++++++-
> >  arch/powerpc/kvm/book3s.c          |  4 ++--
> >  arch/powerpc/kvm/book3s_pr.c       |  2 +-
> >  arch/powerpc/kvm/booke.c           |  6 +++---
> >  arch/powerpc/kvm/e500_emulate.c    |  2 +-
> >  arch/powerpc/kvm/powerpc.c         |  2 +-
> >  6 files changed, 20 insertions(+), 9 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
> > index 169ea6a7fbad..bbe7378ad0ef 100644
> > --- a/arch/powerpc/include/asm/kvm_ppc.h
> > +++ b/arch/powerpc/include/asm/kvm_ppc.h
> > @@ -30,6 +30,17 @@
> >  #endif
> >  #include <asm/inst.h>
> >  
> > +/*
> > + * TODO: For unknown reasons, KVM PPC has historically ignored vcpu->mode when
> > + *       determining if kicking a vCPU needs an IPI.  Either document why that
> > + *       behavior is necessary, or drop this helper and the @force param from
> > + *       __kvm_vcpu_kick().
> > + */
> > +static inline void kvmppc_vcpu_kick(struct kvm_vcpu *vcpu)
> > +{
> > +	__kvm_vcpu_kick(vcpu, false, true);
> > +}
> > +
> 
> AFAICS, there is no reason for PPC to always return 1. I was looking at
> the old patches on mailing list and found this - https://lore.kernel.org/kvm/0FEE585F-5E21-47F2-A3F0-AD0DE05EBB43@suse.de
> 
> ```
> How about we return 1 for kvm_arch_vcpu_in_guest_mode() on !x86 always, just
> like it's done today basically? Then we can worry about needless IPIs later
> and don't regress from the respective current kick implementations.
> ```

FWIW, I found that as well, but there are a metric ton of kvm_vcpu_kick() calls
that have been added since then, and they scared me.

> However, I'll do some testing and get back by mid next week to make sure
> there are no suprises.

Thanks!  If we can drop the PPC behavior, that would be wonderful!  Though if
we do that, it should be for 7.5 in a follow-up (this series really should go
into 7.4 due to the SNP issue).

