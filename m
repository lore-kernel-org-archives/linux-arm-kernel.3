Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8038C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 11:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PgnwHbz1AjhGioq038lpvG95tXZpXvS33HP9z+P5ExU=; b=KkGo9xaYZwYACVKcI8PLPdEazv
	sguuafSSziJjcZUg7j7CDY+2iPggO0e3xkzqeqTHM7Q01MgAKnC+3RIYCV31Gh7nsU41JJl9lMOGD
	xfsx+jTdTy3L8lbdt2dAZDtaNW4IR5rD7nR6dkp0HN4OB5y5N0i4hzNmDF3MoWG83SGPOj6mp+w72
	p20onRUKsA11Te7pkgrbocvm0HwtF5xfNSdZ8X6JB2ROdFUcuA5drliqMQxtXIhalcJms8YeBF8At
	+p9ytocMcz7kQb+S7bYLWQhHxPLnEh8zivXDJGcdmYwdd46tHOdpS+py15gKRc6A7WK5FjvDb6rsM
	z1GZgt6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGfc-0000000Bm6m-1wiW;
	Tue, 06 May 2025 11:41:08 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCF6P-0000000BUfK-38RZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 10:00:42 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-72b8028dd8fso531887a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 03:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746525640; x=1747130440; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgnwHbz1AjhGioq038lpvG95tXZpXvS33HP9z+P5ExU=;
        b=YbV6+iLWo1XLQUL4pHgwk1wIkRkvHI3kqLz4b+YTxbgJ/AfG32G+oQteWK5yHvF9ja
         IpcYoaMDKqgOdiXVDNdNyODajctUAbSLkia1VvTOJeK2PRxZLFv5FNu90GCrjedQJ/Z4
         bHBEWeXHpS7FqAbNlxfJTxWbFI0OmKNRR2F6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746525640; x=1747130440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PgnwHbz1AjhGioq038lpvG95tXZpXvS33HP9z+P5ExU=;
        b=MOJLSDPX68gonIha8sGDZwhAYLXpiS+c8bH6aX86onEwsf1D3x6SpoaDwnqkSJ0V+g
         obxH3sfk5qDuc+IYCQK+EwZ1Y+XCjEwA0wewMxy4hXmfSkOUZTwOvSmNszhgj6LKgOM6
         QPTOqdymfFcAS9ALz5iLHBAXX9/hMPWHISHcAGMGhi11Bn7fI5aKSE8A1uw1/t7QoQyN
         2/9CHlz0hhe7jrGU2Ix8ddVsVkMei7hiz2O/1wb1G2rmMIpAewgKBiVpGS0pEb+BDE12
         zS+RHgiyNpmwpTXD2StkC2D3Mp2uu5DJgYn517VtcnFnq96rSRFSeZg2vj6MLXx7mgZC
         r2ew==
X-Gm-Message-State: AOJu0YyHxLxzRtJlaThcNKQ9yJDu2bImP7Ao/nBh9XNacz8Jdq5jP5iw
	HcsVx9OpHja/40uT4uP4wntDPg2d1IZi1lpZXrBLTILiN1T7yS2aWCAtPvvQulS/A/J0Cwnkoqz
	xFD4M3LtRM9fH3BqKV+3/uFhXojaPdljL0VW3HJllUS64+L2GUw==
X-Gm-Gg: ASbGncuYw3hIs75k8+NNJv4Gfrci2mzYwPi0eSImVFiJKxSR3jEa1c026crh6aoadsD
	LoWEBuyn/sqoAY+XbgmwT/KGbRgJrnm7t3+9Em2CNlNm8UFnMr3ny3i0S2QGMLroE+uz1T7SZ3C
	ZGbkehJxXRbhUtjtaqgIHbew4LYGcuzNMao/6cKUONyUswy28dQQ==
X-Google-Smtp-Source: AGHT+IHhiyIn/3nXmyB0TYKrtQeZw6wh97jFrO+F43EodTx1tAmH3sRUHkuhHaTX6F/Xwh2Vb3HsEaBkMH8rLIg5VLU=
X-Received: by 2002:a4a:e0d9:0:b0:606:3a5d:c7ad with SMTP id
 006d021491bc7-607ee513583mr2347984eaf.0.1746525640269; Tue, 06 May 2025
 03:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250506095224.176085-1-revest@chromium.org> <20250506095224.176085-5-revest@chromium.org>
