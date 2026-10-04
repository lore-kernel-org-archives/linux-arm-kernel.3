Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8287CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 21:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZyOZV2jREkEMgP7lc0lXhqq3JrvHJwGpCfb5qvHgmmY=; b=f9ZNisXCmS/9GOOCZIiJJfNeAh
	GVihRgMljYPsuFCvt2f1xjGZEkcl9cT7Sn5JMeCW9cH+Hc5w0HXmyg4o97saBNOxWrnAI7Gd17FAJ
	X6sjrew30lItUPDUKdv1dMl8Uz9Lau3tYhO7bI9iPqTsyjHaXSFGoK2wR4ZZrB5zILtc0u2nEzTXW
	YEAuOGk5D51sul1SBM6GHwpCCWbs9MUbEuSmQkATVb7OMz1fxO2XJaPoFEJmVwTvN8L5FrnL77M4o
	XoYgIPGtSNNtYsWNEXDTZIGCO8Dh9HYgkJzfAVVk2yeyQqz6040uge7NC/aimwdFhxbQ4S4nxTZjG
	1+OcvLVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTLp-0000000FK0Q-2f2U;
	Sun, 04 Oct 2026 21:02:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTLl-0000000FJzS-2bPk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 21:02:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4317152B;
	Sun,  4 Oct 2026 14:02:18 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C7A23F86F;
	Sun,  4 Oct 2026 14:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791147742; bh=L8CykEMHJYwOt0EHko7Ar+PdxNSESH4QKQqzSpPvsyY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XrryI15AkdfMkkPNwFILx0swrNyjbuIaMUS1pbP0xtTUgafj9UJT/dqcGwLtN3Lqr
	 2LjD/EQAXPO3wVbXCPVYrPR14QDX+k1Xtg9ifhAy+5ANP7tF004Axj09sdlXcdBuWt
	 Ys+zRjqxbh0HYYhb8+daShac9XyV4/GqwB9z3dZY=
Date: Sun, 4 Oct 2026 22:57:24 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Norman Herms <dockseed@proton.me>
Cc: Linus Walleij <linusw@kernel.org>, Pablo Mazzini <pmazzini@gmail.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>, "linux-sunxi@lists.linux.dev"
 <linux-sunxi@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: pinctrl: sunxi: a733: irq_banks too small for port K
Message-ID: <20261004225724.0b821e9c@ryzen.lan>
In-Reply-To: <lqyUiTS5jK5vqN8dT8ByLl8sBPTW6eSDG_13v8UAkVIUCnnxLv4UBrlHTm0c7f4brqOd5ur4sDdgld0Ol4usnXOHgJscjqwJl2BrzPpJk5Y=@proton.me>
References: <lqyUiTS5jK5vqN8dT8ByLl8sBPTW6eSDG_13v8UAkVIUCnnxLv4UBrlHTm0c7f4brqOd5ur4sDdgld0Ol4usnXOHgJscjqwJl2BrzPpJk5Y=@proton.me>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_140225_924355_75592A06 
X-CRM114-Status: GOOD (  21.67  )
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

On Sun, 04 Oct 2026 06:38:56 +0000
Norman Herms <dockseed@proton.me> wrote:

Hi Norman,

> Andre, Linus,
> 
> Observation on "pinctrl: sunxi: add support for the Allwinner A733"
> (Andre's series [2], now in linusw/devel for 7.4):
> the A733 pinctrl description sets .irq_banks = 10, but PA does not
> exist there, and prepare_function_table() in pinctrl-sunxi-dt.c counts
> IRQ banks from PA, so PB is 1 and PK is 10. This is the same
> numbering problem as in Pablo's thread [1].
> 

So I blame AI, but that below is a lot of words for a simple problem:
the number of IRQ banks should be 11, not 10. If we go with the dummy
IRQ. There are no official DTs for the A733 yet, so we need to decide
there, and I guess that depends on the outcome of the A523 problem.
I will send a fix after -rc1, with one of the solutions - unless you
beat me to it.

Thanks,
Andre

> With irq_banks = 10, PK (26 pins, bank 10):
>  - sunxi_pinctrl_init_with_flags() allocates irq_array for 320
>    entries but sunxi_pinctrl_build_state() writes PK to 320..345
>    (104 bytes past the end) at every probe;
>  - PK gets no parent interrupt and its hwirqs are outside the IRQ
>    domain, so there are no GPIO interrupts on port K.
> 
> Measured on two Radxa Cubie A7S boards, same kernel (v7.3-rc5 plus
> this series), once as is and once with irq_banks = 11. Requesting
> edge detection on PK0 through the GPIO v2 character device fails
> with ENXIO as is and works with irq_banks = 11. PB0 as a control
> works in both cases.
> 
> KASAN (generic) does not report the overflow on either board. devres
> rounds the allocation up to the whole kmalloc bucket, so the 104
> bytes still lie inside the object. The out-of-bounds write is
> therefore invisible to KASAN here.
> 
> Regarding Pablo's thread: with the convention Andre preferred there
> (count from PA, placeholder interrupt in the DT), the A733 needs
> irq_banks = 11, which also matches the binding (exactly 11
> interrupts). 10 would only be right with the renumbering from
> Pablo's patch, which is not applied.
> 
> I am not a kernel developer. The measurements were run on my boards
> by AI agents, and the analysis was done with the help of an AI
> assistant (Claude). This is a report, not a Tested-by.
> 
> [1] https://lore.kernel.org/linux-sunxi/20260929203634.32998-1-pmazzini@gmail.com/
> [2] https://lore.kernel.org/linux-sunxi/20260910133519.459011-1-andre.przywara@arm.com/
> 
> Thanks,
> Norman
> 


