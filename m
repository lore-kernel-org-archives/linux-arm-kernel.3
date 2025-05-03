Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626BCC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 11:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oy9Ap1teIHGD5UvBQYEg14w0X5ag0HWEWjZAfEIUEXs=; b=4FXaRQkxEnUBj0JgJ4eSjbT1E7
	OTDLasi85DbORhbHjAzPuaOwaxhAIALJlJUhKz1Rf3xS5dj2WKbJ3e8IRim0XPV5NHRIcwvtZHpaE
	atMmUc+z+QJLfT6xYA9jVM8t6fgCfY1XADDnuHn4T69WUGuZkDk6m+tHw5PMpFnlW8WrK0qptecyS
	3D8rydU9R4e7nDm2wD98DNgrvk+Aw0XiOwW4BStFK1sOZI71o/OiGgmSWTparfLLnJBXzNuI/S/k3
	G1wagwEAZa5uT6g1lsKYFjF0tve8vBW0ORiQJwY5ZejRTEoOPPkIqaiooPEIk7aTW+t86Ss+M7NQD
	nqxKTNfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBBLm-00000003pQr-43Pw;
	Sat, 03 May 2025 11:48:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBBJs-00000003pLe-0EbU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 11:46:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 179A1A4ACAA
	for <linux-arm-kernel@lists.infradead.org>; Sat,  3 May 2025 11:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 779DBC4CEEE
	for <linux-arm-kernel@lists.infradead.org>; Sat,  3 May 2025 11:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746272770;
	bh=bfcQsv23MNVK857Y7WeF95vXbIfxrbp6fjPgXRHLwso=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DB8EeP1/5ajPB+TG9sbnHIxvXaCSNb8CK3zwZMlPM/JT5jwkCC8D8ngU2xkd+ifKM
	 MCK8jtC3OQUiFt//dnb4YN8gqpw+vPLoRcjRqg7M8iaKLGoXooA4ZVlqEAnjeWGKUZ
	 XHL3JS1lJAdzAlZDo82DAt3oZDy+GCrxSW1EwlsQZ2nNqpsJx9p9U2iU8iIfT2sGaX
	 u3GWBtTD/HLIT/Vk36orL4UyZ/fiPtuS9oIj8TBS837wBA3QDzLqoSYFk4RF2pQAvw
	 gOCA2GRAkrfeQ1fcC7keafAe4wdl0F+b7/dQW6R2ifhYJfCUchvTYF5/79WerrkaTu
	 mKSZNh3SpVN2g==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54d6f93316dso1175328e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 May 2025 04:46:10 -0700 (PDT)
X-Gm-Message-State: AOJu0YwTZRmDfFBpwKLXJhFKtua8hThE5khr+zhTrrej1TZemxErgMXm
	N+AZqGjwAnlVoP7Usk+dyM4M8YsoWa5PsQT7MgBqBAxzkWyJ3jpy7PakYQje+ANkF6fSTiXu1Ks
	kQR2D6VucRAHvVjl1gk8XlQvrJzw=
X-Google-Smtp-Source: AGHT+IHz/3ATFoh4wIgvBEGGR8MnAIK1VcwaWcaFPChLtV1tkN1Aox46uOYbOwGewUJIMMHq9O1xvp8JObSuRAjkcIk=
X-Received: by 2002:a05:6512:3055:b0:545:2837:17d0 with SMTP id
 2adb3069b0e04-54f9efadbe1mr305458e87.12.1746272768840; Sat, 03 May 2025
 04:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250503112137.1962910-5-ardb+git@google.com> <20250503112137.1962910-7-ardb+git@google.com>
In-Reply-To: <20250503112137.1962910-7-ardb+git@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 3 May 2025 13:45:57 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHoiF_OZxVgrBXCQ=Uqa+TUCC=d33Ep4V9hB5kESs=ijg@mail.gmail.com>
X-Gm-Features: ATxdqUF91cVbg03qRC4JmyCf5lDpGyiBRbnb3NFtY4j-bOnEBPKfshjHeztzKfY
Message-ID: <CAMj1kXHoiF_OZxVgrBXCQ=Uqa+TUCC=d33Ep4V9hB5kESs=ijg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64/boot: Disallow BSS exports to startup code
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, 
	Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_044612_230780_A6C79C06 
X-CRM114-Status: GOOD (  18.23  )
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

