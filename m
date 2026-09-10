Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D1CC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 14:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8oyxFCQSeedLJKULwIB/jBqXDj/eEeo8IdiHrDqE2q4=; b=3yyqAVx60kTT11
	o9Qjs+io5SCc/ycsHrwNlvEQLXrjEQoFFpuLMtwns/ZAiuCJUZ14CQq/6gwmgUwVa0QJbT2GV8LOi
	6JiCQvpo1mG/35IQQ1HVB5BlYYIVe2Z6iR93ZpRQ5KTnWTdU7qep/c4hr4LIB6LVGP1HA+sYTdnPQ
	D9poGUA9M8SCCXMN4zSyRCxItJ8Kux7GmTtIrRnbcoaxqE7l6Obubww3+7btjnMWCrU5yVorCN2wV
	14a5dorwiQ628LfeDsOY893Pfk1xysHwCm4GE9J/PDXItGk/34BYpuXIpG3R9kyK7Vgdq7B3mf7Ui
	l6l60rQ39a9Tx9Cb+Xxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fhr-0000000EclQ-09iZ;
	Thu, 10 Sep 2026 14:24:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fho-0000000Eckq-2kEs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 14:24:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE08F153B;
	Thu, 10 Sep 2026 07:24:43 -0700 (PDT)
Received: from [10.0.152.207] (unknown [10.0.152.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B38EB3F7B4;
	Thu, 10 Sep 2026 07:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789050287; bh=HEfL7d3n00h3U3+XJykgzKwhbH5YqtSSnRGlr/lRfNc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a07ChFdOX0Dv7XSDDls5zde/APBZPGr1SXf2UvW0eJ7Axf8f41/BJmoBknxkaS9/6
	 P2hLKXuEpBSmBkRaRT6qmUw6BwqbVbBv6kI7te5/xgTMKrKh+EAYaYoT8xr8CrzLSa
	 whCEMaMyBbMn5PRxuXBklaVkMI1DlDsLSowmFxs4=
Message-ID: <1066c195-fde7-4bfc-850f-189936c29c96@arm.com>
Date: Thu, 10 Sep 2026 15:24:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/21] arm64: gpr-num: add __GPR_NUM() helper
To: Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20260908151741.394589-1-mark.rutland@arm.com>
 <20260908151741.394589-12-mark.rutland@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260908151741.394589-12-mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_072448_741582_E9A57678 
X-CRM114-Status: GOOD (  17.28  )
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
Cc: ryan.roberts@arm.com, usama.anjum@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 9/8/26 16:17, Mark Rutland wrote:
> The gpr-num infrastructure requires users to concatenate the register
> name with a long prefix in order to get a symbol that evaluates to a
> compile-time constant. Doing this manually is error-prone and painful to
> read.
> 
> Add a new __GPR_NUM() helper which wraps the concatenation.
> 
> For the moment I've left existing open-coded concatenation as-is. In
> particular, the DEFINE_MRS_S() and DEFINE_MSR_S() macros have awkward
> stringification requirements and would require invasive changes that
> outweigh the benefit. I have plans to rework those in the near future to
> remove the need to use gpr-num values.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Vladimir Murzin <vladimir.murzin@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Yang Shi <yang@os.amperecomputing.com>
> ---
>  arch/arm64/include/asm/gpr-num.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/gpr-num.h b/arch/arm64/include/asm/gpr-num.h
> index 240cd25d55c5a..30fb8a67b19f0 100644
> --- a/arch/arm64/include/asm/gpr-num.h
> +++ b/arch/arm64/include/asm/gpr-num.h
> @@ -11,6 +11,8 @@
>  	.equ	.L__gpr_num_xzr, 31
>  	.equ	.L__gpr_num_wzr, 31
>  
> +#define __GPR_NUM(gpr)		(.L__gpr_num_##gpr)
> +
>  #else /* __ASSEMBLER__ */
>  
>  #define __DEFINE_ASM_GPR_NUMS					\
> @@ -26,6 +28,8 @@
>  "	wx\\n	.req	w\\n\n"										\
>  "	.endr\n"
>  
> +#define __GPR_NUM(gpr)		"(.L__gpr_num_" gpr ")"
> +
>  #endif /* __ASSEMBLER__ */
>  
>  #endif /* __ASM_GPR_NUM_H */
> -- 2.30.2
> 

Brilliant!

FWIW,

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>

