Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39350D74EC5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 13:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBYcqlGYW8UUfzptlST4B8RZaYiXzmpfBYXwA1tur54=; b=PVKkSV8gLgD4+DZLFIeNeUhTCr
	rW+1zSGpDoQWtA14s/hjM6ZMrD+z9fPSEDtvOtOUCyrKagg5lxW02mMpFLm8XQUAh8drwWwiMKbdW
	n86SWQTJ9pRshPF7M3WGoCK3PiAkvhwktwRa+OecKoSjB3SEkhc8W0Rn7mUt+nQYp5CJltL5eIhSo
	+e025kyg1ZiJSGOdRgUP5rohphP/yq+ZjbMbx9e+WJUCFFoXwujhYVgSv8Rrci1/cmuj1i0ER1CxL
	YPWJo/ZLZY65PyG4ejG9Il51XLu8XFHC3k6FPe7CZYggW3fmTIarjAp95PwpOUhN7PcUKToK9iI3r
	L/fHqFog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHCA-00000008xdG-3Lbn;
	Fri, 23 Jan 2026 13:27:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHC4-00000008xbj-1qKx;
	Fri, 23 Jan 2026 13:27:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 876731476;
	Fri, 23 Jan 2026 05:26:59 -0800 (PST)
Received: from [10.57.51.35] (unknown [10.57.51.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 862413F632;
	Fri, 23 Jan 2026 05:27:04 -0800 (PST)
Message-ID: <447e8d5a-916b-4d58-b39c-3467c152379c@arm.com>
Date: Fri, 23 Jan 2026 13:27:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: rockchip: mark the GPIO controller as sleeping
To: Bartosz Golaszewski <brgl@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
References: <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com>
 <aWGSQYCXP4R08koQ@venus>
 <CAMRc=Mf0tRxRrh7tn5OaDn3a47N_qvUcjO=zqbTi-GhY-Y9hOg@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAMRc=Mf0tRxRrh7tn5OaDn3a47N_qvUcjO=zqbTi-GhY-Y9hOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_052721_184008_2C086A3E 
X-CRM114-Status: GOOD (  24.48  )
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

On 2026-01-12 9:08 am, Bartosz Golaszewski wrote:
> On Sat, Jan 10, 2026 at 12:55 AM Sebastian Reichel
> <sebastian.reichel@collabora.com> wrote:
>>
>> Hi,
>>
>> On Tue, Jan 06, 2026 at 10:00:11AM +0100, Bartosz Golaszewski wrote:
>>> The GPIO controller is configured as non-sleeping but it uses generic
>>> pinctrl helpers which use a mutex for synchronization.
>>>
>>> This can cause the following lockdep splat with shared GPIOs enabled on
>>> boards which have multiple devices using the same GPIO:
>>>
> 
> [snip]
> 
>>>
>>> Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
>>> Cc: stable@vger.kernel.org
>>> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Closes: https://lore.kernel.org/all/d035fc29-3b03-4cd6-b8ec-001f93540bc6@samsung.com/
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>> ---
>>>   drivers/gpio/gpio-rockchip.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
>>> index 47174eb3ba76..bae2061f15fc 100644
>>> --- a/drivers/gpio/gpio-rockchip.c
>>> +++ b/drivers/gpio/gpio-rockchip.c
>>> @@ -593,6 +593,7 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
>>>        gc->ngpio = bank->nr_pins;
>>>        gc->label = bank->name;
>>>        gc->parent = bank->dev;
>>> +     gc->can_sleep = true;
>>
>> This means all operations are marked as can_sleep, even though
>> pinctrl operations are only used for the direction setting.
>> I.e. the common get/set operations always worked in atomic mode,
>> but now complain. See for example:
>>
>> https://lore.kernel.org/all/20260108-media-synopsys-hdmirx-fix-gpio-cansleep-v1-1-3570518d8bab@kernel.org/
>>
>> It's not a big issue for the hdmirx driver specifically, but I wonder
>> how many more (less often tested) rockchip drivers use GPIOs from their
>> IRQ handler.

Yeah, seems this finally reached my distro kernel and now the kernel log 
on one of my boards is totally flooded from gpio_ir_recv_irq() 
(legitimately) calling gpio_get_value()... that's not really OK :/

Thanks,
Robin.

>> Considering setting or getting the GPIO from atomic context is much
>> more common than changing the direction - is there some way to
>> describe the sleep behavior in a more specific way in the GPIO
>> controller?
>>
> 
> No, there's no such switch at the moment. This is because there are
> paths that we can take, where we *do* end up setting direction from
> gpiod_set_value(). For instance:
> 
> gpiod_set_value()
>    gpiod_set_value_nocheck()
>      gpio_set_open_drain_value_commit()
>        gpiochip_direction_output()
> 
> I'm afraid, for correctness, it has to be either sleeping, or not. I
> would love - at some point - to make pinctrl mostly lockless with
> SRCU, like we did with GPIO. That would solve this issue correctly.
> But until then, I'm afraid we need to keep a chip-global switch for
> sleeping.
> 
> Bartosz
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