On Sat, 3 May 2025 at 13:22, Ard Biesheuvel <ardb+git@google.com> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> BSS might be uninitialized when entering the startup code, so forbid the
> use of any variables that live after __bss_start in the linker map.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/kernel/image-vars.h  | 66 +++++++++++---------
>  arch/arm64/kernel/vmlinux.lds.S |  2 +
>  2 files changed, 37 insertions(+), 31 deletions(-)
>
> diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
> index a0977f7cd3ec..a70244d1aa2a 100644
> --- a/arch/arm64/kernel/image-vars.h
> +++ b/arch/arm64/kernel/image-vars.h
> @@ -10,6 +10,12 @@
>  #error This file should only be included in vmlinux.lds.S
>  #endif
>
> +#define PI_EXPORT_SYM(sym)             \
> +       __PI_EXPORT_SYM(sym, __pi_ ## sym, Cannot export BSS symbol sym to startup code)
> +#define __PI_EXPORT_SYM(sym, pisym, msg)\
> +       PROVIDE(pisym = sym);           \
> +       ASSERT(sym < __bss_start, #msg)

LLD doesn't seem to love this. I'll replace this with

ASSERT((sym - KIMAGE_VADDR) < (__bss_start - KIMAGE_VADDR), #msg)

which appears to work for both LLD and ld.bfd



> +
>  PROVIDE(__efistub_primary_entry                = primary_entry);
>
>  /*
> @@ -36,39 +42,37 @@ PROVIDE(__pi___memcpy                       = __pi_memcpy);
>  PROVIDE(__pi___memmove                 = __pi_memmove);
>  PROVIDE(__pi___memset                  = __pi_memset);
>
> -PROVIDE(__pi_id_aa64isar1_override     = id_aa64isar1_override);
> -PROVIDE(__pi_id_aa64isar2_override     = id_aa64isar2_override);
> -PROVIDE(__pi_id_aa64mmfr0_override     = id_aa64mmfr0_override);
> -PROVIDE(__pi_id_aa64mmfr1_override     = id_aa64mmfr1_override);
> -PROVIDE(__pi_id_aa64mmfr2_override     = id_aa64mmfr2_override);
> -PROVIDE(__pi_id_aa64pfr0_override      = id_aa64pfr0_override);
> -PROVIDE(__pi_id_aa64pfr1_override      = id_aa64pfr1_override);
> -PROVIDE(__pi_id_aa64smfr0_override     = id_aa64smfr0_override);
> -PROVIDE(__pi_id_aa64zfr0_override      = id_aa64zfr0_override);
> -PROVIDE(__pi_arm64_sw_feature_override = arm64_sw_feature_override);
> -PROVIDE(__pi_arm64_use_ng_mappings     = arm64_use_ng_mappings);
> +PI_EXPORT_SYM(id_aa64isar1_override);
> +PI_EXPORT_SYM(id_aa64isar2_override);
> +PI_EXPORT_SYM(id_aa64mmfr0_override);
> +PI_EXPORT_SYM(id_aa64mmfr1_override);
> +PI_EXPORT_SYM(id_aa64mmfr2_override);
> +PI_EXPORT_SYM(id_aa64pfr0_override);
> +PI_EXPORT_SYM(id_aa64pfr1_override);
> +PI_EXPORT_SYM(id_aa64smfr0_override);
> +PI_EXPORT_SYM(id_aa64zfr0_override);
> +PI_EXPORT_SYM(arm64_sw_feature_override);
> +PI_EXPORT_SYM(arm64_use_ng_mappings);
>  #ifdef CONFIG_CAVIUM_ERRATUM_27456
> -PROVIDE(__pi_cavium_erratum_27456_cpus = cavium_erratum_27456_cpus);
> -PROVIDE(__pi_is_midr_in_range_list     = is_midr_in_range_list);
> +PI_EXPORT_SYM(cavium_erratum_27456_cpus);
> +PI_EXPORT_SYM(is_midr_in_range_list);
>  #endif
> -PROVIDE(__pi__ctype                    = _ctype);
> -PROVIDE(__pi_memstart_offset_seed      = memstart_offset_seed);
> -
> -PROVIDE(__pi_init_idmap_pg_dir         = init_idmap_pg_dir);
> -PROVIDE(__pi_init_idmap_pg_end         = init_idmap_pg_end);
> -PROVIDE(__pi_swapper_pg_dir            = swapper_pg_dir);
> -
> -PROVIDE(__pi__text                     = _text);
> -PROVIDE(__pi__stext                    = _stext);
> -PROVIDE(__pi__etext                    = _etext);
> -PROVIDE(__pi___start_rodata            = __start_rodata);
> -PROVIDE(__pi___inittext_begin          = __inittext_begin);
> -PROVIDE(__pi___inittext_end            = __inittext_end);
> -PROVIDE(__pi___initdata_begin          = __initdata_begin);
> -PROVIDE(__pi___initdata_end            = __initdata_end);
> -PROVIDE(__pi__data                     = _data);
> -PROVIDE(__pi___bss_start               = __bss_start);
> -PROVIDE(__pi__end                      = _end);
> +PI_EXPORT_SYM(_ctype);
> +PI_EXPORT_SYM(memstart_offset_seed);
> +
> +PI_EXPORT_SYM(init_idmap_pg_dir);
> +PI_EXPORT_SYM(init_idmap_pg_end);
> +PI_EXPORT_SYM(swapper_pg_dir);
> +
> +PI_EXPORT_SYM(_text);
> +PI_EXPORT_SYM(_stext);
> +PI_EXPORT_SYM(_etext);
> +PI_EXPORT_SYM(__start_rodata);
> +PI_EXPORT_SYM(__inittext_begin);
> +PI_EXPORT_SYM(__inittext_end);
> +PI_EXPORT_SYM(__initdata_begin);
> +PI_EXPORT_SYM(__initdata_end);
> +PI_EXPORT_SYM(_data);
>
>  #ifdef CONFIG_KVM
>
> diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
> index 73fa57f341b0..bd7626b8c7a3 100644
> --- a/arch/arm64/kernel/vmlinux.lds.S
> +++ b/arch/arm64/kernel/vmlinux.lds.S
> @@ -319,6 +319,7 @@ SECTIONS
>
>         /* start of zero-init region */
>         BSS_SECTION(SBSS_ALIGN, 0, 0)
> +       __pi___bss_start = __bss_start;
>
>         . = ALIGN(PAGE_SIZE);
>         __pi_init_pg_dir = .;
> @@ -332,6 +333,7 @@ SECTIONS
>         . = ALIGN(SEGMENT_ALIGN);
>         __pecoff_data_size = ABSOLUTE(. - __initdata_begin);
>         _end = .;
> +       __pi__end = .;
>
>         STABS_DEBUG
>         DWARF_DEBUG
> --
> 2.49.0.906.g1f30a19c02-goog
>

