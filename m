Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B764DCEBF8D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7aNsSoqL4Oh9FppblaXOE+GKfYhRL9+dtetncwBHI7I=; b=WXt2E3CfA8NPOhuh2EuQut5GOT
	CitVrAnbsLfFfCMth7HLZ+aVEJvbjC/BHMNeNiFTECOx/6ULNjhIx32bOt57+O1S9v+VzqD+rqQXi
	82C4Tj2uyVUfPfGb+BzVE1I98AhWn8UN81GYtlxMjTaYFMzpA3IvnIlp0SbiB+i6/1McO5VmbdPo8
	baKCreHI/4ExQB9ukZSMs6vSWM/ts5dn6NKGAsYWm9ZMm+0taz1MiAkWSLNKT96UUX2gJxXH0gUQd
	ICAirxTNmi9ItZK4VIr+QFHQXbWlZ8scW+oxqQVyH4gMQixr1z5nCFn7i3R56ntjobMQJYUFENGU/
	IoJB/fxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4Jm-0000000GfmJ-21fa;
	Mon, 17 Nov 2025 18:51:14 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4Jk-0000000Gflu-13Cq;
	Mon, 17 Nov 2025 18:51:12 +0000
Message-ID: <3bf1793a-2ffd-4017-b4bf-dc63f3a2a7c8@infradead.org>
Date: Mon, 17 Nov 2025 10:51:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] lib: Support
 ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Conor Dooley <conor@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 linux-cxl@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org,
 Dan Williams <dan.j.williams@intel.com>, "H . Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Drew Fustini <fustini@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: james.morse@arm.com, Will Deacon <will@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, linuxarm@huawei.com,
 Yushan Wang <wangyushan12@huawei.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 Andy Lutomirski <luto@kernel.org>, Dave Jiang <dave.jiang@intel.com>
References: <20251117104800.2041329-1-Jonathan.Cameron@huawei.com>
 <20251117104800.2041329-4-Jonathan.Cameron@huawei.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251117104800.2041329-4-Jonathan.Cameron@huawei.com>
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

Hi,

On 11/17/25 2:47 AM, Jonathan Cameron wrote:
> diff --git a/lib/Kconfig b/lib/Kconfig
> index e629449dd2a3..e11136d188ae 100644
> --- a/lib/Kconfig
> +++ b/lib/Kconfig
> @@ -542,6 +542,10 @@ config MEMREGION
>  config ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
>  	bool
>  
> +config GENERIC_CPU_CACHE_MAINTENANCE
> +	bool
> +	select ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
> +
>  config ARCH_HAS_MEMREMAP_COMPAT_ALIGN
>  	bool

Architectures and/or platforms select ARCH_HAS_*.

With this change above, it becomes the only entry in
lib/Kconfig that does "select ARCH_HAS_anytning".

so I think this is wrong, back*wards.

-- 
~Randy


