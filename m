Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD62EC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 19:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9mXoB0hmEQUOqAzambBPKWUXGRpwqp2/RutLHj6JLI=; b=xTG5eBYOUZzh+uMdwAF6lrhh3E
	BxhKCsAa0Lg//CyI9EGc+dME4agb86MxPvn4yS0mA7yi4282yhBV9lTaRANG/y/+GuJLmPyE7oPBa
	7e/oacVvZUjss/oZIpwO09fMvIvzr1b8mX2mev5uN4QiSFQkqylLxjGiWC6zzbhlxdbqDLI+Fzbzi
	eRkQMbuuwHRKIJwES86kQSvhNd9ZiXm3KObuzKZ40PGu/Km+ShThAHiZj4gVL5L/dZ5xK55deKsya
	lFiRMeysXNOZig5ByZsZenlqLM1J6y048dm+7CsdWItbfizPDmwJgolc0szHogTmagKB4PpLCvezt
	jm3nf7jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9jx-00000006ge0-2KXm;
	Tue, 24 Jun 2025 19:55:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU7IL-00000006NG3-0fwU
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Jun 2025 17:18:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=D9mXoB0hmEQUOqAzambBPKWUXGRpwqp2/RutLHj6JLI=; b=NujHNQ2OnYYeEaXEsUYNleH6ug
	QTVUIU1QQHbjR71G3gbICoiPb9Rzrd/sdqHMh+NtgWgQ21eS61qVv4c5go8ZecVF3CKX9jn0ehCV0
	erloRGflpgCwKvNcyt3igKFTr1kuFLqpdnamEasF3NPX2Mf4zGGv+XoEgL6cPWgGcJOfCWCEKQTB0
	8LKXC8CCE5irZO72zvdt+blMrOn3JBSnSsR1ccH19LZrlbSL0R1FJC8SkUo4yO0c9gZJqBqZ6TEFv
	QVoqrlN5W8hzRMo0/iwPyWuKQr/w6By0GQG/O4MVmGxxJyeN4Vq+bnhixFFgeokIraly5cNY/DMEr
	s9jna1yg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU7IE-00000007CNt-32oy;
	Tue, 24 Jun 2025 17:18:46 +0000
Message-ID: <037f1ba1-ead1-4627-b464-39f1a8010d3f@infradead.org>
Date: Tue, 24 Jun 2025 10:18:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] cache: Support cache maintenance for HiSilicon SoC
 Hydra Home Agent
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, james.morse@arm.com,
 linux-cxl@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org,
 gregkh@linuxfoundation.org, Will Deacon <will@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Davidlohr Bueso <dave@stgolabs.net>
Cc: Yicong Yang <yangyicong@huawei.com>, linuxarm@huawei.com,
 Yushan Wang <wangyushan12@huawei.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, H Peter Anvin
 <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
References: <20250624154805.66985-1-Jonathan.Cameron@huawei.com>
 <20250624154805.66985-7-Jonathan.Cameron@huawei.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250624154805.66985-7-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi--

On 6/24/25 8:48 AM, Jonathan Cameron wrote:
> diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
> index bedc51bea1d1..0ed87f25bd69 100644
> --- a/drivers/cache/Kconfig
> +++ b/drivers/cache/Kconfig
> @@ -10,6 +10,20 @@ config CACHE_COHERENCY_SUBSYSTEM
>  	  kernel subsystems to issue invalidations and similar coherency
>  	  operations.
>  
> +if CACHE_COHERENCY_SUBSYSTEM
> +
> +config HISI_SOC_HHA
> +	tristate "HiSilicon Hydra Home Agent (HHA) device driver"
> +	depends on (ARM64 && ACPI) || COMPILE_TEST
> +	help
> +	  The Hydra Home Agent (HHA) is responsible of cache coherency

	                                            for cache coherency

> +	  on SoC. This drivers provides cache maintenance functions of HHA.

	  on the SoC.

> +
> +	  This driver can be built as a module. If so, the module will be
> +	  called hisi_soc_hha.
> +
> +endif

-- 
~Randy


