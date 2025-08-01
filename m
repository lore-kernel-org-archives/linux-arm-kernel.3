Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605EAC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 14:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PvrPRjBDQzEZkQSn1/B+pSB4XKNUNb4+MyYXGeuYwHI=; b=hCXh1Dydm3khMYj8aMFdJc2BxH
	MyoodokB832rWtCmF7T/N1DRaRJFRblf5P14YlVOetEBpQ2174kKQNsBAYolJTNH5oVJRYz/o9jeY
	XPSbsXrVhNmgP4N35CX4kCW5NgSGrxID6beKtIULr2lW/CO9yFDufyy1D1dnVn2/Rn/F6oe9amE8m
	bblBi8iZRmYBj7ypLPssXxliJcknI3FTtGp2UKvnRFd/0TmfntksXo2DSt7+vxwLEVRh3OCaLX7Li
	/bjd0ASvj+9i/ggoigW9vD4ZSt+r9pZy8n5xNwPZz6qIo4XDcCI71sAl1awprfXu1cX4EXhV9AnaR
	8NPu98nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhqwG-00000006G1Y-1w5Y;
	Fri, 01 Aug 2025 14:40:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhqrq-00000006FLY-09Tx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 14:36:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82CBD1516;
	Fri,  1 Aug 2025 07:36:09 -0700 (PDT)
Received: from [10.57.87.210] (unknown [10.57.87.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C13DA3F673;
	Fri,  1 Aug 2025 07:36:15 -0700 (PDT)
Message-ID: <bb17a56c-00ea-4dcf-906f-e77de212c95f@arm.com>
Date: Fri, 1 Aug 2025 15:36:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: cpufeature: add AmpereOne to BBML2 allow list
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, will@kernel.org,
 catalin.marinas@arm.com, akpm@linux-foundation.org, Miko.Lenczewski@arm.com,
 dev.jain@arm.com, scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250724221216.1998696-1-yang@os.amperecomputing.com>
 <20250724221216.1998696-3-yang@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250724221216.1998696-3-yang@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_073618_117481_1E631D86 
X-CRM114-Status: GOOD (  12.07  )
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

On 24/07/2025 23:11, Yang Shi wrote:
> AmpereOne supports BBML2 without conflict abort, add to the allow list.
> 
> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  arch/arm64/kernel/cpufeature.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 7a3c404288d5..d2a8a509a58e 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2230,6 +2230,8 @@ static bool has_bbml2_noabort(const struct arm64_cpu_capabilities *caps, int sco
>  	static const struct midr_range supports_bbml2_noabort_list[] = {
>  		MIDR_REV_RANGE(MIDR_CORTEX_X4, 0, 3, 0xf),
>  		MIDR_REV_RANGE(MIDR_NEOVERSE_V3, 0, 2, 0xf),
> +		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
> +		MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
>  		{}
>  	};
>  


