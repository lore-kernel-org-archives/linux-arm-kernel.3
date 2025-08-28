Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EE1CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 23:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+4JW4eGwDdSkIS6UvVtJHitLoUo4W10Im3juuHDQeVc=; b=1VacGIxsVrzdUE98uRlloZZStN
	7aFIz/rSkmYC1Y8FitVkhzLoxX+VP70Z1tP/wlghKWCbbjjwoiwmMOcBpueDjH1Fs5hkLZMOxshnJ
	0NfWrkzyfu063Tmrv6YvUAk0htToeMfYsahdB0Okczcvd/H9OvOms9KJeDAPUFndLhdnkGWS5b5kl
	Umq6hHOy3L7MEC0N+6KH1tHI8y/wX+ALVfvtX5ey87Wq4e9CbEzoWCzGp0W+q7nwZEqUV6/4jpThy
	2jdyMwQ8MjeZopLKr1f40/vEZquUTFM9PBnNrmzT+we9tYkK7GgQv7UapVvGegIdySVZ6XlA3MBVz
	vBz/RQMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urm0k-00000003ezK-0UmH;
	Thu, 28 Aug 2025 23:26:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urj5d-000000039qW-3Zdr;
	Thu, 28 Aug 2025 20:19:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D48E45229;
	Thu, 28 Aug 2025 20:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8182C4CEEB;
	Thu, 28 Aug 2025 20:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756412361;
	bh=EfjnmzRM4EzcfrEjZb23/Q388aWEyQC6jnzqc5fc3EY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BWYmvZjGSIhGsXSITNjValCU+H/NakH+Ls/Djn/tsb1jdJotNaLCwT5loQOWcouAI
	 L9RCLZblArg6XxZ+165bTtoXHQyfMZbRxY+nq4By7/Vbriu4UDciz9M/fhi292xlfg
	 MlvDF7Q4gmgRW+JnZQb3ugIJFYG51hxAsvnNyrfGhLWRmuR6Q0Z09CQF+EJfYGL/kc
	 ZLYOLaR3Cf0mRUUVYgkqT6Dsu1hWwB2LTJDQceK8ZyzuT6aZQBjTVDVsis5JCRanln
	 EYIsBdufpk0e3794rEjgqj9JtPTkeB3oYtJopEGq552ZGP7crVncu0xWF1Qjhp/ycN
	 0/2Ql3ZHeRFRw==
Date: Thu, 28 Aug 2025 13:19:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@outflux.net>,
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
Message-ID: <20250828201915.GA219815@ax162>
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-5-kees@kernel.org>
 <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
 <202508250834.E2456B9@keescook>
 <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
 <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net>
 <20250827013444.GA2859318@ax162>
 <56c2b1ce-00a4-403c-9927-79bfd9a23574@infradead.org>
 <20250827193815.GA2293657@ax162>
 <CANiq72nX7d3XQtQKDdeUh2RFy5HqSg360m4pzesJyBP+y9K7FA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nX7d3XQtQKDdeUh2RFy5HqSg360m4pzesJyBP+y9K7FA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_131921_931329_2F774A67 
X-CRM114-Status: GOOD (  19.78  )
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

On Thu, Aug 28, 2025 at 02:11:51PM +0200, Miguel Ojeda wrote:
> On Wed, Aug 27, 2025 at 9:38 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > Another idea I had to avoid this is introducing CONFIG_CFI_GCC as a user
> > selectable symbol and making CONFIG_CFI the hidden symbol that both
> > compiler symbols select. After a couple of releases (or maybe the next
> > LTS), both CONFIG_CFI_CLANG and CONFIG_CFI_GCC could be eliminated with
> > CONFIG_CFI becoming user selectable, which would keep things working
> > since CONFIG_CFI=y will be present in the previous configuration.
> 
> If we are OK with something like this (i.e. waiting a few releases),
> then isn't it simpler the `def_bool` approach I mentioned? i.e. it
> means one less symbol and one less rename later, right?

Ah yes, I reread your suggestion and that would probably be the best
course of action, as it does avoid the extra symbol (although I am not
sure what you mean by one less rename?). As I understand it:

  config CFI_CLANG
      bool "Use Kernel Control Flow Integrity (kCFI)"
      depends on ARCH_SUPPORTS_CFI
      depends on $(cc-option,-fsanitize=kcfi)
      help
        <generic help text>

  config CFI
      def_bool CFI_CLANG

then keep the rest of the change the same with the rename? I guess the
CLANG in the symbol name could be confusing for some people but thinking
about the timeline more, kCFI would not ship until GCC 16 in the spring
of 2026, which would be after the Linux LTS release at the end of 2025.
That means we could easily drop CONFIG_CFI_CLANG in the first release of
2026 so that compatible GCC users should only ever see CONFIG_CFI from
mainline. They could see CONFIG_CFI_CLANG in the LTS release but at
least it would work.

Cheers,
Nathan

