Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4EEC87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 07:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSHEYJX788VYHRiy4xhCclV7U8sQXRjHeZkuG3AFE8g=; b=VPTNlmJ9NrlYDzf2U65Fi6vMoa
	UNAuQy/x7I/BumEi88cPX8di8rkRf4ll1tU54iNqWQhKSjgTvceumalwry9u4C1mp0f0xqgN56w/n
	Px8admkWNeEfOyvWFKmriykmqZSrnlxh1Fufy6tNgYPZjrfEEPeeQdGHlsGA7PSoyE0Qol+sCIZjB
	wrIrbB7fhD+JE47A7WLBbr5pPMBeOlPqkUDjQKY2lveGqk3TJwjYDB6+AAVROrL/pBEBeDtDflutI
	gi9AnT241G2LjPlj+KubxtAh9GyETuYfhYQLraIiecEztPtwfHU/6JKvhkQ8iU61p1HtxIkUkqRBA
	0BYjZSSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uipEq-00000009mNW-1Qpd;
	Mon, 04 Aug 2025 07:04:04 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uipCH-00000009mCq-3VMd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 07:01:27 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4aef56cea5bso280021cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 00:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754290884; x=1754895684; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RSHEYJX788VYHRiy4xhCclV7U8sQXRjHeZkuG3AFE8g=;
        b=iGOF6U/lfd1vqlOpnA6MsQSYBT2gg0fRtIjbd4vAhRif/Piv5MFHefbzpAc7LZ+AIK
         +BUZ9roIJ7RODX9PZzWLLOM71qxBBvojLIM96H/iiB34JDvZY+zF4OujeJJCXxPdcm8v
         9k4756IJupL597eXVfK+c11hmmQHbq9i6T96Ari0BhhH+ntDyEu6tYkbTC7EoOg6oQAC
         An7HBdXIdbTnns2wHGFTzcVxJJb3p5f6DJ5L0a9YLuEOKBHC8hQiwfUzFQtC+ugkkFmq
         Ge4jdoS2tBgRoXwQbsFxTU8rrZOXRiF/m9kUeUDrdKDA+rJv8tBCE/+KKhkCZwRyl5xM
         HeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754290884; x=1754895684;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RSHEYJX788VYHRiy4xhCclV7U8sQXRjHeZkuG3AFE8g=;
        b=bOMmCI9ljNbiM3GpV4BFd82MgkHTczGgBDHfBW9KJ4bFGJ+s2xFkVKvh/xnTFdMXzr
         mvJ4kWpD293mWfisWCC8sh1j0neNN3DEyWS9Ic8nMw366tOeKHX/c5QCSThhSG3rAIzq
         3BS2me8LmgN9oDKRqnluNofNNWOidT3GhNWeJsMzHJEOZ5ADJ7rBGDGqRccBexu3WmXL
         kXje3bLNCF+iw+YIZYPfrH672lOKYphqSbLHCkvwu9HHJ+3zCWPz3OtTiucQKfjpX7wo
         p3aa8mKHAJYJSm+1wH8XmoT2A6++gtAc3W90GUn332DPHz9leghzKVIGiJCZ/W9CNmcx
         0s3w==
X-Forwarded-Encrypted: i=1; AJvYcCVP8ICP3LE//7ByVPrztS2SsH2kUeOdA1U1VHDTr50rc079EkdK+xodBsfcenHl/Uxf3vOyAlNVkSCloFtkgjYO@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmd/Pwk32LfuBBbk1Tf8P2RLkwwiPzIfi3pfH5vo7KaOWjTwSw
	1YYMDUDRPO1ylsWK0kKyzV91o6MoqPnX1QhgRjEHvUkwCr/InMnENCqHUhhqUI0XMFe4UUsPgBW
	l7+eP6YZaRIxQ3YCEwPygxkgR5YJXdwXvuLr1Ttdr
X-Gm-Gg: ASbGncsZoKucAxKSqt88MPrbWzuG4ZXj+cwCNsb4bAFdIOihEXH08F96mBw5XhJeRfP
	g7L2npYRt0Cim62bJ/sXMhDQ2VnfC6/fTOJ4QoLn7d0i4iqmvBr0oQpDFmZgf2n48vB1PuzvsiG
	QW/VCXMNDhd0EWJoRM+7yM4Egk/kC+MIBMb4y/39MI5U5zDCZuftE78UPwfmpoB6pcQF3tpYB+7
	gbAnL5G
X-Google-Smtp-Source: AGHT+IGniHAA7FH+Eqd7YBUZA05anC+yqxu5yiEtg/S9Kxo9mx70xDcmXaV24SioouRxAn4eOORFllugMTauEdotgoE=
X-Received: by 2002:a05:622a:15cb:b0:4af:103d:f71 with SMTP id
 d75a77b69052e-4af12e2b2b0mr9053651cf.2.1754290883220; Mon, 04 Aug 2025
 00:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250729120014.2799359-1-tabba@google.com> <20250729120014.2799359-2-tabba@google.com>
 <szsqsx77mjo4kdawzcboud4eawuvz3sye4grmx5n74qzze26ap@xbfwc44ruetx>
