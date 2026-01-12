Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153BCC9EC76
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 11:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ghPiZ7OelwcaW8u+RLbWed6YYuVAFqTuBWiYtNO6WZ4=; b=HxNIrfW+bnCoi61BQJ/RI8J6Rc
	pxmTUYLyQJRSY5Kvl9Q2Ip2w7o2+mLfDzkfPncBCzLDL1qg7VVBxhUbHCZpjRNGY9O20t1TY5pNtt
	PjgdhyeWVjOXPyPSP0t1AnGN/SBQoLVeYh9DKaAQ5zC7rMuydLatAF9v/nTLfFV/Lj5Tss7GbGe3s
	mU54AJa51Tr4nr33hO+rRS+E3MQRck9ifa/BpVSLS3dyEGzjWt4pYTn19v7IuCXXVKjIldCK8AP4I
	afySjXK9AUu1Uiz+B83o4UvkwooPNY4YUaoKsQT763GVH0WdajSTq6lg96AdLqsQLj4rB6BOYWqAT
	6396VTQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfG47-00000005Fjv-3ESS;
	Mon, 12 Jan 2026 11:26:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfG44-00000005FjA-3GLb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 11:26:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C562497;
	Mon, 12 Jan 2026 03:26:19 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0FE63F694;
	Mon, 12 Jan 2026 03:26:23 -0800 (PST)
Date: Mon, 12 Jan 2026 11:26:20 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: mark.rutland@arm.com, james.morse@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [RFC PATCH v6 03/35] KVM: arm64: Add CONFIG_KVM_ARM_SPE Kconfig
 option
Message-ID: <aWTaXBse_R_LjJE-@raptor>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
 <20251114160717.163230-4-alexandru.elisei@arm.com>
 <1aaffbcd-ba0c-4371-80d7-ce59ac7f13a9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1aaffbcd-ba0c-4371-80d7-ce59ac7f13a9@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_032628_883060_9E94E1A3 
X-CRM114-Status: GOOD (  26.93  )
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

Hi James,

On Fri, Jan 09, 2026 at 04:29:50PM +0000, James Clark wrote:
> 
> 
> On 14/11/2025 4:06 pm, Alexandru Elisei wrote:
> > Add a new configuration option that will be used for KVM SPE emulation.
> > CONFIG_KVM_ARM_SPE depends on the SPE driver being builtin because:
> > 
> > 1. The SPE driver maintains a cpumask of physical CPUs that support SPE,
> >     and that will be used by KVM to emulate SPE on heterogeneous systems.
> > 
> > 2. KVM will rely on the SPE driver enabling the SPE interrupt at the GIC
> >     level.
> > 
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > ---
> >   arch/arm64/kvm/Kconfig | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> > index 4f803fd1c99a..31388b5b2655 100644
> > --- a/arch/arm64/kvm/Kconfig
> > +++ b/arch/arm64/kvm/Kconfig
> > @@ -83,4 +83,12 @@ config PTDUMP_STAGE2_DEBUGFS
> >   	  If in doubt, say N.
> > +config KVM_ARM_SPE
> > +	bool
> > +	depends on KVM && ARM_SPE_PMU=y
> 
> I think the most common configuration is module, so requiring built-in isn't
> great. If there's any way of avoiding it, even if it costs a little bit of
> pain, it would be good for adoption.

I'm not sure how that could be done. You need the buffer maintenance interrupt
to do a VM exit so KVM can inject the virtual interrupt back into the guest,
otherwise there's a possibility of a large blackout window when the buffer is
full.

The code also relies on the SPE driver to probe all the SPUs in the system.

> 
> It was basically the first thing I got stuck on trying to get it to work. Or
> if it really can't be done, maybe some kind of debug message to say why
> enabling failed.

When you search for the symbol in menuconfig you get a list of the symbols it
depends on.

Thanks,
Alex

