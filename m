Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D344DC71150
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 19:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYQKVIsJMhuZ99Ye+NhcTo0fD3PFwm2XWlaykYXMczw=; b=KkbE1wDj3C/cqy9RdKk13+uHJi
	X+AUaCxoO/iPNkHr6Uyoz0gRJPJeaMD88tJ746G/yblbdfLWCRhxy1OGcakqT6qzo4Ox74DsksOlQ
	UYvs50ej3JrKBH5jTFhMjHLnJPCM+8+LrhhwJ3RcyMKO42ainTggyo3P5JgCky+LcjWiAFiqYTdGI
	FOb8dtEFzqRM51ApHfgXWjJt0qm5bpuxjCmfUtVLhtYqxExc07kgmrbOGmoGAyVmhwbYypAxOZ65q
	XlyuH5zHJwGkHYbzkUXbyyf2c5n4ggO/ppVgyUJfUA33eHE09UNpuRC82lZ/dB49TP4S6GtsBiIRA
	6BkTlM9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ9h9-0000000HNZc-3fdr;
	Fri, 13 Jun 2025 19:04:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ7h9-0000000H7bg-34RT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 16:56:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B7C21C0A;
	Fri, 13 Jun 2025 09:55:38 -0700 (PDT)
Received: from [10.57.28.131] (unknown [10.57.28.131])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1F523F66E;
	Fri, 13 Jun 2025 09:55:53 -0700 (PDT)
Message-ID: <7ffe2c8a-1433-4adf-9786-ee0a9d2f3867@arm.com>
Date: Fri, 13 Jun 2025 17:55:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] iommu/apple-dart: Drop default ARCH_APPLE in
 Kconfig
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, =?UTF-8?Q?Martin_Povi=C5=A1er?=
 <povik+lin@cutebit.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev,
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
 <20250612-apple-kconfig-defconfig-v1-7-0e6f9cb512c1@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-7-0e6f9cb512c1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_095559_816764_C1D096A6 
X-CRM114-Status: GOOD (  15.23  )
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

On 2025-06-12 10:11 pm, Sven Peter wrote:
> When the first driver for Apple Silicon was upstreamed we accidentally
> included `default ARCH_APPLE` in its Kconfig which then spread to almost
> every subsequent driver. As soon as ARCH_APPLE is set to y this will
> pull in many drivers as built-ins which is not what we want.
> Thus, drop `default ARCH_APPLE` from Kconfig.

Acked-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>   drivers/iommu/Kconfig | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 0a33d995d15dd759eb47705c00b411f1157b408a..91d0c871acc418ac5fede4f177ce3af97aef5560 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -305,7 +305,6 @@ config APPLE_DART
>   	depends on !GENERIC_ATOMIC64	# for IOMMU_IO_PGTABLE_DART
>   	select IOMMU_API
>   	select IOMMU_IO_PGTABLE_DART
> -	default ARCH_APPLE
>   	help
>   	  Support for Apple DART (Device Address Resolution Table) IOMMUs
>   	  found in Apple ARM SoCs like the M1.
> 


