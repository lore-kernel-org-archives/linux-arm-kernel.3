Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6186C9831E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 22:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vLnKVd7fUckhsJB6yUYdTvrC8vLjUQhIHZYzMS6+W4=; b=dCfuEsooHUKjsYNWI/Yd69YuJl
	+649MQzOSwvihaC1sCySafqFHfVqxd3wr91pIGgmiRN2oLIYJnTiwXuLocodKzL55PUPD8em2cezA
	YlRC7OtGhBt4et7x2a1mF0OhD4Shdo3yCfRLITZU7b/ou0Jvhm8mStNIWxtJiuqc9DLLGxX/Q6AI/
	sCXcbpV2Kk7kup/ulajeycrl5nYwwIEDUDHOwyI7p7DxOmavolJ2R/9I1Wlfl2jZL3vW7dthcaYeZ
	vL+10ge6ATooiL8AoCJA6oz6dzpa7GBcsVrtS17ZFKwg4m9YKn7lLMdyfj3riS4ZJSk5gwrfRpjt/
	NOyuW6QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sDg-0000000CJmI-2zZD;
	Thu, 24 Sep 2026 22:47:12 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sDc-0000000CJlr-3ZZG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 22:47:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A520C4E41062
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 22:47:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 71F4C60738;
	Thu, 24 Sep 2026 22:47:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E6E5210329539;
	Fri, 25 Sep 2026 00:46:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790290018; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4vLnKVd7fUckhsJB6yUYdTvrC8vLjUQhIHZYzMS6+W4=;
	b=So8D3lIi8mQBRKlgSahDn9EPRM4TasG/JdVs5jqU4+YPZBRWqCL4r5EiseaeY9q2SLjuFu
	lig6lu0H6oGu+zKZ0MQ3nRhyRpA0gXJODN5OyFcqkwC3qHxdozthi8G7bJHEl+GFlmIRET
	QStdsf2sG24y0AcWR0DnGZvd+sJ/sw226tEMuqfVgy98v9B4lXmDBVuTGRc6WTICKnEYHd
	nZJ7lCeTJsxXJcJOHDMp4PhwbPA3L2ukjm248sQarxHE1Y+Dnu8SPXVSFia6U3UK4OKAfx
	wykAXQmVbSOzEmfEX/7T4SIOHiJFhT9/B+U3WJL4pXOzeNynqs1+2kelxy3cWQ==
Date: Fri, 25 Sep 2026 00:46:57 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Daniel =?iso-8859-1?Q?Via=F1o?= <danividanivi@gmail.com>
Cc: Michal Simek <michal.simek@amd.com>, linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] rtc: zynqmp: Enable crystal oscillator in initialization
Message-ID: <20260924224657b2d275e7@mail.local>
References: <20260924071917.80004-1-danividanivi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260924071917.80004-1-danividanivi@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_154709_043893_DA51F430 
X-CRM114-Status: GOOD (  24.15  )
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

On 24/09/2026 09:19:16+0200, Daniel Viaño wrote:
> Enable the RTC crystal oscillator bit in the control register (RTC_CTRL,
> offset 0x40) during driver initialization.
> 
> Although the RTC_OSC_EN macro was defined when the driver was originally
> introduced, it was never asserted in xlnx_init_rtc(). On cold boots, after
> battery exhaustion, or on platforms where firmware does not pre-initialize
> RTC_CTRL, the oscillator remains disabled and the counter never ticks.
> 
> Asserting RTC_OSC_EN alongside RTC_BATT_EN ensures the oscillator starts
> without relying on bootloader initialization. Per the Zynq UltraScale+
> TRM (UG1085), bit 24 (OSC_CNTRL) is a static level enable for the crystal
> inverter rather than an edge-triggered reset; re-asserting it when the
> oscillator is already running is a non-destructive no-op that does not
> glitch or reset the ticking counters.
> 
> Tested on Zynq UltraScale+ hardware, confirming that the counter freezes
> when RTC_OSC_EN is cleared, advances reliably once enabled, and is
> unaffected when re-asserted while running.
> 
> Fixes: 11143c19eb57 ("rtc: add xilinx zynqmp rtc driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel Viaño <danividanivi@gmail.com>
> ---
>  drivers/rtc/rtc-zynqmp.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
> index 5bcb7536e973..278705ec09f5 100644
> --- a/drivers/rtc/rtc-zynqmp.c
> +++ b/drivers/rtc/rtc-zynqmp.c
> @@ -167,9 +167,12 @@ static void xlnx_init_rtc(struct xlnx_rtc_dev *xrtcdev)
>  {
>  	u32 rtc_ctrl;
>  
> -	/* Enable RTC switch to battery when VCC_PSAUX is not available */
> +	/*
> +	 * Enable crystal oscillator, and enable RTC switch to battery
> +	 * when VCC_PSAUX is not available.
> +	 */
>  	rtc_ctrl = readl(xrtcdev->reg_base + RTC_CTRL);
> -	rtc_ctrl |= RTC_BATT_EN;
> +	rtc_ctrl |= RTC_BATT_EN | RTC_OSC_EN;

No, you need to keep it disabled until you now the time is correct, that
is in set_time and you need to test for it in read_time and return
-EINVAL when it is not set.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

