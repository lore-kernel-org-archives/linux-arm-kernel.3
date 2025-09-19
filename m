Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2071DCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 15:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcjBFe3FnXjznjDnFm4OyR/DdPsyIiLZ9Gg9YC+8Udc=; b=lNi1191ChhEKzJvtETtVE4ywnS
	uDNrzGh1GWzbVLAbCyJCi36Q36Q0TZPclXYnm9elBH9iMbyj7RHtnPIa1/PLUaQY+GCHlQFzdYBIg
	OXBTzqAod1t62KUTvVwTCX9R81Tqyzi0ru61XtOldKkoNc7ewBj19kK5isTVxewQMcD8xn00UiXkN
	nZGKfOfyVp1WTLFeKURzMB710K5D1b+qcwzYJrMiMQMVq7UQcp3g4EINdko0OkLyWP2Wov4GFOn8z
	xdzgq5Sk0LHrpY495wLKXYhT9KvA7guqYwNRKD42sbFURIk+FPnOQ/zbigHVhmowMpSFZPH8F0AEU
	80MLCecg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcc1-00000003Fch-2gIR;
	Fri, 19 Sep 2025 15:01:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcc0-00000003FcM-0VlP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 15:01:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 401B56013A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 15:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9CB9C4CEF0
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 15:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758294082;
	bh=saE+P8goRmOxpFQW3uWKh8mknX6g84clIecZEkZdkuI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BvEHPOILUPW8Dgph1/scxsChaaFw9h2rA33Y0t8QIEmGcJ20PG9RHUvBYQeV/LjGA
	 6vgwK3jCwz1JvTMo4FLg0VJS0OwPgoyE3cX3xw+05BDSKqXbXVC9musW3fOCbmKBhu
	 WZZZmfPcAMNtsHvilU/sgm9A8nmSGmwIW2KHfmpBZj3qYxWm+aGzuXvFxz71zSvwnG
	 BxCJgCepeU1HYXIy84IDy+X6II944uhlQkJyVIttINz1/KAOE+DxUSK0VQA5bv/eGQ
	 cVTYEvxW5/MZXluo081aQZiy3MnrsWcrTNKEFLqR98WD+5sRYrNqWQBPGxbjqp4IQ8
	 1s6lNTWUnV1bw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55f7b6e4145so2650487e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 08:01:22 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx564JRWmvuiLaHbl3Ep9o4c+nB35AkPPaebcpjkGvVLUnEEWG5
	queGNOrvcvSd8JhuRvhqbS86xd1+zjp5iDSozK45M7kgDsam9kDFVzErDijVK2Hw3bd7KZXMeq2
	PlLGjIBldyfD4R5ijSGRovGR4+SAFJ2o=
X-Google-Smtp-Source: AGHT+IGXT7xaqc0MehSYJATRk3j62bszDZlJ0+REGqc7MOVjw7hPH0tRwYf2DbMtCBLbqWw090Xrj/qth/5cVerp7FI=
X-Received: by 2002:ac2:5f1b:0:b0:55b:8afb:e644 with SMTP id
 2adb3069b0e04-579e375ca38mr1096947e87.31.1758294081307; Fri, 19 Sep 2025
 08:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250919122321.946462-1-abarnas@google.com> <20250919122321.946462-3-abarnas@google.com>
In-Reply-To: <20250919122321.946462-3-abarnas@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 19 Sep 2025 17:01:09 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGaT5Kf9=v0rSxW5TB__vDN=iPK7=+gDNBO=vTPrd_4Zg@mail.gmail.com>
X-Gm-Features: AS18NWC-Kn0GPVDh-zCsx0l7aHJimokOHFMUz7N4ftIprt3RNfvD9-Lo50sjvYY
Message-ID: <CAMj1kXGaT5Kf9=v0rSxW5TB__vDN=iPK7=+gDNBO=vTPrd_4Zg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arch: arm64: Reject modules with internal alternative callbacks
To: =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Dylan Hatch <dylanbhatch@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Fanqin Cui <cuifq1@chinatelecom.cn>
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

Hi Adrian,

On Fri, 19 Sept 2025 at 14:23, Adrian Barna=C5=9B <abarnas@google.com> wrot=
e:
>
> During module loading, check if there is a callback function used by the
> alternatives specified in the '.altinstruction' ELF section and block
> loading the module if such a function is present.
>

Why?

AIUI, the issue being addressed is the fact that we cannot yet execute
code from the module itself when alternatives are being applied, and
so the callback must live in the core kernel, or in another module.

So this is a really big hammer, given that it disallows all callback
alternatives, including ones that we could easily support.

