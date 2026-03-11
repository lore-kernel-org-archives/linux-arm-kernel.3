Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBD61062868
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 11:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFUwPWUa2C8RyPEgXtS/bViQ1F3uFE3QYAtTuWHnxcc=; b=2YouC2PGOAlc9Fez9nUZgvKz2P
	aIlQ9PnwVbuyVxWbxWe8ww3M+fpO0r1owQWYHwRDUmqru4LCYm1Y70aj9riGlxMm0MNVK2WSCWdBW
	bZFOiOYLohsYZQc56ShVO8mS3QiBAEZEgCL8P62FZhiSqnWqHWMl5Xk5VOS+YHsBgoWuPFysWCeJn
	a5jtUnz5Msdv0KSwBtGATGSkYv88Vyv+PyrAb/IqzAKWGWke33+3CvZ9uh8i4jXPDsYrnMXfZCL/d
	YNSSzkJ7v1sfwm39QZTKkRFaPRMG++X2Q03N1FW5ZNUj8rxf7CR18ZZBOZ2vuq7aDncB3yLolPmUX
	8QcEuseA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0HmC-0000000BUm7-1N28;
	Wed, 11 Mar 2026 11:30:56 +0000
Received: from mail-vk1-f175.google.com ([209.85.221.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Hm9-0000000BUlX-31fk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 11:30:55 +0000
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso5046315e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 04:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773228652; x=1773833452;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFUwPWUa2C8RyPEgXtS/bViQ1F3uFE3QYAtTuWHnxcc=;
        b=R0SoRWmInATWPnwyQ69Lla9D7sQ/Ao5azGQ19elBCbnNB55yaAvETX4fOJvxlrZNdr
         oiTiR7qPsBX3pjgVnRiL8w5r62RvOncJP1R6Cfpsg3gPOcPmTKpLVbd/ajdbBn4wavYO
         uC5HYEFkdL4I43qzdm3ZeZEQZUWEoQswcHTDYnsWDAhzhIDSM/rRFvaDMl1SBDzdQmE0
         qFqJ/riMxMV38xst0EH0AiYkaW3nRgn+7mv//YyLa9/d5TeDTuXn4tK+5ZWUYGLWkv5s
         XVm+SD6mYT/Ox7+XLI6J+JdNvp163luXl6p69Gv84oHRPW+dppPR+lw+LsHvDoTdVFJq
         5wDg==
X-Forwarded-Encrypted: i=1; AJvYcCUWkOQ4V+ApN2OzU2RkgFiBezyQBDdixRtdlFrJIWUNhZn97J+2tBdX/eMiBgJqfScP2g+24FbXAkcsDlG7M9rm@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2/8EOZ5Q5Ld96lVdApovA/WcW1QkGcb3QhWo5DTMsjzJ3vzE5
	UmxCTwB5sansP3I284rhzgrqVSlAknVTYgwIwYxz6ZVnnqaXaTNbC+mfnfI0Sd7k
X-Gm-Gg: ATEYQzxTh9wuqN6LnucG0Ui8CFZM23UFkZKSf3hHat5i0dZ+MVr5lgj+sbYRP3/cLPD
	nth4PaDr0pDB4pVlw8LcPfQtdOtrQ8VIsX9clw8ylpuLE7eicEgek1NCxaDs6pRhvaBCgfwx8Rf
	9bvSn3snGRDB5Z+7T5vBc/wLmXMJe99jP3z5Y+CvAkHTakEeAQLjFmrua/NuwFt9JbxSMFLykqm
	CvjFz4w6Y+w/pgw/I4yl0OTBCSU4BsEc1HU8Tblb/KL727Nt6eNdrMv3scOYhHDXiLsxJ08JmeS
	G2/xFGIdiNSYk7oMln+Hmg6W8vcm5n1C7w/dcrqIIDSfNM1v1wsQr7MSHJg/1NOPJCefjO2Oc5T
	mhKG0uMxZzUuGETegtx/G8XeZMn3vRu8rg7NkN1UOxpgkspbdSLb4ITBD7gVobIXca70mGNK5Y+
	foxwlSfV9/mc+rHbc8zSJFsus7kflQ1mAUJQA0sxDCM7n2w9zAa9ki1l7enaucQBOF
X-Received: by 2002:a05:6122:2086:b0:566:37dc:e219 with SMTP id 71dfb90a1353d-56b476531b0mr689455e0c.15.1773228652064;
        Wed, 11 Mar 2026 04:30:52 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b46350bc7sm881601e0c.7.2026.03.11.04.30.45
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 04:30:47 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56afbcd8adbso3016760e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 04:30:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWqGrXQ+cH7M3l35RN+ppzJQqBaiPVU232+8KEgQ9fV/77a/vxaPSsUmW4cMHU2PPupqA/2X3pYu0h/DofeOMy7@lists.infradead.org
X-Received: by 2002:a05:6122:4b14:b0:566:2711:d8ab with SMTP id
 71dfb90a1353d-56b47474538mr661085e0c.6.1773228645230; Wed, 11 Mar 2026
 04:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260310184030.3669330-1-cristian.marussi@arm.com> <20260310184030.3669330-2-cristian.marussi@arm.com>
In-Reply-To: <20260310184030.3669330-2-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 12:30:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX5T-7ERcjEK_=z7joEftC2cMLqDkyy8iO65U21S-umng@mail.gmail.com>
X-Gm-Features: AaiRm531V7pPeKFeCYpwBljOpOuuWMHfwPn8-oVZZtZhYt-YNy5G1WfiCBuIrko
Message-ID: <CAMuHMdX5T-7ERcjEK_=z7joEftC2cMLqDkyy8iO65U21S-umng@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] clk: scmi: Fix clock rate rounding
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_043053_765189_62A3EAB9 
X-CRM114-Status: GOOD (  23.72  )
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

Hi Cristian,

On Tue, 10 Mar 2026 at 19:40, Cristian Marussi <cristian.marussi@arm.com> wrote:
> While the do_div() helper used for rounding expects its divisor argument
> to be a 32bits quantity, the currently provided divisor parameter is a
> 64bit value that, as a consequence, is silently truncated and a possible
> source of bugs.
>
> Fix by using the proper div64_ul helper.
>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Fixes: 7a8655e19bdb ("clk: scmi: Fix the rounding of clock rate")
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks for your patch!

> --- a/drivers/clk/clk-scmi.c
> +++ b/drivers/clk/clk-scmi.c

> @@ -83,7 +83,7 @@ static int scmi_clk_determine_rate(struct clk_hw *hw,
>
>         ftmp = req->rate - fmin;
>         ftmp += clk->info->range.step_size - 1; /* to round up */
> -       do_div(ftmp, clk->info->range.step_size);
> +       ftmp = div64_ul(ftmp, clk->info->range.step_size);

include/linux/math64.h has:

    #if BITS_PER_LONG == 64
    #define div64_ul(x, y)   div64_u64((x), (y))
    #elif BITS_PER_LONG == 32
    #define div64_ul(x, y)   div_u64((x), (y))
    #endif

I.e. div64_ul() is meant for the case where the divisor is unsigned
long.  Hence div64_ul() may still truncate step_size on 32-bit
platforms, and thus should use div64_u64() unconditionally.

I am aware clock rates are "unsigned long" on 32-bit platforms, and
thus cannot support rates that do not fit in a 32-bit value.
If that is the reason you are using div64_ul(), it should be documented
properly.  And probably the SCMI core code should reject any rate values
(incl. min, max, step) that do not fit in unsigned long, as such clocks
cannot be used on 32-bit platforms.

>
>         req->rate = ftmp * clk->info->range.step_size + fmin;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

