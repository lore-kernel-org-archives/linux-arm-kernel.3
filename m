Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05572CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 10:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVAzhVgNrvfGhJXuSFvrFDmK336xmECT5jayATxTm8M=; b=Lu5GHGblC4hXqlRU6rOFaOE3xZ
	+pI2V9m6zBZ5mK9xNjFyrmQGlwDAlvfsrQiwvEmIGcJVegFarQ7ktQGpGEgvfMO8/jPPvWHVYE+YN
	UhnYUkr5ivVr/3J9gHlO9zW7wR2cFhRvUCpUIDKdCa3CJCQ0z8HSa2kdrXZG0ocgHwL3tcQGcUG3f
	lDHLVav1kqnqNOBwPxJLTDQ+GkBsnNTCjMb9Jhxzdf1bxu5yu2llgx03JetsAOTB6E1ft30iRWgw7
	WWhP7QmqeqgcqdHuhcNuauBZQLdOxGj9mKVNNRIN8vAtnNUtGP8GXk83MgqqZYLjamVpwNYRXkUpa
	UaoblHBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGa5w-0000000Ccz3-2sWZ;
	Tue, 13 Oct 2026 10:50:56 +0000
Received: from out-19.mta1.migadu.com ([2001:41d0:203:375::13] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGa5t-0000000CcyO-3zKk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 10:50:55 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=KVAzhVgNrvfGhJXuSFvrFDmK336xmECT5jayATxTm8M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791888650; v=1; x=1792493450;
 b=WpvrVoWn8cbXBSaxSXGuknCIRtmb7vPq6Wgm78yq8ciJRHvVxhSeptU2/IleGfHu1DSRz+5G
 oJFPqjI6VXM0TfJZS//20Fbh9T5Q5aj+KyalC2cw26xFs/5+uurEqcPhJgM2PffquCH/M+/iICT
 7lbh3yk4waNjnyt3AT5TqAfw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d059e5cf8b806acd;
	Tue, 13 Oct 2026 10:50:50 +0000
X-Mizu-Trace-ID: d059e5cf8b806acd
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5ba40832934so16923e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 03:50:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBykfBhQH6LQiUoSc/NSp3NTwPAl61Md8uumh+2w6O7tLtgMSNMj73u2m4Kgib9H4wybYTKQYxp6wvAMFsesPFOV@lists.infradead.org
X-Gm-Message-State: AFq9FYK8+ic3/y8l1WlAif8eTI2Q+RFDtwsNbitgyGCnLZ8jARhgCyzI
	G50KYNLV4+Q0Dp/gZBvowkyu950zoh4+/C5C5PksAqKgxd/yA3ojuXrinyM2t5TL23i1OGZuBFl
	MjqyeKyRNgwyjjOmBLkCnM5d9MHVKnZg0AQ0ywf5B
X-Received: by 2002:a05:6512:1284:b0:5b8:c230:1241 with SMTP id
 2adb3069b0e04-5bcea5f77eamr307791e87.10.1791888646329; Tue, 13 Oct 2026
 03:50:46 -0700 (PDT)
MIME-Version: 1.0
References: <20261013081646.933312-1-fuad.tabba@linux.dev> <as3_NKT20MNdqaJR@kernel.org>
 <86wlrl2a2f.wl-maz@kernel.org>
In-Reply-To: <86wlrl2a2f.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 13 Oct 2026 11:50:09 +0100
X-Gmail-Original-Message-ID: <CA+EHjTztZpFrmuz9pK+01BsDxHnzpEwUMt6E3nUrgk4NNTsKYQ@mail.gmail.com>
X-Gm-Features: AclHuK_kCCq3-9Q2tIHYoGWtf99ZLB81HNWPaAdr5x53TtL1SwcCZkCDuzzJ-Oc
Message-ID: <CA+EHjTztZpFrmuz9pK+01BsDxHnzpEwUMt6E3nUrgk4NNTsKYQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261013_035054_128124_FD3041A0 
X-CRM114-Status: GOOD (  14.17  )
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

On Tue, 13 Oct 2026 11:01:44 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> Yeah, I now have a series that has the counting pause, your single
> vcpu pause (fixed to DTRT), and the LPI disabling fix. Patch #2 of
> this series can probably make use of the single-vcpu stunning.

I'll rebase the series on that once it's out, with patch 2 using the
single-vcpu stunning.

> As for the OUTSIDE_GUEST discussion, I've had a long discussion with
> Will where we reversed engineered the synchronisation requirements,
> and concluded that there was nothing to fix on that front (the logic
> is incredibly subtle and counter-intuitive, but overall sound). This
> patch is therefore dropped.

The first [High] issue Sashiko found on patch 2 [1] holds for DISCARD,
because the fold writes back the pending_latch that DISCARD clears.
With a 2ms delay after the exit to widen the window, and the DISCARD
sent at a varying time, the guest in my DISCARD reproducer takes the
discarded LPI in 13 of 20 runs on v2.

A vCPU on its way into the guest does the same: it loads its LRs in
kvm_vgic_flush_hwstate() while it's still OUTSIDE_GUEST_MODE, so
kvm_arm_halt_guest() doesn't wait for it. With the delay after the
flush instead, on v2 plus your 1/7 and 2/7 [2] and both changes from
your reply to 1/7 [3], the guest takes it in 9 of 20 runs.

Once DISCARD waits for irq->on_lr to clear before clearing
pending_latch, the guest takes it in none of 20 runs in either case.
I'll add that to v3, unless the single-vcpu stunning already waits for
it.

Cheers,
/fuad

[1] https://lore.kernel.org/r/sashiko-outbox-169278@kernel.org
[2] https://lore.kernel.org/r/20260929093548.3598547-1-maz@kernel.org
[3] https://lore.kernel.org/r/86a4p0403b.wl-maz@kernel.org

