Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F2CC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 11:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3BOXF7Pg1BN8KhVlvEOHOs8IMKH5Qn7TfyoXlWWPpcw=; b=pYVI/gUrVo7ae/O0edtFgqAb3q
	vJAAQwCWnk6uu9uxucdC4evXDn8W5tdMiH+CjEB0624jj8rxz9YUXGB9uFM1nCJYnvSGXmS+WIyCV
	WpbVwYwAbKGKNiAoJQAO8EXQ0XZsW5qgDnhT5fQBezjXqFrGa9xhX38+1fdKRpxRLhkMaQVDUlmkc
	88BDwsZunFVxaruZZNc9Gzv4YUeW3dsyD+v9EAdqn/C6GZMCtv494a4TPFYi2JeCNVSaf106iUJHv
	cucVH8ZKCr1ybgB+giLtW4ERcN3QflPrAR5hqpuLUdYWlkAjKN8ar4+fxHNigX8i70qmTIpR/qQ2N
	KFWqKK6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2wC-0000000DxW8-1GNG;
	Fri, 14 Mar 2025 11:10:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2k1-0000000DvQY-38TM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 10:58:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36A61113E;
	Fri, 14 Mar 2025 03:58:21 -0700 (PDT)
Received: from [10.57.85.159] (unknown [10.57.85.159])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E15813F673;
	Fri, 14 Mar 2025 03:58:09 -0700 (PDT)
Message-ID: <36c70203-5203-44a1-bc08-479334b730c7@arm.com>
Date: Fri, 14 Mar 2025 10:58:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 PATCH 2/6] arm64: cpufeature: add AmpereOne to BBML2 allow
 list
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250304222018.615808-1-yang@os.amperecomputing.com>
 <20250304222018.615808-3-yang@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250304222018.615808-3-yang@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_035813_832534_6A8C0919 
X-CRM114-Status: GOOD (  12.09  )
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

On 04/03/2025 22:19, Yang Shi wrote:
> AmpereOne supports BBML2 without conflict abort, add to the allow list.
> 
> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> ---
>  arch/arm64/kernel/cpufeature.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 7934c6dd493e..bf3df8407ca3 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2192,6 +2192,8 @@ static bool cpu_has_bbml2_noabort(unsigned int cpu_midr)
>  	static const struct midr_range supports_bbml2_noabort_list[] = {
>  		MIDR_REV_RANGE(MIDR_CORTEX_X4, 0, 3, 0xf),
>  		MIDR_REV_RANGE(MIDR_NEOVERSE_V3, 0, 2, 0xf),
> +		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
> +		MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
>  		{}
>  	};
>  

Miko's series will move back to additionally checking MMFR2.BBM, so you will
need to add an erratum workaround for these CPUs to set MMFR2.BBM=2 in the
per-cpu "sanitised" feature register. See:

https://lore.kernel.org/linux-arm-kernel/86ecyzorb7.wl-maz@kernel.org/

Thanks,
Ryan


