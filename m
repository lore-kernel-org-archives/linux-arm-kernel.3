Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B40C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 15:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icueMdNnM1gZRk62oei0XQENcEv7y6jrDtc+G1tDS1M=; b=dhDZbuxihn3BrI2RTupQ46VyE5
	933qyVyosOcLVpgo69MIun3WpCrKEbuPicjySPA+3U4Z0noMAmTTr90XU92ca995YwJ0ojkh5T0G8
	ofDHseS3rq2w/4jJM69JmzKWxSyzHVdYkNIDZpjOuidqJmJXXQ15OleApl7ZghexpVKthmFdZnNQ/
	fwI8i1q4Cwb7wisuItwVZvr/YlIAmooP+8ezaAE/HfP858FPlOmhcKjLvkHIrpuUDobxJYOXRg1z0
	YPvZ1EwlhXzq57kmlzRZ3VevMgBRt09N/A4ajW6z6MDMDiFi6wPC+skAUoaSAyZlhI4rLEQumXL0O
	7p85+YzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3b0n-000000077eh-2QKb;
	Mon, 07 Sep 2026 15:11:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3b0l-000000077eI-0bGB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 15:11:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B54B61476;
	Mon,  7 Sep 2026 08:11:49 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CF313F7B4;
	Mon,  7 Sep 2026 08:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788793913; bh=nSSUhkg2+GYxqN+mkRCYxS29gRUsOc4/8D4olAlF0CE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GbtOsBioJyZxF0GfsnSnGzJxwvF5IxvF1mYvzCCF2x0SPzAfq/TQzqgfKjFH6y/L8
	 HOLnEKYPQhxQDwdg0JQ5NAFB8UuJ4qhfzwbilXq4RpnnRilS1B5vzWdr7U43zzubzM
	 cG+HWxDVec5RkOP/CapDZFTYRmi4ZggkwHKTtkJ0=
Message-ID: <e6b84240-0e62-4899-ac6b-5935c86c15f7@arm.com>
Date: Mon, 7 Sep 2026 16:11:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add mpam.rst to the MPAM DRIVER entry
To: Fuad Tabba <fuad.tabba@linux.dev>, James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Fenghua Yu <fenghuay@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Fuad Tabba <tabba@google.com>
References: <20260903182300.2706684-1-fuad.tabba@linux.dev>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260903182300.2706684-1-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_081155_225909_086CB8A6 
X-CRM114-Status: GOOD (  15.16  )
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

Hi Fuad,

On 03/09/2026 19:23, Fuad Tabba wrote:
> Documentation/arch/arm64/mpam.rst is not listed under MPAM DRIVER, so
> get_maintainer.pl names neither MPAM maintainer on a patch to it.

I'm ok with this if others think it makes sense.

> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
> 
> Notes:
>     Found this while putting together the recipient list for [1]:
>     get_maintainer.pl names neither MPAM maintainer on a patch to mpam.rst.
>     
>     arch/arm64/kernel/mpam.c, arch/arm64/include/asm/mpam.h and
>     drivers/acpi/arm64/mpam.c aren't in this entry either, but that
>     didn't look as clear cut, so I've left them out. Happy to respin
>     with them added.

I think these can stay as is.

Thanks,

Ben
>     
>     [1] https://lore.kernel.org/all/20260903084809.2027326-1-fuad.tabba@linux.dev/
> 
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fc320b373656f..20a6e70df83c8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18438,6 +18438,7 @@ M:	Ben Horgan <ben.horgan@arm.com>
>  R:	Reinette Chatre <reinette.chatre@intel.com>
>  R:	Fenghua Yu <fenghuay@nvidia.com>
>  S:	Maintained
> +F:	Documentation/arch/arm64/mpam.rst
>  F:	drivers/resctrl/mpam_*
>  F:	drivers/resctrl/test_mpam_*
>  F:	include/linux/arm_mpam.h


