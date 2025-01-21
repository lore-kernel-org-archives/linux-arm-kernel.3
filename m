Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDB0C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 10:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pulaHYswL3RBT3G2fzwNe67BCOa9InRfcnOUkC9cnV0=; b=gkxhFig9qioZIrUot8yYCJG0KH
	jwXo0gCEr/nAYN7RLcA02yuSNFByDrvgE/ryzCpu9wUBSCA8sz0MmJJFcQA+kvvYPP0SFxhOMs/qs
	rdRuqB7ty050horxCikOC1Ox8EkTxfidphRekP9vGkDAr4lVuIfhE9ENLDxagKmHbQsNMPy8rad+j
	chEAF8f/CboA6lm1oWBxzT9qmOVLG/xw/jLYVAwM8CuOe+wkWvRASrw/dA7qV/DKAR/rRsTCUQA/w
	ckfVEOHcFteY1+mexqE0gWs1+b1ZsWj+dTWCKlORRZFTHa0qsQ1CHa+kOWsbJf7OO4uRAWGXRCHGo
	baMM/XDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taBM4-00000007YHE-3AWs;
	Tue, 21 Jan 2025 10:19:32 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taBJe-00000007Xtp-22K9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 10:17:03 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1taBJL-0004uM-KZ; Tue, 21 Jan 2025 11:16:43 +0100
Message-ID: <1cedb66f-dad9-4974-865c-bd5a2721a873@pengutronix.de>
Date: Tue, 21 Jan 2025 11:16:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] gpio: mxc: remove dead code after switch to DT-only
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Haibo Chen <haibo.chen@nxp.com>,
 Catalin Popescu <catalin.popescu@leica-geosystems.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <20250113-b4-imx-gpio-base-warning-v1-3-0a28731a5cf6@pengutronix.de>
 <CAMRc=MfZncRy_Qx_Yi_QjqX2cszv9X9st5Yk87Q7R3Hug2S9KQ@mail.gmail.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <CAMRc=MfZncRy_Qx_Yi_QjqX2cszv9X9st5Yk87Q7R3Hug2S9KQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_021702_522339_361399F2 
X-CRM114-Status: GOOD (  19.51  )
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

On 15.01.25 17:55, Bartosz Golaszewski wrote:
> On Mon, Jan 13, 2025 at 11:19 PM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>>
>> struct platform_device::id was only set by board code, but since i.MX
>> became a devicetree-only platform, this will always be -1
>> (PLATFORM_DEVID_NONE).
>>
>> Note: of_alias_get_id() returns a negative number on error and base
>> treats all negative errors the same, so we need not add any additional
>> error handling.
>>
>> Fixes: 0f2c7af45d7e ("gpio: mxc: Convert the driver to DT-only")
>> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>> ---
>>  drivers/gpio/gpio-mxc.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
>> index 4cb455b2bdee71ba4eb20c93567c3b8db100dbb2..619b6fb9d833a4bb94a93b4209f01b49ad1cbdb0 100644
>> --- a/drivers/gpio/gpio-mxc.c
>> +++ b/drivers/gpio/gpio-mxc.c
>> @@ -490,8 +490,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>>         port->gc.request = mxc_gpio_request;
>>         port->gc.free = mxc_gpio_free;
>>         port->gc.to_irq = mxc_gpio_to_irq;
>> -       port->gc.base = (pdev->id < 0) ? of_alias_get_id(np, "gpio") * 32 :
>> -                                            pdev->id * 32;
>> +       port->gc.base = of_alias_get_id(np, "gpio") * 32;
>>
>>         err = devm_gpiochip_add_data(&pdev->dev, &port->gc, port);
>>         if (err)
>>
>> --
>> 2.39.5
>>
> 
> This looks like I can pick it up separately from the rest? Is that right?

Yes, please do.

Thanks,
Ahmad

> 
> Bart
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

