Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8D4F417F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 16:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NlB3vbas5rEhEZESVEC9QYMNt01aogcgkerFcP/8V8Y=; b=RhMXy5WH7flwvJ/H5+QlCtBJDT
	0+HQiY5tVn9+6TIMbyDTC7Txwc7xROVPaaXIL8F4j1ZP170HLs1y+NP1YIhmOxIMmhdW8VqowV6R8
	6cP1/Ympq/JiR6KA/VzY21edOLLsEyYDwtLfqpqKsGMDo/RG/zkqZJl/w3/vwEJakcLOg0XbGN7Br
	QgxaRPTwgWHhO7L1S1eyvx2rcACJfAKaqIcAznNocPPy+2tAmTdUD5heJSyvbLLvOwxhxHCkcS/jk
	vnuiBF46v2EnE/h5EdoxF7LGRTNuaZr+IWxIKc1HnDo6ZTWRViUOe7VQF+lziXFfkdOZNmWMl6nrU
	21EXpBGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzd3A-00000007eta-45kx;
	Mon, 09 Mar 2026 16:01:44 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzd38-00000007et2-1Rtu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 16:01:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773072093;
	bh=jTbE2ceLrilfjSszpgvgBsccDyZ6aIIDbiDbOLoWtxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=akinAlOM7mBS3929MCfTdqsYqWPlITHYpZ2jehzXVAGkZxT2/+FTNe7uv+8CDTi14
	 laLjQMixP8WE3eOwP+OfjibkBBFTnK9ko185ciGWbluZzYLdpS1Ruz9rsQfClsIOEy
	 iFixwltgUokfm9IPiYd/mEV8/OliqZ9SAukihmT0=
Date: Mon, 9 Mar 2026 17:01:32 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Nick Huang <sef1548@gmail.com>
Cc: macro@orcam.me.uk, davidgow@google.com, dongsheng.yang@linux.dev, 
	dory85109@gmail.com, ebiggers@kernel.org, idryomov@gmail.com, jlayton@kernel.org, 
	john.g.garry@oracle.com, kusogame68@gmail.com, likerockman102@hotmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux@armlinux.org.uk, 
	namhyung@kernel.org, robh@kernel.org, squid@squidspirit.com, wdhh6@aliyun.com, 
	wqu@suse.com, yot4106@gmail.com
Subject: Re: [PATCH v2] arm: Replace ASSEMBLY with ASSEMBLER in uapi
Message-ID: <2ad752a7-0349-44e6-92b9-c67ba37c913c@t-8ch.de>
References: <alpine.DEB.2.21.2603011816460.44093@angie.orcam.me.uk>
 <20260309152423.2582-1-sef1548@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309152423.2582-1-sef1548@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_090142_550997_7FEF7CD3 
X-CRM114-Status: GOOD (  16.29  )
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

Hi Nick,

thanks for the update. After our last discussion I prepared a
supplemental patch for this, but of course forgot to actually
send it out.

On 2026-03-09 15:24:23+0000, Nick Huang wrote:
> Add a compatibility shim for __ASSEMBLER__ to support older GCC versions.
> This bridge ensures that toolchains defining only __ASSEMBLY__ can correctly identify assembly stages.
> This block can be removed once consensus is reached to drop support for these legacy compilers. If this version is acceptable, I will send it out in the v3 patch.
> 
> diff --git a/arch/arm/include/uapi/asm/ptrace.h b/arch/arm/include/uapi/asm/ptrace.h
> index 8896c23cc..427eb70bd 100644
> --- a/arch/arm/include/uapi/asm/ptrace.h
> +++ b/arch/arm/include/uapi/asm/ptrace.h
> @@ -119,7 +119,11 @@
>  #define PT_DATA_ADDR		0x10004
>  #define PT_TEXT_END_ADDR	0x10008
 
> -#ifndef __ASSEMBLY__
> +#if !defined(__ASSEMBLER__) && defined(__ASSEMBLY__)
> +#define __ASSEMBLER__ __ASSEMBLY__
> +#endif

With [0] this hunk should also be unnecesarry. It would free all
UAPI authors from worrying about the problem at all.

[0] https://lore.kernel.org/lkml/20260309-uapi-assembly-v1-1-a7ebfbf14309@weissschuh.net/T/#u

> +#ifndef __ASSEMBLER__ 
>  
>  /*
>   * This struct defines the way the registers are stored on the
> @@ -158,6 +162,6 @@ struct pt_regs {
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

