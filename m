Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C05CCA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 14:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYnBr8r6c21ca60+U3T3/s+Y9/GMQ/LaRaA3LF/la8s=; b=EuIE5itAkHx89njpXMWC8PYFgu
	A3WrKo7E1FbiBGKQmjiB/5rQ/UdMpAA/samfnHCbzqPSx7Ippm8Jclzq8j7BCmP+3WDQIiJwAH5QX
	ieC2IIOv1ncuxin7dOXnRTh5eAaf7CemY5B1QaOlZeJjkm+Q3qhVGXTHl1W5mxggRSAZNsIAt6FuT
	GeAk6aV2m4qyxkQcKEze3rtSa42O6jRzZBXYC6E0jW+rwmLlwJqQzzIj75Y0Epe2nwTkxl40tUvYf
	tPHRIBkHSkWYDPj8SpF0rfAi/YCjzH87KQxMi5O63lCykcdJL9OICjlC+HxcZC2lUUAIxSQ6EMUj5
	WJubM/gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0UO-000000066lg-1iXb;
	Fri, 29 Aug 2025 14:54:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urwhS-00000005Nqe-1kCI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 10:51:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C46FF4542B;
	Fri, 29 Aug 2025 10:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806D2C4CEF0;
	Fri, 29 Aug 2025 10:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756464677;
	bh=+QsysON+6yRXfht3SSQ9NdAWxzxbXXdbaMGso6HoALs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LQwVDWIH+/Qu6JVgq6u/kmBGTQ0szc2u6O1Y980dbmif03eUdGf9Ffa+hQYghUTym
	 9Lz+S0+sroN2vzaMxk4zIiev2rCF7ZbPHbJ5fS+V2sTdX2Cvl5+yN2GByDhGPzlWqM
	 gqfnX/gpIRPHi0LFF4WE/qzaDYW5U6LBzk2pf36nhHC6QEVALjV2AeV2hVKvEDUaAY
	 p2K7Ls6F16mtaJ1lhY4+SSi4gTu6P4Llo3blGpDTR8r3zwkV0vFn6qFIpuOZmmkn1r
	 qa5LsZGWqXtDT0HdY5O54iKmYQbRWHPVt8B/k0a6HflOcsSdn/b7lyg47/Qd/LHzAI
	 F5FXz8bmRP8RA==
Message-ID: <3a2475f8-6373-4dd1-b605-b58c74a97fee@kernel.org>
Date: Fri, 29 Aug 2025 12:51:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] dt-bindings: soc: fsl: qe: Add support of IRQ in
 QE GPIO
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Rob Herring <robh@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1756104334.git.christophe.leroy@csgroup.eu>
 <17636607f2beac3b64c87b3bec035fa27ce8d195.1756104334.git.christophe.leroy@csgroup.eu>
 <CAL_JsqKFvVQTVXV8mWX0z1=hd3nLDzLXq-0G_0bshMCvQ5kVvA@mail.gmail.com>
 <f21e27da-de26-4835-9660-b39e99695281@csgroup.eu>
 <0f716362-07f4-4c79-bb0a-e71d2630a797@kernel.org>
 <1ba37df7-2d4a-4258-8220-58ee7d609264@csgroup.eu>
 <c314b7c6-f5b7-4f3e-8d67-e3c92ff8ff37@kernel.org>
 <bf5444e4-8f3f-4a56-be67-29857726b119@csgroup.eu>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <bf5444e4-8f3f-4a56-be67-29857726b119@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_035118_504126_EF93CE4F 
X-CRM114-Status: GOOD (  29.84  )
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

