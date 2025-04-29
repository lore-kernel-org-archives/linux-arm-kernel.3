Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670E1C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 04:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GrC/icl4+sT0MIOyq2FXbuWY0YoGFmgz4xin2ewVuCM=; b=rqVLa1pgHHY7dl/yCXe8o8FmEZ
	d+1E9n3JEEqrqJmNwR4gRPzUhUOjbKZusNzF00L83T6kFHXy0VSv09ztpDYvS5Cz7vl3wUiOgKrjo
	pS7hxgdtuOwJJmhK4omMrNhp/Lq+sjNnpNlesXF1hGyozNFowyOm7Mx2E0ySxndDZDhwvKUQnkZqx
	z/4JPLv0HDTBdM/gMf7KnfIo6ywP8tSxzHzRQyeKMW/Bm6k+CFLfWv2tWaGVLKPm//8bJmMyAGU2L
	FfDauEplzDIaoyxhKJzfY0NOfrFFeCl46Wv7pMKTGKy1BjhKlvV5QlzW92tGx0mVfOp3rW/ew6WwT
	OFzehMrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9cbi-00000008J2r-3kmp;
	Tue, 29 Apr 2025 04:30:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9cMy-00000008HXl-0rGc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 04:14:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A55C1515;
	Mon, 28 Apr 2025 21:14:46 -0700 (PDT)
Received: from [10.163.52.122] (unknown [10.163.52.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C797B3F66E;
	Mon, 28 Apr 2025 21:14:49 -0700 (PDT)
Message-ID: <afc531fe-c4d0-4676-92ef-c5cfc63a3967@arm.com>
Date: Tue, 29 Apr 2025 09:44:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] documentation: Add nodebugmon for arm64 platforms
To: linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250416062706.2735563-1-anshuman.khandual@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250416062706.2735563-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_211456_292505_46783B78 
X-CRM114-Status: GOOD (  15.62  )
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



On 4/16/25 11:57, Anshuman Khandual wrote:
> Add an entry for nodebugmon which has been used on arm64 platforms.
> 
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v6.15-rc2
> 
>  Documentation/admin-guide/kernel-parameters.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index d9fd26b95b34..f4a313d6c0ab 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4085,6 +4085,13 @@
>  			/sys/module/printk/parameters/console_suspend) to
>  			turn on/off it dynamically.
>  
> +	nodebugmon
> +			[HW,ARM64] Disable debug monitor
> +			Disables the debug monitor exception handling on the platform
> +			regardless whether breakpoints and watchpoints are programmed
> +			or not. This prevents debug exceptions from being enabled via
> +			MDSCR_EL1 register.
> +
>  	no_debug_objects
>  			[KNL,EARLY] Disable object debugging
>  

Any updates on this ?

