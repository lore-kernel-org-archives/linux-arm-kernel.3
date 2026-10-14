Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B434CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 15:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0f0XlcDWPu7vEl/cNYEpPAYzbQQK1B6EzHdGpLVNiw=; b=Yuhq3azygcPK1xNclGcDc5GUYA
	/t9qoEiQ0JnG8BA75AuTa1OueuppJebE0XR2lJ/IvMHkRracdVbHTYRnACmig7kngI3vzXr03ufYP
	8SoY5v+JSx2KtXKjO8P0CE4qiH3WenGEb+OO7r5I2xkpeg60wQYBhcJBLc08bzot8A8DyBWKgq1p4
	6OQiiG1umbuTOp0urpCR5hFSXnY98gaSYQkRUkMWkbwUKSipHe6wbHMztsgmY6zpg/ULemiHVWjPU
	J+YC5d1We3YymFyS689aNOSyYn1dKg/eeeI1KdpS/UtmlcqUcsLZgOlkI8IX2rm+OHeVGTQBqq80m
	kwFJHHvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH0nT-0000000FphY-2J31;
	Wed, 14 Oct 2026 15:21:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH0nQ-0000000Fpgz-0sgl
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 15:21:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=X0f0XlcDWPu7vEl/cNYEpPAYzbQQK1B6EzHdGpLVNiw=; b=TKXHOYybLqce3rU2lWrt3HuDK6
	UNAq63xSYYEuigGhnMlDlM9mfbHxH7jn0H/H+svVnSyZkwQcjky3HJqzf8lc7T82oll9mPf4v/wUo
	M00F26seI6lQNSb4inhjyYOlNW9UopeJUzx8/aDG+hAsa3bsraItjJ8zb86RwVbnWsjiajr0fLvl0
	mfgWBUnfos9UTPEo4RTP+y2SdGzUw5j6D9rPuD0wPCjUxu52XOY0HSuAKAlEQtjZ+irMwch1N2JFg
	akboJD6tYZ8cJ9NgF30frzBg6drM2VLJYI+Qwr/RWlMnJD4Mm+MdSyRhFOy+z4H5/NxAmmym/1id5
	MFXt5rXw==;
Received: from out-174.mta1.migadu.com ([2001:41d0:203:375::ae] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xH0nN-0000000GvxH-0hBe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 15:21:35 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=quvfgFJ++znBLejNnQxBzynex0w2Jk0eO461131buU4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791991290; v=1; x=1792596090;
 b=e8CQk9tfNeROBWVJjPWdSPlzDmKTaOPsj8JId2r0gB/IMoOjYdXijoQKZyj3lDFRvEI9JKk1
 pBGK1RsEKMWUOXK2GA7JIJZrvsMzE7fUqGHyw5WNiq8hJ8q9Azw+TZIW0Ejl5SJgLBsQ6kChgEn
 LUoOJhJdkWOVJrtnzNAQjo2E=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 986b7931fc426730;
	Wed, 14 Oct 2026 15:21:30 +0000
X-Mizu-Trace-ID: 986b7931fc426730
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so33346e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 08:21:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByp4tVFcjbDpENINNG/678LjRc4I1h/Sli+R2WvIWpJbliYwqHZSeUdZmvx3pWohB1wl1E6OqoH2Qx7/KPeKfX5@lists.infradead.org
X-Gm-Message-State: AFq9FYJ+ywNn5bx3TfNgxb6+NoYTtjy5DdmZRLm+cX/X4hUgF0y9uZyk
	kR0kDr3EEP9R2OO9pJdMZSYJhTfI1bKjEx54W1sp8u9V7HfYq3vJHH+p4phqPpnpbHpOTHfCTlo
	yfGYN4iTNeuWPdXVWMNPToR0Gx2F/kd949uKcVeY6
X-Received: by 2002:ac2:568c:0:b0:5bc:b2ec:eaee with SMTP id
 2adb3069b0e04-5be35cac1c5mr118716e87.11.1791991289793; Wed, 14 Oct 2026
 08:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <86tsmp20ne.wl-maz@kernel.org> <20261013143338.815377-1-fuad.tabba@linux.dev>
 <86se281k4u.wl-maz@kernel.org>
In-Reply-To: <86se281k4u.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 14 Oct 2026 16:20:53 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwnO-G8jx+1RvSUcFyKtGB2vbASzHDjTLeZCPY90dhzJg@mail.gmail.com>
X-Gm-Features: AclHuK-B5G1xDGXPQoX5Vm0txWNpcPBVZK84TOsBPDslRqCcUXPB_JGF6FjQ5oU
Message-ID: <CA+EHjTwnO-G8jx+1RvSUcFyKtGB2vbASzHDjTLeZCPY90dhzJg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] KVM: arm64: vgic-its: Fix LPI double mapping and DISCARD
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Andre Przywara <andre.przywara@arm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_162133_376350_A3AFCB07 
X-CRM114-Status: GOOD (  22.35  )
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

On Wed, 14 Oct 2026 14:34:09 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> I don't think this is right. Yes, it probably does enough request
> checks that we end-up with not getting it completely wrong, but the
> issues are that:
>
> - we have state change before we evaluate the requests
>
> - we mix request generation and state change in a single helper
>
> and we should be able to fix that so that there is only a single
> request checking point in the whole entry sequence.

Agreed, this is cleaner. With the flush after the single request
check, your run loop is what the second litmus test in my last email
[1] models (discard+halt+check), which comes out Never under the LKMM.
On QEMU, with your diff on top of v2, the guest doesn't take the
discarded LPI in any of 20 runs with the debug hooks forcing the race.
With NV, vgic_lpi_stress and my DISCARD test pass with the guest at
vEL2, but I don't have any tests that run an L2 guest.

[...]
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
[...]
> @@ -1334,18 +1330,19 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>                  smp_store_mb(vcpu->mode, IN_GUEST_MODE);
>
>                  if (ret <= 0 || kvm_vcpu_exit_request(vcpu, &ret)) {
> -                        vcpu->mode = OUTSIDE_GUEST_MODE;
>                          isb(); /* Ensure work in x_flush_hwstate is committed */

I think you can drop this isb() too. It was added so that the early
exit's vgic sync would read back consistent GIC state after the flush
had written it (771621b0e2f8).

[...]
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
[...]
> @@ -2054,6 +2057,11 @@ void kvm_nested_flush_hwstate(struct kvm_vcpu *vcpu)
>
>          if (unlikely(vcpu_test_and_clear_flag(vcpu, NESTED_SERROR_PENDING)))
>                  kvm_inject_serror_esr(vcpu, vcpu_get_vsesr(vcpu));
> +
> +        vgic_v3_nested_update_mi(vcpu);
> +
> +        if (vgic_state_is_nested(vcpu) && kvm_vgic_vcpu_pending_irq(vcpu))
> +                kvm_make_request(KVM_REQ_GUEST_HYP_IRQ_PENDING, vcpu);

This now runs before kvm_pmu_flush_hwstate(), so a PMU overflow raised
there isn't queued yet when the pending check runs, and the vCPU goes
round the loop once more (the injection's KVM_REQ_IRQ_PENDING still
stops the entry). Would it make sense to call
kvm_nested_flush_hwstate() after kvm_pmu_flush_hwstate() instead?

Patch 2 depends on your run-loop change, so I'll wait for it and for
your series with the pauses and the LPI-disabling fix, and rebase both
patches on top for v3.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261013143338.815377-1-fuad.tabba@linux.dev/

