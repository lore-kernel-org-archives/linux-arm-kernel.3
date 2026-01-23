Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3344D778AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 20:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98sXlw4H+t60FxBp3pMa1NWBBRyhdZF6mH0QeaS0AJE=; b=r/hlffOa+Vn0G2j+3LtkaoYRFt
	AeNZ1tbSFXf7MDsZNaR3IAaELEknnQY+LbxVTX/f5knYgyt7DwNoh8ljajfTMUfWJKoscu9YdkSX9
	odrsqauEmU+y4I9IFeNBzqd0RLeK0ktdw5uDDjE70dxIAZkTOgYVdBgQPaHdHGWziO/0TB5YSIKa8
	FgWuMCmylaVSE59HV0ZMb4JIpDMM1wyut9La0FdRIUCeozgWaXKeTuIBAN93nX4QlejVKQFvmekOG
	9Sz3vQ1gHbRX1aA3dRh6u1zBLrVpnYtrLCcFvk+fhkzir6oRZCXEn4ijUpN19/6OK0wHMDIWgSiTq
	f3ns7QIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjOEJ-00000009Ulp-030N;
	Fri, 23 Jan 2026 20:58:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjOEF-00000009UlM-3Vzz;
	Fri, 23 Jan 2026 20:58:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 122ED1476;
	Fri, 23 Jan 2026 12:57:48 -0800 (PST)
Received: from [10.57.51.35] (unknown [10.57.51.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2A1B3F632;
	Fri, 23 Jan 2026 12:57:52 -0800 (PST)
Message-ID: <e9fd0005-bfbb-4052-8c2a-9200eb0b60ac@arm.com>
Date: Fri, 23 Jan 2026 20:57:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: rockchip: mark the GPIO controller as sleeping
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
References: <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com>
 <aWGSQYCXP4R08koQ@venus>
 <CAMRc=Mf0tRxRrh7tn5OaDn3a47N_qvUcjO=zqbTi-GhY-Y9hOg@mail.gmail.com>
 <447e8d5a-916b-4d58-b39c-3467c152379c@arm.com>
 <CAMRc=Md0h5b=N9CqV-9L9sOtCNbiL1-y6RE0x4+w9HYXE8=pEQ@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAMRc=Md0h5b=N9CqV-9L9sOtCNbiL1-y6RE0x4+w9HYXE8=pEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_125804_009447_6D8EB6FD 
X-CRM114-Status: GOOD (  19.82  )
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

On 2026-01-23 7:27 pm, Bartosz Golaszewski wrote:
> On Fri, Jan 23, 2026 at 2:27 PM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>>>>
>>>> It's not a big issue for the hdmirx driver specifically, but I wonder
>>>> how many more (less often tested) rockchip drivers use GPIOs from their
>>>> IRQ handler.
>>
>> Yeah, seems this finally reached my distro kernel and now the kernel log
>> on one of my boards is totally flooded from gpio_ir_recv_irq()
>> (legitimately) calling gpio_get_value()... that's not really OK :/
>>
> 
> This has always been a sleeping driver. The driver does not know the
> firmware configuration it'll be passed and - as I explained above -
> depending on the lookup flags, we may call .direction_output() and
> descend into pinctrl which uses mutexes. Ideally, we'd make
> GPIO-facing pinctrl operations not sleeping but this is a long-time
> project and quite complex. Telling the GPIO core that it cannot sleep
> is simply incorrect - even if it worked for this particular use-case -
> and has an impact on paths we're choosing.
> 
> Can the GPIO reading in the gpio-ir-recv driver be done from a
> high-priority workqueue by any chance? Or can we make it a threaded
> interrupt?

rockchip_gpio_get() is essentially nothing but a readl(), please explain 
how that could sleep? Saying that countless in-tree and out-of-tree 
arbitrary GPIO consumer drivers should pointlessly refactor just to 
avoid the GPIO core spewing spurious WARN()s is not reasonable.

I appreciate there are cases where the warning most definitely *is* 
relevant, which is why I picked up this discussion rather than proposing 
a revert, even though the documentation says:

  * @can_sleep: flag must be set iff get()/set() methods sleep, as they

where since neither rockchip_gpio_get() nor rockchip_gpio_set() 
themselves sleep, apparently this flag must *not* be set. It's 
irrelevant that a higher-level gpiod_set_value() invocation might end up 
calling .set_direction before it gets as far as calling .set - that's 
not the gpio_chip's fault, and gpiolib knows exactly what it's doing.

What I'm getting at is that getting, and even (directly) setting a 
GPIO's value can reasonably be expected to be more common and applicable 
in a wider range of circumstances than changing its configuration, so 
the former should not be unfairly penalised because of the latter. This 
case is clearly distinct from external GPIO expanders on buses that 
fundamentally can't guarantee fast memory-mapped access at all, so 
trying to conflate it under the same flag doesn't fit, and that needs 
fixing ASAP, before the reverts *do* start piling in. Maybe that just 
means some new dir_can_sleep or more abstract dir_needs_pinctrl flag 
might suffice, maybe it's something more involved; I don't really know, 
and I don't have the bandwidth to take this on myself.

Thanks,
Robin.

