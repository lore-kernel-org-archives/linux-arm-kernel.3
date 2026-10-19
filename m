Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F19CCF2E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 12:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OpxE5kXPGrsppdqGxWyxuo5iEyr3HIRwZSoxHZSN43k=; b=WElSKZc+cHoLsFt+ajBp9/fIJv
	xGzfJXi0PbkEdIMO5ZkRH4mtAHVRODnvYKzm7GTtzsAvNuqgwArr9n5PsK8KqlecpyaU3o2/CgIoj
	fZkGEUbfc0klnQsQmCDcDr/FsyNyQnq6u2ylvke6Ktt8NpR9TEIed8YFWsrdC+iws8qDdCZlUZZ8z
	5BAfQlHdScHAriWSlJulRuajkvzb3uvuEZfOtld6DgZEdsbZ52PUT0RjXeqcbVV0jNWlXny1/fAEl
	SGV24sy+qGcRXNMQVg1VheddTUavwmk9wFHlrdL5XbstH/REs7L2+A7mMBuRChr5uMWQw7njRQzHz
	y0Ib8NPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImki-00000007QVl-1dVy;
	Mon, 19 Oct 2026 12:46:08 +0000
Received: from out-155.mta1.migadu.com ([2001:41d0:203:375::9b] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImkd-00000007QUR-1QcX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 12:46:07 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Qxp6b0ax9oueHkME8135NN7XH5RwaIVlp3JI/E88/tc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792413960; v=1; x=1793018760;
 b=ddAhfBnRjV4HajViEPRZvST8/4a8stWgmmit6aD56HCYiR6gP7aoC9XN0TXSgu64MS2a2JiU
 eeKalcgHgW9dTFpgrR5PX/SR9WMrcFn/PMnqCWClqHhTnyUUHpRiNF5lHMuOmSjccIIpM2HhTEo
 Zzhiy+DJ8IS9MptzGQUHAyy8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 5ce12a080d76237b;
	Mon, 19 Oct 2026 12:46:00 +0000
X-Mizu-Trace-ID: 5ce12a080d76237b
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so9700e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 05:45:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw3zEaz/fDoKnvGP9fWoSSDP/iBXR9GXQOLNvrAgRBpgscjyCQ91Q8mhp4gt69xDrOHta8eeW90ENbTirvSKHBV@lists.infradead.org
X-Gm-Message-State: AFq9FYLl/ItgZz7V1qnSRoYBbix60tAlByyXEMZp/68aqmzS7pommt2J
	Skd1UJ9pfOWCcAMUCJOAOKM0yydlkjH31oRPQNwKUp5HsRPlg67t+xaQtrRf7SAIFeIcBCcAl/m
	Kg0iAQTFCdiDxT3I79BSkyfahmFTcZbYbEOfj0Bgt
X-Received: by 2002:a05:6512:4026:b0:5be:5605:3606 with SMTP id
 2adb3069b0e04-5be560540ecmr122144e87.8.1792413957034; Mon, 19 Oct 2026
 05:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <20261014125510.2928306-1-fuad.tabba@linux.dev>
 <20261014125510.2928306-3-fuad.tabba@linux.dev> <atXqLxU5bBtJ8U9W@google.com>
 <20261019114357.3528498-1-fuad.tabba@linux.dev> <atYPZeJuw2grFDlz@google.com> <atYQKaLo4VJDoNJn@google.com>
In-Reply-To: <atYQKaLo4VJDoNJn@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 19 Oct 2026 13:45:20 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxU_dAPcm7C77SkWffJRtAzkTG3NJ6ix3Qk1hC-09wRBQ@mail.gmail.com>
X-Gm-Features: AclHuK88biJmUkYYPe6V74w0Egs3dpNZ2AJ9BmPKg1toG3idbbnqb7l-xriaAuI
Message-ID: <CA+EHjTxU_dAPcm7C77SkWffJRtAzkTG3NJ6ix3Qk1hC-09wRBQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: arm64: Ensure TLBs and I-cache are private to
 each vCPU in pKVM
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Quentin Perret <qperret@google.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_054603_526855_433F1986 
X-CRM114-Status: GOOD (  23.00  )
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

On Mon, 19 Oct 2026 at 13:42, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> On Mon, Oct 19, 2026 at 01:39:01PM +0100, Vincent Donnefort wrote:
> > On Mon, Oct 19, 2026 at 12:43:57PM +0100, Fuad Tabba wrote:
> > > Hi Vincent,
> > >
> > > On Mon, 19 Oct 2026 11:00:15 +0100, Vincent Donnefort <vdonnefort@google.com> wrote:
> > > [...]
> > > > > diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> > > [...]
> > > > > @@ -54,6 +54,9 @@ struct pkvm_hyp_vm {
> > > > >          unsigned short refcount;
> > > > >          hyp_spinlock_t lock;
> > > > >
> > > > > +        /* Per physical CPU, the vcpu_idx of the last vCPU of this VM loaded there. */
> > > > > +        int *last_vcpu_ran;
> > > >
> > > > Unlikely to be a problem in pratice, but vcpu_idx is "unsigned int". I wonder if
> > > > this shouldn't be unsigned int here too and initialised to UINT_MAX?
> > >
> > > I'd copied int and -1 from the host's mmu->last_vcpu_ran, but the
> > > vcpu_idx it's comparing against here is unsigned int, so I'll switch to
> > > unsigned int and UINT_MAX in v2.
> > >
> > > Thanks,
> > > /fuad
> >
> > Also,
> >
> > as it is always allocated when pkvm_hyp_vm is, Would it make sense to add this
> > to pkvm_get_hyp_vm_size() instead of allocating separately?
> >
> > --
> > Vincent
>
> Ha, I just saw your answer to Marc and you will switch to a per-cpu approach
> anyway it seems?

Yes. Now v2 (coming soon) doesn't allocate it at all. As you noticed,
after Marc's comment on patch 1 [1], I'm dropping that patch and made
this a static per-CPU array indexed by the VM's table entry.

Cheers,
/fuad

[1] https://lore.kernel.org/all/86y0buyo5s.wl-maz@kernel.org/

>
> --
> Vincent

