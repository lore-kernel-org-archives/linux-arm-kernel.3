Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61548CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 09:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZYp0LTc7f1Lq9YJK21JExDfotHPdleR/WErCcr4Lw84=; b=d3B/sAi65eaVRuAIH0j11Y5lrd
	8JO/qgejzBHPKAG4YpxRlt2oE97vGB8yIkoN6pOoxWXu2c+Nnh0pFk2ezydhkvp3I/joy/zBhmM4H
	lgL9hhg+7f6fAqYrtZyTs7MDuraGo0YkaNzFuc3aYXUJsjNO1hxuEYCQWJEKMJJ1zHuNLaAIFP+TB
	A9gBSbQXaHYD53JU0ySpBLDI/n0EHuqQquNAdLrZslBztDZhW8cp/58qOluh2ObW4GlSACJU5HHRA
	Ns6mdZphnXWOdUl7VxGYnpNApXbpoStlCTNorYsi7am45h9A1Tf4kiIgXKU3DE2Mq8TsYvk2E5N2P
	EJ5pdzVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urvVy-00000005AuV-1uvT;
	Fri, 29 Aug 2025 09:35:22 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uruoc-0000000522k-2Bo7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 08:50:35 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cCs6D1Vmbz9sT1;
	Fri, 29 Aug 2025 10:35:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w9NDmBDpyOOx; Fri, 29 Aug 2025 10:35:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cCs6D0Xh0z9sSr;
	Fri, 29 Aug 2025 10:35:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F40178B778;
	Fri, 29 Aug 2025 10:35:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id uQqX3YFuqtHI; Fri, 29 Aug 2025 10:35:31 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 53B0A8B776;
	Fri, 29 Aug 2025 10:35:31 +0200 (CEST)
Message-ID: <1ba37df7-2d4a-4258-8220-58ee7d609264@csgroup.eu>
Date: Fri, 29 Aug 2025 10:35:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] dt-bindings: soc: fsl: qe: Add support of IRQ in
 QE GPIO
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
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
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <0f716362-07f4-4c79-bb0a-e71d2630a797@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_015034_724022_30A72E47 
X-CRM114-Status: GOOD (  19.23  )
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



Le 29/08/2025 à 09:47, Krzysztof Kozlowski a écrit :
> On 28/08/2025 16:12, Christophe Leroy wrote:
>>
>>
>> Le 28/08/2025 à 15:28, Rob Herring a écrit :
>>> On Mon, Aug 25, 2025 at 2:20 AM Christophe Leroy
>>> <christophe.leroy@csgroup.eu> wrote:
>>>>
>>>> In the QE, a few GPIOs are IRQ capable. Similarly to
>>>> commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
>>>> GPIO"), add IRQ support to QE GPIO.
>>>>
>>>> Add property 'fsl,qe-gpio-irq-mask' similar to
>>>> 'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.
>>>
>>> Why do you need to know this? The ones that have interrupts will be
>>> referenced by an 'interrupts' property somewhere.
>>
>> I don't follow you. The ones that have interrupts need to be reported by
>> gc->qe_gpio_to_irq[] so that gpiod_to_irq() return the IRQ number, for
>> instance to gpio_sysfs_request_irq() so that it can install an irq
>> handler. I can't see where they would be referenced by an "interrupts"
>> property.
> 
> They would be referenced by every consumer of these interrupts. IOW,
> this property is completely redundant, because DT holds this information
> already in other place.

But the gpio controller _is_ the consumer of these interrupts, it it 
_not_ the provider.

The interrupts are provided by a separate interrupt controller. Let's 
take the exemple of powerpc 8xx. Here is the list of interrupts handled 
by the CPM interrupt controller on the 8xx:

