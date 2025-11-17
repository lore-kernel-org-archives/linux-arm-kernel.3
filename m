Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88136CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 09:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WgU9XUgj2TLzJK4V0f6yxH+gniqWUXfT8cg0cyckfJc=; b=z2Ag+I4O6FkLoKTPU85wcsWefk
	ttEeWFXpGUr5aVL7TXkIH8cht5Po8nO5n8gy0sMwi5Yd4N/ckZCHsTLLt0IY+Yuo9lc7DOMy+xl8N
	BZqCQnAI1gPiqoJV+KiR5ncpLJyQXN1U3e3eSRkT2IU1RtAV6trkhHCf819bMucxC+azPpZFLdTJu
	6m8KK//loHxjdjAtBHJrW2VKIJSvVMDpObIo1DEkJWHGD1MDAMKSdTP2PaWgzf95CKnnDbrM0me3u
	823xEA/3pDwM/eCMHs0y6bI3Tysm9MBq7v8lJT8KRvr95f3X6GbH5WDMlyIEaudpCEwbQeeYlrBz0
	NWFqEaVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvep-0000000Fnzq-11qP;
	Mon, 17 Nov 2025 09:36:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKven-0000000FnzS-3jj8;
	Mon, 17 Nov 2025 09:36:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 11D4B6019A;
	Mon, 17 Nov 2025 09:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49DB4C4CEF5;
	Mon, 17 Nov 2025 09:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763372180;
	bh=uQCgN5v/OVl4jrNZEJCu3UP4oTLCnPh1F7riEXXRBnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mz5bOdV2sb45qmJ5UH/A2M5QIE1RAPwKS7ebX4SuqggdroXfvKR2HX3pfuUVUKZfT
	 cOiT2EzGoEGZbeL4qpOKZ4GNA3/uXCOJkXEWBRaZlykG2/JwZiEPm8QKW/7uh19SdY
	 uQSy9X4QMtBIqK7IaVnqG7FiCqtD/ky5OaAODiMnV2F6exVcViDIthxBfAta0lrTYl
	 zHc2nMpLX+BymuGBq5PfIPgSaoNTZKXphC976AtHwAaO8031wUuzz7LgjarwtO0HuW
	 BY8GvV1jFJUCgtlAnFJKnHUw9o13fOe+E9lYg7WLlJZK5j/h5LCfu6skNiE1OCKOKM
	 hsxLgpQdIkJ4w==
Date: Mon, 17 Nov 2025 15:06:08 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Enlin Mu <enlin.mu@linux.dev>
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de, 
	linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, linux-kernel@vger.kernel.org, 
	enlin.mu@unisoc.com
Subject: Re: [PATCH V2] clocksource/drivers/rda: Add sched_clock_register for
 RDA8810PL SoC
Message-ID: <jdok5u7aryu6n6aleeox6cy5epkvxdrdnklxzo3kbuffhrifir@qdkvdk67o3lq>
References: <20251107063347.3692-1-enlin.mu@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251107063347.3692-1-enlin.mu@linux.dev>
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

On Fri, Nov 07, 2025 at 02:33:47PM +0800, Enlin Mu wrote:
> From: Enlin Mu <enlin.mu@unisoc.com>
> 
> The current system log timestamp accuracy is tick, which can not
> meet the usage requirements and needs to reach nanoseconds.

Which 'usage requirement' you are referring here?

> Therefore, the sched_clock_register funciton needs to be add.
> 
> Signed-off-by: Enlin Mu <enlin.mu@unisoc.com>

But I'm happy to see a patch from Unisoc for RDA Micro SoC :)

- Mani

> ---
>  drivers/clocksource/timer-rda.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-rda.c b/drivers/clocksource/timer-rda.c
> index fd1199c189bf..0be8e05970e2 100644
> --- a/drivers/clocksource/timer-rda.c
> +++ b/drivers/clocksource/timer-rda.c
> @@ -13,6 +13,7 @@
>  
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
> +#include <linux/sched_clock.h>
>  
>  #include "timer-of.h"
>  
> @@ -153,7 +154,7 @@ static struct timer_of rda_ostimer_of = {
>  	},
>  };
>  
> -static u64 rda_hwtimer_read(struct clocksource *cs)
> +static u64 rda_hwtimer_clocksource_read(void)
>  {
>  	void __iomem *base = timer_of_base(&rda_ostimer_of);
>  	u32 lo, hi;
> @@ -167,6 +168,11 @@ static u64 rda_hwtimer_read(struct clocksource *cs)
>  	return ((u64)hi << 32) | lo;
>  }
>  
> +static u64 rda_hwtimer_read(struct clocksource *cs)
> +{
> +	return rda_hwtimer_clocksource_read();
> +}
> +
>  static struct clocksource rda_hwtimer_clocksource = {
>  	.name           = "rda-timer",
>  	.rating         = 400,
> @@ -185,6 +191,7 @@ static int __init rda_timer_init(struct device_node *np)
>  		return ret;
>  
>  	clocksource_register_hz(&rda_hwtimer_clocksource, rate);
> +	sched_clock_register(rda_hwtimer_clocksource_read, 64, rate);
>  
>  	clockevents_config_and_register(&rda_ostimer_of.clkevt, rate,
>  					0x2, UINT_MAX);
> -- 
> 2.39.5
> 

-- 
மணிவண்ணன் சதாசிவம்