On 29/08/2025 11:41, Christophe Leroy wrote:
>>>
>>> That's more or less the same here with my series, patch 1 implements an
>>> interrupt controller (documented in patch 6) and then the GPIO
>>> controllers consume the interrupts, for instance in gpiolib functions
>>> gpio_sysfs_request_irq() [drivers/gpio/gpiolib-sysfs.c] or
>>> edge_detector_setup() or debounce_setup() [drivers/gpio/gpiolib-cdev.c]
>>>
>>> External drivers also use interrupts indirectly. For example driver
>>> sound/soc/soc-jack.c, it doesn't have any direct reference to an
>>> interrupt. The driver is given an array of GPIOs and then installs an
>>> IRQ in function snd_soc_jack_add_gpios() by doing
>>>
>>> 	request_any_context_irq(gpiod_to_irq(gpios[i].desc),
>>> 					      gpio_handler,
>>> 					      IRQF_SHARED |
>>> 					      IRQF_TRIGGER_RISING |
>>> 					      IRQF_TRIGGER_FALLING,
>>> 					      gpios[i].name,
>>> 					      &gpios[i]);
>>
>>
>> External drivers do not matter then. Your GPIO controller receives
>> specific interrupts (that's the interrupt property) and knows exactly
>> how each GPIO maps to it.
>>
> 
> Do you mean then that the GPIO driver should already know which line has 

The SoC knows, that's fixed information, so shall GPIO driver know as well.

> an interrupt and which one doesn't ?
> 
> The interrupts are fixed per soc, but today the GPIO driver is generic 
> and used on different SOCs that don't have interrupts on the same lines. 

How you write drivers is one thing, but that's never a reason alone to
add properties to the DT.

> And even on the given SOCs, not all ports have interrupts on the same 

That's pretty standard between all GPIO/pinctrl drivers. I would
generalize that's pretty standard for all SoCs - they have differences
within devices, some pins do that, some do different things.

> lines. Should all possibilities be hard-coded inside the driver for each 
> possible compatible ? The property 'fsl,qe-gpio-irq-mask' is there to 

There are many ways how to do it in the driver, that feels like one of
them, so yes, it should.

> avoid that and keep the GPIO driver as generic as possible with a single 

Sorry, that approach, which leads to moving such stuff to DT, was many
times on mailing list rejected. You use the same argument as that "one
clock, one device node" TI approach. It got it way to kernel long time
ago but since then was pretty discouraged (rejected for new SoCs). It
re-appeared again few months ago in a form of "I have two registers, so
I have two device nodes in DT", so it seems poor code keeps re-appearing.

> compatible 'fsl,mpc8323-qe-pario-bank' that is found in the DTS of 8323 
> but also in DTS of 8360, in DTS of 8569, etc... :
> 
> arch/powerpc/boot/dts/fsl/mpc8569mds.dts: 
>              "fsl,mpc8323-qe-pario-bank";
> arch/powerpc/boot/dts/fsl/mpc8569mds.dts: 
>              "fsl,mpc8323-qe-pario-bank";
> arch/powerpc/boot/dts/kmeter1.dts: 
>      "fsl,mpc8323-qe-pario-bank";
> arch/powerpc/boot/dts/mpc832x_rdb.dts: 
> compatible = "fsl,mpc8323-qe-pario-bank";
> arch/powerpc/boot/dts/mpc836x_rdk.dts: 
> "fsl,mpc8323-qe-pario-bank";
> arch/powerpc/boot/dts/mpc836x_rdk.dts: 
> "fsl,mpc8323-qe-pario-bank";
> 
> Do you mean we should define one compatible for each of the ports of 
> each soc, and encode the mask of interrupts that define which line of 
> the port has interrupts in the data field ?

I don't know that good your hardware to tell.

> 
> Something like:
> 
> static const struct of_device_id qe_gpio_match[] = {
> 	{
> 		.compatible = "fsl,mpc8323-qe-pario-bank-a",
> 		.data = (void *)0x00a00028,

There is no DTS in your patchset, so I cannot help really. I just don't
have time to imagine such DTS and try to figure out how it can be
written. Posting complete picture usually helps.

I don't follow what is the bank.

You have a device, yes?
It has some grouped GPIOs (banks?) and some within group/bank can handle
interrupts?
Are these fixed per SoC? Yes. Well, that's standard and every other
vendor has the same. They solve it in the drivers differently, though.

> 	},
> 	{
> 		.compatible = "fsl,mpc8323-qe-pario-bank-b",
> 		.data = (void *)0x01400050,
> 	},
> 	{
> 		.compatible = "fsl,mpc8323-qe-pario-bank-c",
> 		.data = (void *)0x00000084,
> 	},
> 	{
> 		.compatible = "fsl,mpc8323-qe-pario-bank-d",
> 		.data = (void *)0,
> 	},
> 	{
> 		.compatible = "fsl,mpc8360-qe-pario-bank-a",
> 		.data = (void *)0xXXXXXXXX,
> 	},
> 	{
> 		.compatible = "fsl,mpc8360-qe-pario-bank-b",
> 		.data = (void *)0xXXXXXXXX,
> 	},
> ....
> 	{},
> };
> MODULE_DEVICE_TABLE(of, qe_gpio_match);
> 
> That would be feasible but would mean updating the driver each time a 
> new SOC is added.

BTW, like every other platform.

> 
> Do you mean it should be done that way ?
> 
> Isn't the purpose of the device tree to keep drivers as generic as 
> possible ?

Not at all, sorry. The purpose of DT is not to keep drivers generic.


Best regards,
Krzysztof

