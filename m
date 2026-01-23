Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A8FD7789B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 23:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ySzEIvHsY36m17Y60SQgx6T97G8qNfOq3WKRr9UwxDY=; b=NGWA7bs8Pq+jP/qG3JO7zP+zLA
	xA7k7ra/4JDnYoK9kxYV+bMENxIGt7LnObNYuVuDn+fOWcpcwam7hrIixh7ArmcIMlCOU9NQia+UN
	/XVmWYTcPCS8u94rkZU+XReMs4ugWPPi7usQYfq+P9SgNytz7SCXaDda03J5TNfdfFkdgpwqNOFC0
	rxhjKYVS89IQrHsYmRDF5rb8Qketgm0gw9wjufvPxoVKlHcEbhuVrvIX0x+7+ery0IKMIoPSMdjR6
	F8mceF0/KBzHJOe2GSOnXuNP6lxy5einvwqEZs1yClOh0AnE5CruEAPxwDOO56GndVVcZo2AR9eLE
	9szsY+wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjQqM-00000009aXP-4C16;
	Fri, 23 Jan 2026 23:45:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjQqK-00000009aX1-08eN;
	Fri, 23 Jan 2026 23:45:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCC431476;
	Fri, 23 Jan 2026 15:45:22 -0800 (PST)
Received: from [10.57.51.35] (unknown [10.57.51.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A8B73F632;
	Fri, 23 Jan 2026 15:45:27 -0800 (PST)
Message-ID: <cb13c3df-be09-4cf3-b679-4431862d7264@arm.com>
Date: Fri, 23 Jan 2026 23:45:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: rockchip: mark the GPIO controller as sleeping
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com>
 <CAMRc=Md0h5b=N9CqV-9L9sOtCNbiL1-y6RE0x4+w9HYXE8=pEQ@mail.gmail.com>
 <e9fd0005-bfbb-4052-8c2a-9200eb0b60ac@arm.com> <16771005.dW097sEU6C@diego>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <16771005.dW097sEU6C@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_154532_203869_EB59D74A 
X-CRM114-Status: GOOD (  29.62  )
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

On 2026-01-23 9:52 pm, Heiko Stübner wrote:
> Am Freitag, 23. Januar 2026, 21:57:50 Mitteleuropäische Normalzeit schrieb Robin Murphy:
>> On 2026-01-23 7:27 pm, Bartosz Golaszewski wrote:
>>> On Fri, Jan 23, 2026 at 2:27 PM Robin Murphy <robin.murphy@arm.com> wrote:
>>>>
>>>>>>
>>>>>> It's not a big issue for the hdmirx driver specifically, but I wonder
>>>>>> how many more (less often tested) rockchip drivers use GPIOs from their
>>>>>> IRQ handler.
>>>>
>>>> Yeah, seems this finally reached my distro kernel and now the kernel log
>>>> on one of my boards is totally flooded from gpio_ir_recv_irq()
>>>> (legitimately) calling gpio_get_value()... that's not really OK :/
>>>>
>>>
>>> This has always been a sleeping driver. The driver does not know the
>>> firmware configuration it'll be passed and - as I explained above -
>>> depending on the lookup flags, we may call .direction_output() and
>>> descend into pinctrl which uses mutexes. Ideally, we'd make
>>> GPIO-facing pinctrl operations not sleeping but this is a long-time
>>> project and quite complex. Telling the GPIO core that it cannot sleep
>>> is simply incorrect - even if it worked for this particular use-case -
>>> and has an impact on paths we're choosing.
>>>
>>> Can the GPIO reading in the gpio-ir-recv driver be done from a
>>> high-priority workqueue by any chance? Or can we make it a threaded
>>> interrupt?
>>
>> rockchip_gpio_get() is essentially nothing but a readl(), please explain
>> how that could sleep? Saying that countless in-tree and out-of-tree
>> arbitrary GPIO consumer drivers should pointlessly refactor just to
>> avoid the GPIO core spewing spurious WARN()s is not reasonable.
>>
>> I appreciate there are cases where the warning most definitely *is*
>> relevant, which is why I picked up this discussion rather than proposing
>> a revert, even though the documentation says:
>>
>>    * @can_sleep: flag must be set iff get()/set() methods sleep, as they
>>
>> where since neither rockchip_gpio_get() nor rockchip_gpio_set()
>> themselves sleep, apparently this flag must *not* be set. It's
>> irrelevant that a higher-level gpiod_set_value() invocation might end up
>> calling .set_direction before it gets as far as calling .set - that's
>> not the gpio_chip's fault, and gpiolib knows exactly what it's doing.
>>
>> What I'm getting at is that getting, and even (directly) setting a
>> GPIO's value can reasonably be expected to be more common and applicable
>> in a wider range of circumstances than changing its configuration, so
>> the former should not be unfairly penalised because of the latter. This
>> case is clearly distinct from external GPIO expanders on buses that
>> fundamentally can't guarantee fast memory-mapped access at all, so
>> trying to conflate it under the same flag doesn't fit, and that needs
>> fixing ASAP, before the reverts *do* start piling in. Maybe that just
>> means some new dir_can_sleep or more abstract dir_needs_pinctrl flag
>> might suffice, maybe it's something more involved; I don't really know,
>> and I don't have the bandwidth to take this on myself.
> 
> the sadest part here is, that the dive from gpio to pinctrl is sort of
> a remant of the past. Originally it was meant to "automatically" set
> the gpio pinmux, but nowadays we (at least try to) have pinctrl entries
> doing that separately.
> 
> But of course that's hard to enforce now, because we can't really know
> where gpios without pinctrl might hide, and of course newer kernels
> need to still run with old DTBs.
> 
> But...
> 
> rockchip_pmx_gpio_set_direction()'s only function is to set the GPIO
> pinmux - it does not handle the actual the actual direction.
> 
> Can't we move the pinctrl_gpio_direction_input/_output() call just over
> to the request callback of the gpiochip?

In fact, after an hour or so chasing through the code, is that not just
pretty much this? (Not even compile tested as I'd rather go to bed now...)

Cheers,
Robin.

----->8-----
diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 47174eb3ba76..118edd57c252 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -164,12 +164,6 @@ static int rockchip_gpio_set_direction(struct gpio_chip *chip,
  	unsigned long flags;
  	u32 data = input ? 0 : 1;
  
-
-	if (input)
-		pinctrl_gpio_direction_input(chip, offset);
-	else
-		pinctrl_gpio_direction_output(chip, offset);
-
  	raw_spin_lock_irqsave(&bank->slock, flags);
  	rockchip_gpio_writel_bit(bank, offset, data, bank->gpio_regs->port_ddr);
  	raw_spin_unlock_irqrestore(&bank->slock, flags);
diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index e44ef262beec..2fc67aeafdb3 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3545,10 +3545,9 @@ static int rockchip_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
  	return 0;
  }
  
-static int rockchip_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
-					   struct pinctrl_gpio_range *range,
-					   unsigned offset,
-					   bool input)
+static int rockchip_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
+					    struct pinctrl_gpio_range *range,
+					    unsigned int offset)
  {
  	struct rockchip_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
  	struct rockchip_pin_bank *bank;
@@ -3562,7 +3561,7 @@ static const struct pinmux_ops rockchip_pmx_ops = {
  	.get_function_name	= rockchip_pmx_get_func_name,
  	.get_function_groups	= rockchip_pmx_get_groups,
  	.set_mux		= rockchip_pmx_set,
-	.gpio_set_direction	= rockchip_pmx_gpio_set_direction,
+	.gpio_request_enable	= rockchip_pmx_gpio_request_enable,
  };
  
  /*


