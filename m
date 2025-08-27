Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E065CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 01:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KIAvKKfn0bFHmRTwszZHJIuJC++Msep57pJrpM6S8I4=; b=WoFBXYeKFWK5L4s8i0SGJY+ENu
	XVp4DSM96e/43Ca8Fgyjp52mXhZqccDgFznPBD8m2qvmFxHoNhsB/aL3o9v1FpSDsVAx6WPZYY7hV
	bsu1wMCw5bwwgXsQSWnquZRd1n4AxNgEOLZLrmMjsKJQh+Gkr4tORM86v8T0GNe5yyHLE4or8oqri
	2JjZs418lIjb6XlVtFTVe9ECyzHFOES/eDkXibjtOT5j7/UwOuvNu4/GTdi9uJNNVpBFPg6I59id7
	0Hcjy2FRP9oyuuDkmSkeUlRs2dTXnPMJr4vLD3H1EAN2uiWA3DD1nBxEVl3USlSBHv/5Xln7I9NTm
	SyJG20ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur56Z-0000000DYBD-0sxa;
	Wed, 27 Aug 2025 01:37:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur53q-0000000DXe9-3z91;
	Wed, 27 Aug 2025 01:34:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0A06843F7E;
	Wed, 27 Aug 2025 01:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B78EAC4CEF1;
	Wed, 27 Aug 2025 01:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756258489;
	bh=4eiZvo+hL550WY6CZyKaK4fRP2VeqMte3/ZsoSFK2Bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iNIp4MzCAz/2Su6Q9ie6SJSrrgadQvUrBTeD8Iqgom97Azq/yiTX5YT/3bytvQl+R
	 c77dFs4j5ymA0p96r2A9q2eclhACDC0BeMXTZP3LnGFleYKgQ9mzTP+GLP+5gY/9Ld
	 t7KLAwBt93khS7Q2I4taw+eQH0o+6z/5mLHT/GtxiSd8i5gwIHOrQUTdUKOkadkKml
	 BoJhCES05WcIZSHiAvdbLB6rQmXqn6pV9HA0YzCMKsq74yPYyioPU2x3Lxud9h9HZh
	 77zbyyS0CGOO7salab+iMazbkewswWMxdSjGCMEwRVQAwc5Bm5GbuGBYLRhm1vqbze
	 /uP+OMYTMYmNg==
Date: Tue, 26 Aug 2025 18:34:44 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@outflux.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
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
Message-ID: <20250827013444.GA2859318@ax162>
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-5-kees@kernel.org>
 <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
 <202508250834.E2456B9@keescook>
 <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
 <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_183451_028665_21D5DBF9 
X-CRM114-Status: GOOD (  28.50  )
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

On Mon, Aug 25, 2025 at 03:31:34PM -0400, Kees Cook wrote:
> On August 25, 2025 1:00:22 PM EDT, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
> >On Mon, Aug 25, 2025 at 5:35 PM Kees Cook <kees@kernel.org> wrote:
> >>
> >> Yeah, that's a good idea. What the right way to do that?
> >>
> >> config CFI_CLANG
> >>         bool "Use Clang's Control Flow Integrity (CFI)"
> >>         depends on ARCH_SUPPORTS_CFI
> >>         select CFI
> >>
> >> ?
> >
> >I don't recall what is the idiomatic solution for renames, but I
> >remember Linus talking about this topic and about avoiding losing old
> >values if possible (perhaps getting a new question in `oldconfig` is
> >OK as long as the `olddefconfig` respects the old value).
> >
> >I think your suggestion above will still make it appear twice in
> >`menuconfig` -- there may be a way to play with visibility to make it
> >better.
> >
> >A simple possibility I can think of (assuming it works) is having the
> >CFI symbol for the time being introduced just as a `def_bool
> >CFI_CLANG` for a few releases so that people get the new one in their
> >configs.
> 
> Ah, I think this works:
> 
> config CFI_CLANG
>     bool
> 
> config CFI
>     bool "...."
>     default CFI_CLANG
> 
> I will add that for v2.

That does not appear to work for me. I applied

diff --git a/arch/Kconfig b/arch/Kconfig
index c25a45d9aa96..0d3ed03c76c2 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -876,8 +876,12 @@ config ARCH_SUPPORTS_CFI
 config ARCH_USES_CFI_TRAPS
        bool

+config CFI_CLANG
+       bool
+
 config CFI
        bool "Use Kernel Control Flow Integrity (kCFI)"
+       default CFI_CLANG
        depends on ARCH_SUPPORTS_CFI
        depends on $(cc-option,-fsanitize=kcfi)
        help

on top of this series and

  CONFIG_CFI_CLANG=y
  # CONFIG_CFI_ICALL_NORMALIZE_INTEGERS is not set
  # CONFIG_CFI_PERMISSIVE is not set

gets turned into

  # CONFIG_CFI is not set

after olddefconfig. CONFIG_CFI_CLANG has to be user selectable with a
prompt but the only solution I can think of at the moment results in a
duplicate prompt for Clang.

diff --git a/arch/Kconfig b/arch/Kconfig
index c25a45d9aa96..93bf9b41a9de 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -876,8 +876,17 @@ config ARCH_SUPPORTS_CFI
 config ARCH_USES_CFI_TRAPS
        bool

+config CFI_CLANG
+       bool "Use Kernel Control Flow Integrity (kCFI) - Transitional" if CC_IS_CLANG
+       select CFI
+       depends on ARCH_SUPPORTS_CFI
+       depends on $(cc-option,-fsanitize=kcfi)
+       help
+         This is a transitional symbol to CONFIG_CFI, see its help text
+         for more information.
+
 config CFI
-       bool "Use Kernel Control Flow Integrity (kCFI)"
+       bool "Use Kernel Control Flow Integrity (kCFI)" if CC_IS_GCC
        depends on ARCH_SUPPORTS_CFI
        depends on $(cc-option,-fsanitize=kcfi)
        help

Maybe that does not matter for the sake of keeping things working?
Otherwise, we could just keep things as they are with the patch set and
expect people to actually use oldconfig or diff the results of
olddefconfig (which I think is good practice anyways).

Cheers,
Nathan

