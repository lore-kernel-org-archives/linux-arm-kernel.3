Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0394E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 18:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2AHMsU9C3aGdPeyC3kWWTvP8Q55SWIWb7sIWx3ma3k=; b=amcVY+3TOoNwkkS6TyPUxEWxt6
	YgTwXaiudoGR6ivOyxSuh415nQuEw98FfrofO6wOKY1qqAPn98H563bb3b8SlrfhDVhFwvk2n955I
	cXrcnjE8DczFC9nHCwrUN9d5W3OmAMDPo5b8yky3wJN1MCeCPU2nW+RQiCOsKi2H0iURG3L49SxuR
	C0QPjyHKXMk3v7uA6+Ta7mYWrlF/XUX4JTihvGfKpfJC1LXFe40llLWmCn89wsggLnLheJs7rBCir
	1NNqoL0TV4s6V/run3MF1zgtjIZOkPuyzdUs6Pd4Erc/KkONZ+clbe5kxPOWbOWbCL9QoGe58jsdb
	kbeeS4sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKiwq-00000008x33-1Q2p;
	Mon, 09 Dec 2024 18:57:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKivm-00000008wrC-3dJb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 18:56:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CBD3E5C5ECF;
	Mon,  9 Dec 2024 18:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6431C4CED1;
	Mon,  9 Dec 2024 18:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733770590;
	bh=jWitqbI3BToGLZp+6qWZmYRLd+6j/B93+eI3CbU4/Zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p519Aw5jPWzqrzBFSTv91Bmk6wjee690Qpps0g/UQj0hE3dtph47dJtKsHJu+98dP
	 jCjDpI3BYoG1hMUaaKN3RHQ0NXXJ3qZTnM4TeRBhQy6g25VjNT0oLUScszmLxFltJT
	 OUhzlgSL4aSJQJLgUebHnoggFhyNsK8/RYe14LdK6F6fLXhg6T56JdTMy5VFSdNIeO
	 FeWRcfUZ1XcLAJgDgx3ArhqhUzGwLECc8tZtQd1YVxOkgDfloR5vs9DSA5v2D5kdQB
	 gzLxWWdQ7pi3w6K3MTRJNXGZFjN8NvG02r9Jy59wXvMAKlLoqzeBmNUowRndSdoJHy
	 MdMjsFTSCEPxA==
Date: Mon, 9 Dec 2024 18:56:24 +0000
From: Will Deacon <will@kernel.org>
To: Rong Xu <xur@google.com>
Cc: Yabin Cui <yabinc@google.com>, Han Shen <shenhan@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: Allow CONFIG_AUTOFDO_CLANG to be selected
Message-ID: <20241209185623.GA13084@willie-the-truck>
References: <20241118222540.27495-1-yabinc@google.com>
 <20241209162028.GD12428@willie-the-truck>
 <CAF1bQ=SiHi8oCyo5YnXGpQGofM1zAsnBdqSEet1mS-BYNKVU8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF1bQ=SiHi8oCyo5YnXGpQGofM1zAsnBdqSEet1mS-BYNKVU8A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_105630_953062_65BB4A46 
X-CRM114-Status: GOOD (  19.28  )
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

(Aside: please try to avoid top-posting on the public lists as it messes up
the flow of conversation; I'll try to piece this back together.)

On Mon, Dec 09, 2024 at 09:30:50AM -0800, Rong Xu wrote:
> On Mon, Dec 9, 2024 at 8:20 AM Will Deacon <will@kernel.org> wrote:
> > On Mon, Nov 18, 2024 at 02:25:40PM -0800, Yabin Cui wrote:
> > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > > index fd9df6dcc593..c3814df5e391 100644
> > > --- a/arch/arm64/Kconfig
> > > +++ b/arch/arm64/Kconfig
> > > @@ -103,6 +103,7 @@ config ARM64
> > >       select ARCH_SUPPORTS_PER_VMA_LOCK
> > >       select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
> > >       select ARCH_SUPPORTS_RT
> > > +     select ARCH_SUPPORTS_AUTOFDO_CLANG
> > >       select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
> > >       select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
> > >       select ARCH_WANT_DEFAULT_BPF_JIT
> >
> > After this change, both arm64 and x86 select this option unconditionally
> > and with no apparent support code being added. So what is actually
> > required in order to select ARCH_SUPPORTS_AUTOFDO_CLANG and why isn't
> > it just available for all architectures instead?

> Enabling an AutoFDO build requires users to explicitly set CONFIG_AUTOFDO_CLANG.
> The support code is in Commit 315ad8780a129e82 (kbuild: Add AutoFDO
> support for Clang build).

Yes, that is precisely my point. The user has to enable
CONFIG_AUTOFDO_CLANG anyway, so what is the point in having
ARCH_SUPPORTS_AUTOFDO_CLANG. Why would an architecture _not_ want to
select that?

> We are not enabling this for all architectures because AutoFDO's optimized build
> relies on Last Branch Records (LBR) which aren't available on all architectures.

So? ETM isn't available on all arm64 machines and I doubt whether LBR is
available on _all_ x86 machines either. So there's a runtime failure
mode that needs to be handled anyway and I don't think the arch-specific
Kconfig option is really doing anything useful.

Will

