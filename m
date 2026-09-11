Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07005C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 12:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y9ulFaTqs6kS2HsDG0ygIrIAR2Hx3HEyof7jo0XZ8Pc=; b=ORgR4MbsTYxdEl
	GImoD/tr9jp4oQS3/rpF5/VMV+3r6WVjCj5KPrG5m8r8lw/4YU3gOnzYDXfSxXwGHh2dZOHXXc7E6
	B8SGZxRMaj75XDpMadCloenPopXE628eeOYgsAK0OFbBXg9v/PNR8YwgAe8YHQE4lUNGv5HvFaEIX
	SFHKfsui8A944CnmmBkogWhpV6zNZA0hDkJ84LePbpxbRR7MtLA4iDwVe9kq91P9dlIF5CFKt8doh
	b6SGbLOBgLLPUm+pzHGfE626LI0wIm6X8MxarmJzuP4MCxj+vJ7tkEe8fETtZsSlbr4Yed899xQyz
	xsrVjFOh8PhE94I7uknA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50b6-0000000GeFD-0ebq;
	Fri, 11 Sep 2026 12:43:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50b3-0000000GeEV-1oWP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 12:43:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07CA716A3;
	Fri, 11 Sep 2026 05:43:08 -0700 (PDT)
Received: from [10.0.152.207] (unknown [10.0.152.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E4A13F86C;
	Fri, 11 Sep 2026 05:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789130591; bh=8fDkzR3xz7bUOtv2VBFNlhKTI6GaTQbh45cNz7auKIE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jdmjoc5YXFimKoPrWtsGzDiGgZpv8L6ol0veAddLpi+DieVRLlBFhpQBd0mkoA76D
	 OOlnQrdfnw4UKHK+7cK+fo2vr5+ik6SxvUJVyTIlViR8/usYl5Ck27rAZQg6TijAje
	 mas5G9cZFd7DT/ro51xOYv4lY+2i/wYZqT81irwY=
Message-ID: <e99bf73a-d46b-42ac-9608-32c3b1b6f083@arm.com>
Date: Fri, 11 Sep 2026 13:43:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/21] arm64: gpr-num: Add wxN aliases for wN registers
To: Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20260908151741.394589-1-mark.rutland@arm.com>
 <20260908151741.394589-11-mark.rutland@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260908151741.394589-11-mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_054313_676339_8D83BDDA 
X-CRM114-Status: GOOD (  18.50  )
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
> Some A64 instructions require a W register name for specific register
> arguments, and will not accept an X register name. For example:
> 
> 	STRH <Wt>, [<Xn|SP>, (<Wm>|<Xm>){, <extend> {<amount>}}]
> 
> This is painful when writing macros for inline assembly, especially
> where a single register is used as both an X register and a W register.
> 
> We solved this for plain assembly by adding a wxN alias for each xN
> register in commit:
> 
>   4c4dcd3541f83d21 ("arm64: assembler: introduce wxN aliases for wN registers")
> 
> Add the same facility for inline assembly, with a new
> __DEFINE_ASM_GPR_ALIASES macro.
> 
> As with the other macros in gpr-num.h, different escaping is necessary
> for inline vs non-inline assembly, so we can't share a single definition
> that we stringify().
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
>  arch/arm64/include/asm/gpr-num.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/gpr-num.h b/arch/arm64/include/asm/gpr-num.h
> index a114e4f8209b0..240cd25d55c5a 100644
> --- a/arch/arm64/include/asm/gpr-num.h
> +++ b/arch/arm64/include/asm/gpr-num.h
> @@ -21,6 +21,11 @@
>  "	.equ	.L__gpr_num_xzr, 31\n"				\
>  "	.equ	.L__gpr_num_wzr, 31\n"
>  
> +#define __DEFINE_ASM_GPR_ALIASES									\
> +"	.irp	n,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30\n"	\
> +"	wx\\n	.req	w\\n\n"										\
> +"	.endr\n"
> +
>  #endif /* __ASSEMBLER__ */
>  
>  #endif /* __ASM_GPR_NUM_H */
> -- 2.30.2
> 

FWIW,

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>


