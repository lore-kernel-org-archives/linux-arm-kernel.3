Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A060C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 09:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OinlicTUqCKuG9MTHGgEFzHpHXn4e/TbFQka2FRD/MQ=; b=zboakOzqzcn585Ignhm4s2laBv
	QADlkpXkfn7L9t956mFSC8JDNnlmtdTNlvAg8NaMyWtXmntgrkWKEQq1ktHTNNuT/5oNHS0Hmchi1
	RXNhDIwgxGseof2Cku7YsWkXSNGBd59HSmTbf83G8Z+IjtJ5e+REkazxrx6pGYVpN+cGZgXuKzi74
	eUQJTkXvCLuHz2v5L3r/hKzVZwvijQgOJaPSQazp4spuoi1WF0W4/dkKbXFgDBfaFaAyZX75qUhtA
	kLVGxeo0lwpgrpBz+Nk/vZ0ABmlgZjbN4YtsC1sS8RAKQn2UL8F7SWSJMDfNWzURbkZNbr89plEu9
	No9qy/tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSByv-0000000CgJe-3zT0;
	Thu, 19 Jun 2025 09:54:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSB3y-0000000CVpt-1753;
	Thu, 19 Jun 2025 08:56:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B3E3629E6;
	Thu, 19 Jun 2025 08:56:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB25C4CEF3;
	Thu, 19 Jun 2025 08:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750323361;
	bh=GY39qewCO8ZjeGeZxUohtkWS54SrNUfyybjbm7an5Kw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BiG8+DpI8qK/7ehh9mHlWcIBDcd2aW6L5zsdQwFfDHxAQzkw3wpYWGPQ6B8QAPH9D
	 y3g3vBeuapW2jbg7F3C0+1XUsLnDTo/NVZBstotfSykAdmedcEkBtU7uK0/NAe+wSt
	 Kc+Lun055qORQz7b1mmMomPpcYDq76KH/YewkrSM0s4AR/fntnE2c+ZQiv3ylk6uFy
	 YMe89/7ZUy5WBvyLmptPtHixT5axCELqsF3d08SoPQsMs39mRobfTX8/5lFJkTd5Ag
	 2mulMGlFaIN9bMOa0eo2qBME6/JU5n//r22rEhdAHA56YcfKfLRjdPIb6YPhoPnwm1
	 xxs6mMfeLDs3A==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so840190a12.2;
        Thu, 19 Jun 2025 01:56:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUFsma2gYcQRXjavN9m6qbIBQ6e9n9QCi7oqUtTM74ZOGIB2s3uM7dZTSGWnURb/nhPUCciW3fRVScO8E4NB2OF@lists.infradead.org, AJvYcCWM+lLWT9wmBMlSWZ7dKOqPoZ9g5KRkH92gRPLJsmenPb3AOQomSsKJElOweOLQzfX52v8iCljSVxiCJSE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1UVPr9+0axtk9jDOZSW/sWRWTIjUbEdSa/HQSfcbKPfzJTiI+
	2RId+5B2jnhy3YZU6FTjuytDE+1edLfYo1Oh8bq7M5BK+bFvfROcPHyXq+mI8LA3Ons+95vwWMG
	VkJSlIJlgaac4pffklbKE4Y6FZBDZdRY=
X-Google-Smtp-Source: AGHT+IHshgFBjrE/bznWO4e6lyy0nq5bnj0JFcjbPNAIZZpdv6svyHpe5+Z0ZAFZ4cpQ+FvgAbwAckAC6VQE1xAS01s=
X-Received: by 2002:a05:6402:26cc:b0:607:16b1:7489 with SMTP id
 4fb4d7f45d1cf-608d094801bmr19223662a12.20.1750323359751; Thu, 19 Jun 2025
 01:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250523043251.it.550-kees@kernel.org> <20250523043935.2009972-10-kees@kernel.org>
