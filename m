Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DE9C02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 16:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dk4AD0A4+NSbHo6Win7A0ZFIIueIBzS/S1WZEhiOrP0=; b=T9RcjC6u6Asb4PC2UDWJ41TanP
	ZWclGrQujIPxOZ+rkIZvbrQHdpxklI/OwoDlVQeuQ357WOsYRkCmSE1dlvCM2z/o/zclmsvb8gOQg
	j0WunqOJHjq3Cbyx7Tgu6slNMTyL+n5AyqWJIOwqxHhA3msn+xEdovP9Brl9eIIrMXFbocnwvv8NW
	Pvl/kpeOdlgl4ry+EyzidXqsDLWAtXN6NW4AZV0JIcRZ5GkfclWtTev9J28vSk9/nrI10adX3yBuI
	KRG/RpGZVHVbuz6VrO7LN8ktgqx0nO4Bqdlq6zbOMUhRBz0EoTbD0OqfpYTXq/nVqLb4Yq9Herwgz
	FfVUlQrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6ND-0000000CSvh-0stU;
	Wed, 15 Jan 2025 16:36:07 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6Gm-0000000CRrc-3HJh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 16:29:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FE2BC0004;
	Wed, 15 Jan 2025 16:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736958564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dk4AD0A4+NSbHo6Win7A0ZFIIueIBzS/S1WZEhiOrP0=;
	b=Tmh3cEmMOwCopXEug4n156jZhXoGFcKHS1BE+4u4/nfhAPyj/Cq/OvQ5t+9TCntUGz0WU3
	PGNswowcP4l01uXMpXzYdv26doFwSraKDSmgp6l+K/1Bm6vlD9byBI3Iai8B2Hc0LZCwOZ
	SBwT2HT8WEvXacvXTZ3ncn84E/h6mnH/Ht1xtcpe/cqjLsfjSV3jZOB0an9cpAmiTvs9AA
	ifPD18JjhRVGaynPX5/kaCTUCs7RIIcXHcucNXtES/nel9wp6OSsBefiItJK/TJo8rXGPp
	ok24/prkr6lhQjdFQ5OtDb3CrPcYjRELS9zlavfCTWhyM59QDQyjaNOngB5Nvg==