In-Reply-To: <20250506095224.176085-5-revest@chromium.org>
From: Florent Revest <revest@chromium.org>
Date: Tue, 6 May 2025 12:00:29 +0200
X-Gm-Features: ATxdqUEWe64mgnWNWtDc2kPZf5XuKvFECDO9Vew2NFN-uLRlx3rHuyFczgLc0LE
Message-ID: <CABRcYm+vgD+BNYQ6H7=n6Bdhvq8QXriKx5Ksjhsx+DpYq6064g@mail.gmail.com>
Subject: Re: [PATCH 4/4] mm: consolidate VM_HIGH_ARCH_* macros into parametric macros
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Cc: catalin.marinas@arm.com, will@kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, akpm@linux-foundation.org, broonie@kernel.org, 
	thiago.bauermann@linaro.org, jackmanb@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_030041_803628_34E6824A 
X-CRM114-Status: GOOD (  20.92  )
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

On Tue, May 6, 2025 at 11:53=E2=80=AFAM Florent Revest <revest@chromium.org=
> wrote:
>
> This reduces code duplication and chances of mistakes.
>
> Signed-off-by: Florent Revest <revest@chromium.org>
> ---
>  include/linux/mm.h | 50 ++++++++++++++--------------------------------
>  1 file changed, 15 insertions(+), 35 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index b12549f0a6dce..6750020d5ea37 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -298,42 +298,22 @@ extern unsigned int kobjsize(const void *objp);
>  #define VM_MERGEABLE   0x80000000      /* KSM may merge identical pages =
*/
>
>  #ifdef CONFIG_64BIT
> -#define VM_HIGH_ARCH_BIT_0     32      /* bit only usable on 64-bit arch=
itectures */
> -#define VM_HIGH_ARCH_BIT_1     33      /* bit only usable on 64-bit arch=
itectures */
> -#define VM_HIGH_ARCH_BIT_2     34      /* bit only usable on 64-bit arch=
itectures */
> -#define VM_HIGH_ARCH_BIT_3     35      /* bit only usable on 64-bit arch=
itectures */
> -#define VM_HIGH_ARCH_BIT_4     36      /* bit only usable on 64-bit arch=
itectures */
> -#define VM_HIGH_ARCH_BIT_5     37      /* bit only usable on 64-bit arch=
itectures */
> -#define VM_HIGH_ARCH_BIT_6     38      /* bit only usable on 64-bit arch=
itectures */
> -#define VM_HIGH_ARCH_BIT_7     39      /* bit only usable on 64-bit arch=
itectures */
> -#define VM_HIGH_ARCH_BIT_8     40      /* bit only usable on 64-bit arch=
itectures */
> -#define VM_HIGH_ARCH_BIT_9     41      /* bit only usable on 64-bit arch=
itectures */
> -#define VM_HIGH_ARCH_BIT_10    42      /* bit only usable on 64-bit arch=
itectures */
> -#define VM_HIGH_ARCH_0 BIT(VM_HIGH_ARCH_BIT_0)
> -#define VM_HIGH_ARCH_1 BIT(VM_HIGH_ARCH_BIT_1)
> -#define VM_HIGH_ARCH_2 BIT(VM_HIGH_ARCH_BIT_2)
> -#define VM_HIGH_ARCH_3 BIT(VM_HIGH_ARCH_BIT_3)
> -#define VM_HIGH_ARCH_4 BIT(VM_HIGH_ARCH_BIT_4)
> -#define VM_HIGH_ARCH_5 BIT(VM_HIGH_ARCH_BIT_5)
> -#define VM_HIGH_ARCH_6 BIT(VM_HIGH_ARCH_BIT_6)
> -#define VM_HIGH_ARCH_7 BIT(VM_HIGH_ARCH_BIT_7)
> -#define VM_HIGH_ARCH_8 BIT(VM_HIGH_ARCH_BIT_8)
> -#define VM_HIGH_ARCH_9 BIT(VM_HIGH_ARCH_BIT_9)
> -#define VM_HIGH_ARCH_10        BIT(VM_HIGH_ARCH_BIT_10)
> +#define VM_HIGH_ARCH_BIT(i)    (32+i)  /* bit only usable on 64-bit arch=
itectures */
> +#define VM_HIGH_ARCH_(i)       BIT(VM_HIGH_ARCH_BIT(i))

Argh, and of course I forgot to squash two local fixes before sending
the series out...

This should have been VM_HIGH_ARCH() here (the _ at the end is a typo)

>  #endif /* CONFIG_64BIT */
>
>  #ifdef CONFIG_ARCH_HAS_PKEYS
>  # define VM_PKEY_SHIFT VM_HIGH_ARCH_BIT_0

And this should have been a VM_HIGH_ARCH_BIT(0)

... Anyway, I think it still gets the point across that it could make
some sense to change those VM_HIGH_ARCH macros.

