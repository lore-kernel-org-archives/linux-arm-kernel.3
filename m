Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B498BCD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 13:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZAi73Mqob0bgaiFGpV5uEk1XYugbydh8hdX0JB/yPSE=; b=B1X/c9+VUrGQs1CTmpLj+ee2xN
	o51c/2SQ+Rr8RjWdXqLKtfGe4SrrwU7fo3a+s5Tl5WGfx42RVBWa9o5alUsxO6i1PHQrBWTkEk6rY
	04jD0unxN6ReZH+fdTM4djgFHDVSZB8x+zclhNfmfG2HF8uuwuH0RO4YwI0ZP4zRs2fYASbAxZrfS
	MaYmkX/sRoKbKLu7oipOxhvSmN8bHrK3asJ4D+DkF263aEX5MriNyGHw+A6ZcVT3MqIP0A2zhB4/S
	T6XPXHn90gucENJHnaym8REUhXZ/BsaQz/eXqgGwgNS6G84p7n4EaHa3QZPp897zOzgrBDZOiSy3y
	8fcntboQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSaVc-00000005lZY-3goK;
	Thu, 28 May 2026 13:10:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSaVb-00000005lYX-04ci
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 13:10:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D33894402;
	Thu, 28 May 2026 06:10:36 -0700 (PDT)
Received: from [10.1.28.164] (unknown [10.1.28.164])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 284773F632;
	Thu, 28 May 2026 06:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779973841; bh=Jnt9KuLkWsuC6eedPcxmoBMiPXplBzGlOfT17H7n1LM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dzScRJIw6z6dqFSw/alsZGKm9XCM3JEeBgdW4TX3T2n1qvhE0Ym/MbhsoJMrBtahc
	 E610HSZPjokTNSjkGNC+BmJ2ORn01+gvBNCestwL+Xsz1gOgUawkIV1xC/RfqC083v
	 BnQyeUqT6X0hrUq7IuZN3SIVUDTEoI3799vQbFTk=
Message-ID: <6f03bcd0-f46c-4cc7-b08e-85fb6a81e9a3@arm.com>
Date: Thu, 28 May 2026 14:10:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/18] arm64: fpsimd: Remove <asm/fpsimdmacros.h>
To: Mark Rutland <mark.rutland@arm.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Cc: broonie@kernel.org, catalin.marinas@arm.com, james.morse@arm.com,
 maz@kernel.org, oupton@kernel.org, tabba@google.com, will@kernel.org
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-19-mark.rutland@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260521132556.584676-19-mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_061047_217240_FB48DD9F 
X-CRM114-Status: GOOD (  13.01  )
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

On 5/21/26 14:25, Mark Rutland wrote:
> We no longer need any of the remaining macros in <asm/fpsimdmacros.h>.
> 
> Remove all of it.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/fpsimdmacros.h | 64 ---------------------------
>  1 file changed, 64 deletions(-)
>  delete mode 100644 arch/arm64/include/asm/fpsimdmacros.h
> 
> diff --git a/arch/arm64/include/asm/fpsimdmacros.h b/arch/arm64/include/asm/fpsimdmacros.h
> deleted file mode 100644
> index a763fd03ffef3..0000000000000
> --- a/arch/arm64/include/asm/fpsimdmacros.h
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * FP/SIMD state saving and restoring macros
> - *
> - * Copyright (C) 2012 ARM Ltd.
> - * Author: Catalin Marinas <catalin.marinas@arm.com>
> - */
> -
> -#include <asm/assembler.h>
> -
> -/* Sanity-check macros to help avoid encoding garbage instructions */
> -
> -.macro _check_general_reg nr
> -	.if (\nr) < 0 || (\nr) > 30
> -		.error "Bad register number \nr."
> -	.endif
> -.endm
> -
> -.macro _sve_check_zreg znr
> -	.if (\znr) < 0 || (\znr) > 31
> -		.error "Bad Scalable Vector Extension vector register number \znr."
> -	.endif
> -.endm
> -
> -.macro _sve_check_preg pnr
> -	.if (\pnr) < 0 || (\pnr) > 15
> -		.error "Bad Scalable Vector Extension predicate register number \pnr."
> -	.endif
> -.endm
> -
> -.macro _check_num n, min, max
> -	.if (\n) < (\min) || (\n) > (\max)
> -		.error "Number \n out of range [\min,\max]"
> -	.endif
> -.endm
> -
> -.macro _sme_check_wv v
> -	.if (\v) < 12 || (\v) > 15
> -		.error "Bad vector select register \v."
> -	.endif
> -.endm
> -
> -.macro __for from:req, to:req
> -	.if (\from) == (\to)
> -		_for__body %\from
> -	.else
> -		__for %\from, %((\from) + ((\to) - (\from)) / 2)
> -		__for %((\from) + ((\to) - (\from)) / 2 + 1), %\to
> -	.endif
> -.endm
> -
> -.macro _for var:req, from:req, to:req, insn:vararg
> -	.macro _for__body \var:req
> -		.noaltmacro
> -		\insn
> -		.altmacro
> -	.endm
> -
> -	.altmacro
> -	__for \from, \to
> -	.noaltmacro
> -
> -	.purgem _for__body
> -.endm
> -- 2.30.2
> 

FWIW,

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>


