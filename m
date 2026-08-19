Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2093C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 11:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qb8vbO35I9ReDoy08LYZaOcpJWIqiGdFJcRUGNTu904=; b=tOF3JzkONGVypsA+uGiW7qbGAn
	TIzCwBINJm5+8NJd7GnFMUYiX6lgFx582M2fFIKVIuO7HDp9e/sHO9eL6U7W+UG7rtnP3FX+bNGzU
	ePH6T+rWzLQ/Od7zLT3iNgw8qcEXkG1LiqsXVJLUyHtPiGqxucBO8OXmXJw2CkVglmQGmLKMdG1mm
	SD9ZCGN8jPx9Vbg7HT45gGsMRB8a7txmeoZf5LPR03y1X8+q6nXyrzS5hTyiKhy12KUHIBIUadByV
	dVh0jZjXmTxjT3vUxzrr24sN0D0Vph2HquMD1KxaG2aLrlfc2Gb5R+yZFEaE2rVsBEb7YxHUG7Z4p
	fQy03lJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wweo4-00000009hiC-44kk;
	Wed, 19 Aug 2026 11:50:08 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wweo2-00000009hhP-0uIb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 11:50:07 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-39f1ac13687so6139751fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 04:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787140204; x=1787745004; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qb8vbO35I9ReDoy08LYZaOcpJWIqiGdFJcRUGNTu904=;
        b=j7Ag2Bjpu8HaLr0c1tAvInr8240b+MniiQK212faYTTeK4A2ApQJklse7b7yp1u8eL
         m0FSZxD32jACt17Xqcadn/xgk67NORY8T562BWTWKEP3xEEU4U2nAL4FRdgD1jR/Wi0H
         gTWc7KWVO78RhmxbLC9QGxXY0mMJGhvXP8+8k7DEx638Blk6HtanDYpUWSUsjyclYfpY
         Ph+/b5VRMCx5NLfJXSiv7oyak2s6H+PFE/5EjagLmRBt3Jg08DSGS0sNs5Wn6QrWFTW/
         j6yaj7WlySF83893sYx0jyuKPOOLNE/M5eS/S7um+zxTB/0y7LjNpqu3q437bbHM3iKx
         ch7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787140204; x=1787745004;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qb8vbO35I9ReDoy08LYZaOcpJWIqiGdFJcRUGNTu904=;
        b=XQI/l6za6s99Xrg1c64D+6/87MbYRTOq6Ud3tQSRD1qd2x0wWUrdUQ7BwveIiBekp2
         oJXVfKKnn5Dnd6VUGR+Mw2l5f8H28U3FykXcDIEGGdW4ehbIDo+E1CeX3roALaEtyvBW
         LcjFtdckTYv8wSvGJK8FvCMLlspsToj0UopNMsS2s7R+QaeZ7h0KpWMSW5Me7o6lxkai
         jMYdscHwB4eCIMUtIUiPQb5eOCN0uL2tpcIp2aaiI6EpsrqsJBr9V+ORIW4n5TionLQ3
         /TY6lk+UvHIUdznzV4auXA2c/k7fBMVb6A9Mp4o/HvEZsxe6pbJZZUjBKW9ufzaQdHtw
         9hGQ==
X-Forwarded-Encrypted: i=1; AHgh+RpWlslYsIeCfjtpSaJ2b29b7LDPPb4MZ211zgso0KpGwsU+ep8fU0510dRpR7t07YeAlSExLojAgjppnw1dMF4N@lists.infradead.org
X-Gm-Message-State: AOJu0YwgkIBi0cRwzzCfIevoENqm42nXdAdcF31rhcD8raVWUSY3aUCk
	Ae5Ia0hTbzCunHyWU83MVu6EV1c4QzNRu5nbFtead084h8JtICn6j7gU
