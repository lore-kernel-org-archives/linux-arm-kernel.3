Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33772606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YO0sKQbM;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hcxVirp2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BCIqCJTJI3CEPROs9512EusTir8+qkAL3Ppxq3Gysy4=; b=YO0sKQbMINS08QPSzXpWhZlpwm
	x5uixVUS5MEZI1LTKWP/f/rvN+r6ZSbXYiSISvNL9Q/Gyn2F3ZU1mAl0TiqHtQBn9p9k2ZKqr+UBX
	aOMdHPsUm3z/+YzhRAbmV33m3fsCjn9Wkw3xdcB0/J3yzu63+e6p6M3mHx8WSFkVH6wzi4ooUm3o6
	4GBO/1ZGR04B+02LFXEkVatcKdpnuPQ8LHtlLi1Gh7FTMgpjdz3Q2DYUzjrl1Yc2MWc7NumXnARLm
	MspF0Qgog8l78Cec4jNX1/y9NwLFHXFk1Gzu4uC7dI9BseOs5U7F2nOvrUEsy8ATRllAbYsbS0hTc
	CanuT+gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHI9-000000036Ks-0CvA;
	Tue, 03 Nov 2026 16:23:21 +0000
Received: from out-125.mta1.migadu.com ([95.215.58.125] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHI6-000000036H5-22uT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:23:20 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=XEdFqC6h97QFZvtiPpW+UzaHuigGpaYAlhVfXdg2ZzM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793722991; v=1; x=1794327791;
 b=hcxVirp2HH+zRuY85IocxTeYsAYDrM/GB9K1tF8T4/AK/ju9ZzsvhC7VZPbaBrDhDDLvIs/J
 EprVSqSC+S5yyxjxPwIX8XR0EOmJXtJbpZQ9ZK28sUNQWQq3W5M4FD6aEv7sGXJzoNh1vOzLosG
 JClfdfe5UNBjntq/vHDIHmoM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 09c518d1b4761494;
	Tue, 03 Nov 2026 16:23:10 +0000
X-Mizu-Trace-ID: 09c518d1b4761494
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bfca2a2af4so7789e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:23:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxZl3X1DtqoUZsI+2id23eOEbz6nUjqG8AZyWhPnaV3HnXt3gLA1tJSVqn9LuI4GCFyUMUC7DIF5/4cZH+i3f80@lists.infradead.org
X-Gm-Message-State: APuU4Z+YCQEGlvbS0EAiq3nQ2XMdFVltmzLOxovbd1vY8sbuipY5CCTa
	2b6vWeFjX4iCmwJoQoOXJ+T7CEK8K1TGsPgXuldn6+pvoZqYxlN6n5h5Vg2nus/eNC9WHCPS2XX
	h/bgZbZUTISN6jNS4Waj2AJyMo4oAQw3p26UQyfmr
X-Received: by 2002:a05:6512:12cf:b0:5bf:c9c6:ae92 with SMTP id
 2adb3069b0e04-5bff0544d8fmr146220e87.7.1793722985169; Tue, 03 Nov 2026
 08:23:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103084742.1302597-1-fuad.tabba@linux.dev>
 <20261103084742.1302597-4-fuad.tabba@linux.dev> <29e7d214-b7b0-403a-a40f-dbc5b6951e22@arm.com>
 <b191c40e-8e2b-4c1a-8604-d75cb47bd194@arm.com>
In-Reply-To: <b191c40e-8e2b-4c1a-8604-d75cb47bd194@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 3 Nov 2026 16:22:28 +0000
X-Gmail-Original-Message-ID: <CA+EHjTyFRxuvi+jRvSgNRaPNan2SO3nO3aDivCarvKDaUHRarg@mail.gmail.com>
X-Gm-Features: AclHuK-bljgFCCFARu7bxbrTGuz_ajmvxtmJjvK8SX6B4thjgg1guu6VgoopCi0
Message-ID: <CA+EHjTyFRxuvi+jRvSgNRaPNan2SO3nO3aDivCarvKDaUHRarg@mail.gmail.com>
Subject: Re: [PATCH 3/3] KVM: arm64: Move stage-2 teardown into kvm_vm_s2_ops
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Raghavendra Rao Ananta <rananta@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_082318_676935_33401E1E 
X-CRM114-Status: GOOD (  15.04  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Suzuki,

On Tue, 03 Nov 2026 10:33:15 +0000, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> > Someone beat you on this (well almost) ;-)

:D

> > https://lore.kernel.org/all/4304d0c7-2220-4add-9c71-e6dc6b4fbc11@arm.com

realm_stage2_destroy() in your sketch doesn't use the range it's
given, so it should fit this hook, which only takes the pgt.

[...]
> >> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> >> index 10b425a0141be..9df3c80a5acd1 100644
> >> --- a/arch/arm64/kvm/mmu.c
> >> +++ b/arch/arm64/kvm/mmu.c
> >> @@ -1029,17 +1029,16 @@ static void stage2_destroy_range(struct
> >> kvm_pgtable *pgt, phys_addr_t addr,
> >>       } while (addr = next, addr != end);
> >>   }
> >> -static void kvm_stage2_destroy(struct kvm_pgtable *pgt)
> >> +static void kvm_vm_stage2_destroy(struct kvm_pgtable *pgt)
> >>   {
> >> -    unsigned int ia_bits = VTCR_EL2_IPA(pgt->mmu->vtcr);
> >> +    stage2_destroy_range(pgt, 0, kvm_phys_size(pgt->mmu));
>
> Also, now that stage2_destroy_range is only called for normal KVM,
> could we fold that in here ?

Ack.

[...]
> >> @@ -1126,7 +1125,7 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct
> >> kvm_s2_mmu *mmu, unsigned long t
> >>       return 0;
> >>   out_destroy_pgtable:
> >> -    kvm_stage2_destroy(pgt);
> >> +    kvm->arch.vm_s2_ops->vm_stage2_destroy(pgt);
> >
> > minor nit: should we retain the kvm_stage2_destroy() to dispatch the
> > callback ?

I'll keep it in v2.

> >
> > Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Thanks!

Cheers,
/fuad

