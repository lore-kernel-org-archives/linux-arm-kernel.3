Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80719CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 23:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9pZeR5ZdekwSTxHiD8ECMVDdrj7lL+Mj2HktSL/veo=; b=httNzmGlqz4kgPxC6rEa2Qu0kV
	ilXz8gu4ktkEFqyLGPa35Bl+jScFxNNSrIun5cvTb8nFtULb5EUS+2e13xYYWU1By6BTyF4B+urHd
	2Yi6aGo1A3jQRgKZekMDeBG55MBw7WbsRU276JR7oG6Qiq1jgvqxDtvNCQPNqTuqFuKG4dlsJDFhj
	rOyxjCR7Ggpu1WNF1JXJvzmvT2oZhnopCa2r+yeiTAZbcHOKeZAIk8zRQNm7rl1Vc86JtTZjRIELY
	gaIBgTECadNeTXjEGI0cuneha8FU4QCBA+lpNOibKYBUBPSRfl5SD8YQbZnUno1Oy404NdFkEUG0M
	pneBdzTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urm1P-00000003g57-1Qfu;
	Thu, 28 Aug 2025 23:27:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1url0j-00000003UWN-1o0s;
	Thu, 28 Aug 2025 22:22:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 99DBA6013C;
	Thu, 28 Aug 2025 22:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04117C4CEEB;
	Thu, 28 Aug 2025 22:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756419744;
	bh=d/92f6J5aPp1ufMfnBooQwWAih94z2/6gNAZnQHQ1yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rHsAjhoMTnZN7Ni9jW2DbXEcOWN6o9IGBCgqiQSwF2bf8CVwARs2lPfx+RWUxguEY
	 WY7vxk94VGhxjkAOomShDAb23QLFSNQG5bkUYgx+5MQ54lXPVPHiVONINXxwkXSlXV
	 KircQjPnCz/FwjJFE14oGi83LKS8/lcmMZQqvQc9yajCYL+ZuWYnR0ySrCx2CWt5WN
	 u/vUOMIMaqn3josSGA10QBXkuqZ/gV3nrAsH5pS6pVcz+4ZZKFznVG22iE8mTWFu+q
	 evzzghYy4zPxVtIAW1dnVFRRXY6LNzix24QfLFaLJv6s4XtNEd448oHIdtTEZV9/FU
	 OhApFBu5bZ0JA==
Date: Thu, 28 Aug 2025 15:22:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@outflux.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
Message-ID: <20250828222218.GA3029249@ax162>
References: <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
 <202508250834.E2456B9@keescook>
 <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
 <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net>
 <20250827013444.GA2859318@ax162>
 <56c2b1ce-00a4-403c-9927-79bfd9a23574@infradead.org>
 <20250827193815.GA2293657@ax162>
 <CANiq72nX7d3XQtQKDdeUh2RFy5HqSg360m4pzesJyBP+y9K7FA@mail.gmail.com>
 <20250828201915.GA219815@ax162>
 <25B398C8-4D9A-46C6-AED9-9DA2805DF9D7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25B398C8-4D9A-46C6-AED9-9DA2805DF9D7@kernel.org>
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

On Thu, Aug 28, 2025 at 04:32:16PM -0400, Kees Cook wrote:
> On August 28, 2025 4:19:15 PM EDT, Nathan Chancellor <nathan@kernel.org> wrote:
> >On Thu, Aug 28, 2025 at 02:11:51PM +0200, Miguel Ojeda wrote:
> >> On Wed, Aug 27, 2025 at 9:38 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >> > Another idea I had to avoid this is introducing CONFIG_CFI_GCC as a user
> >> > selectable symbol and making CONFIG_CFI the hidden symbol that both
> >> > compiler symbols select. After a couple of releases (or maybe the next
> >> > LTS), both CONFIG_CFI_CLANG and CONFIG_CFI_GCC could be eliminated with
> >> > CONFIG_CFI becoming user selectable, which would keep things working
> >> > since CONFIG_CFI=y will be present in the previous configuration.
> >> 
> >> If we are OK with something like this (i.e. waiting a few releases),
> >> then isn't it simpler the `def_bool` approach I mentioned? i.e. it
> >> means one less symbol and one less rename later, right?
> >
> >Ah yes, I reread your suggestion and that would probably be the best
> >course of action, as it does avoid the extra symbol (although I am not
> >sure what you mean by one less rename?). As I understand it:
> >
> >  config CFI_CLANG
> >      bool "Use Kernel Control Flow Integrity (kCFI)"
> >      depends on ARCH_SUPPORTS_CFI
> >      depends on $(cc-option,-fsanitize=kcfi)
> >      help
> >        <generic help text>
> >
> >  config CFI
> >      def_bool CFI_CLANG
> 
> Oh! Keep CFI_CLANG the visible option? Will the later rename work right? I'll give it a try.

It should, as long as people are at least upgrading LTS releases
continuously. In theory, there could be people who upgrade with a
configuration that has CONFIG_CFI_CLANG=y to a release after the rename
to CONFIG_CFI happens but at that point, I would expect them to need to
diff their configuration to make sure other items did not go missing or
change since they are going across many months/releases when upgrading.
I think doing it this way is a healthy balance of not breaking the
people who upgrade their kernels yearly (via LTS) or every stable
release while allowing the code as a whole to become more generic in the
meantime.

Folks who have CONFIG_CFI_CLANG=y in defconfigs like Android should
notice it disappearing and be able to figure out that it got renamed and
adjust, since they already have to do that for other symbols.

Cheers,
Nathan

