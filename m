Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5C5C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 19:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUTO67W7pIQuxtDQ4EVl7HKeWGIRh9KyGHjp+5VkxDg=; b=RpZzUQfOH6LedDWXj2CIznDkps
	8Y55iGiwEZiRKVCYOPcS+oNkXEDT86tZ+MG5OqSAihQRoJtW92ywBWjUsD+9ZM2sigzIQ8+karxVd
	/Fz6zMTrkizju5d1omenKoFlUsom6WWv9MlKdJUGUuzJwo9AuBgVBr9TVJVVZCZpXdj9kXYo+ZWZ9
	VDu55N43+HAITcoTwc7m/xiWeNpSEOEdh8wvtnkUsjWAgGqJ67JxlKkYVVuno4VrnUNxRdU6y/Q1Q
	KIjCGQzZV8djbA1MyU8PCAxBM6Bx8s9TlSqqKZuNewpSkrX1yNFB3EfB9Ap8wkpEMLXlRECG1aTd1
	nEvpkiVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6uzK-0000000A0Pe-21HC;
	Wed, 16 Sep 2026 19:08:10 +0000
Received: from out-42.mta0.migadu.com ([2001:41d0:1004:224b::2a] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6uzH-0000000A0P8-3DQw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 19:08:09 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=+TDPxJtL8DsDFOfZOcxmuxXF09ysKs2kKWxtP5RDI3c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789585685; v=1; x=1790190485;
 b=RRY2e5IOu8715wz1XFDgSDXNL2LgN3QRqGa0N1jrrGXcjJ7S/fCWH3FBUeddt70tXuzuv0TW
 kg9h6L5aOZhCPpsRqtKMmC30nKQDn6D/6yGzVuCNA8HUC/JQrpwlCeXcdAsvmS6qp4hSvCiD+xW
 SunU4EYCONT8wY3KfEb/pnP8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c1e3ff26580b4df5;
	Wed, 16 Sep 2026 19:08:05 +0000
X-Mizu-Trace-ID: c1e3ff26580b4df5
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b78e073980so862e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 12:08:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByKF7bwh9rIebKapfon5EKvUhcGbIaG84cWnMJg6ncyr/P8FWwqmZJYOhNwzg3xjsrwNscTw27RcF3A3QLLt7eh@lists.infradead.org
X-Gm-Message-State: AFuF++mg/sofaskXpuRazM7gfZU1M2ATTHeUN41de7RT2zXxnnEC+V/h
	DZTMr9+RVdGW7290KJ6siIgmJ4l61XGR+3w3/qjrO4MAaoOaEzokfMgL8blXKH9jyW3t4Wiq8nr
	Ok4F/bqi8k5tc86QSqJSr0j0i9VdgA/zGIAj+pQsS
X-Received: by 2002:a05:6512:2526:b0:5ae:b918:79d5 with SMTP id
 2adb3069b0e04-5b8baa4c0afmr22017e87.2.1789585684442; Wed, 16 Sep 2026
 12:08:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260914113338.159227-1-fuad.tabba@linux.dev> <20260914113338.159227-16-fuad.tabba@linux.dev>
 <86a4ph5fb9.wl-maz@kernel.org>
In-Reply-To: <86a4ph5fb9.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 16 Sep 2026 20:07:28 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzCQkeXQQcCDwABLR2w+NTmKTG3V6RSmhzYNayaoYXw3g@mail.gmail.com>
X-Gm-Features: AcwNN1WM-tTkNGmfulRqkmQ-SKP25Un1Bu-f9T35yz7K6_Zjf4OVrGXAUm-nH7c
Message-ID: <CA+EHjTzCQkeXQQcCDwABLR2w+NTmKTG3V6RSmhzYNayaoYXw3g@mail.gmail.com>
Subject: Re: [PATCH v3 15/18] KVM: arm64: Reject host access to protected VM
 private state
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, steven.price@arm.com, vdonnefort@google.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_120807_945596_74FC820B 
X-CRM114-Status: GOOD (  19.55  )
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

On Wed, 16 Sept 2026 at 17:30, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
[...]
> > +/*
> > + * Once a protected vCPU has run, the host copy is not the guest's state,
> > + * and EL2 has read mp_state, which it does only at hyp vCPU creation.
> > + */
> > +static long pkvm_filter_vcpu_ioctl(struct kvm_vcpu *vcpu, unsigned int ioctl)
> > +{
> > +        switch (ioctl) {
> > +        case KVM_ARM_VCPU_INIT:
> > +        case KVM_SET_ONE_REG:
> > +        case KVM_GET_ONE_REG:
> > +                if (vcpu_is_protected(vcpu) && vcpu_has_run_once(vcpu))
> > +                        return -EPERM;
> > +        }
> > +
> > +        return 0;
> > +}
> > +
>
> I'm not keen on returning -EPERM for the ONE_REG stuff. For a start,
> X0 *is* valid on MMIO, and when you want to support LD64B and co,
> you'll need to show the actual data there.
>
> I'd rather return what is in the host vcpu structure, as normal.

I think we should keep the error, for the reason s390 returns -EINVAL
from ONE_REG on a protected vCPU and x86 does from the register ioctls
for protected VM types: once the vCPU has run, the copy is the VMM's
boot state plus what the exit handlers copy out, and the VMM can't
distinguish them. x0 on MMIO is one of those fields, but the VMM reads
it from kvm_run->mmio. For LD64B, EL2 would copy the operands out the
same way and the error could be relaxed to those registers. Loosening
later breaks nobody. The comment and the message do overstate it by
calling the copy "not the guest's state", and I'll reword both in v4.
More on the kvmtool thread [1].

Cheers,
/fuad

[1] https://lore.kernel.org/all/CA+EHjTwCs8B4du2=rAdoTOpOfh64p5cbW902e5g0u6NZT=r=gA@mail.gmail.com/

