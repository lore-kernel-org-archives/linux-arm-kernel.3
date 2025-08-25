Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E9ECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 16:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6SEsQQJu4RQI6QtdIP/ei9FbRwEVDbv01cRvFrqdNIw=; b=g6OxkSDnvOZ1Curt+MFORIn2Cb
	sqcGGrT7W8L5Mmm34lLOFTvVI7nuWGdyjVtBpqnSaTWHly8XIKxMcxIRp9CcyVFGiAZkPwK+XLu4M
	1zZk+SNPLcmkJYsPB6v6n8vynpij4R/LPjKDLvzFpEl7WisO5r8ZUkVT1AkaG5cChZn3lTV6mLCOW
	hfgpqfQlPEUCgcN7xOdshKTD8NsrCaa8vbVt7pANYITdxqnFghcPvFFImd/3hU/yJ1VnkspFT7O8l
	PvkS9k9xXi62hoj1/1FKtb1C4uwmvfoHytHwH1t3o5krBu/rsZSgfhBYS0byxFvhnectAXpkeF/IY
	CHCGBwrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqa6a-00000008fYo-24Fc;
	Mon, 25 Aug 2025 16:31:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZE3-00000008XEU-1v08;
	Mon, 25 Aug 2025 15:35:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A3034069E;
	Mon, 25 Aug 2025 15:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011FEC4CEED;
	Mon, 25 Aug 2025 15:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756136115;
	bh=DJjOmkVujeC5JzsbUheOOz5HCUqqi0gOpXXCgeiknkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kdmBXckubJWHEXmKqcoBXuKEg4sUWopFtgGS8CKU6AYg17qDR9d4sAIFF7YZcTjLg
	 +9bpRB9qMnzrlApo2L4kU8KTtH6EcgOtoChsicI3YfkBfzj3bTXYtQTAvsmdef+4mu
	 jZFOTgnbrqRUuqb+wMsUj7pzNS7gmcdr2KHeo+Bb2Z79HW6SoBTsAHksQkkMSxZeIr
	 m0yNkjx2elCNQ9F5SA2nuLkJmL+4yl9P4s5D64UAf2gU1/uH3I2g1zdoE5ZeomcWI5
	 35NMHJFivKJtXYbojPIzbyphYxV4aWgHrEIdOtDPkaX0ujVfi3lGMMVyaYnorRZOvv
	 ETPnUGlCWOgNg==
Date: Mon, 25 Aug 2025 08:35:14 -0700
From: Kees Cook <kees@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@outflux.net>,
	Sami Tolvanen <samitolvanen@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
Message-ID: <202508250834.E2456B9@keescook>
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-5-kees@kernel.org>
 <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_083515_514874_2D49B7CA 
X-CRM114-Status: GOOD (  13.02  )
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

On Mon, Aug 25, 2025 at 05:01:13PM +0200, Miguel Ojeda wrote:
> On Mon, Aug 25, 2025 at 4:28 PM Kees Cook <kees@kernel.org> wrote:
> >
> > -config CFI_CLANG
> > -       bool "Use Clang's Control Flow Integrity (CFI)"
> > -       depends on ARCH_SUPPORTS_CFI_CLANG
> > +config CFI
> > +       bool "Use Kernel Control Flow Integrity (kCFI)"
> > +       depends on ARCH_SUPPORTS_CFI
> >         depends on $(cc-option,-fsanitize=kcfi)
> >         help
> 
> Do we need to do something to make the transition smoother, i.e.
> keeping the old one for a while to avoid a new question etc.?

Yeah, that's a good idea. What the right way to do that?

config CFI_CLANG
	bool "Use Clang's Control Flow Integrity (CFI)"
	depends on ARCH_SUPPORTS_CFI
	select CFI

?

-- 
Kees Cook

