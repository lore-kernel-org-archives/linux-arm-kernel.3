Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC11CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEWDi0GnM504mJolEuuHguaPOvbVGXjXGmdXpFb+87E=; b=dWKRnoBgi3CBTp67klSKfxOB5K
	YWqaTqU0p+QDxiX+yUJvMR0EhRCGP1ahcUoHPg0hZoEHtYZL44+VZ6t0knrGic1guIf04obuB/uEq
	R8ADNyP1g8Y8zo4qRLoDzFcj23QpMEOjtqrOpGgKRQnUrmGf1yGQvLvsgNDUk5aYrGhUfgg6426kB
	mb4hCXyTuZ6eNCAC4Ps4nDZYN4T9bX+mT+gBG4BMooBPRxth4shLoPpGLtCfOF+31wuvS3ZcHgWB2
	GmAz+TYUgG2cCf2MZUkKzSLs4+X1pQEGJCRnb0JQfvbWL3SnlCJKQpTMGbzFuvSBRF1e0wZBhCtnk
	8GqzygsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfBI-0000000Buwv-2B2M;
	Fri, 02 Oct 2026 15:28:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfBF-0000000Buvi-0qkD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:28:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2DF0143D;
	Fri,  2 Oct 2026 08:28:08 -0700 (PDT)
Received: from [10.2.212.14] (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F39E63F882;
	Fri,  2 Oct 2026 08:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790954892; bh=SBJel+ooDz1gRUkPel1Y7M40DlcCPPj25e5QajwwZXc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CK99x9/uXkjfykjfyQ0CVPfBcqtZ9StLdvj7pbREw+MQSQflkVc7QJKS4Dh7BvWQr
	 uexp/V0BBMrbfEBoW6njlQxh2GKs1wEm/xZjgjUpl27IJ5A2hGS04KXfUSOKvkB0hB
	 eWv/KHlw/1b1QwPre4m2xaV6lqUFBQMyn5tMdsZg=
Message-ID: <0e78cff6-edd1-4db8-bdb0-7ee6123b146f@arm.com>
Date: Fri, 2 Oct 2026 16:28:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add mpam.rst to the MPAM DRIVER entry
To: Fuad Tabba <fuad.tabba@linux.dev>, Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Fenghua Yu <fenghuay@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Fuad Tabba <tabba@google.com>
References: <20260903182300.2706684-1-fuad.tabba@linux.dev>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260903182300.2706684-1-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_082813_298288_0B3A5FDB 
X-CRM114-Status: GOOD (  12.64  )
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

Fair enough ...

I've picked this up to send on to Catalin...


> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
> 
> Notes:
>     Found this while putting together the recipient list for [1]:
>     get_maintainer.pl names neither MPAM maintainer on a patch to mpam.rst.

>     arch/arm64/kernel/mpam.c, arch/arm64/include/asm/mpam.h and
>     drivers/acpi/arm64/mpam.c aren't in this entry either, but that
>     didn't look as clear cut, so I've left them out. Happy to respin
>     with them added.

I'd leave that - the split is so that stuff in the arm-arm is part of the arch
code, and things that aren't a buried out in drivers.


Thanks,

James


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


