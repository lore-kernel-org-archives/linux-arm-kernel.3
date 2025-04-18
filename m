Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA48C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 13:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2VF1Wqh+s5kSSHdvzdvWTRfznQ05tTz5lgM74ZIniE=; b=rHHg7ZqpZRUC/psv75RlwawQy5
	4xtDxw9aaruJ5rbbDhwMytGGU7wfELIzDJzCD1t5o6Oe2RX/6vX9ie9z1uFb/t4XCxQIZzb8t8o40
	vodEo16h3WjmS4FQcWQ0fuZAWtTvQjPTb9g1b2d1r+1vm9FEWfIlJxhWZ3w1cZjEyBjVGHvFv8VR6
	hhdbjqGfV04Wz+NmVsvH3BXhSTXoJABT85WKvUKEU0eCNrXWvwmgbzlNWagk43Vqjlx9CoUPYIoRw
	LfyqV5LChn8kDwAlT1Plbdx1IkAWMCC+WTy85AlZFCkziqRcZVQyZirrXymsssJh4r0Lj99x0wnfp
	4nTbVkYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ljz-0000000GEDf-3UBT;
	Fri, 18 Apr 2025 13:26:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5li3-0000000GDhc-0v9Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 13:24:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2B33FA4A0F5
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 13:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1840FC4CEED
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 13:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744982686;
	bh=Zpq0zvnXdVEbaBwzWK6PMJI0n8R2FyiSy5j5Qz5uRSE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cionJg7L3TmwTFeVS5XuXObcMV/a/qYo6bkBGi7ZmSSxgsmsTHt4a1c0nRpCSi23a
	 8zsy9Xff+wHznJXzWUzsHnGTSGng1tbF7tOfIrWaFOiitIV4LmH+WpnCKIevKApxd4
	 oOmfepaqqrIkagMXTXRZn6rXqFLreXRPNYSeUAt1df9Tg4ZcoiouQ3DiWfc4mXTPwn
	 DpiQM8RU/lNNO2ksMV1wu1expaMSjYlJDfSLEEcDIrNU6ugKC08TmO9DHQKCu0dP8o
	 SgReWFMf7hidWL+yLXuXBWChsbmfkEIdEhholLRGVhH6mE7HOpVzgHffHhFqMY6bat
	 4wKQxfFzabizQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3105ef2a070so19061181fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 06:24:45 -0700 (PDT)
X-Gm-Message-State: AOJu0YzBG9GwKl0Uip+J1BUl19IByS6rmC2CgUZ/OCX837QtosR915sE
	XBrWi843vvErq6t/uMN587LJ7OriQ29CjaCoqjJ2zA0mxWasoZvIFtLOy1AFzVP5B+fv/cgRKka
	80rBVIS7lcDQW1ByAAlwQjs9rObM=
X-Google-Smtp-Source: AGHT+IErep3WGm4BtwQbtUM21QyEnX4Yv4tOQqENF1MhIsvxiD9bDt1+g2ar+vyD71wyvGU9V+mWf5jvr1lqOC2Tljk=
X-Received: by 2002:a05:651c:881:b0:30b:b7c3:949a with SMTP id
 38308e7fff4ca-310905008cfmr7971221fa.18.1744982684428; Fri, 18 Apr 2025
 06:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250414174018.6359-1-ebiggers@kernel.org>
In-Reply-To: <20250414174018.6359-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 18 Apr 2025 15:24:32 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGtQ=beo5Yvh38Sr-G3qyb7hYFpJsubUvkQuM4_451CGw@mail.gmail.com>
X-Gm-Features: ATxdqUElMc5hlF675lGEFJTV3nML3Kc9OVzWiwsASn1paK0_oCsLyQuqTnCSjCw
Message-ID: <CAMj1kXGtQ=beo5Yvh38Sr-G3qyb7hYFpJsubUvkQuM4_451CGw@mail.gmail.com>
Subject: Re: [PATCH] arm64: Kconfig: remove unnecessary selection of CRC32
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_062447_396303_45C75E70 
X-CRM114-Status: GOOD (  22.20  )
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

On Mon, 14 Apr 2025 at 19:41, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> The selection of CRC32 by ARM64 was added by commit 7481cddf29ed
> ("arm64/lib: add accelerated crc32 routines") as a workaround for the
> fact that, at the time, the CRC32 library functions used weak symbols to
> allow architecture-specific overrides.  That only worked when CRC32 was
> built-in, and thus ARM64 was made to just force CRC32 to built-in.
>
> Now that the CRC32 library no longer uses weak symbols, that no longer
> applies.  And the selection does not fulfill a user dependency either;
> those all have their own selections from other options.  Therefore, the
> selection of CRC32 by ARM64 is no longer necessary.  Remove it.
>
> Note that this does not necessarily result in CRC32 no longer being set
> to y, as it still tends to get selected by something else anyway.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>
> Please consider taking this through the arm64 tree.  But if it doesn't
> get picked up there, I'll take it through the crc tree.
>
>  arch/arm64/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index a182295e6f08..14073b0094c1 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -132,11 +132,10 @@ config ARM64
>         select BUILDTIME_TABLE_SORT
>         select CLONE_BACKWARDS
>         select COMMON_CLK
>         select CPU_PM if (SUSPEND || CPU_IDLE)
>         select CPUMASK_OFFSTACK if NR_CPUS > 256
> -       select CRC32
>         select DCACHE_WORD_ACCESS
>         select DYNAMIC_FTRACE if FUNCTION_TRACER
>         select DMA_BOUNCE_UNALIGNED_KMALLOC
>         select DMA_DIRECT_REMAP
>         select EDAC_SUPPORT
>
> base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
> --
> 2.49.0
>

