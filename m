Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FBFCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 13:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNRrALc9epRIa+VL/Sd9X3S9lAhmRvDrlG60aDx/h/I=; b=mqNKhRlrNFYVjUFkSnt9WcBM+W
	lrwbMqs9ALAMZGbvDj66OzP4OoUi9hZYCNhCCKRc2MMrV/1p8TLaEKiOzfaM7XN+l+q1E+YiYL0Ik
	ezuryPEoZhtmm8nYtRJkWaX24MW7AvKqJNYhIYYFaU7dbE0TXFXYutu4W0JpwTP91+9o2O9bobUC4
	l0vUWnGYo8zPAedBssVFFGZYxk2tpTPc4PXE5JytMXq1cVZ1xVeE1336nmZjsZ+fShXoMRQfLYvY/
	Pw5+3FRAW+ff7gZdijyUioo4k2jDdxkjgYL+/WqTmwVqp08cMRwteJPlSRFz2pdrt/Wus+UUXkKgo
	2QPStVtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHPh-0000000BulR-3KMK;
	Tue, 04 Nov 2025 13:49:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHPg-0000000Bukb-02QY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 13:49:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D548417D1;
	Tue,  4 Nov 2025 13:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0611C4CEF7;
	Tue,  4 Nov 2025 13:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762264170;
	bh=Daus9Pr0BeitM16s4MIbnEX/QtDo08oqO/H/oI5ky5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NHpZjq27Dnn+CQq/uSnn4ahj+jHQE0KEDPj5Z4fgGQlTQi2grPOAIAQ6oNbxenyQo
	 NB5OudGRrMC+M3X+hTKzhCSgynMjKI54LujN/96F+5GoFEfs2OgJqUYEhZ4QfhEHjg
	 ihz/09qwrDcQ6uEjnrGghx1Y0s2P3+5XSEEvnl/ZQz8Td9OErau4jimqhRrVzAMcUh
	 u0QTdsHz1+OuZKOkgFTkOjvj2kPcpKsnvvfccx1H9GW0U9L6D99lz5wvY9ljjX61xW
	 e0kgYR8WenyTJkGvr/mYbWft1jQ4nK1/JRCG2hq7GSVjOOAZKXwo9QiPgiUkyNBV3r
	 f2V958zoVuleg==
Date: Tue, 4 Nov 2025 13:49:26 +0000
From: Will Deacon <will@kernel.org>
To: Omar Sandoval <osandov@osandov.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, kernel-team@fb.com
Subject: Re: [PATCH] arm64: remove unused ARCH_PFN_OFFSET
Message-ID: <aQoEZor2mjy2Rxvh@willie-the-truck>
References: <9078f326973e9065eef9d7c3198f94ded296915c.1759964446.git.osandov@osandov.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9078f326973e9065eef9d7c3198f94ded296915c.1759964446.git.osandov@osandov.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_054932_064982_2B8DB34D 
X-CRM114-Status: GOOD (  15.72  )
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

On Wed, Oct 08, 2025 at 04:01:30PM -0700, Omar Sandoval wrote:
> From: Omar Sandoval <osandov@fb.com>
> 
> This is only relevant to the FLATMEM memory model, which isn't an option
> since commit 782276b4d0ad ("arm64: Force SPARSEMEM_VMEMMAP as the only
> memory management model").
> 
> Signed-off-by: Omar Sandoval <osandov@fb.com>
> ---
>  arch/arm64/include/asm/memory.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
> index f1505c4acb38..585a46a122fe 100644
> --- a/arch/arm64/include/asm/memory.h
> +++ b/arch/arm64/include/asm/memory.h
> @@ -392,7 +392,6 @@ static inline unsigned long virt_to_pfn(const void *kaddr)
>   *  virt_to_page(x)	convert a _valid_ virtual address to struct page *
>   *  virt_addr_valid(x)	indicates whether a virtual address is valid
>   */
> -#define ARCH_PFN_OFFSET		((unsigned long)PHYS_PFN_OFFSET)
>  
>  #if defined(CONFIG_DEBUG_VIRTUAL)
>  #define page_to_virt(x)	({						\

Acked-by: Will Deacon <will@kernel.org>

Will

