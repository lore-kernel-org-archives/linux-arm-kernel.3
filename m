Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B40F46132
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 15:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nTSl2OG5DiP4Tzrdin34Md98OgKsXpz3qr2juSxA29Y=; b=cWE/jA6e/NuEYbowiG8mqGDTl4
	hePmhWtPDoyL2VAV2VKNWINkp+vfRMWIzvQrGIhaXYuoYZfeGcPiSq244O+1t/QMgjKJasKktGl2v
	CA3566ol7O3zCaa1q8Zr2UdO9Hzxomgj5GP+cbLw0GC6YfU9udQsHPipUXCVL+6/KdangU/YfsAff
	lbdlIAgq3fk/x/6AOlZdgjXDKeb0XxmYsJZmQ4KZ96W/W+iOXSRRUTFYFj4Lt4f0n24si/GsgIM75
	10zSTGS1hShHZW6/5MQpAd1+mzRbH2HiiPUKrjcthw6l2MIexIaQNa0DqBgEDQ4RA/ASQ71siBfxw
	uBwwdkEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4glV-0000000GyL6-36eV;
	Mon, 23 Mar 2026 15:00:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4glU-0000000GyKF-1qkZ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Mar 2026 15:00:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nTSl2OG5DiP4Tzrdin34Md98OgKsXpz3qr2juSxA29Y=; b=hVwYpUa5SKuQVzH/wxOFmedbrv
	nbX6EZLPU+rRySmuyaihCYpb87xtomW+K+sKdxwqILgYk3Se8p4vuselViQYSFRHK82/j4n8PyT0h
	f9WjcFnevLeHRgyQi5brs6EcfzK24mvN/z1iowSgkAsWrSnpsH7w7Gkf0f5H4szFEmG849QfDaNBz
	uFXbqdilTCzEo9OeADCQNmenYik5xOmymof6uht7FMyOLd5qqPWbP8FzVH8s+dJEThcbTBY7GxmSp
	b0LjFsSVKOjCJYyrDL5+Ks1QmLb6N6yboXGMGpyiifyHwPiHqmWjk8ETSYomCLwe3Ec4LlebZ82Km
	S35m/k4w==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4glQ-00000001n8J-0LBs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 15:00:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 82BDA43615;
	Mon, 23 Mar 2026 15:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2CB2C2BC9E;
	Mon, 23 Mar 2026 15:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774278016;
	bh=Hv3zAbS8DeLMrQDrPh89cAimDkr9XNvit+xdTh3RoWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nNdHEjiH4fJldE6ROcEUbFfZ/8o4o/PbBAg79CJYMBezd9MApZMfyHLKMsZeJBjC5
	 caClkZxB4r3aJixckNrChXGwRsYb4oLgv7JWkNP/L/RbS88nwRUmuG5Yqco0HmSvuq
	 1vDt1eWOU3h2dQ+ENhu6aMw+2V2lwUYw84LnvRMtUO6NaMh/C4L/v1kgTmOqoa9/59
	 4m+Ias2QxYpnF63YN7mJjO54WU9JJ69CLFprmJyEas83nDu5jt5V4waXoJ7BnpWHGq
	 jNOPScYypraXrpEE/8RNXMVuijUX6xBUCJw3y3EeyoJAM9wkT2fX+KwHl4g5ysDlD0
	 PPcv880wANmig==
Date: Mon, 23 Mar 2026 15:00:10 +0000
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: Re: [PATCH v3 30/36] KVM: arm64: Allow userspace to create protected
 VMs when pKVM is enabled
Message-ID: <acFVeqB2P0rKqvBu@willie-the-truck>
References: <20260305144351.17071-1-will@kernel.org>
 <20260305144351.17071-31-will@kernel.org>
 <865x6q63fu.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <865x6q63fu.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_150020_467344_181526DF 
X-CRM114-Status: GOOD (  27.57  )
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

On Fri, Mar 20, 2026 at 01:22:29PM +0000, Marc Zyngier wrote:
> On Thu, 05 Mar 2026 14:43:43 +0000,
> Will Deacon <will@kernel.org> wrote:
> > 
> > Introduce a new VM type for KVM/arm64 to allow userspace to request the
> > creation of a "protected VM" when the host has booted with pKVM enabled.
> > 
> > For now, this depends on CONFIG_EXPERT and results in a taint on first
> > use as many aspects of a protected VM are not yet protected!
> > 
> > Signed-off-by: Will Deacon <will@kernel.org>
> > ---
> >  arch/arm64/include/asm/kvm_pkvm.h |  2 +-
> >  arch/arm64/kvm/Kconfig            | 10 ++++++++++
> >  arch/arm64/kvm/arm.c              |  8 +++++++-
> >  arch/arm64/kvm/mmu.c              |  3 ---
> >  arch/arm64/kvm/pkvm.c             | 11 ++++++++++-
> >  include/uapi/linux/kvm.h          |  5 +++++
> >  6 files changed, 33 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> > index 7041e398fb4c..2954b311128c 100644
> > --- a/arch/arm64/include/asm/kvm_pkvm.h
> > +++ b/arch/arm64/include/asm/kvm_pkvm.h
> > @@ -17,7 +17,7 @@
> >  
> >  #define HYP_MEMBLOCK_REGIONS 128
> >  
> > -int pkvm_init_host_vm(struct kvm *kvm);
> > +int pkvm_init_host_vm(struct kvm *kvm, unsigned long type);
> >  int pkvm_create_hyp_vm(struct kvm *kvm);
> >  bool pkvm_hyp_vm_is_created(struct kvm *kvm);
> >  void pkvm_destroy_hyp_vm(struct kvm *kvm);
> > diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> > index 7d1f22fd490b..e71f7fb6e89a 100644
> > --- a/arch/arm64/kvm/Kconfig
> > +++ b/arch/arm64/kvm/Kconfig
> > @@ -82,4 +82,14 @@ config PTDUMP_STAGE2_DEBUGFS
> >  
> >  	  If in doubt, say N.
> >  
> > +config PROTECTED_VM_UAPI
> > +	bool "Expose protected VMs to userspace (experimental)"
> > +	depends on KVM && EXPERT
> > +	help
> > +	  Say Y here to enable experimental (i.e. in development)
> > +	  support for creating protected virtual machines using KVM's
> > +	  KVM_CREATE_VM ioctl() when booted with pKVM enabled.
> > +
> > +	  Unless you are a KVM developer, say N.
> > +
> 
> Let me once more express my lack of appetite for config options.
> Protected more is already gated by a command-line option, and requires
> active buy-in from the user.
> 
> Nested support is in the same "not quite finished" state, and yet
> isn't hidden behind a configuration symbol.
> 
> Taint the kernel if you want, but I'd rather we don't add extra config
> options for this. Documenting the "experimental" aspect of upstream
> pKVM should be enough.

Since I _do_ expect the user ABI to evolve (probably becoming stricter)
as we introduce additional protection to parts of the protected VM
state, I just went for the full shebang: CONFIG option, cmdline option
and taint.

I tend to agree that having *all* of that is overkill, so if you're
happy for me to drop the CONFIG option, despite the user ABI not being
stable, then I'm fine with that.

Will