X-Gm-Gg: AR+sD11e1O7TcH5V8ec+tNMi6/gxNTAyIuE23ljPsJm73h0fRwD2f4G5tqrTsYZi9hL
	OKqusHIgTwzY1UmziXOXjpKW9rVkJLqKYVBr8DcBpBSZ9fIxMXSLCbZhA+loeyGCG74bX5vkQk4
	wIcVN2pFFcd28W/5F/gFqHFmJm9f3WP1xO5VA6b6jz9xi2GdUErxlvDM7lr4/dsC4NWMKDAmyiD
	GOEceYhUABrG3LQxQhgi6U/GRpb7XgIq1xjKcgAV4KDXioxOaErOFBH8pG0a4I9FKdzJVNiXi5e
	+v8qc5Ai9070acGfwC11iBPU2WB27hZ0UpBdn39WAclDk2myJNBbJuYHz1GkuoiBC5fJhUABepT
	FsXtGk7PsDlADgFBI9J7yx+D8z8qsv5ZGOk0SuOOHlRxu/0UGxmUWMBTsEJHBgv2OA/HtEVCm9a
	/VM/Ck3xRSqeJmbMtBwxHERA9BNUH6bBVOYlxQhIYvjdEbyGiGMzicPHyXiOA2cEtFW0K2MSk/i
	f3TnWiEOtW9t8Oeb4w=
X-Received: by 2002:a05:651c:3135:b0:39b:48c1:8cd4 with SMTP id 38308e7fff4ca-3a18996bd7dmr7858151fa.7.1787140203900;
        Wed, 19 Aug 2026 04:50:03 -0700 (PDT)
Received: from pc636 (host-95-193-137-165.mobileonline.telia.com. [95.193.137.165])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a18a8e8579sm4123321fa.0.2026.08.19.04.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 04:50:03 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 19 Aug 2026 13:49:58 +0200
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Andy Lutomirski <luto@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Len Brown <lenb@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vasily Gorbik <gor@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>,
	Will Deacon <will@kernel.org>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH 3/6] mm/vmalloc: constify vm parameter of
 get_vm_area_page_order()
Message-ID: <aoWYZk7xNfjwuzQ_@pc636>
References: <20260816-execmem-set-vm-perms-v0-2-v1-0-90944a3ad43f@kernel.org>
 <20260816-execmem-set-vm-perms-v0-2-v1-3-90944a3ad43f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816-execmem-set-vm-perms-v0-2-v1-3-90944a3ad43f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_045006_276935_6C1826F2 
X-CRM114-Status: GOOD (  20.02  )
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

On Sun, Aug 16, 2026 at 01:59:26PM +0300, Mike Rapoport (Microsoft) wrote:
> get_vm_area_page_order() and vm_area_page_order() do not need to modify
> struct vm_struct passed to them.
> 
> Constify the parameter.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  mm/vmalloc.c | 4 ++--
>  mm/vmalloc.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 6822f0fe9583..fc7993db4152 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3124,7 +3124,7 @@ EXPORT_SYMBOL(vm_map_ram);
>  
>  static struct vm_struct *vmlist __initdata;
>  
> -static inline unsigned int vm_area_page_order(struct vm_struct *vm)
> +static inline unsigned int vm_area_page_order(const struct vm_struct *vm)
>  {
>  #ifdef CONFIG_HAVE_ARCH_HUGE_VMALLOC
>  	return vm->page_order;
> @@ -3133,7 +3133,7 @@ static inline unsigned int vm_area_page_order(struct vm_struct *vm)
>  #endif
>  }
>  
> -unsigned int get_vm_area_page_order(struct vm_struct *vm)
> +unsigned int get_vm_area_page_order(const struct vm_struct *vm)
>  {
>  	return vm_area_page_order(vm);
>  }
> diff --git a/mm/vmalloc.h b/mm/vmalloc.h
> index 8866ddcff668..211869f36509 100644
> --- a/mm/vmalloc.h
> +++ b/mm/vmalloc.h
> @@ -12,7 +12,7 @@ void __init vmalloc_init(void);
>  int __must_check vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>  		pgprot_t prot, struct page **pages,
>  		unsigned int page_shift, gfp_t gfp_mask);
> -unsigned int get_vm_area_page_order(struct vm_struct *vm);
> +unsigned int get_vm_area_page_order(const struct vm_struct *vm);
>  #else
>  static inline void vmalloc_init(void) {}
>  
> 
> -- 
> 2.53.0
> 
LGTM:

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki

