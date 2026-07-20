Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E0EC44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 19:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4oc02UGdmLh31pih6zb2K/J1p4iSYx2HWoGM19eKbs=; b=IFdpTUn8MDv9SEtyMxY5J9vh8G
	aAciR+WuFvzDrcXJrhnjxmXyq37pb4Kt/gxE4h9XPnM1EZZFNEf6drYEzgvUbqOq0zuNbzTlxeyq2
	IzvzR3ujpNE6X0VtH29zBW/hbEj7uQ3umyKuJQKw1rTcCLc5AuJVLHxnX5IPoCuEYpTy+DmfjIOb5
	ab3gztd/R7Xqx098pnECsGHx5BaMfnvy6BfiW00SFdZYFhxSarI4kL2qMXp0Ql8hLUprAmP+L4ctv
	nGSPtf5NWSa0APARszooY8nwyZQCN/CG9YUo3rvsBauhAO7a6hbhJ0oRYAxGqlYSV/GAydpBNKPdI
	TUZFQGeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltIJ-00000007ib0-20Kl;
	Mon, 20 Jul 2026 19:04:51 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltIF-00000007ia0-3vZN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 19:04:50 +0000
X-Forwarded-Encrypted: i=1; AHgh+RowfT1/KIT79UYX/0NMAxz1FMpfxB5T3wrD21E2QD5FCr2+9g1FGVTLGDQkmO7YXCsVnMb20yH4D52AxbpcsUs5@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784574284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z4oc02UGdmLh31pih6zb2K/J1p4iSYx2HWoGM19eKbs=;
	b=UWNMU0Mp1mAKLF5w9p5oKMypeVCWxnZuMryJa5p6S1WcgQCJ4Lb5ufcJ959oSSgk6Kew+J
	oG72SLmtg6CdqmLAU3ghhfFkZDVXkFHUCHwHQAZ+tVtCOUKhVnK7rUTjzn2wmYJ7pIpkpC
	iQDdnktzo4WLRjBLjx8TDHj5gv0BzPs=
X-Gm-Message-State: AOJu0Yy4DvioIASyLFGfabgHKIblKCJkSAkvXgL6s3akwE46MN9fBfJK
	v4zXcybfotqh9mqPDn1dzXTL/t3k7DMquSOXzKSqndcXxNKhEQcoz6+Ah7BvaBICzCCuQMCn+lv
	p2eIe+iy2tzCOOguHzGyHNP1tD+f+Aj/bGeTGGxGi
X-Received: by 2002:a05:622a:4a8d:b0:4f3:5475:6b10 with SMTP id
 d75a77b69052e-5260069a309mr4824311cf.8.1784574280611; Mon, 20 Jul 2026
 12:04:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260720184850.1826630-1-fuad.tabba@linux.dev>
 <al5wo9x7oUGzlbTo@google.com> <al5w4wn9ZhPsZYUR@google.com>
In-Reply-To: <al5w4wn9ZhPsZYUR@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 20 Jul 2026 20:04:03 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzbOcc0UpHYLCHzQyxWw7M2H0XaF_wcUBG=-xHqkezmPg@mail.gmail.com>
X-Gm-Features: AUfX_mwYfsJH3aB_tIRpzbGB-1UW5fTmJ9nimOTrdWhssuMgPDA252YmMYMb4GI
Message-ID: <CA+EHjTzbOcc0UpHYLCHzQyxWw7M2H0XaF_wcUBG=-xHqkezmPg@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Stop the hyp trace clock worker on disable
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_120448_397329_6A87909F 
X-CRM114-Status: GOOD (  17.36  )
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

On Mon, 20 Jul 2026 at 20:03, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> On Mon, Jul 20, 2026 at 08:01:55PM +0100, Vincent Donnefort wrote:
> > On Mon, Jul 20, 2026 at 07:48:50PM +0100, Fuad Tabba wrote:
> > > When disabling, hyp_trace_clock_enable() cancels the clock work but then
> > > falls through into the enable path, which re-schedules it and marks the
> > > clock running again, so the worker never stops. Return once the work is
> > > cancelled.
> > >
> > > Fixes: b22888917fa41 ("KVM: arm64: Sync boot clock with the nVHE/pKVM hyp")
> > > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > > Closes: https://lore.kernel.org/all/20260720172923.E4F161F000E9@smtp.kernel.org/
> > > Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> >
> > Done here already https://lore.kernel.org/all/alczBmnItMwq8xj4@google.com/
>
> sorry I meant here:
>
> https://lore.kernel.org/all/20260715105100.3178255-1-vdonnefort@google.com/

Thanks, and sorry for the noise!
/fuad

>
>
> >
> > > ---
> > >  arch/arm64/kvm/hyp_trace.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
> > > index 2411b4c32932c..27367843fd211 100644
> > > --- a/arch/arm64/kvm/hyp_trace.c
> > > +++ b/arch/arm64/kvm/hyp_trace.c
> > > @@ -116,6 +116,7 @@ static void hyp_trace_clock_enable(struct hyp_trace_clock *hyp_clock, bool enabl
> > >     if (!enable) {
> > >             cancel_delayed_work_sync(&hyp_clock->work);
> > >             hyp_clock->running = false;
> > > +           return;
> > >     }
> > >
> > >     ktime_get_snapshot_id(CLOCK_BOOTTIME, &snap);
> > >
> > > base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
> > > --
> > > 2.39.5
> > >

