Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1883E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 04:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUxpj+QiidXRdwd8aw8YCFerLQNEwqQsKhXKavlQ1Jg=; b=H4x2JuruiD6qSTdP3E04+1b2mY
	hPL/TSvoZvIDIm/gadSyi5+Yps5wMfwtLrKQ4ZgL7K+8o50lKe4RNXsGVFzmyEDopBjLUi9e9Oqc/
	7pQdT0RgeKfhEhskjUviCdDHLvDKRbUw/2y5Z0+syGXuIF2kDfa7wr76ywc2PqiTZkeFJlTEb0Eus
	cBR2Ct7neKbsnkEA+4nRzSGmykPva/9oSSeFBflNfBTCb3+a/1OfaghfTveJVCE+6pVYOlIflOg2P
	DSzEER77ni1+Faplh90ML8NqOlNmF12AvClAjpOw2nkevlQ4+bWHabkjAUqpihQGYPBNFc3KzmPbo
	NiXxgqMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJQA8-00000000YAR-06Ro;
	Fri, 06 Dec 2024 04:41:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJQ96-00000000Xu1-1GHh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 04:40:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03BDC169E;
	Thu,  5 Dec 2024 20:41:19 -0800 (PST)
Received: from [10.163.50.12] (unknown [10.163.50.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99B7B3F58B;
	Thu,  5 Dec 2024 20:40:45 -0800 (PST)
Message-ID: <c1f2ba9e-6f2d-4c7e-9956-6d3b183d3e05@arm.com>
Date: Fri, 6 Dec 2024 10:10:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: remove CONFIG_RODATA_FULL_DEFAULT_ENABLED
To: Huang Shijie <shijie@os.amperecomputing.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: patches@amperecomputing.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, ardb@kernel.org, steven.price@arm.com,
 suzuki.poulose@arm.com, mark.rutland@arm.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 cl@os.amperecomputing.com
References: <20241126085647.4993-1-shijie@os.amperecomputing.com>
 <20241126085647.4993-3-shijie@os.amperecomputing.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20241126085647.4993-3-shijie@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_204052_410289_C6B37EB3 
X-CRM114-Status: GOOD (  17.78  )
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

On 11/26/24 14:26, Huang Shijie wrote:
> The default kernel is rodata=on which means

Right but this is true only after the update in the series.

        if (!strcmp(arg, "on")) {
                rodata_enabled = rodata_full = true;
                return true;
        }

rodata_full is always "true" via 'rodata=on' and does not depend
on the config RODATA_FULL_DEFAULT_ENABLED anymore, so it can be
dropped. Please update this commit message with these context as
well.

> CONFIG_RODATA_FULL_DEFAULT_ENABLED is always enabled by default.
> So we can remove CONFIG_RODATA_FULL_DEFAULT_ENABLED now.
> 
> Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
> ---
>  arch/arm64/Kconfig       | 14 --------------
>  arch/arm64/mm/pageattr.c |  2 +-
>  2 files changed, 1 insertion(+), 15 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 4316b1fe8bf8..a9ca305a31d8 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1653,20 +1653,6 @@ config MITIGATE_SPECTRE_BRANCH_HISTORY
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

This patch can still follow the first one but after folding in the
third patch.

