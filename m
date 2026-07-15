Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C801C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8pixiHE+4PXxCGaQx5Hl8gBRS82rPyfLLhsedDMY+s=; b=KzH9FUOQpPco296MJJSgDj2awm
	HWxZ/biBB7p+bprhG8cLBH8sGHmjPVj/NDkQXUvKwzS/GrGCl9hCllHml/0jbT+agsSYsLyd3R52r
	dQ3h+kxWrZ+BcCUYkevdKnQuENSGdCuhZvWSbHaDeGaKbVXWCYLBqgP4hN+qzkBKh0H71VLl9GiKz
	6m8eMikSFKxe/bHSCfEiJkoFmT6lA9aNF/7T59wm0aiyu74/kt385UEt/xgSwoQPBdJs14khEFLZc
	Qjv7r4s5x1gGwBSaN1cCkaosEQDnFAURcsoQlyWRjhE9b08Q/y1AogEjiJIZREueTYidi4yabNBWA
	Ye95J1GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvDr-0000000EBdE-3fR7;
	Wed, 15 Jul 2026 08:44:07 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvDo-0000000EBcJ-33ng;
	Wed, 15 Jul 2026 08:44:06 +0000
Date: Wed, 15 Jul 2026 10:43:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784105042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o8pixiHE+4PXxCGaQx5Hl8gBRS82rPyfLLhsedDMY+s=;
	b=QKxHOIoHlp9u8M8n7Bkrh/HzI/ySdA78pU1ti/pDCkw/MSn0MWNaQRHJOk/MmAqJZPGA/U
	755oRYJ6WL4SPpfkD+hMgpByfPye6Iqf07ZTiJZRrtUauZO46auwLjWX4DLPSD2PxfxpgT
	v2cQg1lgK+iT5uxdzTKiEfzLtT2TblweDfuxLjQzAXlTplMVhTNqLdpVBqJGMBvYshMFRC
	509eIK1zzpfwv92fNZWDETfzk+qTbknHABmd53JaVHVBM2pd2VgQgBtJGuRmhmfbFF44zY
	ODM7urNC9FO+TS82heAptFv+XiDhksIGAOOcbPd2WHcxqkgWP/5MVs5Hi4ZbFw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784105042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o8pixiHE+4PXxCGaQx5Hl8gBRS82rPyfLLhsedDMY+s=;
	b=hmDYfd6U6mGyUoOlO2p4RjVL+21CJL8XTw+s2nT0Ecrrq23qvMl/Btmh/e257h781FfwnR
	H8elA9RqAIp+yrDA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 3/7] MIPS: csrc-r4k: Replace CONFIG_GENERIC_GETTIMEOFDAY
 ifdeffery with IS_ENABLED()
Message-ID: <20260715102751-d1ed7195-f541-484e-9843-73ee4237b7b5@linutronix.de>
References: <20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de>
 <20260709-vdso-arch-clockmodes-v1-3-3fd780bbf851@linutronix.de>
 <87wluwoe1c.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87wluwoe1c.ffs@fw13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_014404_975293_405E3A6D 
X-CRM114-Status: GOOD (  19.90  )
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

On Wed, Jul 15, 2026 at 10:25:19AM +0200, Thomas Gleixner wrote:
> On Thu, Jul 09 2026 at 13:32, Thomas Weißschuh wrote:
> > Now that there is a dummy declaration of VDSO_CLOCKMODE_R4K, even if no
> > vDSO is built, the ugly ifdeffery can be replaced with a cleaner
> > IS_ENABLED() check.
> 
> Duh. This stuff is really obfuscated. I just realized that the previous
> one actually expands the architecture defines to non-defined integer
> variable declarations.
> 
> Smart, but seriously?
> 
> I just double checked and it turns out that none of this ifdeffery is
> required. If CONFIG_GENERIC_GETTIMEOFDAY is disabled, then it does not
> matter at all whether the actual ARCH_CLOCK_VDSO_MODE is set in
> clocksource::vdso_mode or not.
> 
> Nothing uses the vdso mode field outside of update_vsyscall and that's
> compiled out when CONFIG_GENERIC_GETTIMEOFDAY=n.

__clocksource_register_scale() does.

> So all what's required is:
> 
> --- a/include/vdso/clocksource.h
> +++ b/include/vdso/clocksource.h
> @@ -3,14 +3,11 @@
>  #define __VDSO_CLOCKSOURCE_H
>  
>  #include <vdso/limits.h>
> -
> -#ifdef CONFIG_GENERIC_GETTIMEOFDAY
>  #include <asm/vdso/clocksource.h>
> -#endif /* CONFIG_GENERIC_GETTIMEOFDAY */
>  enum vdso_clock_mode {
>  	VDSO_CLOCKMODE_NONE,
> -#ifdef CONFIG_GENERIC_GETTIMEOFDAY
> +#ifdef VDSO_ARCH_CLOCKMODES
>  	VDSO_ARCH_CLOCKMODES,
>  #endif
>  	VDSO_CLOCKMODE_MAX,
> 
> and then you can just unconditionally set clocksource::vdso_clock_mode
> in all drivers.
> 
> No?

It will weaken the sanity check in __clocksouce_register_scale() if
CONFIG_GENERIC_GETTIMEOFDAY=n. I am not sure what that sanity check
is supposed to protect against, so I left it as is.
If we can weaken the check, or maybe even remove it,
I'm all for your simpler aproach.


Thomas

