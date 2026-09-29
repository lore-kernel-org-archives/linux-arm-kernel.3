Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BD9CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 13:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dR4qcRDxX3hO7ETMKHI+QRh0vavJ6h+pN11Uh696H1M=; b=yf3xLuhP7p8ZdurxfoQDyaaA1d
	w5bZd0i4+b4EWMWo+hpHpxfRRC6oCg4PSkvj7S2HOfDInvmkAkj5UNQIf6PeYUwJbBbOGo+AJZXhv
	DEONgCve0Yr8A0aLXbWhrUkaJdAtS37E/yyN4K9qqjdQXm3XmxCa63wPZwA8CdeKWVd37jKf3dcR0
	AT02wZ74G0q7a/aNlBqX8N1pm1FvDyqn/rJuBZkaGIls0YPFo6/y2/ZuIJNgcZDLLSpduZaCvKDSW
	X0LPuzf3q0R8G7Iut2qgA1ArZCenlYGEGP1EUFGHTQWevNavJ4tGHGGfRoYm2AdozgkY6VmKY511A
	o5bYAsNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXRR-00000003cFN-3u2s;
	Tue, 29 Sep 2026 13:00:17 +0000
Received: from out-125.mta0.migadu.com ([2001:41d0:1004:224b::7d] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXRO-00000003cE2-0cYh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 13:00:16 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=3g9q9xAMofPTtsw+JqswDBxUzsiZn8hnkYRupWW+aWE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790686811; v=1; x=1791291611;
 b=fAy3OKejVm+gRCeTFoptivE9lwuAPD94U0O/kjVb2+/JtZn2ZN0lpmWaEJvuK4hDMZfi69tk
 KRghxPR8H662qXx16ZhHNTOlQ/p2GRlhM2QNE88xu+Oa9/nXUc/qIpRQXYilX4AE8J6XPxup0XX
 L4K6/w3PkRHpv8d/r/pG/6pc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2ac412c2879f231f;
	Tue, 29 Sep 2026 13:00:01 +0000
X-Mizu-Trace-ID: 2ac412c2879f231f
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b8ea0ca5baso7216e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 06:00:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzdOqAq8BRJrkXgvlAUK0JC4WeoZ2FzYwkydF1dbwsZ2E0WmUDSCw8a775b7pKXF0apt7PHzgojmp7lXuiFhdJ/@lists.infradead.org
X-Gm-Message-State: AFq9FYJYrO9yqFkstE+/xJqd9KGrxTj0Ugc9Z0aLvhoa/WYYIJ7HL3O/
	Agfcku1PWLr8ecxd5yf2VNv8NDT3XU+fLD8d7c7mXKh8Fh5QGMgf6vuyEtp5Ax2n3E1v4RBBH1z
	bIOisa2w1Wwc8YqxJLKVSJC2g8PV6BV3u/Sm99VVF
X-Received: by 2002:ac2:5b03:0:b0:5ba:3602:4343 with SMTP id
 2adb3069b0e04-5ba360245a5mr41833e87.16.1790686800038; Tue, 29 Sep 2026
 06:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260929093548.3598547-1-maz@kernel.org> <20260929093548.3598547-2-maz@kernel.org>
In-Reply-To: <20260929093548.3598547-2-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 29 Sep 2026 13:59:23 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwZSFUZmavbB4tE-eFxHg9WF80CA230EwvynuNcZQ0prg@mail.gmail.com>
X-Gm-Features: AclHuK9iOAMxlNpl03FjFTpY7NaQOY39bA66xUuGfPVEXi6mkeEvy65UK09-Y0M
Message-ID: <CA+EHjTwZSFUZmavbB4tE-eFxHg9WF80CA230EwvynuNcZQ0prg@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] KVM: arm64: Move OUTSIDE_GUEST_MODE publication
 past context being saved
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Yuchao Zhang <ndaugoing@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_060015_197096_074DF0D8 
X-CRM114-Status: GOOD (  13.30  )
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

On Tue, 29 Sep 2026 10:35:42 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> Move the publication of OUTSIDE_GUEST_MODE to the point where the state
> is actually written, and give this write release semantics to ensure the
> correct ordering.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: stable@vger.kernel.org


No Fixes: tag?

[...]
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
[...]
> @@ -1386,6 +1385,12 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>
>               kvm_arch_vcpu_ctxsync_fp(vcpu);
>
> +             /*
> +              * All the state has been synchronised, let advertise
> +              * we're outside of the guest.
> +              */
> +             smp_store_release(&vcpu->mode, OUTSIDE_GUEST_MODE);

Pardon my atomics :), but what does the release pair with? On the halt
path, the only reader I can find is the cmpxchg() in
kvm_vcpu_exiting_guest_mode(), and the LPI-disable and MOVALL halts
then take ap_list_lock or irq_lock. Would WRITE_ONCE() be enough?

Should the early exit path (the kvm_vcpu_exit_request() bail-out) get
the same treatment? I think that's what Sashiko is trying to say in
the patch 5 review [1].

nit: "let advertise" -> "publish"?

Cheers,
/fuad

[1] https://sashiko.dev/#/patchset/20260929093548.3598547-1-maz%40kernel.org?part=5

