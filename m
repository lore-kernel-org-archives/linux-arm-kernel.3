Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C54CA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 13:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYUbr06nCzkun3NGQIdKMFxFK4xBcbT7RiA9aRgNq6I=; b=Vj8yqd2lhGo6EuUuAUohoTmt9k
	cBJAXwiwKLGKY1/XeVp58zwktBykWYnJcTuD2Ymi9257hym6trDA64oDnL+7IcQktyQuRg0SRTBQN
	eB+Q054smCQASYfU35An7pqOOgYRRYhY8vrbD/+qvz2ce6oUG1u0efRTu77IQIs1sFkkhpQhTO+nS
	p+09n+GMa2eG0p1g7dRMItbgVY3TawtOibyhPvbMSuXAwMIP5deFaPgndjMt8dAOu+igtH42pWvqi
	yj5BjceiVIm/pUTBAJYHN6wdxh1ZOMS3dYI+/8WRHym0FzTs92kqsDaW1yd6cRRsQwFbo7LuYPAnP
	xDJ0q2aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGc73-0000000CtOC-3etP;
	Tue, 13 Oct 2026 13:00:13 +0000
Received: from out-224.mta0.migadu.com ([2001:41d0:1004:224b::e0] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGc6y-0000000CtMa-3HPO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 13:00:12 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=LYUbr06nCzkun3NGQIdKMFxFK4xBcbT7RiA9aRgNq6I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791896406; v=1; x=1792501206;
 b=tBgPHyTM5siVvDz1GvdfGyGJe+fpsDuTrLTbHLYDh/bDloUXWNf7aeIwgnHZb++B2927Ucyd
 uHBZnxoYAMShIqbPPgD8jSmR48RqwnQDJVqRAmQe+q27lEJpc+6Bsd6SSLIDk50AIc0OYvQZX9b
 TaTwxQSaHIHgBOE0cGpT4ido=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 04134d22086f35ae;
	Tue, 13 Oct 2026 13:00:06 +0000
X-Mizu-Trace-ID: 04134d22086f35ae
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bcf03d95b8so16120e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 06:00:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw5eCIt7WVO/BwyE0T6GmR4ZMFp9f7y1DiVeYRtVdkd3hHgnYScTlbBO0p5swm1h4Blr4V8FvApXFXACVyzUq2W@lists.infradead.org
X-Gm-Message-State: AFq9FYIMKA0Q/AhNqMjaw9KCJhOy3Ra7nTERRZ6zsOrK6u23VQmle9i7
	vaO9wLGrZkoMhlXt3HJap5MJFqrvAZM+qiUcYtx7jjSNQZY8rhgwldhlBCM+DxssJzC6z+4jguo
	sIazHQmF8aaZksCWaMzbeTB0yOsHAC5gRrPA1z/Mh
X-Received: by 2002:a05:6512:1284:b0:5b8:c230:1241 with SMTP id
 2adb3069b0e04-5bcea5f77eamr325892e87.10.1791896400858; Tue, 13 Oct 2026
 06:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <20261013081646.933312-1-fuad.tabba@linux.dev> <as3_NKT20MNdqaJR@kernel.org>
 <86wlrl2a2f.wl-maz@kernel.org> <CA+EHjTztZpFrmuz9pK+01BsDxHnzpEwUMt6E3nUrgk4NNTsKYQ@mail.gmail.com>
 <86v77526me.wl-maz@kernel.org>
In-Reply-To: <86v77526me.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 13 Oct 2026 13:59:22 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyZA6VL6EjhkB2bf9fDk4fUWpc=iXsu+sR1B+_YbR-nOQ@mail.gmail.com>
X-Gm-Features: AclHuK91_oNrs_00jtZZScBUrir_3CsFdStuVvifnhav_N77zBitsUsBdY8t0FU
Message-ID: <CA+EHjTyZA6VL6EjhkB2bf9fDk4fUWpc=iXsu+sR1B+_YbR-nOQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261013_060010_923382_5AA6836A 
X-CRM114-Status: GOOD (  19.81  )
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

On Tue, 13 Oct 2026 12:16:09 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > A vCPU on its way into the guest does the same: it loads its LRs in
> > kvm_vgic_flush_hwstate() while it's still OUTSIDE_GUEST_MODE, so
> > kvm_arm_halt_guest() doesn't wait for it. With the delay after the
> > flush instead, on v2 plus your 1/7 and 2/7 [2] and both changes from
> > your reply to 1/7 [3], the guest takes it in 9 of 20 runs.
>
> Does this mean we still need OUTSIDE_GUEST_MODE to be a store-release
> past the point where we resync the state?

Not for the 9 of 20: that run already had the release. The halt reads
the OUTSIDE_GUEST_MODE the vCPU published at its previous exit, so it
doesn't wait for the early exit that folds the LPI back.

We do still need it for the window after the exit: with the delay
there and the same patches applied, the guest takes it in none of 20
runs, against 13 of 20 on v2.

> > Once DISCARD waits for irq->on_lr to clear before clearing
> > pending_latch, the guest takes it in none of 20 runs in either case.
> > I'll add that to v3, unless the single-vcpu stunning already waits for
> > it.
>
> Polling for on_lr feels very dodgy, and I'd like to avoid this. If the
> OUTSIDE_GUEST release addresses it, I'd rather do that.

I'd rather avoid the polling too, but the release alone doesn't close
this one. The vCPU would also need to store IN_GUEST_MODE and check
its requests before kvm_vgic_flush_hwstate(), so that it never loads
its LRs while it's OUTSIDE_GUEST_MODE. The existing check after the
flush would still be needed, for the KVM_REQ_GUEST_HYP_IRQ_PENDING
request kvm_vgic_flush_hwstate() makes in a nested state. With that
and the release, the guest takes it in none of 20 runs with the delay
after the flush, and herd7 finds no LKMM execution that leaves it
pending.

The IN_GUEST_MODE change would also cover vgic_mmio_change_active(),
which depends on the same halt (the comment above
vgic_access_active_prepare()). Would you be OK folding it into your
series, on top of your OUTSIDE_GUEST_MODE changes? Patch 2 then
wouldn't need the on_lr wait.

Cheers,
/fuad

