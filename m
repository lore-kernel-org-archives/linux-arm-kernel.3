Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E7BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 06:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGMtC8nmbGLzOG9MxmHCiYK40TQT/yqlu9YKCtzbCe8=; b=ISqcmhQw0ightghH1Nz0/Ki8gd
	S37LdfAxkNp/zAIGbYlZ72wcM3vxIMRBc1CIv8FskDinpfuSh0iUXeo0kgTBXbTNRSnGA3GWiTAXs
	Cj5YevyvhQ12t8tVUtg+/OP/XxizV+LcBrLwgxWlFRlyz4qWzCm0iC7PbLdEF+vo/X2gMVoO7lgWu
	TJECfrTIruuwBaT2bKd34ancGUmUc/AHpfBxyNZ89S6hqujjcaVqTjflr2qUlvyNZOdYvz4lgVMTy
	O3OYibQx7QVWKOyomK8meEeTO759lejcrRIs7eLrjGg5/lmkzeXPGBJQk/dwSTKkoJUyAucCS05K2
	XSAEe8XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi50r-00000004IOL-1wFM;
	Fri, 10 Jul 2026 06:47:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi50p-00000004INs-1nyx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 06:47:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09B1A1692;
	Thu,  9 Jul 2026 23:46:58 -0700 (PDT)
Received: from [10.174.42.251] (unknown [10.174.42.251])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98E6C3F66F;
	Thu,  9 Jul 2026 23:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783666022; bh=Yr7V7BVtXSXre/dYciCuyyXWJrBWa/DmbARL/gn5+tI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q53QyGr6bnNR8g78ahzl0MqsnPPsjyamPNTEryES9q3Y7CyEiEPIfa4KmOxdeEXGL
	 SYuLxEAXWN2UyBwIaqvW94cQ9tLEaQ1IYU07TVGPYDRQexSU/EdAVgOyy+eGLldgvu
	 5dsnBjLonzruQlcSZWT8REUFHHfXvHsGRMSJBJ+U=
Message-ID: <07c755f7-7b1f-4423-a92b-aa9ff75202b8@arm.com>
Date: Fri, 10 Jul 2026 12:16:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: sysreg: Add BBM_3
To: Linu Cherian <linu.cherian@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260708144331.679816-1-linu.cherian@arm.com>
 <20260708144331.679816-5-linu.cherian@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260708144331.679816-5-linu.cherian@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_234703_511032_FD1482F5 
X-CRM114-Status: GOOD (  10.80  )
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



On 08/07/26 8:13 PM, Linu Cherian wrote:
> Add BBM_3 definition for ID_AA64MMFR1_EL1 register.

ID_AA64MMFR2_EL1 register has BBM field.
> 
> Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> ---
>  arch/arm64/tools/sysreg | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index bc1788b1662b..082256ec3bf9 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -2259,6 +2259,7 @@ UnsignedEnum	55:52	BBM
>  	0b0000	0
>  	0b0001	1
>  	0b0010	2
> +	0b0011	3
>  EndEnum
>  UnsignedEnum	51:48	TTL
>  	0b0000	NI


