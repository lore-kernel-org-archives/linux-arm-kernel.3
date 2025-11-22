Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E21ECFC510
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 00:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISqmEXUU3Dk6M340iPc9VrK0FBgdamUhQqRKoR+PeyI=; b=AVGCmq8aAH4oNoROJA0PnfWMsH
	392DZ5ym0k2MHwJR2e38Gihk5Zfjo2Z7Ok1Y1ccN1ohYJ1WhNvndied27pSIBUdtw1AVQbV8AvZlN
	DmrjMVt5a/yhM9JBNm9LlDM6wMobFiBnlTZH110GBO49fjxcQksT7187WhNLus2vBPVplMkxitX2I
	+6GCkl5gHalrmEjgdKAio3IXFIVnwhL014DZ0fpqCw9N133fm/haHsM8tvRDlwoIRtsvdNUUUNZDM
	BtyBgIihgVtss3lFlf1fiW/rLuCsLpGhVrLtsra3lwUaXwnmU432wgocgvCvNHogMutv/yctTFS3S
	DrV/TZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMb3s-000000095Gl-4BSz;
	Sat, 22 Nov 2025 00:01:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMb3r-000000095GZ-3MYd;
	Sat, 22 Nov 2025 00:01:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D0F3A60145;
	Sat, 22 Nov 2025 00:01:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1879EC4CEF1;
	Sat, 22 Nov 2025 00:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763769666;
	bh=7VO8MtWqKmaIpeDWygtuR4K+s9loO2/N5EOqF8TuZKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bBy+Q6F/kNGlBfq4O+WSanA5e8J+IBriuKtAEnRPMqD8xgh+9NUcsdRQKdyB7kJ9z
	 oc/4ZVK2Q2Ki4BcZbLFLzmdTRk2VYtJhqNOI05v1dZpkM9t4T14HL5Pym1d78q5FQQ
	 cInnVW6id1gGtRmHOwsYWfOtAXo1xxT3jGW6ZDSggl94vFoUfG3egL1eAof2Lxq0/B
	 TXKNPMzJl54V/HTfLlu/AZuCtFLCJjQj52CdS2/3r+w+wPrF0o/dFWwuuYpYGpiUUx
	 angpT+Z/hP0QEoNEgtR78CMDnpVWsZCrf9hFflWC+bFF1P4JheC+kJvpNojrSh5K6C
	 /krEyXvOprQhw==
Date: Fri, 21 Nov 2025 17:01:01 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-efi@vger.kernel.org, loongarch@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] kbuild: Add KBUILD_VMLINUX_LIBS_PRELINK
Message-ID: <20251122000101.GA1996391@ax162>
References: <20251119042708.27658-1-yangtiezhu@loongson.cn>
 <20251121070140.GA780042@ax162>
 <hka6ukulmkmxp7mrcmxmllco2sqof2elextc7ggcikazfzmwni@a4pnogedcr7r>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hka6ukulmkmxp7mrcmxmllco2sqof2elextc7ggcikazfzmwni@a4pnogedcr7r>
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

On Fri, Nov 21, 2025 at 10:42:47AM -0800, Josh Poimboeuf wrote:
> On Fri, Nov 21, 2025 at 12:01:40AM -0700, Nathan Chancellor wrote:
> > > @@ -1199,6 +1199,7 @@ KBUILD_VMLINUX_OBJS := built-in.a $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)
> > >  KBUILD_VMLINUX_LIBS := $(filter-out %/, $(libs-y))
> > >  
> > >  export KBUILD_VMLINUX_LIBS
> > > +export KBUILD_VMLINUX_LIBS_PRELINK
> > 
> > This variable name is a little confusing to me since they do get added
> > to vmlinux during linking, not before. I am not sure of a better one
> > though, maybe KBUILD_VMLINUX_LIBS_FINAL?
> 
> I think that name was my idea.  Not sure what I was thinking, I guess
> "prelink" was somehow meant to imply after the vmlinux.o whole-archive
> link but before the "final" link.

Yeah I could see where you were going with that but glad we agree final
is better heh.

> "final" is indeed better.
> 
> > It may also make sense to
> > introduce similar syntax to the existing libs-y syntax, maybe
> > 
> >   final-libs-y
> > 
> > or something like that?
> 
> Yeah, I suppose that would mirror how KBUILD_VMLINUX_LIBS is wired up.

On second thought, it might be less complicated to keep it this way...

> > Also, since these objects are no longer in KBUILD_VMLINUX_LIBS, does
> > this new variable need to be added to any of the other places in the
> > build system that use KBUILD_VMLINUX_LIBS for things such as build
> > dependencies?
> 
> Not sure about that one.  drivers/firmware/efi/libstub/lib.a is getting
> built regardless so there must already be an implicit dependency?

I think the explicit dependency currently comes from

  vmlinux_o: vmlinux.a $(KBUILD_VMLINUX_LIBS)

in Makefile. I think something like

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index cd788cac9d91..38b5f0ba9a4b 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -68,7 +68,7 @@ cmd_link_vmlinux =							\
 	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
 
 targets += vmlinux.unstripped .vmlinux.export.o
-vmlinux.unstripped: scripts/link-vmlinux.sh vmlinux.o .vmlinux.export.o $(KBUILD_LDS) FORCE
+vmlinux.unstripped: scripts/link-vmlinux.sh vmlinux.o .vmlinux.export.o $(KBUILD_LDS) $(KBUILD_VMLINUX_LIBS_FINAL) FORCE
 	+$(call if_changed_dep,link_vmlinux)
 ifdef CONFIG_DEBUG_INFO_BTF
 vmlinux.unstripped: $(RESOLVE_BTFIDS)

is needed to ensure that an updated drivers/firmware/efi/libstub/lib.a
results in vmlinux getting regenerated (at least according to my
testing).

Cheers,
Nathan

