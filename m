Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209AEFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:To:From:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhyMtsrNWAXlc5eZxMUZW5WuN2uAE85mS/6yr9JYrYw=; b=zG3HN//wwH0fAJD1fj9TBFfU0j
	w8L/KtPtCXCgLSYVk5uNWpkyaR64+0N2QoDjMpCu6e2d8MB6gPJ7SjWdv+DMFwShVJEvgbEE0FtA0
	NGn6PSyvIvblHcJZUmYoYFpqfhHJBPZtvpi259WiSrRUx3mLb4cV3CXF8JxCeCEqtjhbra/NOgGQJ
	67lkU+nXJjfHYW2L0bZWOmW5nWCXavvDv3wq/4B2TJy4Pw1U8jDg8f0xOlntY/gmo3AkCRK82hGgp
	czPBccQlO1nPlyqsfOUsUV3GnwE0rpYzZ/ZFQcO8PKI9m2blYVBdyowbZwESZi3A7lu3D6sEJUfeu
	eENJbH6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1DN-00000003Kpe-1cZo;
	Wed, 29 Apr 2026 09:28:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1DL-00000003KpL-2GzA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 09:28:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 95E8D60128;
	Wed, 29 Apr 2026 09:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 104D6C4AF0B;
	Wed, 29 Apr 2026 09:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777454894;
	bh=fpOCUVYEWC1NdrTTi027HUseiIi9m9kIiSeG69aOkwY=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=jKLdDuRHDylpCirha4Z+Mzujyl4KZkrVzuNbDuT3KqdsV2JBd7ZSxnOMeckuzVxcg
	 yR0QYdns3kWUHAerdWr1E4EQAaVu9iHb0QioSCGhXzJULBq9pH0d7NIDDFyOmpuIya
	 k/8zcWFEEmrCUCOywbTq/ut8MDuQ8/ZFO9Xkki5pOlnVHuV+Yi1UE1uW6VMGZi8N7W
	 /PtWZJhNWjUOP34R/7no+f6McEZMan1gBhC6LF0eEDmVdDWMyYmyrPbfuY5QSLMCK5
	 IOBYsnc/Zf/E0HBU4Za8BubQtXdG/4nm3D3LhgPTPs55+yl5DIpfWNVvREIlAADVMN
	 AsOc6VcofnLMg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1FDD0F40070;
	Wed, 29 Apr 2026 05:28:13 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Wed, 29 Apr 2026 05:28:13 -0400
X-ME-Sender: <xms:Lc_xaX8dhdG6OlWZ2QBKEP8o0ojHripKZgdeJJimn_KBaL_NsNR0yw>
    <xme:Lc_xaeh80Py45KlNuw4BcCi-CNGIUgLYSFCO9mbZKXo_Lkt3xpnYr7vVjfsZ8ISRh
    3gwuZwAcqFZm6PLa2WFoQTpvD3QHc3Gl3zj6BpZZtZhI2PZsw1JOJc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekgedtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcuuehi
    vghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpeffieehgfdvfeefieetfeelvdetvdfgfedvjeetheegvdegjeduuefhheeigeei
    heenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    guodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdehtddtjeelqdef
    fedvudeigeduhedqrghruggspeepkhgvrhhnvghlrdhorhhgseifohhrkhhofhgrrhgurd
    gtohhmpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohephhhurg
    hnghiihhgrohihrghnghesghhmrghilhdrtghomhdprhgtphhtthhopeifihhllheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlih
    hsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhtvghvvgdrkhgrnhhg
    sehunhhishhotgdrtghomhdprhgtphhtthhopeiihhgrohihrghnghdrhhhurghnghesuh
    hnihhsohgtrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdr
    khgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Lc_xaRnJyIZuoEv0ggKHv_-6mXRl_7T_VtlHF1BULWDn8_xkUQPKbg>
    <xmx:Lc_xaW51gyt60G61DDdRHrbKYyykEKgPEWGc-XPfN3mrtotWc-gywQ>
    <xmx:Lc_xaXgvvLuHL-DL0eiRNmKnSMwSUd36yy8wVph-PwigfICIz5GlEg>
    <xmx:Lc_xaTEBz2KXh863vq3l9IGcpMwOQoHtwb3kZdA7b44UhxO5ARRegg>
    <xmx:Lc_xadRF7jfSoy6ZXl81iaIsKZLTKSWWmzSsKxaP0q8x_W25eoSAeXIK>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 00D69700069; Wed, 29 Apr 2026 05:28:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 29 Apr 2026 11:27:01 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Zhaoyang Huang" <huangzhaoyang@gmail.com>, steve.kang@unisoc.com
