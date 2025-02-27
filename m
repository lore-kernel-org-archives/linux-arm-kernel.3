Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C467DC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 13:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3D27/czJ9tTae692WszgtvNJJBNH99Ngz/ZrVGIZii8=; b=P6Xxf1r7cMxLvCGAffAYHmdom+
	J06DJbPgFtBTU9TiAb2gnTPZtUnCgcMmSj/+cT1zQ6XNjYIVzdh8s3V9LasKIM9I64b3gdX2QfLWH
	W/pL2bmdqFn7ifJRo4Ir09YxArYH0yCZ6RKVySJqNsE/iRTWjiRIlgaxFu4r0QwFaALQkdWmMAaeT
	YQpZpNMCDYGZuHXiJTg7PyuTyz7SgI8xHln2M7O2JLCWcn7mIP4erb0Xls7hN0Y7hyssesgkxZOxE
	PsxWLH7O03y45APgO2rz15qvmaX8E0oSCsLIZtSV+E1Ez2X3CKLCRQiV6fUT3aDho/yCVUZoiFC4o
	cuTLHOFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tndnA-00000007UrZ-1PYK;
	Thu, 27 Feb 2025 13:19:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnd31-00000007NKt-2Hjs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 12:31:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D54B25C28D8;
	Thu, 27 Feb 2025 12:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D25AC4CEE9;
	Thu, 27 Feb 2025 12:31:20 +0000 (UTC)
Date: Thu, 27 Feb 2025 12:31:17 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: yazen.ghannam@amd.com, mark.rutland@arm.com, mingo@redhat.com,
	robin.murphy@arm.com, Jonathan.Cameron@huawei.com, bp@alien8.de,
	rafael@kernel.org, linux-arm-kernel@lists.infradead.org,
	wangkefeng.wang@huawei.com, tanxiaofei@huawei.com,
	mawupeng1@huawei.com, tony.luck@intel.com, linmiaohe@huawei.com,
	naoya.horiguchi@nec.com, james.morse@arm.com,
	tongtiangen@huawei.com, gregkh@linuxfoundation.org, will@kernel.org,
	jarkko@kernel.org, linux-acpi@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	linux-edac@vger.kernel.org, x86@kernel.org, justin.he@arm.com,
	ardb@kernel.org, ying.huang@linux.alibaba.com, ashish.kalra@amd.com,
	baolin.wang@linux.alibaba.com, tglx@linutronix.de,
	dave.hansen@linux.intel.com, lenb@kernel.org, hpa@zytor.com,
	robert.moore@intel.com, lvying6@huawei.com, xiexiuqi@huawei.com,
	zhuo.song@linux.alibaba.com
Subject: Re: [PATCH v18 2/3] mm: memory-failure: move return value
 documentation to function declaration
Message-ID: <Z8BbFRupgknBTvH8@arm.com>
References: <20250107081735.16159-1-xueshuai@linux.alibaba.com>
 <20250107081735.16159-3-xueshuai@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107081735.16159-3-xueshuai@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_043127_671442_54261632 
X-CRM114-Status: GOOD (  18.55  )
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

(going through patches in my inbox)

On Tue, Jan 07, 2025 at 04:17:34PM +0800, Shuai Xue wrote:
> Part of return value comments for memory_failure() were originally
> documented at the call site. Move those comments to the function
> declaration to improve code readability and to provide developers with

s/declaration/definition/

> immediate access to function usage and return information.
> 
> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
> Reviewed-by: Jane Chu <jane.chu@oracle.com>
> ---
>  arch/x86/kernel/cpu/mce/core.c |  7 -------
>  mm/memory-failure.c            | 10 +++++++---
>  2 files changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
> index 7fb5556a0b53..d1dd7f892514 100644
> --- a/arch/x86/kernel/cpu/mce/core.c
> +++ b/arch/x86/kernel/cpu/mce/core.c
> @@ -1398,13 +1398,6 @@ static void kill_me_maybe(struct callback_head *cb)
>  		return;
>  	}
>  
> -	/*
> -	 * -EHWPOISON from memory_failure() means that it already sent SIGBUS
> -	 * to the current process with the proper error info,
> -	 * -EOPNOTSUPP means hwpoison_filter() filtered the error event,
> -	 *
> -	 * In both cases, no further processing is required.
> -	 */
>  	if (ret == -EHWPOISON || ret == -EOPNOTSUPP)
>  		return;
>  
> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> index a7b8ccd29b6f..14c316d7d38d 100644
> --- a/mm/memory-failure.c
> +++ b/mm/memory-failure.c
> @@ -2211,9 +2211,13 @@ static void kill_procs_now(struct page *p, unsigned long pfn, int flags,
>   * Must run in process context (e.g. a work queue) with interrupts
>   * enabled and no spinlocks held.
>   *
> - * Return: 0 for successfully handled the memory error,
> - *         -EOPNOTSUPP for hwpoison_filter() filtered the error event,
> - *         < 0(except -EOPNOTSUPP) on failure.
> + * Return:
> + *   0             - success,
> + *   -ENXIO        - memory not managed by the kernel
> + *   -EOPNOTSUPP   - hwpoison_filter() filtered the error event,
> + *   -EHWPOISON    - the page was already poisoned, potentially
> + *                   kill process,
> + *   other negative values - failure.
>   */
>  int memory_failure(unsigned long pfn, int flags)
>  {

Why not keep the comment in both places? One is about the x86 decisions,
the other is about what memory_failure() can return.

-- 
Catalin

