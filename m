Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB33C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 13:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOvNkyIo5Cons7sdeDRn7jngMiw5iribY5STlVP9ZTk=; b=h7RXzAWvVOao3PN2POf4YhstWW
	CW26VZnOM/qRV7EAiHQbMZVijnsthuC39svvDGpaBnEyZZculLjgCDggW7KOz2auK1Q+MeUTVbM4n
	Wunp/d1rgnWv3wFn6UCMnch48KUurIqz4gLuTA0cAIHhcnY7ldeBf92mpMZDTZOT3js5DkTtrJN6x
	n9zez+8K/KZ5tOoKvZUgxVzg8wuQPWNyRwjJqsUcsZN/xAbl/5sczaoBwGrysKLDTwXQCZusrzpcV
	BVIoI6jL1YOygXrCFeuB5n5g25lWIeJSylq9QaScEj+6bg+nI5iYB2tZPHi9GJOHNAHE+Qk9id7hR
	1U7olbPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGRm-00000009KuM-3QCf;
	Mon, 13 Jul 2026 13:11:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGRi-00000009Kt9-020L;
	Mon, 13 Jul 2026 13:11:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783948299;
	bh=794YbEXyzIorMyKoNEFQ6cQ/F/QQjKG1DMjHHg8ga20=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nvas8LQIvvJDhQizpfs1AArtRbGcWBZKnvqebRXJGr7BQPAl0DYTfd5ENLJO5pyvU
	 CU/OqUGLCIP1aGEd3AXR7wW6Dhz4O4uLvRgBYgZa3KrQYgEOovc9JTBxF6b9N+l9Yg
	 zmr0436PoWjX7UK/l0zyurnom0LzXsVPtNKQGvYCKCv7YK32yOevPz6ICGHkAfx3vA
	 rsYkuFU2jISdeVsummOH2689WSoDlW1uQn6Wgbu+V22iySHQRczPi/L6qVwmEjnpgN
	 xCx5uPXADO/d/o7rwvHWjvbauMvZIpkxGdZVM9REwO1eAi/j4G2wedNOIF87vbSdaH
	 5IFXzjbC0F5KA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 40E1D17E010F;
	Mon, 13 Jul 2026 15:11:39 +0200 (CEST)
Message-ID: <298f5835-d607-41d7-b8da-7b19b8e8abdc@collabora.com>
Date: Mon, 13 Jul 2026 15:11:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] pinctrl: mediatek: Add driver for MT6858
To: Nikolai Burov <nikolai.burov+review@abscue.de>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, nikolai.burov@jolla.com,
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
References: <20260710-mt6858-pinctrl-v1-0-f75ab558f0df@jolla.com>
 <20260710-mt6858-pinctrl-v1-2-f75ab558f0df@jolla.com>
 <89e4eb3d-a61c-410e-8ad5-e845b07f8029@collabora.com>
 <2d34c3f6-5f66-4b60-b9a2-180163964552@abscue.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <2d34c3f6-5f66-4b60-b9a2-180163964552@abscue.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_061142_303473_DBA905D2 
X-CRM114-Status: GOOD (  26.05  )
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

On 7/13/26 14:51, Nikolai Burov wrote:
> On 7/13/26 10:01 AM, AngeloGioacchino Del Regno wrote:
> [...]
>>> +    [PINCTRL_PIN_REG_MODE] = MTK_RANGE(mt6858_pin_mode_range),
>>> +    [PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt6858_pin_dir_range),
>>> +    [PINCTRL_PIN_REG_DI] = MTK_RANGE(mt6858_pin_di_range),
>>> +    [PINCTRL_PIN_REG_DO] = MTK_RANGE(mt6858_pin_do_range),
>>> +    [PINCTRL_PIN_REG_SR] = MTK_RANGE(mt6858_pin_dir_range),
>>
>> This is Slew Rate, not Direction... And I think this is wrong.
>>
>> If you don't know where the slew rate registers are, or if that is an unsupported 
>> operation, just omit PINCTRL_PIN_REG_SR.
> 
> Thanks for noticing this! This seems to be a mistake in the downstream driver that 
> I unintentionally copied over. I will remove the slew rate.
> 