> -# define VM_PKEY_BIT0  VM_HIGH_ARCH_0
> -# define VM_PKEY_BIT1  VM_HIGH_ARCH_1
> -# define VM_PKEY_BIT2  VM_HIGH_ARCH_2
> +# define VM_PKEY_BIT0  VM_HIGH_ARCH(0)
> +# define VM_PKEY_BIT1  VM_HIGH_ARCH(1)
> +# define VM_PKEY_BIT2  VM_HIGH_ARCH(2)
>  #if CONFIG_ARCH_PKEY_BITS > 3
> -# define VM_PKEY_BIT3  VM_HIGH_ARCH_3
> +# define VM_PKEY_BIT3  VM_HIGH_ARCH(3)
>  #else
>  # define VM_PKEY_BIT3  0
>  #endif
>  #if CONFIG_ARCH_PKEY_BITS > 4
> -# define VM_PKEY_BIT4  VM_HIGH_ARCH_4
> +# define VM_PKEY_BIT4  VM_HIGH_ARCH(4)
>  #else
>  # define VM_PKEY_BIT4  0
>  #endif
> @@ -349,7 +329,7 @@ extern unsigned int kobjsize(const void *objp);
>   * (x86). See the comments near alloc_shstk() in arch/x86/kernel/shstk.c
>   * for more details on the guard size.
>   */
> -# define VM_SHADOW_STACK       VM_HIGH_ARCH_5
> +# define VM_SHADOW_STACK       VM_HIGH_ARCH(5)
>  #endif
>
>  #if defined(CONFIG_ARM64_GCS)
> @@ -357,7 +337,7 @@ extern unsigned int kobjsize(const void *objp);
>   * arm64's Guarded Control Stack implements similar functionality and
>   * has similar constraints to shadow stacks.
>   */
> -# define VM_SHADOW_STACK       VM_HIGH_ARCH_6
> +# define VM_SHADOW_STACK       VM_HIGH_ARCH(6)
>  #endif
>
>  #ifndef VM_SHADOW_STACK
> @@ -381,8 +361,8 @@ extern unsigned int kobjsize(const void *objp);
>  #endif
>
>  #if defined(CONFIG_ARM64_MTE)
> -# define VM_MTE                VM_HIGH_ARCH_4  /* Use Tagged memory for =
access control */
> -# define VM_MTE_ALLOWED        VM_HIGH_ARCH_5  /* Tagged memory permitte=
d */
> +# define VM_MTE                VM_HIGH_ARCH(4) /* Use Tagged memory for =
access control */
> +# define VM_MTE_ALLOWED        VM_HIGH_ARCH(5) /* Tagged memory permitte=
d */
>  #else
>  # define VM_MTE                VM_NONE
>  # define VM_MTE_ALLOWED        VM_NONE
> @@ -393,7 +373,7 @@ extern unsigned int kobjsize(const void *objp);
>  #endif
>
>  #ifdef CONFIG_HAVE_ARCH_USERFAULTFD_MINOR
> -# define VM_UFFD_MINOR         VM_HIGH_ARCH_9  /* UFFD minor faults */
> +# define VM_UFFD_MINOR         VM_HIGH_ARCH(9) /* UFFD minor faults */
>  #else /* !CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
>  # define VM_UFFD_MINOR         VM_NONE
>  #endif /* CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
> @@ -406,13 +386,13 @@ extern unsigned int kobjsize(const void *objp);
>   * if KVM does not lock down the memory type.
>   */
>  #ifdef CONFIG_64BIT
> -#define VM_ALLOW_ANY_UNCACHED          VM_HIGH_ARCH_7
> +#define VM_ALLOW_ANY_UNCACHED          VM_HIGH_ARCH(7)
>  #else
>  #define VM_ALLOW_ANY_UNCACHED          VM_NONE
>  #endif
>
>  #ifdef CONFIG_64BIT
> -#define VM_DROPPABLE           VM_HIGH_ARCH_8
> +#define VM_DROPPABLE           VM_HIGH_ARCH(8)
>  #elif defined(CONFIG_PPC32)
>  #define VM_DROPPABLE           VM_ARCH_1
>  #else
> @@ -421,7 +401,7 @@ extern unsigned int kobjsize(const void *objp);
>
>  #ifdef CONFIG_64BIT
>  /* VM is sealed, in vm_flags */
> -#define VM_SEALED      VM_HIGH_ARCH_10
> +#define VM_SEALED      VM_HIGH_ARCH(10)
>  #endif
>
>  /* Bits set in the VMA until the stack is in its final location */
> --
> 2.49.0.967.g6a0df3ecc3-goog
>

