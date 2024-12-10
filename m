Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C792E77181
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 07:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GK7jNiQwXGq1HNLW5XdewC21FHArvyWIAyQgbmPZrMw=; b=nONfAYtVHrLVl2+i5+CWK/HulG
	98Q/LXkmtrhU//KlNUEOEm7N9aAJdgTC/MMrF6XdPRDbmKkDfjS3dXCRQ481Dm9UYBpuxKfrONbpC
	/jWtn7xSlrH1HrnQSE7FDKrcQKHt9vqJcGc/55JvXlOFo60gQx01Kr8BpISwkP7Hj1x/UWj+muOT3
	oml/7O0WyGOEaEaDTlCg9SnZA81/1Oi+TZuPjTL1oIs40L0LORG2/4YQwGX7Otk8XmXe2Bu/vj0Mb
	pKNGeZfrxLQDiTv0nnzSgJQ8WCfvkpWHJ7MjHDs/gmQWBSMO8XNJ9pd4rpoP06KdgiFsVcOV3CVPC
	fjbGsa5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKufI-0000000AYUT-2IBH;
	Tue, 10 Dec 2024 07:28:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKueF-0000000AYNl-1tef
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 07:27:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E857EFEC;
	Mon,  9 Dec 2024 23:27:38 -0800 (PST)
Received: from [10.163.48.173] (unknown [10.163.48.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F04C83F720;
	Mon,  9 Dec 2024 23:27:06 -0800 (PST)
Message-ID: <767de5f8-a650-4acf-966e-528fd08b09bb@arm.com>
Date: Tue, 10 Dec 2024 12:57:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: remove CONFIG_RODATA_FULL_DEFAULT_ENABLED
To: Huang Shijie <shijie@os.amperecomputing.com>, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net
Cc: patches@amperecomputing.com, cl@linux.com, akpm@linux-foundation.org,
 thuth@redhat.com, rostedt@goodmis.org, xiongwei.song@windriver.com,
 ardb@kernel.org, inux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241209072020.4743-1-shijie@os.amperecomputing.com>
 <20241209072020.4743-3-shijie@os.amperecomputing.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20241209072020.4743-3-shijie@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_232711_534822_9869E489 
X-CRM114-Status: GOOD (  17.91  )
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

A small nit:

arm64/Kconfig: Remove CONFIG_RODATA_FULL_DEFAULT_ENABLED

On 12/9/24 12:50, Huang Shijie wrote:
> After patch "arm64: refacotr the rodata=xxx",
> the "rodata=on" becomes the default.
> 
>      ......................................
> 	if (!strcmp(arg, "on")) {
> 		rodata_enabled = rodata_full = true;
> 		return true;
> 	}
>      ......................................
> 
> The rodata_full is always "true" via "rodata=on" and does not
> depend on the config RODATA_FULL_DEFAULT_ENABLED anymore,
> so it can be dropped.
> 
> Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
> ---
>  arch/arm64/Kconfig       | 14 --------------
>  arch/arm64/mm/pageattr.c |  2 +-
>  2 files changed, 1 insertion(+), 15 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index cbfd357f94a6..1c69982302ed 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1666,20 +1666,6 @@ config MITIGATE_SPECTRE_BRANCH_HISTORY
>  	  When taking an exception from user-space, a sequence of branches
>  	  or a firmware call overwrites the branch history.
>  
> -config RODATA_FULL_DEFAULT_ENABLED
> -	bool "Apply r/o permissions of VM areas also to their linear aliases"
> -	default y
> -	help
> -	  Apply read-only attributes of VM areas to the linear alias of
> -	  the backing pages as well. This prevents code or read-only data
> -	  from being modified (inadvertently or intentionally) via another
> -	  mapping of the same memory page. This additional enhancement can
> -	  be turned off at runtime by passing rodata=[off|on] (and turned on
> -	  with rodata=full if this option is set to 'n')
> -
> -	  This requires the linear region to be mapped down to pages,
> -	  which may adversely affect performance in some cases.
> -
>  config ARM64_SW_TTBR0_PAN
>  	bool "Emulate Privileged Access Never using TTBR0_EL1 switching"
>  	depends on !KCSAN
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 39fd1f7ff02a..6eef08d8451e 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -20,7 +20,7 @@ struct page_change_data {
>  	pgprot_t clear_mask;
>  };
>  
> -bool rodata_full __ro_after_init = IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED);
> +bool rodata_full __ro_after_init = true;
>  
>  bool can_set_direct_map(void)
>  {

Otherwise LGTM

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

