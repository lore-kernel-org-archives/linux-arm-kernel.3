Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02681CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 10:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2re5h9BvVIxhLoIAp0ePvp6c2zEE/FG4SPTToG/0/C8=; b=QgJ5pnsWwgy4Lf1U+QCRk3MMv6
	bSqEBvz2KAGH4Y3x110oxr+n2ClaPCHTEr5vvqgJ+sx4+whet46fBeFfWf90LlJKKep0zBw7QT9JA
	edxrc4mf6Bb9oI8Qc0BHXSyAE9C+HKAlrARWw29DZxL4lObZIGg33v1nxiMupD00KAqn36+7I0snQ
	51dQNJkuv0UlG1iX6qTAtAYeOqtMsjJAg9rbnTqpuxN0ozkjhbE7GsGzLxyl9VSa5emkwuUag249g
	2Ar6uEUO1R4L2HRnaV5RDrtInoiDigKfTHRFjLSF2sVSv4PBt3I1ZFDYV8WTFuMyO/KAzfcZsEt/b
	0Bs3AQHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyp83-0000000Av5f-127U;
	Wed, 17 Sep 2025 10:11:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyp82-0000000Av5Q-0MVW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 10:11:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5385F60210
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 10:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04868C4CEF7
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 10:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758103869;
	bh=D+HyPQGG33HAXRRC/Y+C/4+k8YOzUXZka/GXNcZ+hgA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Hv7i9no64vTtkikWEwpHojBc80eIzXuIE+Bq7XVG8DaQe1xT3gnUbTZagem1TnKHW
	 qQOX+91nws6nJ19HYHx5WwkLHJTEbX+7I0VWSAfJbwK9ItUgLCbZk606S9S8qU59Tm
	 xLoBSJR7r9Gi9jyVge2Jjl0zeYCdop9ed0C04kccxdUZbF8BVTfGoXT/hhep32azLd
	 KU0J98z7tOrj2pv8LwZPLl5ocApzSF41NHZBpqdZlZpZsCjrdrUcUdpphzOtNpTNPl
	 RMiI8qoFyiFW1Nyvb3E47/kJa+c7EXxSSJnySZYi+AvEh4g8+41uWSjBq8HvAE661A
	 RGlvrJweeDL/w==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-33ca74c62acso58910751fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 03:11:08 -0700 (PDT)
X-Gm-Message-State: AOJu0YyNewVFHbh/VjYErO1Kpm+H9isWOBsiRDhP6TRzNiJvAADYtAuJ
	Y+5AUycX10UB6tRqJc+0tsBnAC43fBupM0k3uHwL8hF6HEXl5C4xvwKtIDQDjFCkYSUpv6ro+SV
	YeI+dgYQNVnu64und9ptetr1aJFNgpDE=
X-Google-Smtp-Source: AGHT+IHhEi0SMEJ/7BE9/xnk2Fj5uKjCLFZyFEr3GNqLMCwcQcGvNWwPsSNngNqZ12xIGlNuZK/HwJZZHRQVlmniDj0=
X-Received: by 2002:a05:651c:a0b:b0:338:1daf:f192 with SMTP id
 38308e7fff4ca-35f63d928eamr5786121fa.28.1758103867268; Wed, 17 Sep 2025
 03:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAHi4H7FKjYf0c90qoN9bSORboru+S718-k1eJYh4pVoDcJPGHw@mail.gmail.com>
In-Reply-To: <CAHi4H7FKjYf0c90qoN9bSORboru+S718-k1eJYh4pVoDcJPGHw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 17 Sep 2025 12:10:55 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGnyNdq5pxY1kZwBr1n9idKvHU=tyCM0Wie5Ys3RkW3SA@mail.gmail.com>
X-Gm-Features: AS18NWD3SkaQK4-aMuM5iMKahhGj71iY0SVwZnwIWBnkpUc4hwbcmgktWii5a6Q
Message-ID: <CAMj1kXGnyNdq5pxY1kZwBr1n9idKvHU=tyCM0Wie5Ys3RkW3SA@mail.gmail.com>
Subject: Re: armv7 R_ARM_PREL31 relocation out of range error when loading module
To: William Zhang <william.zhang@broadcom.com>
Cc: Linux ARM List <linux-arm-kernel@lists.infradead.org>, 
	Kursad Oney <kursad.oney@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Wenchung Su <wenchung.su@broadcom.com>, 
	"song@kernel.org" <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 17 Sept 2025 at 04:55, William Zhang <william.zhang@broadcom.com> wrote:
>
> Hi,
>
> We recently ran into the driver loading error resulting from
> apply_relocate function when it handle the R_ARM_PREL31 case in
> arch/arm/kernel/module.c:
> section 29 reloc 0 sym '': relocation 42 out of range (0xc2ab9be8 ->
> 0x7fad5998)
>
> After some dig, it seems this issue is caused by this change:
> ac3b43283923 ("module: replace module_layout with module_memory")
>
> I can see the necessity of this change but it seems it can cause this
> kind of error under certain configurations. In our particular case, we
> use the 2G/2G split and our armv7 board has 1GB ddr memory. This means
> the kernel lower memory is from 0x8000-0000 to 0xc000-0000 and vmalloc
> range is from 0xc000-0000 and above.
>
> Before this module layout change, the module is loaded through two
> layout sections: core and init. The driver in the test is fairly big
> and core module layout(text, data, rodata, sections) can not fit into
> the 16MB MODULE memory so both text, data and rodata fallback to
> vmalloc range. But with this change, it will text, data and rodata one
> by one. So it ends up text in the MODULES memory but rodata is
> allocated in VMALLOC and the distance is more than 1GB hence we
> believe it causes the above error when R_ARM_PREL31 relocation can not
> support more than 1GB offset.
>
> Since the default split is 1G/3G model, the distance between vmalloc
> and module memory is always below 1G so we won't see this issue. But
> it seems to us the problem is real when use 2G/2G split.
>
> It appears the sections containing R_ARM_PREL31 in our driver are
> mostly in .ARM.exidx section. Some search shows this is used by ARM
> C++ exception handling but our driver does not use C++. Is there a way
> to disable such section for R_ARM_PREL31? If not, is there any
> workaround or fix to handle this run-time R_ARM_PREL31 relocation
> issue? The same apply_relocate function can handle R_ARM_JUMP24 out of
> range using PLTS. Can this apply to R_ARM_PREL31?
>

Hi William,

Two options come to mind:

1) use the frame pointer for unwind information instead of the C++
exception metadata, i.e., enable CONFIG_UNWINDER_FRAME_POINTER

2) ensure that ARM.exidx sections are allocated from the same bucket
as the .text sections they annotate, e.g., something like the below

--- a/arch/arm/kernel/module-plts.c
+++ b/arch/arm/kernel/module-plts.c
@@ -225,6 +225,11 @@
                        mod->arch.init.plt = s;
                else if (s->sh_type == SHT_SYMTAB)
                        syms = (Elf32_Sym *)s->sh_addr;
+#if defined(CONFIG_ARM_UNWIND) && !defined(CONFIG_VMSPLIT_3G)
+               else if (s->sh_type == ELF_SECTION_UNWIND)
+                       s->sh_flags |= SHF_EXECINSTR;
+#endif
+
        }

        if (!mod->arch.core.plt || !mod->arch.init.plt) {

