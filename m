Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B944AC54EDA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 11:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:Date:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rScpXVbASUqjAgnv8asCUXuGu69m7xK2h2FjiRqoUxs=; b=t76etbu7QiLtxCSbCOz83JWlmE
	4ncfSJcM5h6xENeKQFLbJ+5vslTVdCxhswfxQlM/XtuOFPXS0rd721aDXWe2409MuSqQl9G7hDBBK
	BXqsiVuX9JxBijMPS19WzPWfjOiVos1Zul7oP2htfJv7O+T2xaDt6gD/LHEvvgDey3Uagq8u0vz9a
	yusZ/WJXWo9kzv7goDwtBnOPqVYTe5YN4DuKYYZHWyuMkwv15vQpULzNw80DmWsK4tcqVxaToLMf7
	5QQM8TitSazJjZsGAKYiI57TxbVY8gyb/x90P4hyBfSZDsENs9vdF24yiVSW5qOJaNubeo8s7Og9O
	1edatuwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uImwX-00000005n0a-3g7i;
	Sat, 24 May 2025 11:21:33 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uImuL-00000005mo3-2rDn;
	Sat, 24 May 2025 11:19:19 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7399838db7fso605976b3a.0;
        Sat, 24 May 2025 04:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748085556; x=1748690356; darn=lists.infradead.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rScpXVbASUqjAgnv8asCUXuGu69m7xK2h2FjiRqoUxs=;
        b=Wd4C+sKp8R9UuCZeiu8JqjcpQBHTQyypP/IoA14pNH18Fy0kgex+EKN7oA7e5r0fsx
         U50zmOh7t1bx9U2Dq4T97IgkvzYURJA6dK0f0dfbu+w9FTihSBfDUWrhcerFxu3xNd7J
         BiRjmM8S4UCqzi6B2s8pu3FvMd0paVa1S7E3m9LEaImDq1R8qJtSqbr955jcUlUHnMco
         kgP6iU0ifl1z1zABEr+WOq+x/jim5ftu+7VOyZdPw+69N5tG5sf3e8CU2YzXWcuVHOui
         Lx+YNPoBRZgMZVxPjQgpmj9TEySPAry5NKSsjRMfJCmVc+7jSMyJUo6TH4ZLlA2fboHo
         fgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748085556; x=1748690356;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rScpXVbASUqjAgnv8asCUXuGu69m7xK2h2FjiRqoUxs=;
        b=MVwbWbgJoL81G9BR4bzD9RPAWUQ51KtmdVVPUjDZcrLeGwHCXpUtF2qMrgTxLVJgYH
         VhoBmlm8mVjD3nM14vkNrMe957XF1ar3A+XddjMMo0NeRC2vfIfeAuzlrba0fOAXZrIU
         i49I0LM9Ezwd24HocMtbp5YjBsxblQmUV67XfJSvldivB4R/0pzhxfcArYZzFB7OIPgs
         sT7MiHY0abBdokKqreIFFpkLxKXWXrp3wvBHdV9uJyeGtz+NvKlbPeMxCvLA23buKAa1
         XFBqJAsaUS9Y4JhYa1s8WX2+CA3NaVFZDM8pQ2Vs/gii0EmZGg9gFusnv2q93RqbgPXK
         SmsA==
X-Forwarded-Encrypted: i=1; AJvYcCUu/SdgeinLUGLo57JDsOqtnPuVOCnRb9J1JMI8uhSq+ZrojGvq7zygDIGENxCFVHY2fAG6MZfmHi+cX4E=@lists.infradead.org, AJvYcCWpDESxwD2mwb3YtDkigbcQB09cEm2GryX+IXVtud0uzxZiMASSDWXxXLBOvHYhl3oc//ki0uL7CDDSfw+pksMC@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk9a/g73alsIQN+ZmqXRsSLRQlImB0YzYqrJE0ZXyl3JNbem+C
	Un1nR0+wH0oOZhMMAs7ZuSzhi96UwP0v+gzES0KGJLiVkGD+VfqIa0L7
X-Gm-Gg: ASbGncvRvR7SZdESqJ4e6kOA4v5miTuEktTdKTM5BGxmLQEWNKdexoS2Nn7EcpWn1zw
	qSF2BguQ1V/JHk2i+CNZQTYo43bA4u4uNYBk4TT0eDZ1bMGXUBXVk77+TWseDuKUjgFm5RRQl3S
	t8lOvUDtnlgJ9tFetzRLAXySVqKW5z+woRpWNFNWVZILSzVZnhNzlQcO6VXhltCb4kXiQp5LCX0
	CI7HuCqGUyjv5CQED4Goss7dS3Ji+o35Es/vgQ0CWsIJfcihSgYWQP5HjxOhBfj1idN+W9Iqjhp
	ub0yjFj6bsMQvsvopX5Sv+ii+ChI+9CUDuixQdExHEAa1699vXiOExE=
X-Google-Smtp-Source: AGHT+IHzgyF4RMk4/VcB/ult2huesDrd3BktU05/6T5tjhGyNb1hL3EGlpy4BVyGxnMoNfwEQoYJDQ==
X-Received: by 2002:a05:6a00:1903:b0:73e:2367:c914 with SMTP id d2e1a72fcca58-745fe068d61mr3795551b3a.7.1748085556260;
        Sat, 24 May 2025 04:19:16 -0700 (PDT)
