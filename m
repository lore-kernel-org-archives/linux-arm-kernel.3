Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF604C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 11:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=darxaJL7ak/EhqWLlkqndWp32tDVnLDX3/DIggFASOI=; b=pnyP0cfYTf9RNKiijc6YOMtWE/
	MFt57yNpsZqBzdCxO1e2eXw3IF8EBEBNXWrVW73E9w0vlg55AqQN0S9YzG7+f1eauFtOb4Zd1SZ3Z
	P5LoRaMYku2tLXDkKUl7xakLyDgyAgCqKgUicqjwBixlxzznjwKCMc4Xi1leL5rs06DIMOJN6WOQ2
	rBnQY47Ykj9NZjgtjMxqMgZ1pC5sep9ZA52IAfDva9IsKKKSxVnM4hmV9YjaTvxuc2kvk+TQQXzp3
	zD5bu04RPf8CuEZKBuPH3ScrqLm848AYmULflNAcD1iq9YY0AAkjDHefAfPqXev59QJjSlDKIWdZj
	4wiKzEfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASFW-0000000FIgM-24bt;
	Thu, 01 May 2025 11:38:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASAj-0000000FI0V-2jq6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 11:33:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 63054A4B4CF;
	Thu,  1 May 2025 11:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ABDFC4CEE3;
	Thu,  1 May 2025 11:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746099223;
	bh=ocyLbW+jKOfPNRNrEmoJxAVuQTdlz26nGIKuLypEFBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rmecMg1p1zWQc/4/QshHtUFzLgfOStyJN+kzcEEiTV1/Cgy+WXUvpHl77EGdl02HY
	 vlf8V79IZj4iTXyXzEbaFXMVdUaJZy2NVCPHI00yMyp8UT1GrllY8lQDmdzFpsNw6N
	 OVrt+2HNFFV5MGAXi3eyrhJt2YyaaA++CdvXmzfOcMVXmPP/jA0AV50iG+qvviRr2u
	 tzknTF5S1eCB40I6/k4E0xG8E7erk6DTBvj/K+JaWsz4/hgiisktgfr1uoxDHmqTDu
	 tCHrQzeDb+U/HpYAuUNVaz77Q5hxaxTWFpo/wUxJbih6KIyBYXIs1U+p0kQY4CpwWE
	 /MIwRSLbbrQCQ==
Date: Thu, 1 May 2025 12:33:39 +0100
From: Lee Jones <lee@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, James Morse <james.morse@arm.com>,
	Doug Anderson <dianders@chromium.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] arm64: errata: Add missing sentinels to Spectre-BHB MIDR
 arrays
Message-ID: <20250501113339.GH1567507@google.com>
References: <20250501104747.28431-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250501104747.28431-1-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_043345_830753_B7B7D037 
X-CRM114-Status: GOOD (  19.02  )
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

On Thu, 01 May 2025, Will Deacon wrote:

> Commit a5951389e58d ("arm64: errata: Add newer ARM cores to the
> spectre_bhb_loop_affected() lists") added some additional CPUs to the
> Spectre-BHB workaround, including some new arrays for designs that
> require new 'k' values for the workaround to be effective.
> 
> Unfortunately, the new arrays omitted the sentinel entry and so
> is_midr_in_range_list() will walk off the end when it doesn't find a
> match. With UBSAN enabled, this leads to a crash during boot when
> is_midr_in_range_list() is inlined (which was more common prior to
> c8c2647e69be ("arm64: Make  _midr_in_range_list() an exported
> function")):
> 
>  |  Internal error: aarch64 BRK: 00000000f2000001 [#1] PREEMPT SMP
>  |  pstate: 804000c5 (Nzcv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>  |  pc : spectre_bhb_loop_affected+0x28/0x30
>  |  lr : is_spectre_bhb_affected+0x170/0x190
>  | [...]
>  |  Call trace:
>  |   spectre_bhb_loop_affected+0x28/0x30
>  |   update_cpu_capabilities+0xc0/0x184
>  |   init_cpu_features+0x188/0x1a4
>  |   cpuinfo_store_boot_cpu+0x4c/0x60
>  |   smp_prepare_boot_cpu+0x38/0x54
>  |   start_kernel+0x8c/0x478
>  |   __primary_switched+0xc8/0xd4
>  |  Code: 6b09011f 54000061 52801080 d65f03c0 (d4200020)
>  |  ---[ end trace 0000000000000000 ]---
>  |  Kernel panic - not syncing: aarch64 BRK: Fatal exception
> 
> Add the missing sentinel entries.
> 
> Cc: Lee Jones <lee@kernel.org>
> Cc: James Morse <james.morse@arm.com>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Fixes: a5951389e58d ("arm64: errata: Add newer ARM cores to the spectre_bhb_loop_affected() lists")
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/proton-pack.c | 2 ++
>  1 file changed, 2 insertions(+)

Nice catch!

Reviewed-by: Lee Jones <lee@kernel.org>

> diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
> index b198dde79e59..b607f6dfc5e6 100644
> --- a/arch/arm64/kernel/proton-pack.c
> +++ b/arch/arm64/kernel/proton-pack.c
> @@ -879,10 +879,12 @@ static u8 spectre_bhb_loop_affected(void)
>  	static const struct midr_range spectre_bhb_k132_list[] = {
>  		MIDR_ALL_VERSIONS(MIDR_CORTEX_X3),
>  		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V2),
> +		{},
>  	};
>  	static const struct midr_range spectre_bhb_k38_list[] = {
>  		MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
>  		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720),
> +		{},
>  	};
>  	static const struct midr_range spectre_bhb_k32_list[] = {
>  		MIDR_ALL_VERSIONS(MIDR_CORTEX_A78),
> -- 
> 2.49.0.906.g1f30a19c02-goog
> 

-- 
Lee Jones [李琼斯]

