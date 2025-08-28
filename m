Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53E5C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGjCeCCH2n29lw5ZPF5uqFUiwezgPm3FyUCTA9ovXwc=; b=Rt6epAesJrYAkDzvJfMNfVATZ4
	1Vs2db6bJcXA53Aik/Xvshj2K5P8nfZU3fRPTFhuwvmePr2E7/rMZfng+j2AkeKEvGRq3yelPK8yJ
	SfPOoJ5u+YEDTSNz9CJpj9iEyGeFxKGcycbjQa/byPwT9qpqTQIeDi497OwJZ4FBNtzvEvQbEqNuz
	KozUYzBSE2NVHhDFNSmRE3MEZpZX+3tkJG+rqZyViEVw2mrKAfSwt5vMt96pTrk4u6D1QILhZH3u+
	B7IOsz+whAvkoRPYvA5TAJUDQ4KYVrlAW3WghswBZc74bNtFHyJ1oPam4E6zRK97I4h+t9SRa/hoy
	DmtHqWZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgPw-00000002VRn-3SWB;
	Thu, 28 Aug 2025 17:28:08 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urdUS-00000001tEv-1Yos
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 14:20:37 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cCNdk5SrLz9sSN;
	Thu, 28 Aug 2025 16:12:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ctYw9B2ysKGN; Thu, 28 Aug 2025 16:12:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cCNdk4lLRz9sSK;
	Thu, 28 Aug 2025 16:12:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8D9F48B764;
	Thu, 28 Aug 2025 16:12:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id rt_hf7oHqOmD; Thu, 28 Aug 2025 16:12:42 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0BB338B763;
	Thu, 28 Aug 2025 16:12:42 +0200 (CEST)
Message-ID: <f21e27da-de26-4835-9660-b39e99695281@csgroup.eu>
Date: Thu, 28 Aug 2025 16:12:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] dt-bindings: soc: fsl: qe: Add support of IRQ in
 QE GPIO
To: Rob Herring <robh@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1756104334.git.christophe.leroy@csgroup.eu>
 <17636607f2beac3b64c87b3bec035fa27ce8d195.1756104334.git.christophe.leroy@csgroup.eu>
 <CAL_JsqKFvVQTVXV8mWX0z1=hd3nLDzLXq-0G_0bshMCvQ5kVvA@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <CAL_JsqKFvVQTVXV8mWX0z1=hd3nLDzLXq-0G_0bshMCvQ5kVvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_072036_575017_E26374A4 
X-CRM114-Status: GOOD (  13.51  )
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



Le 28/08/2025 à 15:28, Rob Herring a écrit :
> On Mon, Aug 25, 2025 at 2:20 AM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>> In the QE, a few GPIOs are IRQ capable. Similarly to
>> commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
>> GPIO"), add IRQ support to QE GPIO.
>>
>> Add property 'fsl,qe-gpio-irq-mask' similar to
>> 'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.
> 
> Why do you need to know this? The ones that have interrupts will be
> referenced by an 'interrupts' property somewhere.

I don't follow you. The ones that have interrupts need to be reported by 
gc->qe_gpio_to_irq[] so that gpiod_to_irq() return the IRQ number, for 
instance to gpio_sysfs_request_irq() so that it can install an irq 
handler. I can't see where they would be referenced by an "interrupts" 
property.

> 
>> Here is an exemple for port B of mpc8323 which has IRQs for
> 
> typo
> 
>> GPIOs PB7, PB9, PB25 and PB27.
>>
>>          qe_pio_b: gpio-controller@1418 {
>>                  compatible = "fsl,mpc8323-qe-pario-bank";
>>                  reg = <0x1418 0x18>;
>>                  interrupts = <4 5 6 7>;
>>                  interrupt-parent = <&qepic>;
>>                  gpio-controller;
>>                  #gpio-cells = <2>;
>>                  fsl,qe-gpio-irq-mask = <0x01400050>;
>>          };
> 
> You are missing #interrupt-cells and interrupt-controller properties.

The gpio controller is not an interrupt controller. The GPIO controller 
is brought by patch 1/6 and documented in patch 6/6.

> 
> With multiple new properties, this should be converted to schema first.

Ah. I didn't know, and checkpatch.pl doesn't know either it seems.

Christophe


