Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47E7C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 10:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2SJkg06ckcdDzIziVPgyah9kgdAaOhw56y6spOAOFY=; b=JeK5ao9akwHdxqowvHfJHPByBk
	AhUPLMMh48ZLRBz20/ViZ/uWx7/GHYgQNbJK2aoIrWzK6plGg5zqT3lqUaTvIywJLkkyjRpITyshj
	qmqXFHwTqFMP5ZnYJLgVlfVzEQp+KMqj+Rk0x38Ww++G5xkL8Fq/80cbdQzzbZbU80sV1bhZYdxPS
	s7XmYaMMnOkIuWQclFI76neo0+MBjGiwwAqAxlxm459zcmFgLRXe61l88qs1enDECJUshT0OE969s
	GyuGhVK20wgJGZRSOuun4yK71BDkdiQFyDe1i/gxylZW6sOCGeEnEZivqKpz2StWuokb834o3gxcp
	of3IxI0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26BF-00000003eqH-0Lxg;
	Tue, 08 Apr 2025 10:27:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24u0-00000003NML-2QVp;
	Tue, 08 Apr 2025 09:05:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56FDA1688;
	Tue,  8 Apr 2025 02:05:50 -0700 (PDT)
Received: from [10.57.41.251] (unknown [10.57.41.251])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 04B913F694;
	Tue,  8 Apr 2025 02:05:47 -0700 (PDT)
Message-ID: <98f6fa74-f14e-48f1-b550-c1ff962df53d@arm.com>
Date: Tue, 8 Apr 2025 10:05:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [Patch v1]Add ETE devarch condition in
 etm4_init_iomem_access
Content-Language: en-GB
To: yiru zhang <yiru.zhang@mediatek.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20250408073651.17140-1-yiru.zhang@mediatek.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250408073651.17140-1-yiru.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_020552_669008_FECB2715 
X-CRM114-Status: GOOD (  17.26  )
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

Hi Yiru



On 08/04/2025 08:36, yiru zhang wrote:
> Due to ETE supported, so add ETE devarch condition in etm4_init_iomem_access.

Is there a reason why you cannot use the "system instructions to access 
the ETE" ?

The patch as such is fine by me (withe some minor styling nits). But, we
do not recommend using the MMIO for ETE, when it can be accessed
directly by sysreg.

FWIW, if you remove the "mmio base" address from the DT/ACPI, it
should automatically use the system instructions for ETE.




> Signed-off-by: yiru zhang <yiru.zhang@mediatek.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 2b8f10463840..971b9f0fe5e4 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1135,8 +1135,9 @@ static bool etm4_init_iomem_access(struct etmv4_drvdata *drvdata,
>   	 * with MMIO. But we cannot touch the OSLK until we are
>   	 * sure this is an ETM. So rely only on the TRCDEVARCH.
>   	 */
> -	if ((devarch & ETM_DEVARCH_ID_MASK) != ETM_DEVARCH_ETMv4x_ARCH) {
> -		pr_warn_once("TRCDEVARCH doesn't match ETMv4 architecture\n");
> +	if ((devarch & ETM_DEVARCH_ID_MASK) != ETM_DEVARCH_ETMv4x_ARCH \
> +	&& (devarch & ETM_DEVARCH_ID_MASK) != ETM_DEVARCH_ETE_ARCH) {

We could use a switch case ?

	switch (devarch & ETM_DEVARCH_ID_MASK) {
	case ETM_DEVARCH_ETMv4x_ARCH:
	case ETM_DEVARCH_ETE_ARCH:
		break;
	default:
		pr_warn_once("Unknown ETM architecture: %x\n",
				devarch & ETM_DEVARCH_ID_MASK);
		return false;
	}

Suzuki

> +		pr_warn_once("TRCDEVARCH doesn't match ETMv4&ETE architecture\n");
>   		return false;
>   	}
>   


