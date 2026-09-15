Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2BDC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 17:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XlHkuIUf+cxpyd7ecVaaZJVqPaf8IdRSyBN6om6Fe6w=; b=NSZwqZt+m5wuTUnENGYdUBppuo
	POhshiWy6SqyJhmmzTqy4JnQEeXAQQZK7y/C+vU3HvwoG8zmEdhyI05YQz0N5jwfkZB1gHE2MQQ36
	nwXzmvqgMX6R8SH3PaKSIoZ8djG0Mr5xYuExPh881l960Weihy4KLIoCDbYtgqaUI/NdAB3YJeXtx
	IOJ9X2LIiAe30vKPAeHfOMvPcC9LhuDGtIaJNXOjuyuK9qHXFRqO6hYjB1r6TG6enscBhSYC3edw0
	s2RkmD+Vm/RdWgKpwOyl2bfqLDy9J2Zbkiu4Auf8o0zDYAMYrxMgKvZ+Q5HeUoOGZ3mOmHuUXpbUn
	pHzPVzrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Wio-00000007YQL-47Ye;
	Tue, 15 Sep 2026 17:13:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Wic-00000007YML-3gaZ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 17:13:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XlHkuIUf+cxpyd7ecVaaZJVqPaf8IdRSyBN6om6Fe6w=; b=o40qLPDmNDTENhcY6XNsUc0iqN
	tzYQtph7PUhniuVU3O2y4WRVnYFe9SXS/XFjfFLQc39o+ncEdeDSQoFo4kQlLbcZLw0n34GJGMMj3
	e/r2rYkNTw7/1UcUoUCgbRXqOsBQmH4S4ZEQ5CkU/oka4bWze/p48FWqe+cglXmgvHeBJ6gk0SOMM
	+SQXO939juJkyrRtK8Ys1MjQ5Uaw2pohGkw9n49Ze9gBEmnEnUg5sUoh5SwNgQ9djH/FkEY4JBEiO
	4XOKEybJYe+ILG8ifPSMKVdj1oT67o+7g5xnTOkWNlSbDBfIEKlqNeO6zuRcgpr/PpV4yjcz7iMkT
	QEJlSLnw==;
Received: from out-122.mta0.migadu.com ([2001:41d0:1004:224b::7a] helo=mta0.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6Wia-000000074YF-0MyV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 17:13:17 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Jp96XiPKTcamQsTvuwBYBtrk9Zn8cDubgT6B+0WBg94=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789492394; v=1; x=1790097194;
 b=S89lTQTDbxYYQEV0mQm7LHE5n4WgZxDkcLzLxnINvmluzrh2qFvyEWg9dvamvSGCUrYCbc4S
 KMLFhGUDoAzf5K232SIS1OwQ1EB0WR3LlCoJQj5fguzYy8GE9kEDLEtm5uaKO8ix7HdqTRJWpd9
 5dHST/4+Oefrs6w3Pv57W0dU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 71b2fbeaff68442e;
	Tue, 15 Sep 2026 17:13:14 +0000
X-Mizu-Trace-ID: 71b2fbeaff68442e
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b78e073980so150e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 10:13:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxGBzx/ht++rLE9r8zsWz5JKzfI8UK+yXhvu0kjOhwC5CmN2+lN5ZXDp54IORqq4x3DuzuX6R9NLtJD8JGe/dMT@lists.infradead.org
X-Gm-Message-State: AFuF++nWv5pYTeHHLKsKo7phEXDkba2Y+8f6U2KCVgPrv8iOuU62cuxC
	A+Adz/Qg7C/yh2zEGha4lu4rHAgEqcZSti6WSEKzYk4v2VQrgFIcqyYCb/dO3cN84srzkR8gBLf
	yWRVJZlSIE8Lrieti2K9ikYSuuN7IR7Bh8jZ/LnhH
X-Received: by 2002:a05:6512:1194:b0:5b7:6707:e44c with SMTP id
 2adb3069b0e04-5b8b2d5785fmr187938e87.12.1789492389080; Tue, 15 Sep 2026
 10:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260807164322.2970811-2-sebastianene@google.com> <20260807164322.2970811-14-sebastianene@google.com>
In-Reply-To: <20260807164322.2970811-14-sebastianene@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 15 Sep 2026 18:12:32 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxAb1vDZW2zf0L3S4JmWMULuNPcO=8KkwZt6TasSvEukQ@mail.gmail.com>
X-Gm-Features: AcwNN1W6pe0lKiNtcjxGTo4pp5BEYRvaWFFOe0G_chQeibnLqZ86nTCgbdmtGNg
Message-ID: <CA+EHjTxAb1vDZW2zf0L3S4JmWMULuNPcO=8KkwZt6TasSvEukQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/13] KVM: arm64: Prevent the host from programming
 new GITS_BASER tables
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, mark.rutland@arm.com, 
	maz@kernel.org, oupton@kernel.org, rananta@google.com, 
	Sascha.Bischoff@arm.com, suzuki.poulose@arm.com, will@kernel.org, 
	kvmarm@lists.linux.dev, android-kvm@google.com, bgrzesik@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nathan@kernel.org, perlarsen@google.com, seiden@linux.ibm.com, 
	smostafa@google.com, tglx@kernel.org, vdonnefort@google.com, 
	vladimir.murzin@arm.com, yuzenghui@huawei.com, zenghui.yu@linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_181316_284611_17886896 
X-CRM114-Status: GOOD (  11.59  )
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

Hi Sebastian,

The GITS_BASER restriction is right, but the new range dispatch lets a
sub-word write through and the masking is incomplete. A few things:

On Fri, Aug 07, 2026 at 04:43:22PM +0000, Sebastian Ene wrote:

> diff --git a/arch/arm64/kvm/hyp/nvhe/its_emulate.c b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
[...]
> +static void baser_write(struct pkvm_protected_reg *region, u64 offset, u64 value)
> +{
[...]
> +        value &= ~(GENMASK_ULL(47, 12) | GENMASK_ULL(9, 0));
> +        value |= (baser & GENMASK_ULL(47, 12)) | (baser & GENMASK_ULL(9, 0));

baser_write should force Valid[63] and the cache/shareability attrs
from the snapshot too, not just PA and [9:0]. As is, the host can set
Valid on a BASER that setup left invalid (pkvm_setup_its_shadow_baser
only mediated tables that were valid in the snapshot), which activates
a table whose L2s hyp never took, and it can change a table's
cacheability/shareability. (Sashiko)

> +        writeq_relaxed(value, its->base + offset);

offset is the raw trapped offset. pkvm_its_emulate_handler now matches
the whole GITS_BASER range (the num_registers change), but it still
doesn't require reg_size == access_size or offset aligned to
access_size, so a 4-byte write at GITS_BASER + 4 reaches baser_write
with offset 0x104. This writeq is then a misaligned 64-bit Device
write that alignment-faults to EL2 and takes hyp down. (Sashiko)

And forcing the address from host_state->tables[].val only points at
the right table once setup validates the snapshot against the hardware
GITS_BASER<n>, the same setup gap as the tables patch.

Cheers,
/fuad

