Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A613C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 10:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EeGQ1SvfBAvpWVBjMHuiNgvp8H9HzyN/6qz4mJMwAbs=; b=P31imrkE5xxIL+GETb4K2oYTQV
	/TMlk7kTpd3jgXhG7Y1ahGJBxf0fCCXCgJBCANr8iKETIcSA9dMxfMVNE1UU8/iNrs5N9LRPYFTKw
	9Kii+2MT3wpPgKD+C22IGzmga2fcUO64wCQiPeVbYB3McmoxzMJLJONZ3UwGafPfwJhKk+O/4h25f
	itT15J4IllLqgli3YKQgS3AZqDt3v8q3UGaA3sCjJiHS7mkdNs9RKqCFjT2OjLUnuMDpxpHTT1bbp
	n7pO3YCjz0ePy9q5ldj052thJMXODSEE503f3iCy02yyXxLvcqo7aumDMMFMf2nvQ/Q9ET00h8IXL
	BZGnzBtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfEwp-00000004DNS-1o76;
	Thu, 02 Jul 2026 10:47:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfEwn-00000004DMv-1mP5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 10:47:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E17FD359D;
	Thu,  2 Jul 2026 03:47:03 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AFCC73F905;
	Thu,  2 Jul 2026 03:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782989228; bh=oJKoNavg0JVxJbLt0HN3PVf8W61ExetBHTFOSEEZlXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nxizj05OzNCOPrF2vDD88XV9HOhYmOfF/UqKyxsu6cO7/1Co/EgfZ6Fec/O5w8Lte
	 nf3fvE8IclU+bHqBfQTEhtDhiIXRHw6KK6AKx10lMTGL8DY3+u8uoAeHvile4DsczI
	 tlzunPwRlGlxRe5zWeiQw6QjWAIrdhAEddjZY/rY=
Date: Thu, 2 Jul 2026 11:47:04 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Linu Cherian <linu.cherian@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: cpufeature: Extend bbml3 support list
Message-ID: <akZBqNTTGXch6I9n@J2N7QTR9R3>
References: <20260701094131.677636-1-linu.cherian@arm.com>
 <20260701094131.677636-6-linu.cherian@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701094131.677636-6-linu.cherian@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_034709_509666_08DA55FB 
X-CRM114-Status: GOOD (  12.40  )
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

On Wed, Jul 01, 2026 at 03:11:31PM +0530, Linu Cherian wrote:
> Add below cpus to the midr list, which supports
> BBML3 but don't advertise through MMFR2 ID.
> 
> Cortex A520(AE)
> Cortex A715
> Cortex A720(AE)
> Cortex A725
> Neoverse N3
> C1-Nano
> C1-Pro
> C1-Ultra
> C1-Premium
> 
> Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> ---
>  arch/arm64/kernel/cpufeature.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index d754b1b7da77..9b806c1c60aa 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2142,6 +2142,15 @@ bool cpu_supports_bbml3(void)
>  		MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
>  		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
>  		MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A520AE),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A725),
> +		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N3),
> +		MIDR_ALL_VERSIONS(MIDR_C1_NANO),
> +		MIDR_ALL_VERSIONS(MIDR_C1_PRO),
> +		MIDR_REV_RANGE(MIDR_C1_ULTRA, 1, 1, 0xf),
> +		MIDR_REV_RANGE(MIDR_C1_PREMIUM, 1, 1, 0xf),

Why do these two have a range? The commit message didn't mention this.

Mark.

