Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72079CA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 19:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LoJoWSdVtQQnsqJJIZm/2aBV/AIaM+6m2UreLj3Rv8o=; b=3X6Ug+eyXfJk0Ic+6UXj1S9Ewu
	mHdCAZUk237yf/Hj5D7+nwKllBUI2jOBEXqtn7fN2rhjYqzakXuYB3TdjfARYrsyQzyzxmUGdCzRd
	Ap5pPVU7algbh7tdPB0FJVpIZJYpazywQZBph2XFSiA1XvxESsL737LETYVPe599oERII1VBRtjxj
	cEAMbwYq3CxmsQ7CRYO0nqVM1wyIutGPW13ouEG8AxYREddqAOhtGjrM7SnhojliOxW5Cp5Mhglj6
	4lxDuLOIGhkm4OwXFLW3aD7rDPvgQh80OEgkduA6BIH9NVRI4/YY4SJzjIALB2m69q7NTQHSjdBd0
	QK455bPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBGbP-00000001OPR-2VEo;
	Mon, 28 Sep 2026 19:01:27 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBGbL-00000001OOP-0g2t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 19:01:25 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=LoJoWSdVtQQnsqJJIZm/2aBV/AIaM+6m2UreLj3Rv8o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790622080; v=1; x=1791226880;
 b=iCohD+5SFFdx7nHdp2i6dg59hqRI9riBQxCfMOPtydJiqpEkGUxKpqwJaYWY79D8mdFyMoIi
 9UVxCDAtWlr/sfa5XCSTBz++B5TOi9Ps0JpZI56XQiCA4WPrVQGR0h3kc6gDAFgmMoMm4c6Rw/b
 j8XWLVIFoF4mPlACprneuamM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2170c8673dc25178;
	Mon, 28 Sep 2026 19:01:19 +0000
X-Mizu-Trace-ID: 2170c8673dc25178
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b8ea0ca5baso117e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 12:01:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwEpomKflQa+FrEjDPQtUlv+xkME2l/pto8a91HY62Vex2zLUdDkaO9w5JN0X/6fHB/OWyhnOcX+cSa4aqZwE/P@lists.infradead.org
X-Gm-Message-State: AFq9FYIkIiAV+SgAMJFRnSmcOESlNMumgagQ5bThyvJO99f5PGG/BwB5
	RGfXjrjAlY6ecFq9WWToWxv6IzM1iNCiz5vlKRSTD0BQknrmWT5JfWVX86fVUX/714w1+8/Cc4I
	6kNlUrhkCHtpiK5jkcn9Sh7UtdjYd/GnvDvjP7Ee2
X-Received: by 2002:a05:6512:23aa:b0:5b8:c230:1241 with SMTP id
 2adb3069b0e04-5ba2e786d94mr6222e87.10.1790622078768; Mon, 28 Sep 2026
 12:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260914113338.159227-1-fuad.tabba@linux.dev> <20260914113338.159227-16-fuad.tabba@linux.dev>
 <86a4ph5fb9.wl-maz@kernel.org> <CA+EHjTzCQkeXQQcCDwABLR2w+NTmKTG3V6RSmhzYNayaoYXw3g@mail.gmail.com>
 <865x045mke.wl-maz@kernel.org> <aq0628Ci4pfEj0KG@willie-the-truck> <871paf3y1n.wl-maz@kernel.org>
In-Reply-To: <871paf3y1n.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 28 Sep 2026 20:00:42 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw5yJ7PjCkHmg-kuZjdXL2cDa+5StZfiFOVT38FiJCS3g@mail.gmail.com>
X-Gm-Features: AclHuK_A3LGm0XhIK4uWtuZLyyMDjjb433L7Zm1vN8E8cf96YxS-xxb0mI7O9p4
Message-ID: <CA+EHjTw5yJ7PjCkHmg-kuZjdXL2cDa+5StZfiFOVT38FiJCS3g@mail.gmail.com>
Subject: Re: [PATCH v3 15/18] KVM: arm64: Reject host access to protected VM
 private state
To: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, joey.gouly@arm.com, seiden@linux.ibm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com, 
	steven.price@arm.com, vdonnefort@google.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_120123_728791_A180B133 
X-CRM114-Status: GOOD (  23.12  )
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

Hi Marc, Will,

On Sun, 27 Sept 2026 at 09:17, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > > > once the vCPU has run, the copy is the VMM's
> > > > boot state plus what the exit handlers copy out, and the VMM can't
> > > > distinguish them. x0 on MMIO is one of those fields, but the VMM reads
> > > > it from kvm_run->mmio. For LD64B, EL2 would copy the operands out the
> > > > same way and the error could be relaxed to those registers. Loosening
> > > > later breaks nobody. The comment and the message do overstate it by
> > > > calling the copy "not the guest's state", and I'll reword both in v4.
> > > > More on the kvmtool thread [1].
> > >
> > > A protected-aware VMM already knows it cannot obtain the registers.
> >
> > I think you can use that argument both ways: if the VMM knows it cannot
> > obtain the registers, then it's fine to return an error if the VMM does
> > something wrong.
[...]
> > If it's helpful, we can ask the crosvm developers here if they have
> > opinions for/against the two behaviours?
>
> I guess that'd be useful to know what they'd prefer, and also to look
> into what QEMU does in this case -- I'm not exactly a good judge when
> it comes to UAPI definition... ;-)

I asked Frederick Mayle (CC'ed, AVF/pKVM support in crosvm) about what
they think in crosvm. Their preference is an error rather than a
silent failure: an explicit failure is easier to debug, and the
earlier the error surfaces, the easier it is to correlate with the
misbehaviour. Frederick also raised the MMIO case as a concrete risk
of the silent option: a VMM could reasonably think it can complete an
MMIO access with SET_ONE_REG and never find out that it was a no-op.

Cheers,
/fuad

