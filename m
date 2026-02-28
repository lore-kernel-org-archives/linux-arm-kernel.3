Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0540CFEE4E9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 12:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkx5uywUCrDLBvnajb5Iswg9CWV3Ko5C9zPZORYboeI=; b=pb9+3tP8PhCVxSPl/lgDvqJgMq
	JYC240pAZ3NHP2HjiWr3Qr/qxvKA+1ImmiRt9ybhBYYHk7PwGAyoqjbRcYscQaBSwFtCWCOKgOlNT
	FlTTY+mJfFW4P7ZO6vuwenEH46haP1zYUAeHVGyYgTuCwsqylJJVpKjuQ6jYdMEksvK3bTO1q5/5q
	hyS+J5aDPZLn6XQGOn6is3MfzsoyqE430L0y3muZ57y+Nu2wPy540DPM3zLVvTe25b+EsURZEr3jI
	BsVp+9H0wHOo45VwQ+bRMqLHwtch/YCVqF2x5FxK24pyRS0ZD2PxyHjeBNGey1NYw8wQsv3DLzeX3
	JDQGt1aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwJIo-00000009pH7-0Evj;
	Sat, 28 Feb 2026 12:20:10 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwJIl-00000009pGm-1ykA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 12:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1772281199;
	bh=G6EyI/962zOKlex5lOsr6NAN5CoRjzMD8BumRIGFnjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RGfX/IdPcQfeFwzX8D6ntePs0N8AlThW0Ta1SUyfVs4G/up1UCvdrM2l+m1FlBrLP
	 n30ZC9b/NQHCugGWS+/4Dx1n/vY4p97hmfbAxEy3wuR+M75cVfz20d90311uWYuUGd
	 x1z+yaZHrGqJc7yJYrE9PtDBxTNWO+R/P6mwriFk=
Date: Sat, 28 Feb 2026 13:19:59 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Nick Huang <sef1548@gmail.com>
Cc: macro@orcam.me.uk, linux@armlinux.org.uk, davidgow@google.com, 
	dongsheng.yang@linux.dev, dory85109@gmail.com, ebiggers@kernel.org, idryomov@gmail.com, 
	jlayton@kernel.org, john.g.garry@oracle.com, namhyung@kernel.org, robh@kernel.org, 
	kusogame68@gmail.com, wdhh6@aliyun.com, wqu@suse.com, yot4106@gmail.com, 
	likerockman102@hotmail.com, squid@squidspirit.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm: Replace ASSEMBLY with ASSEMBLER in uapi headers
Message-ID: <164baf81-2824-4943-bbc1-4ae8a160c0cc@t-8ch.de>
References: <20260228121311.3804-1-sef1548@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228121311.3804-1-sef1548@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_042007_751795_D10674C9 
X-CRM114-Status: GOOD (  22.99  )
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

On 2026-02-28 12:13:11+0000, Nick Huang wrote:
> While the transition from __ASSEMBLY__ to __ASSEMBLER__ is not a regression,
> the use of the modern __ASSEMBLER__ macro requires a sufficiently recent
> compiler (GCC 3.0+).
> 
> In some environments, userland might still be using ancient tools like
> GCC 2.95.x, which does not natively define __ASSEMBLER__. To provide a
> complete fix and prevent silent build issues or header ambiguity, add
> an #error guard to catch unsupported toolchains.
> 
> Changes in v2:
> - Added explicit #error check for GCC versions earlier than 3.0.
> - Updated commit message to clarify the rationale for legacy toolchain support.
> - Link to v1: https://lore.kernel.org/all/20260218133952.5356-1-sef1548@gmail.com/
> 
> Signed-off-by: Nick Huang <sef1548@gmail.com>
> ---
>  arch/arm/include/uapi/asm/ptrace.h | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/include/uapi/asm/ptrace.h b/arch/arm/include/uapi/asm/ptrace.h
> index 8896c23cc..51cfefeae 100644
> --- a/arch/arm/include/uapi/asm/ptrace.h
> +++ b/arch/arm/include/uapi/asm/ptrace.h
> @@ -119,7 +119,12 @@
>  #define PT_DATA_ADDR		0x10004
>  #define PT_TEXT_END_ADDR	0x10008
>  
> -#ifndef __ASSEMBLY__
> +#if defined(__GNUC__) && (__GNUC__ <  3)
> +# error "GCC 3.0+ is required for proper __ASSEMBLER__ support. \
> +Your compiler is too old to safely handle modern kernel assembly headers."
> +#endif

Having this check in a random, architecture-specific header does not
make much sense. It should go into a generic header if we want to have it.
Or we can have some generic postprocessing in 'headers_install'.
But as most other architecture UAPI headers already have switched to
__ASSEMBLER__, it seems nobody will be affected by this, so this check
should be unnecessary.

> +
> +#ifndef __ASSEMBLER__ 
>  
>  /*
>   * This struct defines the way the registers are stored on the
> @@ -158,6 +163,6 @@ struct pt_regs {
>  #define ARM_VFPREGS_SIZE ( 32 * 8 /*fpregs*/ + 4 /*fpscr*/ )
>  
>  
> -#endif /* __ASSEMBLY__ */
> +#endif /* __ASSEMBLER__  */
>  
>  #endif /* _UAPI__ASM_ARM_PTRACE_H */
> -- 
> 2.43.0
> 