In-Reply-To: <20250523043935.2009972-10-kees@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 19 Jun 2025 16:55:48 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4WxAwXTYVFOnphgHN80-_6jt77YZ_rw-sOBoBjjiN-yQ@mail.gmail.com>
X-Gm-Features: AX0GCFvInY5DbmRkbwxLo6Cb2clGLakUsQ51xQCaa7Coc4b_DkkyTMX5tkJkYVA
Message-ID: <CAAhV-H4WxAwXTYVFOnphgHN80-_6jt77YZ_rw-sOBoBjjiN-yQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/14] loongarch: Handle KCOV __init vs inline mismatches
To: Kees Cook <kees@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Gleixner <tglx@linutronix.de>, Tianyang Zhang <zhangtianyang@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Christoph Hellwig <hch@lst.de>, Marco Elver <elver@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi, Kees,

On Fri, May 23, 2025 at 12:39=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> When KCOV is enabled all functions get instrumented, unless
> the __no_sanitize_coverage attribute is used. To prepare for
> __no_sanitize_coverage being applied to __init functions, we have to
> handle differences in how GCC's inline optimizations get resolved. For
> loongarch this exposed several places where __init annotations were
> missing but ended up being "accidentally correct". Fix these cases and
> force one function to be inline with __always_inline.
>
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: WANG Xuerui <kernel@xen0n.name>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Tianyang Zhang <zhangtianyang@loongson.cn>
> Cc: Bibo Mao <maobibo@loongson.cn>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: <loongarch@lists.linux.dev>
> ---
>  arch/loongarch/include/asm/smp.h | 2 +-
>  arch/loongarch/kernel/time.c     | 2 +-
>  arch/loongarch/mm/ioremap.c      | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/smp.h b/arch/loongarch/include/as=
m/smp.h
> index ad0bd234a0f1..88e19d8a11f4 100644
> --- a/arch/loongarch/include/asm/smp.h
> +++ b/arch/loongarch/include/asm/smp.h
> @@ -39,7 +39,7 @@ int loongson_cpu_disable(void);
>  void loongson_cpu_die(unsigned int cpu);
>  #endif
>
> -static inline void plat_smp_setup(void)
> +static __always_inline void plat_smp_setup(void)
Similar to x86 and arm, I prefer to mark it as __init rather than
__always_inline.

Huacai

>  {
>         loongson_smp_setup();
>  }
> diff --git a/arch/loongarch/kernel/time.c b/arch/loongarch/kernel/time.c
> index bc75a3a69fc8..367906b10f81 100644
> --- a/arch/loongarch/kernel/time.c
> +++ b/arch/loongarch/kernel/time.c
> @@ -102,7 +102,7 @@ static int constant_timer_next_event(unsigned long de=
lta, struct clock_event_dev
>         return 0;
>  }
>
> -static unsigned long __init get_loops_per_jiffy(void)
> +static unsigned long get_loops_per_jiffy(void)
>  {
>         unsigned long lpj =3D (unsigned long)const_clock_freq;
>
> diff --git a/arch/loongarch/mm/ioremap.c b/arch/loongarch/mm/ioremap.c
> index 70ca73019811..df949a3d0f34 100644
> --- a/arch/loongarch/mm/ioremap.c
> +++ b/arch/loongarch/mm/ioremap.c
> @@ -16,12 +16,12 @@ void __init early_iounmap(void __iomem *addr, unsigne=
d long size)
>
>  }
>
> -void *early_memremap_ro(resource_size_t phys_addr, unsigned long size)
> +void * __init early_memremap_ro(resource_size_t phys_addr, unsigned long=
 size)
>  {
>         return early_memremap(phys_addr, size);
>  }
>
> -void *early_memremap_prot(resource_size_t phys_addr, unsigned long size,
> +void * __init early_memremap_prot(resource_size_t phys_addr, unsigned lo=
ng size,
>                     unsigned long prot_val)
>  {
>         return early_memremap(phys_addr, size);
> --
> 2.34.1
>