Message-Id: <8fcde357-aaa1-4bd2-a8b3-d660b94a38c6@app.fastmail.com>
In-Reply-To: <20260429061752.2880923-1-zhaoyang.huang@unisoc.com>
References: <20260429061752.2880923-1-zhaoyang.huang@unisoc.com>
Subject: Re: [PATCH] arch: arm64: fix KERNEL_SEGMENT_COUNT error
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

Hello Zhaoyang,

On Wed, 29 Apr 2026, at 08:17, zhaoyang.huang wrote:
> From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
>
> During debug of a kernel panic, we find that the pte_t of the final
> part of [data, end] segment got overflow to the next page of
> init_pg_end[1] which is the gap page before early_init_stack[2].
> This should be introduced by the KERNEL_SEGMENT_COUNT's value is 5
> which should be 6 as map_segment are called 6 times for the segments
> of (text, stext, rodata, inittext, initdata, data+bss)
>
> [1]
> crash_arm64_v9.0.1> vtop ffffffed00601000
> VIRTUAL           PHYSICAL
> ffffffed00601000  83401000
>
> PAGE DIRECTORY: ffffffecffd62000
>    PGD: ffffffecffd62da0 => 10000000833fb003
>    PMD: ffffff80033fb018 => 10000000833fe003
>    PTE: ffffff80033fe008 => 68000083401f03
>   PAGE: 83401000
>
>      PTE        PHYSICAL  FLAGS
> 68000083401f03  83401000  (VALID|SHARED|AF|NG|PXN|UXN)
>
>       PAGE       PHYSICAL      MAPPING       INDEX CNT FLAGS
> fffffffec00d0040 83401000                0        0  1 4000 reserved
>
> [2]
> ffffffed002c8000 (r) __pi__data
> ffffffed0054e000 (d) __pi___bss_start
> ffffffed005f5000 (b) __pi_init_pg_dir
> ffffffed005fe000 (b) __pi_init_pg_end
> ffffffed005ff000 (B) early_init_stack
> ffffffed00608000 (b) __pi__end
>
> Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> ---
>  arch/arm64/include/asm/kernel-pgtable.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kernel-pgtable.h 
> b/arch/arm64/include/asm/kernel-pgtable.h
> index 74a4f738c5f5..14dd1c52552a 100644
> --- a/arch/arm64/include/asm/kernel-pgtable.h
> +++ b/arch/arm64/include/asm/kernel-pgtable.h
> @@ -64,8 +64,8 @@
>  #define INIT_IDMAP_FDT_PAGES	(EARLY_PAGES(INIT_IDMAP_PGTABLE_LEVELS, 
> 0UL, UL(MAX_FDT_SIZE), 1) - 1)
>  #define INIT_IDMAP_FDT_SIZE	((INIT_IDMAP_FDT_PAGES + 
> EARLY_IDMAP_EXTRA_FDT_PAGES) * PAGE_SIZE)
> 
> -/* The number of segments in the kernel image (text, rodata, inittext, 
> initdata, data+bss) */
> -#define KERNEL_SEGMENT_COUNT	5
> +/* The number of segments in the kernel image (text, stext, rodata, 
> inittext, initdata, data+bss) */
> +#define KERNEL_SEGMENT_COUNT	6
> 
>  #if SWAPPER_BLOCK_SIZE > SEGMENT_ALIGN
>  #define EARLY_SEGMENT_EXTRA_PAGES (KERNEL_SEGMENT_COUNT + 1)

I think the better fix would be

--- a/arch/arm64/include/asm/kernel-pgtable.h
+++ b/arch/arm64/include/asm/kernel-pgtable.h
@@ -68,7 +68,7 @@
 #define KERNEL_SEGMENT_COUNT   5
 
 #if SWAPPER_BLOCK_SIZE > SEGMENT_ALIGN
-#define EARLY_SEGMENT_EXTRA_PAGES (KERNEL_SEGMENT_COUNT + 1)
+#define EARLY_SEGMENT_EXTRA_PAGES (KERNEL_SEGMENT_COUNT + 2)
 /*
  * The initial ID map consists of the kernel image, mapped as two separate
  * segments, and may appear misaligned wrt the swapper block size. This means

and add a line

Fixes: 5973a62efa34 ("arm64: map [_text, _stext) virtual address range non-executable+read-only")