Date: Wed, 15 Jan 2025 17:29:23 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] rtc: Use str_enable_disable-like helpers
Message-ID: <20250115162923ddf1d821@mail.local>
References: <20250114203623.1013555-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114203623.1013555-1-krzysztof.kozlowski@linaro.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_082929_090700_1B8B103C 
X-CRM114-Status: GOOD (  19.77  )
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
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, Joshua Kinard <kumba@gentoo.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 14/01/2025 21:36:23+0100, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/rtc/proc.c         | 9 +++++----
>  drivers/rtc/rtc-at91sam9.c | 3 ++-
>  drivers/rtc/rtc-cmos.c     | 9 +++++----
>  drivers/rtc/rtc-ds1286.c   | 7 ++++---
>  drivers/rtc/rtc-ds1685.c   | 9 +++++----
>  drivers/rtc/rtc-efi.c      | 5 +++--
>  drivers/rtc/rtc-max8997.c  | 5 +++--
>  drivers/rtc/rtc-mc13xxx.c  | 3 ++-
>  drivers/rtc/rtc-mcp795.c   | 3 ++-
>  drivers/rtc/rtc-pic32.c    | 3 ++-
>  drivers/rtc/rtc-pxa.c      | 5 +++--
>  drivers/rtc/rtc-sh.c       | 5 +++--
>  12 files changed, 39 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/rtc/proc.c b/drivers/rtc/proc.c
> index cbcdbb19d848..19576ce89f6c 100644
> --- a/drivers/rtc/proc.c
> +++ b/drivers/rtc/proc.c
> @@ -12,6 +12,7 @@
>  #include <linux/rtc.h>
>  #include <linux/proc_fs.h>
>  #include <linux/seq_file.h>
> +#include <linux/string_choices.h>
>  
>  #include "rtc-core.h"
>  
> @@ -57,13 +58,13 @@ static int rtc_proc_show(struct seq_file *seq, void *offset)
>  		seq_printf(seq, "alrm_time\t: %ptRt\n", &alrm.time);
>  		seq_printf(seq, "alrm_date\t: %ptRd\n", &alrm.time);
>  		seq_printf(seq, "alarm_IRQ\t: %s\n",
> -			   alrm.enabled ? "yes" : "no");
> +			   str_yes_no(alrm.enabled));
>  		seq_printf(seq, "alrm_pending\t: %s\n",
> -			   alrm.pending ? "yes" : "no");
> +			   str_yes_no(alrm.pending));
>  		seq_printf(seq, "update IRQ enabled\t: %s\n",
> -			   (rtc->uie_rtctimer.enabled) ? "yes" : "no");
> +			   str_yes_no(rtc->uie_rtctimer.enabled));
>  		seq_printf(seq, "periodic IRQ enabled\t: %s\n",
> -			   (rtc->pie_enabled) ? "yes" : "no");
> +			   str_yes_no(rtc->pie_enabled));
>  		seq_printf(seq, "periodic IRQ frequency\t: %d\n",
>  			   rtc->irq_freq);
>  		seq_printf(seq, "max user IRQ frequency\t: %d\n",
> diff --git a/drivers/rtc/rtc-at91sam9.c b/drivers/rtc/rtc-at91sam9.c
> index 15b21da2788f..030ae2241a4a 100644
> --- a/drivers/rtc/rtc-at91sam9.c
> +++ b/drivers/rtc/rtc-at91sam9.c
> @@ -20,6 +20,7 @@
>  #include <linux/rtc.h>
>  #include <linux/slab.h>
>  #include <linux/suspend.h>
> +#include <linux/string_choices.h>
>  #include <linux/time.h>
>  
>  /*
> @@ -252,7 +253,7 @@ static int at91_rtc_proc(struct device *dev, struct seq_file *seq)
>  	u32 mr = rtt_readl(rtc, MR);
>  
>  	seq_printf(seq, "update_IRQ\t: %s\n",
> -		   (mr & AT91_RTT_RTTINCIEN) ? "yes" : "no");
> +		   str_yes_no(mr & AT91_RTT_RTTINCIEN));
>  	return 0;
>  }
>  
> diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
> index 78f2ce12c75a..1f556cdd778f 100644
> --- a/drivers/rtc/rtc-cmos.c
> +++ b/drivers/rtc/rtc-cmos.c
> @@ -32,6 +32,7 @@
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
>  #include <linux/spinlock.h>
> +#include <linux/string_choices.h>
>  #include <linux/platform_device.h>
>  #include <linux/log2.h>
>  #include <linux/pm.h>
> @@ -604,12 +605,12 @@ static int cmos_procfs(struct device *dev, struct seq_file *seq)
>  		   "DST_enable\t: %s\n"
>  		   "periodic_freq\t: %d\n"
>  		   "batt_status\t: %s\n",
> -		   (rtc_control & RTC_PIE) ? "yes" : "no",
> -		   (rtc_control & RTC_UIE) ? "yes" : "no",
> -		   use_hpet_alarm() ? "yes" : "no",
> +		   str_yes_no(rtc_control & RTC_PIE),
> +		   str_yes_no(rtc_control & RTC_UIE),
> +		   str_yes_no(use_hpet_alarm()),
>  		   // (rtc_control & RTC_SQWE) ? "yes" : "no",
>  		   (rtc_control & RTC_DM_BINARY) ? "no" : "yes",

I guess you missed those two.
However, I'm in favor of ripping the whole procfs out of the kernel


> -		   (rtc_control & RTC_DST_EN) ? "yes" : "no",
> +		   str_yes_no(rtc_control & RTC_DST_EN),
>  		   cmos->rtc->irq_freq,
>  		   (valid & RTC_VRT) ? "okay" : "dead");
>  
> diff --git a/drivers/rtc/rtc-ds1286.c b/drivers/rtc/rtc-ds1286.c
> index 7acf849d4902..32fff586d3ec 100644
> --- a/drivers/rtc/rtc-ds1286.c
> +++ b/drivers/rtc/rtc-ds1286.c
> @@ -13,6 +13,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/bcd.h>
>  #include <linux/rtc/ds1286.h>
> +#include <linux/string_choices.h>
>  #include <linux/io.h>
>  #include <linux/slab.h>
>  
> @@ -133,12 +134,12 @@ static int ds1286_proc(struct device *dev, struct seq_file *seq)
>  		   "interrupt_mode\t: %s\n"
>  		   "INTB_mode\t: %s_active\n"
>  		   "interrupt_pins\t: %s\n",
> -		   (cmd & RTC_TDF) ? "yes" : "no",
> -		   (cmd & RTC_WAF) ? "yes" : "no",
> +		   str_yes_no(cmd & RTC_TDF),
> +		   str_yes_no(cmd & RTC_WAF),
>  		   (cmd & RTC_TDM) ? "disabled" : "enabled",
>  		   (cmd & RTC_WAM) ? "disabled" : "enabled",
>  		   (cmd & RTC_PU_LVL) ? "pulse" : "level",
> -		   (cmd & RTC_IBH_LO) ? "low" : "high",
> +		   str_low_high(cmd & RTC_IBH_LO),
>  		   (cmd & RTC_IPSW) ? "unswapped" : "swapped");
>  	return 0;
>  }
> diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
> index 38e25f63597a..25ee2d96bf76 100644
> --- a/drivers/rtc/rtc-ds1685.c
> +++ b/drivers/rtc/rtc-ds1685.c
> @@ -21,6 +21,7 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/rtc.h>
> +#include <linux/string_choices.h>
>  #include <linux/workqueue.h>
>  
>  #include <linux/rtc/ds1685.h>
> @@ -802,14 +803,14 @@ ds1685_rtc_proc(struct device *dev, struct seq_file *seq)
>  	   "SQW Freq\t: %s\n"
>  	   "Serial #\t: %8phC\n",
>  	   model,
> -	   ((ctrla & RTC_CTRL_A_DV1) ? "enabled" : "disabled"),
> +	   str_enabled_disabled(ctrla & RTC_CTRL_A_DV1),
>  	   ((ctrlb & RTC_CTRL_B_2412) ? "24-hour" : "12-hour"),
> -	   ((ctrlb & RTC_CTRL_B_DSE) ? "enabled" : "disabled"),
> +	   str_enabled_disabled(ctrlb & RTC_CTRL_B_DSE),
>  	   ((ctrlb & RTC_CTRL_B_DM) ? "binary" : "BCD"),
>  	   ((ctrld & RTC_CTRL_D_VRT) ? "ok" : "exhausted or n/a"),
>  	   ((ctrl4a & RTC_CTRL_4A_VRT2) ? "ok" : "exhausted or n/a"),
> -	   ((ctrlb & RTC_CTRL_B_UIE) ? "yes" : "no"),
> -	   ((ctrlb & RTC_CTRL_B_PIE) ? "yes" : "no"),
> +	   str_yes_no(ctrlb & RTC_CTRL_B_UIE),
> +	   str_yes_no(ctrlb & RTC_CTRL_B_PIE),
>  	   (!(ctrl4b & RTC_CTRL_4B_E32K) ?
>  	    ds1685_rtc_pirq_rate[(ctrla & RTC_CTRL_A_RS_MASK)] : "none"),
>  	   (!((ctrl4b & RTC_CTRL_4B_E32K)) ?
> diff --git a/drivers/rtc/rtc-efi.c b/drivers/rtc/rtc-efi.c
> index fa8bf82df948..fd4bc2d715da 100644
> --- a/drivers/rtc/rtc-efi.c
> +++ b/drivers/rtc/rtc-efi.c
> @@ -16,6 +16,7 @@
>  #include <linux/time.h>
>  #include <linux/platform_device.h>
>  #include <linux/rtc.h>
> +#include <linux/string_choices.h>
>  #include <linux/efi.h>
>  
>  #define EFI_ISDST (EFI_TIME_ADJUST_DAYLIGHT|EFI_TIME_IN_DAYLIGHT)
> @@ -224,8 +225,8 @@ static int efi_procfs(struct device *dev, struct seq_file *seq)
>  			   alm.hour, alm.minute, alm.second, alm.nanosecond,
>  			   alm.year, alm.month, alm.day,
>  			   alm.daylight,
> -			   enabled == 1 ? "yes" : "no",
> -			   pending == 1 ? "yes" : "no");
> +			   str_yes_no(enabled == 1),
> +			   str_yes_no(pending == 1));
>  
>  		if (alm.timezone == EFI_UNSPECIFIED_TIMEZONE)
>  			seq_puts(seq, "Timezone\t: unspecified\n");
> diff --git a/drivers/rtc/rtc-max8997.c b/drivers/rtc/rtc-max8997.c
> index 20e50d9fdf88..0b094b8f9bb9 100644
> --- a/drivers/rtc/rtc-max8997.c
> +++ b/drivers/rtc/rtc-max8997.c
> @@ -9,6 +9,7 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
>  #include <linux/rtc.h>
>  #include <linux/delay.h>
>  #include <linux/mutex.h>
> @@ -379,7 +380,7 @@ static void max8997_rtc_enable_wtsr(struct max8997_rtc_info *info, bool enable)
>  	mask = WTSR_EN_MASK | WTSRT_MASK;
>  
>  	dev_info(info->dev, "%s: %s WTSR\n", __func__,
> -			enable ? "enable" : "disable");
> +		 str_enable_disable(enable));
>  
>  	ret = max8997_update_reg(info->rtc, MAX8997_RTC_WTSR_SMPL, val, mask);
>  	if (ret < 0) {
> @@ -407,7 +408,7 @@ static void max8997_rtc_enable_smpl(struct max8997_rtc_info *info, bool enable)
>  	mask = SMPL_EN_MASK | SMPLT_MASK;
>  
>  	dev_info(info->dev, "%s: %s SMPL\n", __func__,
> -			enable ? "enable" : "disable");
> +		 str_enable_disable(enable));
>  
>  	ret = max8997_update_reg(info->rtc, MAX8997_RTC_WTSR_SMPL, val, mask);
>  	if (ret < 0) {
> diff --git a/drivers/rtc/rtc-mc13xxx.c b/drivers/rtc/rtc-mc13xxx.c
> index e7b87130e624..fd874baa08ab 100644
> --- a/drivers/rtc/rtc-mc13xxx.c
> +++ b/drivers/rtc/rtc-mc13xxx.c
> @@ -12,6 +12,7 @@
>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
>  #include <linux/rtc.h>
>  
>  #define DRIVER_NAME "mc13xxx-rtc"
> @@ -214,7 +215,7 @@ static int mc13xxx_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
>  
>  	s1970 = rtc_tm_to_time64(&alarm->time);
>  
> -	dev_dbg(dev, "%s: %s %lld\n", __func__, alarm->enabled ? "on" : "off",
> +	dev_dbg(dev, "%s: %s %lld\n", __func__, str_on_off(alarm->enabled),
>  			(long long)s1970);
>  
>  	ret = mc13xxx_rtc_irq_enable_unlocked(dev, alarm->enabled,
> diff --git a/drivers/rtc/rtc-mcp795.c b/drivers/rtc/rtc-mcp795.c
> index e12f0f806ec4..4a55d7e91d08 100644
> --- a/drivers/rtc/rtc-mcp795.c
> +++ b/drivers/rtc/rtc-mcp795.c
> @@ -15,6 +15,7 @@
>  #include <linux/device.h>
>  #include <linux/printk.h>
>  #include <linux/spi/spi.h>
> +#include <linux/string_choices.h>
>  #include <linux/rtc.h>
>  #include <linux/of.h>
>  #include <linux/bcd.h>
> @@ -161,7 +162,7 @@ static int mcp795_update_alarm(struct device *dev, bool enable)
>  {
>  	int ret;
>  
> -	dev_dbg(dev, "%s alarm\n", enable ? "Enable" : "Disable");
> +	dev_dbg(dev, "%s alarm\n", str_enable_disable(enable));
>  
>  	if (enable) {
>  		/* clear ALM0IF (Alarm 0 Interrupt Flag) bit */
> diff --git a/drivers/rtc/rtc-pic32.c b/drivers/rtc/rtc-pic32.c
> index bed3c27e665f..256e7e5e7fd6 100644
> --- a/drivers/rtc/rtc-pic32.c
> +++ b/drivers/rtc/rtc-pic32.c
> @@ -14,6 +14,7 @@
>  #include <linux/slab.h>
>  #include <linux/clk.h>
>  #include <linux/rtc.h>
> +#include <linux/string_choices.h>
>  #include <linux/bcd.h>
>  
>  #include <asm/mach-pic32/pic32.h>
> @@ -247,7 +248,7 @@ static int pic32_rtc_proc(struct device *dev, struct seq_file *seq)
>  
>  	repeat = readw(base + PIC32_RTCALRM);
>  	repeat &= PIC32_RTCALRM_ARPT;
> -	seq_printf(seq, "periodic_IRQ\t: %s\n", repeat  ? "yes" : "no");
> +	seq_printf(seq, "periodic_IRQ\t: %s\n", str_yes_no(repeat));
>  
>  	clk_disable(pdata->clk);
>  	return 0;
> diff --git a/drivers/rtc/rtc-pxa.c b/drivers/rtc/rtc-pxa.c
> index 34d8545c8e15..ff8f0387d023 100644
> --- a/drivers/rtc/rtc-pxa.c
> +++ b/drivers/rtc/rtc-pxa.c
> @@ -13,6 +13,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
>  #include <linux/of.h>
>  
>  #include "rtc-sa1100.h"
> @@ -282,9 +283,9 @@ static int pxa_rtc_proc(struct device *dev, struct seq_file *seq)
>  
>  	seq_printf(seq, "trim/divider\t: 0x%08x\n", rtc_readl(pxa_rtc, RTTR));
>  	seq_printf(seq, "update_IRQ\t: %s\n",
> -		   (rtc_readl(pxa_rtc, RTSR) & RTSR_HZE) ? "yes" : "no");
> +		   str_yes_no(rtc_readl(pxa_rtc, RTSR) & RTSR_HZE));
>  	seq_printf(seq, "periodic_IRQ\t: %s\n",
> -		   (rtc_readl(pxa_rtc, RTSR) & RTSR_PIALE) ? "yes" : "no");
> +		   str_yes_no(rtc_readl(pxa_rtc, RTSR) & RTSR_PIALE));
>  	seq_printf(seq, "periodic_freq\t: %u\n", rtc_readl(pxa_rtc, PIAR));
>  
>  	return 0;
> diff --git a/drivers/rtc/rtc-sh.c b/drivers/rtc/rtc-sh.c
> index a5df521876ba..8073421217fa 100644
> --- a/drivers/rtc/rtc-sh.c
> +++ b/drivers/rtc/rtc-sh.c
> @@ -21,6 +21,7 @@
>  #include <linux/seq_file.h>
>  #include <linux/interrupt.h>
>  #include <linux/spinlock.h>
> +#include <linux/string_choices.h>
>  #include <linux/io.h>
>  #include <linux/log2.h>
>  #include <linux/clk.h>
> @@ -237,11 +238,11 @@ static int sh_rtc_proc(struct device *dev, struct seq_file *seq)
>  	unsigned int tmp;
>  
>  	tmp = readb(rtc->regbase + RCR1);
> -	seq_printf(seq, "carry_IRQ\t: %s\n", (tmp & RCR1_CIE) ? "yes" : "no");
> +	seq_printf(seq, "carry_IRQ\t: %s\n", str_yes_no(tmp & RCR1_CIE));
>  
>  	tmp = readb(rtc->regbase + RCR2);
>  	seq_printf(seq, "periodic_IRQ\t: %s\n",
> -		   (tmp & RCR2_PESMASK) ? "yes" : "no");
> +		   str_yes_no(tmp & RCR2_PESMASK));
>  
>  	return 0;
>  }
> -- 
> 2.43.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

