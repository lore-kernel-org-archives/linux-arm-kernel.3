Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3DFE77182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 11:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CzWcyw35//tqdErP6H7WjbHG0549MW8gKlAUknZHVfs=; b=sguHuYB6LM68zRiYhguqNT8AAi
	d5+zg0NecjNz2fOJsHS0EksVotwDqTtfJ0SZTb+f5SSYDvG6myfeVCyG+JEkyG1s4GYdjDze6AUWw
	YE0ZkfWZm7WTTD66jmKpsi5A/LQtGvYfZeJZb8/vc0SvSAwxSua4vJ+BCjS55lbRBQMLavUOV2Yit
	PoKL69x1gck0YqKO31gu85ISNunjtR7Kg32IJ9jDdBsRx5SG0x7xiy3H2kzIs79Kl/8ajcafBu3xb
	3BHeoHxLLMaZRlfZ5GpO3by7BHwtXjblN4wFJvXYPzDRMzGBf7MU50fxpPDrSZ0pvZ27mUcAkay8+
	W9j8ymrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKyUW-0000000BKMW-3eB3;
	Tue, 10 Dec 2024 11:33:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKySn-0000000BJzn-3QzK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 11:31:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 704FAA412FF;
	Tue, 10 Dec 2024 11:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F14C4CEE5;
	Tue, 10 Dec 2024 11:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733830296;
	bh=c0/Kvxahxgc5BU9+Agj9zRUQoG8xPGH+UnRBmIDO2fs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CAdMLYghmzGQESB8O/bG766ua3RwnQDvvUeRtidNiGqJ8TlfbCRElx/sTeRq75czU
	 3zlwVL9q8G9hLadJBjJc3Rzko3FyKGRlMKDUUrDkuIDBwim+hOFfQiTMsxay+QCkZq
	 dsAC5FAP+jV0quE80qwA4ol9lMd5AF1UYhgaFu0CgsD57mHGPWxDN0Lgy+Uf9C1yYt
	 Dg0oxBHwR6mgEPdoiAY4JcR5TsCFu1Eq1lL52AnYyWlIjgOSlqqnlk0lbeACf2gCBs
	 UmJzUF7qGAXH4lEvPtw1K9GFhr6Mau3FXLNvwd+UUKOWYgUWWpbaXc0eBl6N8ftV0s
	 ezm7ttxPwaAkw==
Date: Tue, 10 Dec 2024 11:31:31 +0000
From: Will Deacon <will@kernel.org>
To: Yabin Cui <yabinc@google.com>
Cc: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: Allow CONFIG_AUTOFDO_CLANG to be selected
Message-ID: <20241210113129.GB14735@willie-the-truck>
References: <20241118222540.27495-1-yabinc@google.com>
 <20241209162028.GD12428@willie-the-truck>
 <CAF1bQ=SiHi8oCyo5YnXGpQGofM1zAsnBdqSEet1mS-BYNKVU8A@mail.gmail.com>
 <20241209185623.GA13084@willie-the-truck>
 <CALJ9ZPNfUFF8OrpvziTnTvGU7OxEgyy9ZTc3aF-NhZ5hMbp7RQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALJ9ZPNfUFF8OrpvziTnTvGU7OxEgyy9ZTc3aF-NhZ5hMbp7RQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_033137_984327_47F13C2D 
X-CRM114-Status: GOOD (  33.57  )
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

On Mon, Dec 09, 2024 at 03:51:34PM -0800, Yabin Cui wrote:
>  On Mon, Dec 9, 2024 at 10:56 AM Will Deacon <will@kernel.org> wrote:
> >
> > (Aside: please try to avoid top-posting on the public lists as it messes up
> > the flow of conversation; I'll try to piece this back together.)
> >
> > On Mon, Dec 09, 2024 at 09:30:50AM -0800, Rong Xu wrote:
> > > On Mon, Dec 9, 2024 at 8:20 AM Will Deacon <will@kernel.org> wrote:
> > > > On Mon, Nov 18, 2024 at 02:25:40PM -0800, Yabin Cui wrote:
> > > > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > > > > index fd9df6dcc593..c3814df5e391 100644
> > > > > --- a/arch/arm64/Kconfig
> > > > > +++ b/arch/arm64/Kconfig
> > > > > @@ -103,6 +103,7 @@ config ARM64
> > > > >       select ARCH_SUPPORTS_PER_VMA_LOCK
> > > > >       select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
> > > > >       select ARCH_SUPPORTS_RT
> > > > > +     select ARCH_SUPPORTS_AUTOFDO_CLANG
> > > > >       select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
> > > > >       select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
> > > > >       select ARCH_WANT_DEFAULT_BPF_JIT
> > > >
> > > > After this change, both arm64 and x86 select this option unconditionally
> > > > and with no apparent support code being added. So what is actually
> > > > required in order to select ARCH_SUPPORTS_AUTOFDO_CLANG and why isn't
> > > > it just available for all architectures instead?
> 
> I think it's similar to ARCH_SUPPORTS_LTO_CLANG, which also doesn't need any
> support code but requires testing to ensure it works on a specific architecture.
> 
> >
> > > Enabling an AutoFDO build requires users to explicitly set CONFIG_AUTOFDO_CLANG.
> > > The support code is in Commit 315ad8780a129e82 (kbuild: Add AutoFDO
> > > support for Clang build).
> >
> > Yes, that is precisely my point. The user has to enable
> > CONFIG_AUTOFDO_CLANG anyway, so what is the point in having
> > ARCH_SUPPORTS_AUTOFDO_CLANG. Why would an architecture _not_ want to
> > select that?
> >
> > > We are not enabling this for all architectures because AutoFDO's optimized build
> > > relies on Last Branch Records (LBR) which aren't available on all architectures.
> >
> > So? ETM isn't available on all arm64 machines and I doubt whether LBR is
> > available on _all_ x86 machines either. So there's a runtime failure
> > mode that needs to be handled anyway and I don't think the arch-specific
> > Kconfig option is really doing anything useful.
> 
> My understanding of the benefits of ARCH_SUPPORTS_AUTOFDO_CLANG is:
> 1. Generally, we don't prefer to collect an AutoFDO profile on one
> architecture and use it to build the kernel for another architecture.
> This is because the profile misses data for architecture-dependent
> code. ARCH_SUPPORTS_AUTOFDO_CLANG can partially prevent this from
> happening.

Hmm, not really. Once more than one architecture selects the option, you
have the possibility of the mismatch you're trying to avoid.

> 2. Building a kernel with an AutoFDO profile involves using new
> optimization flags for clang.  Having ARCH_SUPPORTS_AUTOFDO_CLANG=y
> for one architecture means someone has tested building a kernel with
> an AutoFDO profile on this architecture.

On the flip side, allowing all architectures to select the option
actually increases your test coverage.

Will

