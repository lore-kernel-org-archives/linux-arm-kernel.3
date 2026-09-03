Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C673C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/m6OvwyGBg7TmCqssiXaQcxocNnjw6cbuk67L4uBmSU=; b=0LDTh5SMqzQ3dbTQe6wH+UG8iM
	UCGtXoHfiEY9VzN1sBCSFMRFsxYIyJmLTKfGVll3D83ovt/b+QGaGBvtGMvV7QfvY9ZWLWbPJejm8
	uxIs6lo7rDu82etl2t0bUTx4YmnxyY6XYx/epIRLFQq+BSNu/lCsilR+/WQ4TtzUPUmnfbU2u7lNo
	rWlD1cUyVsr4oFfXiWIBIXWDxBvzlohDJc3/jd21UiGALY37eQMgEivh2wLtath3IfxMacyEUP//N
	0Nnm1syvy410Rc6aJyksP5B5h23INPaWS0XC3C7O7m3wCxIQ1JkPPMGXpAgx19kAa3lvG/zfPpbw7
	8N4PnOJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ACR-000000009Ns-2syt;
	Thu, 03 Sep 2026 16:22:03 +0000
Received: from out-38.mta1.migadu.com ([95.215.58.38] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ACP-000000009NL-2hUA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:22:02 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=xJr95iT1de4rp73BLPNEBJLdD6DzboQPWy71+XEZa3o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788452520; v=1; x=1789057320;
 b=Hd9L57ng3SdmHSTguuMjkjrmeK2BuhRCMeFJKpNdZC4ke3i1LK9cJruTnQXYFS8Dt/zaFuvX
 yXGkMDKB6klrPEko7lSpnbzAGJMye7fpW8vO7YNB8GHcmKNG9aHRRG/WyVNcoOrwooaLg3iKdG4
 8QOWurpTkGfC5mOIBqeczvWk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 121361dc7d31b94e;
	Thu, 03 Sep 2026 16:22:00 +0000
X-Mizu-Trace-ID: 121361dc7d31b94e
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so7847e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 09:21:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw3NXdPcqsneQECDNNq+NOIOX5y/3Q40qZ4uItwvLhxduAprhR69QFSi5K58Brv4pdhGr6tgXyv3g1Uzq83RnYI@lists.infradead.org
X-Gm-Message-State: AFuF++mkNyI0DYsm/BFEXpNEtCUqCTqDMlDcYvUpJXRXorDdBrztcho+
	TYTC3HA7KnCDpXjXT/VgO3cpCYW4QOvOmd4ycVtHTA6Z6WOZJcSq6Vn28Vwde2GE96n0uH4b5v4
	HaITunYfLPJlgg6RzmxjdOe4Djyu75YtLh1prRnjn
X-Received: by 2002:a05:6512:1287:b0:5b6:4ad:d6b9 with SMTP id
 2adb3069b0e04-5b60ed04150mr185236e87.14.1788452514996; Thu, 03 Sep 2026
 09:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260831163421.272420-1-fuad.tabba@linux.dev> <20260831163421.272420-4-fuad.tabba@linux.dev>
 <apglCDec15q8D8u-@google.com>
In-Reply-To: <apglCDec15q8D8u-@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 3 Sep 2026 17:21:18 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx8bx5th_WNm6Fu6K0pdNauiapfgvg2piB6s9YcYxdAbg@mail.gmail.com>
X-Gm-Features: AcwNN1V7oaGB2cmAzKkX0DGvp9U5Agq1xhxNIKZMajkYcTem4jsOiKJGglGRhvw
Message-ID: <CA+EHjTx8bx5th_WNm6Fu6K0pdNauiapfgvg2piB6s9YcYxdAbg@mail.gmail.com>
Subject: Re: [PATCH 03/17] KVM: arm64: Reject the PVTIME vCPU attribute for
 protected VMs
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_092201_840274_9C707469 
X-CRM114-Status: GOOD (  20.91  )
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

On Wed, 2 Sept 2026 at 14:30, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> On Mon, Aug 31, 2026 at 05:34:07PM +0100, Fuad Tabba wrote:
> > pKVM currently does not support steal time for protected guests:
> > KVM_CAP_STEAL_TIME reports 0 for them. The host still accepts the
> > KVM_ARM_VCPU_PVTIME_CTRL attribute, whose IPA would point
> > kvm_update_stolen_time() at the guest's private memory on every vCPU
> > load. Return -EPERM for the attribute group instead.
> >
> > Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> > ---
> >  arch/arm64/kvm/guest.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> > index b01d6622b8720..23f725e2cf745 100644
> > --- a/arch/arm64/kvm/guest.c
> > +++ b/arch/arm64/kvm/guest.c
> > @@ -916,6 +916,10 @@ int kvm_arm_vcpu_arch_set_attr(struct kvm_vcpu *vcpu,
> >               ret = kvm_arm_timer_set_attr(vcpu, attr);
> >               break;
> >       case KVM_ARM_VCPU_PVTIME_CTRL:
> > +             /* Steal time is not offered to protected guests. */
> > +             if (kvm_vm_is_protected(vcpu->kvm))
> > +                     return -EPERM;
> > +
>
> nit: We have vcpu_is_protected()

Will do, and I found others in this series to fix with it.

> Also, would that make more sense to put that check in kvm_arm_pvtime_supported()?

kvm_arm_pvtime_supported() takes no vcpu, and its other caller reports
KVM_CAP_STEAL_TIME, which is already 0 for a protected VM. More
important, moving them would turn these three into -ENXIO, where
-EPERM is the right errno: steal time is implemented, it's just not
permitted for a protected VM.

Cheers,
/fuad

>
> >               ret = kvm_arm_pvtime_set_attr(vcpu, attr);
> >               break;
> >       default:
> > @@ -939,6 +943,9 @@ int kvm_arm_vcpu_arch_get_attr(struct kvm_vcpu *vcpu,
> >               ret = kvm_arm_timer_get_attr(vcpu, attr);
> >               break;
> >       case KVM_ARM_VCPU_PVTIME_CTRL:
> > +             if (kvm_vm_is_protected(vcpu->kvm))
> > +                     return -EPERM;
> > +
> >               ret = kvm_arm_pvtime_get_attr(vcpu, attr);
> >               break;
> >       default:
> > @@ -962,6 +969,9 @@ int kvm_arm_vcpu_arch_has_attr(struct kvm_vcpu *vcpu,
> >               ret = kvm_arm_timer_has_attr(vcpu, attr);
> >               break;
> >       case KVM_ARM_VCPU_PVTIME_CTRL:
> > +             if (kvm_vm_is_protected(vcpu->kvm))
> > +                     return -EPERM;
> > +
> >               ret = kvm_arm_pvtime_has_attr(vcpu, attr);
> >               break;
> >       default:
> > --
> > 2.39.5
> >
>
> --
> Vincent