1 - GPIO Port C Line 4 interrupt
2 - GPIO Port C Line 5 interrupt
3 - SMC2 Serial controller interrupt
4 - SMC1 Serial controller interrupt
5 - SPI controller interrupt
6 - GPIO Port C Line 6 interrupt
7 - Timer 4 interrupt
8 - SCCd Serial controller interrupt
9 - GPIO Port C Line 7 interrupt
10 - GPIO Port C Line 8 interrupt
11 - GPIO Port C Line 9 interrupt
12 - Timer 3 interrupt
13 - SCCc Serial controller interrupt
14 - GPIO Port C Line 10 interrupt
15 - GPIO Port C Line 11 interrupt
16 - I2C Controller interrupt
17 - RISC timer table interrupt
18 - Timer 2 interrupt
19 - SCCb Serial controller interrupt
20 - IDMA2 interrupt
21 - IDMA1 interrupt
22 - SDMA channel bus error interrupt
23 - GPIO Port C Line 12 interrupt
24 - GPIO Port C Line 13 interrupt
25 - Timer 1 interrupt
26 - GPIO Port C Line 14 interrupt
27 - SCCd Serial controller interrupt
28 - SCCc Serial controller interrupt
29 - SCCb Serial controller interrupt
30 - SCCa Serial controller interrupt
31 - GPIO Port C Line 15 interrupt

As you can see in the list, the GPIO line interrupts are nested with 
other types of interrupts so GPIO controller and Interrupt controller 
are to be keept independant.

That's more or less the same here with my series, patch 1 implements an 
interrupt controller (documented in patch 6) and then the GPIO 
controllers consume the interrupts, for instance in gpiolib functions 
gpio_sysfs_request_irq() [drivers/gpio/gpiolib-sysfs.c] or 
edge_detector_setup() or debounce_setup() [drivers/gpio/gpiolib-cdev.c]

External drivers also use interrupts indirectly. For example driver 
sound/soc/soc-jack.c, it doesn't have any direct reference to an 
interrupt. The driver is given an array of GPIOs and then installs an 
IRQ in function snd_soc_jack_add_gpios() by doing

	request_any_context_irq(gpiod_to_irq(gpios[i].desc),
					      gpio_handler,
					      IRQF_SHARED |
					      IRQF_TRIGGER_RISING |
					      IRQF_TRIGGER_FALLING,
					      gpios[i].name,
					      &gpios[i]);

> 
>>
>>>
>>>> Here is an exemple for port B of mpc8323 which has IRQs for
>>>
>>> typo
>>>
>>>> GPIOs PB7, PB9, PB25 and PB27.
>>>>
>>>>           qe_pio_b: gpio-controller@1418 {
>>>>                   compatible = "fsl,mpc8323-qe-pario-bank";
>>>>                   reg = <0x1418 0x18>;
>>>>                   interrupts = <4 5 6 7>;
>>>>                   interrupt-parent = <&qepic>;
>>>>                   gpio-controller;
>>>>                   #gpio-cells = <2>;
>>>>                   fsl,qe-gpio-irq-mask = <0x01400050>;
>>>>           };
>>>
>>> You are missing #interrupt-cells and interrupt-controller properties.
>>
>> The gpio controller is not an interrupt controller. The GPIO controller
>> is brought by patch 1/6 and documented in patch 6/6.
> 
> Then the IRQ mask property is not right here. If you say "this GPIOs
> have IRQs" it means this is an interrupt controller.

The mask tells to the GPIO controller which GPIO line has an interrupt 
(so it can install the edge detector) and which doesn't have an 
interrupt. The "interrupts" property gives a flat list of interrupts, 
the mask in the above example tells: interrupt 4 is for line 7, 
interrupt 5 is for line 9, interrupt 6 is for line 25, interrupt 7 is 
for line 27. Other lines don't have interrupts.

> 
> If you say this is not an interrupt controller, then you cannot have
> here interrupts per some GPIOs, obviously.

It has been working that way on powerpc 8xx for 8 years, since commit 
726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx GPIO")

I don't understand why you say you cannot have
here interrupts per some GPIOs. What am I missing ?

Thanks
Christophe