Received: from dw-tp ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96dfacesm14024380b3a.5.2025.05.24.04.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 04:19:15 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <kees@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linuxppc-dev@lists.ozlabs.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 08/14] powerpc: Handle KCOV __init vs inline mismatches
In-Reply-To: <20250523043935.2009972-8-kees@kernel.org>
Date: Sat, 24 May 2025 16:13:02 +0530
Message-ID: <87jz662ssp.fsf@gmail.com>
References: <20250523043251.it.550-kees@kernel.org> <20250523043935.2009972-8-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_041917_749829_66478323 
X-CRM114-Status: GOOD (  25.45  )
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

Kees Cook <kees@kernel.org> writes:

> When KCOV is enabled all functions get instrumented, unless
> the __no_sanitize_coverage attribute is used. To prepare for
> __no_sanitize_coverage being applied to __init functions, we have to
> handle differences in how GCC's inline optimizations get resolved. For
> s390 this requires forcing a couple functions to be inline with
> __always_inline.
>
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Naveen N Rao <naveen@kernel.org>
> Cc: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: <linuxppc-dev@lists.ozlabs.org>
> ---
>  arch/powerpc/mm/book3s64/hash_utils.c    | 2 +-
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index 5158aefe4873..93f1e1eb5ea6 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -409,7 +409,7 @@ static DEFINE_RAW_SPINLOCK(linear_map_kf_hash_lock);
>  
>  static phys_addr_t kfence_pool;
>  
> -static inline void hash_kfence_alloc_pool(void)
> +static __always_inline void hash_kfence_alloc_pool(void)
>  {
>  	if (!kfence_early_init_enabled())
>  		goto err;
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 9f764bc42b8c..3238e9ed46b5 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -363,7 +363,7 @@ static int __meminit create_physical_mapping(unsigned long start,
>  }
>  
>  #ifdef CONFIG_KFENCE
> -static inline phys_addr_t alloc_kfence_pool(void)
> +static __always_inline phys_addr_t alloc_kfence_pool(void)
>  {
>  	phys_addr_t kfence_pool;
>  

I remember seeing a warning msg around .init.text section. Let me dig
that...

... Here it is: https://lore.kernel.org/oe-kbuild-all/202504190552.mnFGs5sj-lkp@intel.com/

I am not sure why it only complains for hash_debug_pagealloc_alloc_slots().
I believe there should me more functions to mark with __init here.
Anyways, here is the patch of what I had in mind.. I am not a compiler expert,
so please let me know your thoughts on this.

-ritesh


From 59d64dc0014ccb4ae13ed08ab596738628ee23b1 Mon Sep 17 00:00:00 2001
Message-Id: <59d64dc0014ccb4ae13ed08ab596738628ee23b1.1748084756.git.ritesh.list@gmail.com>
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Date: Sat, 24 May 2025 16:14:08 +0530
Subject: [RFC] powerpc/mm/book3s64: Move few kfence & debug_pagealloc
 related calls to __init section

Move few kfence and debug_pagealloc related functions in hash_utils.c
and radix_pgtable.c to __init sections since these are only invoked once
by an __init function during system initialization.

i.e.
- hash_debug_pagealloc_alloc_slots()
- hash_kfence_alloc_pool()
- hash_kfence_map_pool()
  The above 3 functions only gets called by __init htab_initialize().

- alloc_kfence_pool()
- map_kfence_pool()
  The above 2 functions only gets called by __init radix_init_pgtable()

This should also help fix warning msgs like:

>> WARNING: modpost: vmlinux: section mismatch in reference:
hash_debug_pagealloc_alloc_slots+0xb0 (section: .text) ->
memblock_alloc_try_nid (section: .init.text)

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504190552.mnFGs5sj-lkp@intel.com/
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c    | 6 +++---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 5158aefe4873..4693c464fc5a 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -343,7 +343,7 @@ static inline bool hash_supports_debug_pagealloc(void)
 static u8 *linear_map_hash_slots;
 static unsigned long linear_map_hash_count;
 static DEFINE_RAW_SPINLOCK(linear_map_hash_lock);
-static void hash_debug_pagealloc_alloc_slots(void)
+static __init void hash_debug_pagealloc_alloc_slots(void)
 {
 	if (!hash_supports_debug_pagealloc())
 		return;
@@ -409,7 +409,7 @@ static DEFINE_RAW_SPINLOCK(linear_map_kf_hash_lock);
 
 static phys_addr_t kfence_pool;
 
-static inline void hash_kfence_alloc_pool(void)
+static __init void hash_kfence_alloc_pool(void)
 {
 	if (!kfence_early_init_enabled())
 		goto err;
@@ -445,7 +445,7 @@ static inline void hash_kfence_alloc_pool(void)
 	disable_kfence();
 }
 
-static inline void hash_kfence_map_pool(void)
+static __init void hash_kfence_map_pool(void)
 {
 	unsigned long kfence_pool_start, kfence_pool_end;
 	unsigned long prot = pgprot_val(PAGE_KERNEL);
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 311e2112d782..ed226ee1569a 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -363,7 +363,7 @@ static int __meminit create_physical_mapping(unsigned long start,
 }
 
 #ifdef CONFIG_KFENCE
-static inline phys_addr_t alloc_kfence_pool(void)
+static __init phys_addr_t alloc_kfence_pool(void)
 {
 	phys_addr_t kfence_pool;
 
@@ -393,7 +393,7 @@ static inline phys_addr_t alloc_kfence_pool(void)
 	return 0;
 }
 
-static inline void map_kfence_pool(phys_addr_t kfence_pool)
+static __init void map_kfence_pool(phys_addr_t kfence_pool)
 {
 	if (!kfence_pool)
 		return;
-- 
2.39.5


