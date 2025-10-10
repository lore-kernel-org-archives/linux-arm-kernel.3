Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302C4CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 02:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=myuyHG1xUhH8ZBIQYXarzyCRivvt3wPtbidFu+HEqME=; b=dKdgcS8LCMMgoln8Bm0HWxcxKh
	dhTMVFJN5BJcOhNbD0LQPDcjKakl7KQgxDgQV+DRAjdqLTgmGCNdkY7fE2NWZbfpBNh7a5zoO4nVt
	MvzpnYll5t7iMjfROjpRo4Qowr9HWuzuovozG4CXniNJ7Gzs+raUtCxhOnNjCYlY+1xACWl9nU9BG
	1XRpiqOwuJkKZ/NsH3TX5otN0ANKCEXp2I3PUrm6Xkidb442zGuHIDpg4uFp86884drKmb2s3dLjR
	TUOna8RjeK/WnAbMX5/rVXYn+XQqFbgdDgMymkkXn/1lrTq6YDy1c8lIUh+MiTT3pfC4Ar1h2MF0Z
	Z0WaP24A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v72hj-00000007URs-1bQV;
	Fri, 10 Oct 2025 02:17:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v72hh-00000007URX-1li8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 02:17:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FC311596;
	Thu,  9 Oct 2025 19:17:45 -0700 (PDT)
Received: from [10.164.18.47] (unknown [10.164.18.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0F773F738;
	Thu,  9 Oct 2025 19:17:51 -0700 (PDT)
Message-ID: <83a27a0f-ed74-47c7-b964-bf0b2980069e@arm.com>
Date: Fri, 10 Oct 2025 07:47:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: remove unused ARCH_PFN_OFFSET
To: Omar Sandoval <osandov@osandov.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: kernel-team@fb.com
References: <9078f326973e9065eef9d7c3198f94ded296915c.1759964446.git.osandov@osandov.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <9078f326973e9065eef9d7c3198f94ded296915c.1759964446.git.osandov@osandov.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_191757_511313_66BEE789 
X-CRM114-Status: GOOD (  13.59  )
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



On 09/10/25 4:31 AM, Omar Sandoval wrote:
> From: Omar Sandoval <osandov@fb.com>
> 
> This is only relevant to the FLATMEM memory model, which isn't an option
> since commit 782276b4d0ad ("arm64: Force SPARSEMEM_VMEMMAP as the only
> memory management model").
> 
> Signed-off-by: Omar Sandoval <osandov@fb.com>

FLATMEM cannot be selected on arm64 platform which always selects SPARSEMEM.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
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


