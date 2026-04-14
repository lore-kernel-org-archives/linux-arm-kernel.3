Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0206DF531F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 06:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fumOGiEuGSiD8FTeMSTa8ywJjh2IIFWkB/1bTH68iW0=; b=ANilFC42tho6lrkNXxHOCXGuv5
	gwnPnsXfEsCgJ+abpo47IuNQRBEkvuw604n/0+8aQToNtEzJYud8+8SBMzZ61yWAhUsT8hIzYHIGP
	0rrH/MkvYU1F2Xu/rwBCvtwRjUj57cUysZwTqsDIxFadxj6CstdH/KlfSV3I04jXKx1+QKMdrQi2h
	WYhhGJjxbKOS5eQ6cx0MfxWjjmRPee1xcIl5n4AkgGIcX/8vAEYuiiSHvGbBM0Sj3d78xisF/RVv3
	PtmvtNg1TxMxPdKo4mHMuXKbl23xls2BYfGjt1lmHCFWVwsEhnxoQP/Wo0uGOHYwj9957eEjYrHgh
	C50oZlIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCXgq-0000000Gs2f-3cg1;
	Tue, 14 Apr 2026 06:56:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCXgo-0000000Gs2K-25nv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 06:56:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 795334EEA;
	Mon, 13 Apr 2026 23:55:53 -0700 (PDT)
Received: from [10.164.18.83] (J09HK2D2RT.blr.arm.com [10.164.18.83])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 640EC3F86F;
	Mon, 13 Apr 2026 23:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776149759; bh=pX9QwlBOEFv9MYyDm9CACWnc9zJVNgyWvTTpWF+Y0Hc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c6Apt0VjwyC3SzUgpqIeFCY9j2JVWCTGSH2D3uxt/zifVJ1om+Xbj+wjRIqWB8oLX
	 7osRzV3pY4BSIB7FiTTJQcAkil7ty9UDnHGZECgF/lhxOnf5uimBRprE8rooOhzNz1
	 6saLolWOrJUkqXb0hLsSbhp4b/jBl/Bx/aMBmZAc=
Message-ID: <d22daf6d-92cf-444a-9f51-0fa63b21a5c5@arm.com>
Date: Tue, 14 Apr 2026 12:25:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/hwcap: Include kernel-hwcap.h in list of generated
 files
To: Mark Brown <broonie@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Marek Vasut <marex@nabladev.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260413-arm64-hwcap-gen-fix-v1-1-26c56aed6908@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260413-arm64-hwcap-gen-fix-v1-1-26c56aed6908@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_235602_742287_6E3E8715 
X-CRM114-Status: GOOD (  15.85  )
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



On 13/04/26 9:14 PM, Mark Brown wrote:
> When adding generation for the kernel internal constants for hwcaps the
> generated file was not explicitly flagged as such in the build system,
> causing it to be regenerated on each build. This wasn't obvious when the
> series the change was included in was developed since it was all about
> changes that trigger rebuilds anyway.
> 
> Fixes: abed23c3c44f5 (arm64/hwcap: Generate the KERNEL_HWCAP_ definitions for the hwcaps)
> Reported-by: Marek Vasut <marex@nabladev.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  arch/arm64/include/asm/Kbuild | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/include/asm/Kbuild b/arch/arm64/include/asm/Kbuild
> index d2ff8f6c3231..31441790b808 100644
> --- a/arch/arm64/include/asm/Kbuild
> +++ b/arch/arm64/include/asm/Kbuild
> @@ -17,4 +17,5 @@ generic-y += parport.h
>  generic-y += user.h
>  
>  generated-y += cpucap-defs.h
> +generated-y += kernel-hwcap.h
>  generated-y += sysreg-defs.h
> 
> ---
> base-commit: abed23c3c44f565dc812563ac015be70dd61e97b
> change-id: 20260413-arm64-hwcap-gen-fix-ecb4bb6dbb91
> 
> Best regards,
> --  
> Mark Brown <broonie@kernel.org>
> 
> 