I don't object to the approach per se, but please explain why this
solution is reasonable (after you've explained the problem)



> Reported-by: Fanqin Cui <cuifq1@chinatelecom.cn>
> Closes: https://lore.kernel.org/all/20250807072700.348514-1-fanqincui@163=
.com/
> Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
> ---
>  arch/arm64/include/asm/alternative.h |  4 ++--
>  arch/arm64/kernel/alternative.c      | 15 ++++++++++-----
>  arch/arm64/kernel/module.c           |  8 ++++++--
>  3 files changed, 18 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm64/include/asm/alternative.h b/arch/arm64/include/as=
m/alternative.h
> index 00d97b8a757f..6eab2517c809 100644
> --- a/arch/arm64/include/asm/alternative.h
> +++ b/arch/arm64/include/asm/alternative.h
> @@ -26,9 +26,9 @@ void __init apply_alternatives_all(void);
>  bool alternative_is_applied(u16 cpucap);
>
>  #ifdef CONFIG_MODULES
> -void apply_alternatives_module(void *start, size_t length);
> +int apply_alternatives_module(void *start, size_t length);
>  #else
> -static inline void apply_alternatives_module(void *start, size_t length)=
 { }
> +static inline int apply_alternatives_module(void *start, size_t length) =
{ }
>  #endif
>
>  void alt_cb_patch_nops(struct alt_instr *alt, __le32 *origptr,
> diff --git a/arch/arm64/kernel/alternative.c b/arch/arm64/kernel/alternat=
ive.c
> index 8ff6610af496..69fae94c843a 100644
> --- a/arch/arm64/kernel/alternative.c
> +++ b/arch/arm64/kernel/alternative.c
> @@ -139,15 +139,18 @@ static noinstr void clean_dcache_range_nopatch(u64 =
start, u64 end)
>         } while (cur +=3D d_size, cur < end);
>  }
>
> -static void __apply_alternatives(const struct alt_region *region,
> -                                bool is_module,
> -                                unsigned long *cpucap_mask)
> +static int __apply_alternatives(const struct alt_region *region,
> +                               bool is_module,
> +                               unsigned long *cpucap_mask)
>  {
>         struct alt_instr *alt;
>         __le32 *origptr, *updptr;
>         alternative_cb_t alt_cb;
>
>         for (alt =3D region->begin; alt < region->end; alt++) {
> +               if (ALT_HAS_CB(alt) && is_module)
> +                       return -EPERM;

Nit: is EPERM the appropriate error code here?

> +
>                 int nr_inst;
>                 int cap =3D ALT_CAP(alt);
>
> @@ -193,6 +196,8 @@ static void __apply_alternatives(const struct alt_reg=
ion *region,
>                 bitmap_and(applied_alternatives, applied_alternatives,
>                            system_cpucaps, ARM64_NCAPS);
>         }
> +
> +       return 0;
>  }
>
>  static void __init apply_alternatives_vdso(void)
> @@ -277,7 +282,7 @@ void __init apply_boot_alternatives(void)
>  }
>
>  #ifdef CONFIG_MODULES
> -void apply_alternatives_module(void *start, size_t length)
> +int apply_alternatives_module(void *start, size_t length)
>  {
>         struct alt_region region =3D {
>                 .begin  =3D start,
> @@ -287,7 +292,7 @@ void apply_alternatives_module(void *start, size_t le=
ngth)
>
>         bitmap_fill(all_capabilities, ARM64_NCAPS);
>
> -       __apply_alternatives(&region, true, &all_capabilities[0]);
> +       return __apply_alternatives(&region, true, &all_capabilities[0]);
>  }
>  #endif
>
> diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> index 5d6d228c6156..aeefc50229e3 100644
> --- a/arch/arm64/kernel/module.c
> +++ b/arch/arm64/kernel/module.c
> @@ -478,8 +478,12 @@ int module_finalize(const Elf_Ehdr *hdr,
>         int ret;
>
>         s =3D find_section(hdr, sechdrs, ".altinstructions");
> -       if (s)
> -               apply_alternatives_module((void *)s->sh_addr, s->sh_size)=
;
> +       if (s) {
> +               ret =3D apply_alternatives_module((void *)s->sh_addr, s->=
sh_size);
> +               if (ret < 0)
> +                       pr_err("module %s: error occurred when applying a=
lternatives\n", me->name);
> +                       return ret;
> +       }
>
>         if (scs_is_dynamic()) {
>                 s =3D find_section(hdr, sechdrs, ".init.eh_frame");
> --
> 2.51.0.534.gc79095c0ca-goog
>