In-Reply-To: <szsqsx77mjo4kdawzcboud4eawuvz3sye4grmx5n74qzze26ap@xbfwc44ruetx>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 4 Aug 2025 08:00:46 +0100
X-Gm-Features: Ac12FXzPxlkyqKTxS6wmipvAxMngDbBJoOhGXmwgi5KEq_pfkUCqwpGRVI4eeuY
Message-ID: <CA+EHjTxMoVD=ViS8rC+4oiLojQpobfnxHMBSx7qOLSwU_v_J=g@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] KVM: arm64: Rename pkvm.enabled to pkvm.is_protected
To: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, mark.rutland@arm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, broonie@kernel.org, vdonnefort@google.com, 
	qperret@google.com, sebastianene@google.com, keirf@google.com, 
	smostafa@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_000125_895113_6E131A66 
X-CRM114-Status: GOOD (  31.58  )
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

Hi Wei-Lin,

On Sun, 3 Aug 2025 at 07:09, Wei-Lin Chang <r09922117@csie.ntu.edu.tw> wrote:
>
> Hi Fuad,
>
> I am reading some pKVM code and would like to ask for help on some
> questions to make sure my understanding is correct:
>
> While looking at the code I don't see pkvm.enabled, or now
> pkvm.is_protected really assigned, is pkvm development going to add the
> ability to let the user pick whether they want to start a protected VM
> (host EL1 can't access VM memory and registers, mostly) or not (like
> nVHE mode VMs) in the future?
>
> Also, since when running pKVM (kvm-arm.mode=protected) the user can't
> yet choose the VM to be protected or not, the current state is that all
> VMs started by pKVM is protected, is that understanding correct?
>
> Sorry if I missed anything.

You're absolutely right. We are in the process of upstreaming pKVM,
especially support for protected VMs. As you've noticed, upstream code
doesn't yet support that. This series is meant to help facilitate
that.

To get an idea of what we hope to upstream, you could have a look at
what we have in Android:

https://android.googlesource.com/kernel/common/+/refs/heads/android16-6.12

What we have in Android is a new VM type, KVM_VM_TYPE_ARM_PROTECTED,
that you would set on VM creation (when running in protected mode) to
designate a VM as protected. That would set is_protected (or enabled)
to true.

I hope this helps.

Cheers,
/fuad

>
> Thanks,
> Wei-Lin Chang
>
> On Tue, Jul 29, 2025 at 01:00:06PM +0100, Fuad Tabba wrote:
> > The 'pkvm.enabled' field in struct kvm_protected_vm is confusingly named.
> > Its purpose is to indicate whether a VM is a pKVM protected VM, not
> > whether the VM itself is enabled or running.
> >
> > For a non-protected VM, the VM can be fully active, yet this field would
> > be false. This ambiguity can lead to incorrect assumptions about the VM's
> > operational state and makes the code harder to reason about.
> >
> > Rename the field to 'is_protected' to make it unambiguous that the flag
> > tracks the protected status of the VM.
> >
> > No functional change intended.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_host.h | 4 ++--
> >  arch/arm64/kvm/hyp/nvhe/pkvm.c    | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index 3e41a880b062..55dc7cd83e40 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -252,7 +252,7 @@ struct kvm_protected_vm {
> >       pkvm_handle_t handle;
> >       struct kvm_hyp_memcache teardown_mc;
> >       struct kvm_hyp_memcache stage2_teardown_mc;
> > -     bool enabled;
> > +     bool is_protected;
> >  };
> >
> >  struct kvm_mpidr_data {
> > @@ -1522,7 +1522,7 @@ struct kvm *kvm_arch_alloc_vm(void);
> >
> >  #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
> >
> > -#define kvm_vm_is_protected(kvm)     (is_protected_kvm_enabled() && (kvm)->arch.pkvm.enabled)
> > +#define kvm_vm_is_protected(kvm)     (is_protected_kvm_enabled() && (kvm)->arch.pkvm.is_protected)
> >
> >  #define vcpu_is_protected(vcpu)              kvm_vm_is_protected((vcpu)->kvm)
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > index 338505cb0171..6198c1d27b5b 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > @@ -406,7 +406,7 @@ static void init_pkvm_hyp_vm(struct kvm *host_kvm, struct pkvm_hyp_vm *hyp_vm,
> >       hyp_vm->host_kvm = host_kvm;
> >       hyp_vm->kvm.created_vcpus = nr_vcpus;
> >       hyp_vm->kvm.arch.mmu.vtcr = host_mmu.arch.mmu.vtcr;
> > -     hyp_vm->kvm.arch.pkvm.enabled = READ_ONCE(host_kvm->arch.pkvm.enabled);
> > +     hyp_vm->kvm.arch.pkvm.is_protected = READ_ONCE(host_kvm->arch.pkvm.is_protected);
> >       hyp_vm->kvm.arch.flags = 0;
> >       pkvm_init_features_from_host(hyp_vm, host_kvm);
> >  }
> > --
> > 2.50.1.487.gc89ff58d15-goog
> >

