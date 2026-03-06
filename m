Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD34F0183C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExBm7X4LeD8yHFHTHdMuN48+RLwJUYvIfkSB0xzjRAc=; b=nOe6i7GZTIk1QeHBWjF0V93Czy
	4GA9dmRWnoR9gjrO07w9M4o0/FXI1pZJBMz/kBx2AiKpF1rBjc/e6BTNvdXyExo+l7wbcfSDotJ2+
	4rPLOkteTPJI9jPz0YuNpP7GA0c3JUb6mUrEGDCjV3bNUUnWsCHrxn8AGMzaiPOj+hKyh8brthpnT
	fVERSNv2EGNbaZgI+PjcKvFWu0NC+jQ1L4YxECqF/TOL5SByr4bt9DXCudOVh3ptv38mHB23RCQap
	ncSK5Y2xxneDAaoHq8K+DsL7LsdK188fQdX9/jVucrrx0YGgdHv1jrJb8KVLR6sJ68HvWo1irx8zG
	4QNrzPDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVos-00000003rOK-2IUu;
	Fri, 06 Mar 2026 14:06:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVoq-00000003rNe-0dN3;
	Fri, 06 Mar 2026 14:06:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772805977;
	bh=KxkuNcTNtwFFBbBEE6JntkXBu0J6pcUOGJNm9O+XtBA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k2wmXZHrG7GI1x85gXFhg1mHU8cPh3cbwtIljogJFm52FsUHN5wydW1/I/EnSv3q7
	 Wrm3YRy+2PcAbOnNji8+zj3ZtM9P7nlrCsJboj8P5fEvf90+4vnKr3/ntgvH+7xWbM
	 QLFbXseWnKkLCH+qaOczOYHw0kY6frGriPMP6VcgG8ujGNpnELKvuvMCW116Zm9g2f
	 OJI7TywGKiYKXhdXNIeh0B1X5/h6WM1FTef4fys14Ra0H7Z1uHzUhm2Jn6hhouou2a
	 sBEJ1s0lUTx+C1MCT8m0zYPK8DRHigTtZgCHUL2qIA9+flZpqDCj6l5+xhYjZtc5AK
	 SkROGa9hKvtLQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A014217E05B5;
	Fri,  6 Mar 2026 15:06:16 +0100 (CET)
Message-ID: <0994fef0-88f2-4277-aa46-0b6a33c53bfa@collabora.com>
Date: Fri, 6 Mar 2026 15:06:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm: dts: mediatek: mt6589: add basic support for
 Lenovo B8000-F
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, sean.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260304192417.818211-1-akkun11.open@gmail.com>
 <20260304192417.818211-3-akkun11.open@gmail.com>
 <94465ca7-b3dc-4736-9d58-4024f2494e54@collabora.com>
 <CAKr_iV5cmE-GBp679Q-=bZi+186BvMvD41ctxnxNC3mTKEzuRw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAKr_iV5cmE-GBp679Q-=bZi+186BvMvD41ctxnxNC3mTKEzuRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_060620_342097_CED17CC5 
X-CRM114-Status: GOOD (  43.67  )
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

Il 05/03/26 16:49, Akari Tsuyukusa ha scritto:
> Hi Angelo, thanks for the feedback.
> 
> On Thu, Mar 5, 2026 at 6:46 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>> Okay, but this is just a simple framebuffer and a UART; while it may be in some
>> way useful, there's already one device based on MT6589 that was upstreamed with
>> just a framebuffer and a serial port, but then didn't receive any more support.
>>
>> Could you please extend your efforts a little and push at least some support for
>> clock controllers and power domains for the MT6589 SoC to make it at least barely
>> useful?
> 
> Your point is valid. I saw similar minimal Device Trees in
> "arch/arm/boot/dts/mediatek/" . Currently, I am actively working on
> MT6589 kernel mainlining and Lenovo YOGA Tablet support, so I submitted
> this patch as initial support for this device.
> 
> I will send patches to add the following features in the near future
> (preferably within this month):
> 
> - Clock
> I wrote drivers and they seem to be working.
> However, some parent clocks are unknown.

Ouch. Well, it's mostly done then, hopefully sooner than later :-)

> 
> - Pinctrl
> I refactored it to common-v2, paris and it's working.
> A little more work is needed to add support for R0, TDSEL, RDSEL, and
> device tree binding.

Okay, almost done there too, then.

> 
> - PWRAP and MT6320 PMIC RTC
> PWRAP is working fine. This seems to be almost the same as MT8135.
> MT6320 PMIC has confirmed RTC operation, but it will take a little more
> time as I haven't written the regulator driver yet.
> 

Start upstreaming the RTC (and MFD parts) right now maybe?
That all depends on the actual state of things, of course.

Remember that you can upstream whatever is clean and works fine, that doesn't
have hard dependencies on other components.

> Additional time is required to add the following features:
> 
> - Power Domains (scpsys)
> I've written a driver, but I haven't checked that it works yet.
> And, some features are missing for full support.
> 

The power domains should be handled by mtk-pm-domains.c - not sure what you wrote
but if you did it on mtk-scpsys.c that's wrong.

> - eMMC/SD (MSDC)
> Likely compatible with "mtk-sd.c". I have written in Device Tree, but
> it is not working on the device. It needs debug mode.
> 

I can confirm that the MSDC controller in MT6589 will work with mtk-sd, there may
be some very small modifications to be done.... if any.
The mtk-sd driver does support "very old" SoCs already :-)

> - USB
> Almost certainly compatible with "mediatek,mtk-musb" and
> "mediatek,generic-tphy-v1". The device is not recognized by the PC,
> and there are logs saying "couldn't find an available UDC".
> It may take more time.
> 

I can suggest to try host mode. Usually that's the one that easily wants to work.
That may help you to validate that the PHY is actually working.

> - UART DMA
> Boots without any errors, but I can't confirm its operation because
> I haven't soldered UART.
> 

UART DMA on smartphones and tablets is usually used by Bluetooth, but if your
device does not have any UART DMA device, you will be unable to validate.

Soldering a UART for the console won't help you to validate UART DMA, as the
one you select for that excludes DMA.

> - I2C
> I don't know the details, but the clock is supplied from the PMIC,
> but PMIC clock driver does not exist. Fortunately, MediaTek engineers
> implemented MT6589 compatibility in the I2C driver (but it is not added
> in the MT6589 Device Tree).
> 
> - I2C devices (only in mainline)
> Touchscreen: syna,rmi4-i2c
> Accelerometer: bosch,bma255
> Magnetometer: bosch,bmm150
> Fuel Gauge: ti,bq27541
> Battery Charger: ti,bq24196
> 
> - SPI
> Like I2C, there is a driver (it seems that the PMIC clock is not
> required for SPI), but  I don't know what devices are connected.
> 

For SPI and I2C, the IPs didn't really change all that much from the old era
to MT6795/MT8173, so I'm confident that you won't have any problem with the
IP driver itself (be it SPI or I2C).

> I am committed to making MT6589 and the Lenovo YOGA Tablet fully
> functional in the mainline kernel. I will send these additional patches
> as soon as they are ready for review.
> 

I really appreciate seeing those old devices getting new life with upstream,
as much as seeing new ones upstreamed. That's really nice.

Keep up the good work!

Cheers,
Angelo

