Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E55E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 14:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJM/516BFDF+RqkAGrlNBZgJxFMwjRaPYxoC2xc2XAc=; b=Fio+kUwVzaaaku7h9ycFDZnXfU
	WDMm/D4iJXZfAG/2ZqcqiwJFyjtzvZ4g6oL9N6piBteNvPgq2N1gLtIn3E/UvaCAYuDwvigFjQTZI
	TZ7d/jHsbtVcVTLGgKUVYhxWXYO/GA9ZFOP0U/VBeCwzSMLfNUjsIr6Nu91Idk0TWL8AqbEiPuCqM
	w086AD8KFpirEtVO0sgbp5xETPzTHdYJW0hiqbx4aWKM1dvDjqT5eBBUrrXojKnKGX5e4EInbe9Gi
	4x/tQUdrD0PO1mjYPe9WGhORm3RLSj7arb0sVllImvc5pBTliuoDPC08qnS7JGs5LU4hCnBEAikEL
	Cjb89TQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJD1o-0000000GOPI-44Uh;
	Thu, 05 Dec 2024 14:40:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJD0n-0000000GOEe-0GjR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 14:39:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFAA61063;
	Thu,  5 Dec 2024 06:39:50 -0800 (PST)
Received: from [10.1.31.38] (e122027.cambridge.arm.com [10.1.31.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9788C3F5A1;
	Thu,  5 Dec 2024 06:39:21 -0800 (PST)
Message-ID: <7dc06874-faba-45c8-b200-929d508bf39e@arm.com>
Date: Thu, 5 Dec 2024 14:39:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coco: virt: arm64: Do not enable cca guest driver by
 default
To: Suzuki K Poulose <suzuki.poulose@arm.com>, catalin.marinas@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Dan Williams <dan.j.williams@intel.com>,
 Sami Mujawar <sami.mujawar@arm.com>
References: <20241205143634.306114-1-suzuki.poulose@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20241205143634.306114-1-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_063925_149822_282AFA18 
X-CRM114-Status: GOOD (  12.77  )
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

On 05/12/2024 14:36, Suzuki K Poulose wrote:
> As per the guidelines, new drivers may not be set to default on.
> An expert user can always select it.
> 
> Reported-by: Dan Williams <dan.j.williams@intel.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Sami Mujawar <sami.mujawar@arm.com>
> Link: https://lkml.kernel.org/r/6750c695194cd_2508129427@dwillia2-xfh.jf.intel.com.notmuch
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Sorry about that oversight on my part.

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/virt/coco/arm-cca-guest/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/virt/coco/arm-cca-guest/Kconfig b/drivers/virt/coco/arm-cca-guest/Kconfig
> index 9dd27c3ee215..3f0f013f03f1 100644
> --- a/drivers/virt/coco/arm-cca-guest/Kconfig
> +++ b/drivers/virt/coco/arm-cca-guest/Kconfig
> @@ -1,7 +1,6 @@
>  config ARM_CCA_GUEST
>  	tristate "Arm CCA Guest driver"
>  	depends on ARM64
> -	default m
>  	select TSM_REPORTS
>  	help
>  	  The driver provides userspace interface to request and