No worries, it happens.

>>
>>> +    [PINCTRL_PIN_REG_SMT] = MTK_RANGE(mt6858_pin_smt_range),
>>> +    [PINCTRL_PIN_REG_IES] = MTK_RANGE(mt6858_pin_ies_range),
>>> +    [PINCTRL_PIN_REG_PU] = MTK_RANGE(mt6858_pin_pu_range),
>>> +    [PINCTRL_PIN_REG_PD] = MTK_RANGE(mt6858_pin_pd_range),
>>> +    [PINCTRL_PIN_REG_DRV] = MTK_RANGE(mt6858_pin_drv_range),
>>> +    [PINCTRL_PIN_REG_PUPD] = MTK_RANGE(mt6858_pin_pupd_range),
>>> +    [PINCTRL_PIN_REG_R0] = MTK_RANGE(mt6858_pin_r0_range),
>>> +    [PINCTRL_PIN_REG_R1] = MTK_RANGE(mt6858_pin_r1_range),
>>> +    [PINCTRL_PIN_REG_DRV_ADV] = MTK_RANGE(mt6858_pin_drv_adv_range),
>>> +    [PINCTRL_PIN_REG_RSEL] = MTK_RANGE(mt6858_pin_rsel_range),
>>> +};
>>> +
>>> +static const char * const mt6858_pinctrl_register_base_names[] = {
>>> +    "base", "lm", "rb", "bm2", "bm", "bm1", "lt", "lt1", "rt", "rt1",
>>
>> Fix ordering:
>>
>> "base", "lm", "rb", "bm", "bm1", "bm2", "lt", "lt1", "rt", "rt1",
> 
> The bases are already in ascending address order. I don't know what the 1 and 2 
> suffixes in the names of the iocfg regions mean, they may just be a historical 
> leftover. Are the names more important than the addresses here?
> 

Eh, fair point. I guess it's fine then.

For the numbers, that's because the registers for the same region of the chip
(meaning physical region, really) are scattered all around... but bm2, bm, bm1
refer to the same physical region (again, really physical, look at the bga array).

> [...]
>>> +static const struct of_device_id mt6858_pinctrl_of_match[] = {
>>> +    { .compatible = "mediatek,mt6858-pinctrl", .data = &mt6858_data },
>>> +    { }
>>
>>      { /* sentinel */ }
> 
> Thanks!
> 
> [...]
>>> +    MTK_EINT_PIN(119, 0, 72, 0),
>>> +    MTK_EINT_PIN(120, 0, 73, 0),
>>> +    MTK_EINT_PIN(121, 0, 74, 0),
>>
>> Looks like you're missing ~70 pins here?
>>
>> If those have no EINT support, you can declare them as
>>
>>      MTK_EINT_PIN(122, EINT_INVALID_BASE, 0, 0),
>>
>> ...or you can add a macro to add a (sequential) range of pins with no EINT support.
> 
> Adding a variable number of mtk_eint_pin structs (with a different pin number 
> inside each struct) doesn't seem possible using a single macro, so I'll just 
> manually add all of them to the list.
> 
> While writing this, I was looking at the mt6878 driver, which also omits a range of 
> pins. Should that be fixed as well?
> 

If there are holes in between, yes, that wouldn't work.

Honestly though, this is starting to be a problem - as in - up until now,
practically all SoCs had EINTs for each pin, or no holes in between... but
I can see that this is changing, as MT6991, MT6993 and now MT6858 all have
those holes.

This is a note and I'm not asking you to do this but, at some point, we should
really add some logic to the mtk-eint driver so that it doesn't forcefully (and
at this point in time, even stupidly) map/expect pin data at the same array
index as the pin number.

That's probably more important than fixing mt6878, but well, I understand that
this stuff would take a bit more time than adding just a few entries in arrays
right now, and I also understand that time may be lacking, so I am definitely
not blocking the addition of 6858 for this (of course, as long as you fill up
the holes there)

Cheers,
Angelo

