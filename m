Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F35CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FhAyrkxz0LpLbhrHbehusZbj6zNCgOcy91cHD7K/rTw=; b=Eryti1vuDWyjCIob0SUrhvaToD
	N0bkALYaa8fdv//5of5GRQxnc522P67YVGkwsBbknaexos0DrDpRsAxjNWA3nDAJELsdBQgrY9aND
	k5iym0A/VTDmMNOJr+2QcikQ2iM86mH29pIgPvU0EVHbOX/tb7tONV737W06ukqa0VN8BzWYsXtjo
	CFvqOZ/jUDmEC1sXfWoVY97Vw9LTzFafQmLQc4kSEG6ATBm8HsMP10yBpknkS+exdIHIPbpIN1pM9
	s9untTqcijtg4VaR+TlUGG2TIyNKY8ebYwcgMmujyFOujA4xpS7LTmuHa8TCOEVVdwcoaY9DEv18j
	cyJySeDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJBg-0000000C7ME-19Qc;
	Tue, 04 Nov 2025 15:43:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJBe-0000000C7LF-13ZB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 15:43:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8283F41AA4;
	Tue,  4 Nov 2025 15:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41362C4CEF7;
	Tue,  4 Nov 2025 15:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762270989;
	bh=KVTmgezBCR1xhPB/QEJzMt3rheg4sku63yQBXwnYTP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y8FucS1MWRrDaDhum/yjxBXSjcHW305MewAZ6Il1bMNCrQN9d5YWgPq7NaFePtAWn
	 203jESlM53J+4VhxPwmSG8Gjwskr08fIy3IrN+7bUq0Te0FoAd/+3hXWADJCWFTox4
	 +65vmET5Lb+by5OJ02rvKrjLYkpZpUOjDrdGgrdcfzFlt9JNfu4OGIQOFxXVCeeZLO
	 n+jhd749RuUFFCR3HOIQk5CKEn0wg8TFQOyjE2aXEgrSgj3QTxES/CN7cL0a5gOxhP
	 t6uqYJ+KZ8APdkbsvakEMKjA6vfVdXghOBRgv21zFhPbn3HugefDhaxcLED4r0bKDY
	 9Mf9s3tF8A0Qw==
Date: Tue, 4 Nov 2025 15:43:04 +0000
From: Will Deacon <will@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org, ryan.roberts@arm.com
Subject: Re: [PATCH] arm64/mm: Drop redundant extern declaration for
 rodata_full
Message-ID: <aQofCMqxiqujZP-g@willie-the-truck>
References: <20251015023609.427911-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015023609.427911-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_074310_314555_126FCD7D 
X-CRM114-Status: GOOD (  16.69  )
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

On Wed, Oct 15, 2025 at 03:36:09AM +0100, Anshuman Khandual wrote:
> Drop the redundant extern declaration 'rodata_full' which can be included
> via the header <asm/setup.h> after moving exiting declaration outside the
> function arch_parse_debug_rodata(). While here also drop 'rodata_enabled'
> which is anyways available via the generic header <linux/init.h>.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/include/asm/mmu_context.h | 2 --
>  arch/arm64/include/asm/setup.h       | 4 +---
>  2 files changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
> index 0375ca3162ff..e4b3563e1d96 100644
> --- a/arch/arm64/include/asm/mmu_context.h
> +++ b/arch/arm64/include/asm/mmu_context.h
> @@ -26,8 +26,6 @@
>  #include <asm/sysreg.h>
>  #include <asm/tlbflush.h>
>  
> -extern bool rodata_full;
> -
>  static inline void contextidr_thread_switch(struct task_struct *next)
>  {
>  	if (!IS_ENABLED(CONFIG_PID_IN_CONTEXTIDR))
> diff --git a/arch/arm64/include/asm/setup.h b/arch/arm64/include/asm/setup.h
> index 3d96dde4d214..902f1aab520f 100644
> --- a/arch/arm64/include/asm/setup.h
> +++ b/arch/arm64/include/asm/setup.h
> @@ -12,12 +12,10 @@
>   */
>  extern phys_addr_t __fdt_pointer __initdata;
>  extern u64 __cacheline_aligned boot_args[4];
> +extern bool rodata_full;
>  
>  static inline bool arch_parse_debug_rodata(char *arg)
>  {
> -	extern bool rodata_enabled;
> -	extern bool rodata_full;
> -
>  	if (!arg)
>  		return false;

It would probably be cleaner to make 'rodata_full' static in mm/pageattr.c,
move the guts of arch_parse_debug_rodata in there and then consolidate
can_set_direct_map() and force_pte_mapping().

You need to talk to Ryan for the last part, as David's made some
suggestions around that too.

Will

