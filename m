Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA77C9EC97
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 15:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2aN6p3qUmxsj5m4xzxWjiIPDL7aHf9zXGwD6oE6Zx7o=; b=g9C5YPESwQxGMEwSVSaLtr5p8n
	OaSLLnskZRZtxdcb16MfR6vFD01MxJbG7svoL78+kDctO05nBSxAWBqZaOyKjYzrpgGOdrdNdbZVQ
	7g7rAS0LCfAwSPjn9uYXZiP82NbRdCzcX6ypCG3tsdQGmSpYkG2Z8Lg5QRKtUT9EnAFfrh1zO1kUg
	HPCB1QcUK2wYR4OBtRKVw2w6zYUPXXZIBDqE9y8ZbC3xuE7Lul2HxcQUtrkxe4FvNY6rPPnMLbdck
	8uwas+kAqMactMsokMFAUpHklW83fPOnvUnpoEOBhGx0OYT3DDpYuZ0S68hFti1zvVqIKQlVBoWKE
	Vm/iDP0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJh8-00000005d8p-3W7w;
	Mon, 12 Jan 2026 15:19:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJh5-00000005d8H-3QHO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 15:19:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E209497;
	Mon, 12 Jan 2026 07:18:51 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F27613F694;
	Mon, 12 Jan 2026 07:18:55 -0800 (PST)
Date: Mon, 12 Jan 2026 15:18:53 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: mark.rutland@arm.com, james.morse@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [RFC PATCH v6 03/35] KVM: arm64: Add CONFIG_KVM_ARM_SPE Kconfig
 option
Message-ID: <aWUQ3bYuxpMEWTUk@raptor>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
 <20251114160717.163230-4-alexandru.elisei@arm.com>
 <1aaffbcd-ba0c-4371-80d7-ce59ac7f13a9@linaro.org>
 <aWTaXBse_R_LjJE-@raptor>
 <d7db9f17-012e-43d7-a0a5-58b254dd7e33@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7db9f17-012e-43d7-a0a5-58b254dd7e33@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_071859_981303_24D68699 
X-CRM114-Status: GOOD (  39.34  )
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

On Mon, Jan 12, 2026 at 12:09:19PM +0000, James Clark wrote:
> 
> 
> On 12/01/2026 11:26 am, Alexandru Elisei wrote:
> > Hi James,
> > 
> > On Fri, Jan 09, 2026 at 04:29:50PM +0000, James Clark wrote:
> > > 
> > > 
> > > On 14/11/2025 4:06 pm, Alexandru Elisei wrote:
> > > > Add a new configuration option that will be used for KVM SPE emulation.
> > > > CONFIG_KVM_ARM_SPE depends on the SPE driver being builtin because:
> > > > 
> > > > 1. The SPE driver maintains a cpumask of physical CPUs that support SPE,
> > > >      and that will be used by KVM to emulate SPE on heterogeneous systems.
> > > > 
> > > > 2. KVM will rely on the SPE driver enabling the SPE interrupt at the GIC
> > > >      level.
> > > > 
> > > > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > > > ---
> > > >    arch/arm64/kvm/Kconfig | 8 ++++++++
> > > >    1 file changed, 8 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> > > > index 4f803fd1c99a..31388b5b2655 100644
> > > > --- a/arch/arm64/kvm/Kconfig
> > > > +++ b/arch/arm64/kvm/Kconfig
> > > > @@ -83,4 +83,12 @@ config PTDUMP_STAGE2_DEBUGFS
> > > >    	  If in doubt, say N.
> > > > +config KVM_ARM_SPE
> > > > +	bool
> > > > +	depends on KVM && ARM_SPE_PMU=y
> > > 
> > > I think the most common configuration is module, so requiring built-in isn't
> > > great. If there's any way of avoiding it, even if it costs a little bit of
> > > pain, it would be good for adoption.
> > 
> > I'm not sure how that could be done. You need the buffer maintenance interrupt
> > to do a VM exit so KVM can inject the virtual interrupt back into the guest,
> > otherwise there's a possibility of a large blackout window when the buffer is
> > full.
> 
> Without expanding more I don't see how injecting an interrupt is strongly
> related to the way it's compiled.

It's the SPE driver that enables the hardware interrupt in the GIC.

> 
> > 
> > The code also relies on the SPE driver to probe all the SPUs in the system.
> > 
> 
> I don't think that's a hard requirement either, the KVM code could fairly
> easily do this itself. Inline the common code and put it in a shared header
> etc. I'm sure there are lots of creative ways to flip the dependencies that
> might not be "proper" software engineering. But like I said a bit of pain
> here might be beneficial overall.

Userspace gets the maximum buffer size and the SPE instance id from the sysfs
files.

So KVM would have to parse the DTB, read PMBIDR_EL1 and PMSIDR_EL1 on each
physical CPU in the system, create the sysfs files (at least 'type', 'cpumask'
and 'max_buffer_size' or whatever that ends up being named) and install a dummy
IRQ handler before the SPE driver is loaded.

Then when the SPE driver is loaded, the driver would have to remove the IRQ
handler and install its own, and create the rest of the sysfs files.

That's assuming that the SPE driver is loaded after KVM. I think it's possible
for the SPE driver to be loaded first. So both KVM and SPE would have be able to
communicate with one other in case the other probed first.

Is having to change the symbol ARM_SPE_PMU from 'm' to 'y' worth this? I am not
convinced and I don't see much use for going down this rabbit hole at this stage
of the series.

Also, since KVM would partially populate the sysfs directory for each SPE
instance, would it be reasonable for software to assume that the SPE driver is
loaded based on this and start using it? For example, how does perf detect the
presence of the arm_spe event?

Thanks,
Alex

