Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963C4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 12:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzVe8atkrU+j+S9mStRrtWyJtCiaN5tTvQ4xvIGKY4g=; b=HUYZF4zhMvqKy5TqNuj2ffKVed
	Gt2Yi//UofAsy0wyDsAaJg3UQzCYakJHkhLD4SRF06lz9EThxbE0flozJn7R4ybipB5X2WLt7RbKu
	LPzbpfe5WCVSaN2uqD6jrx5P9ILvK34BCE+j0yoaOX88R0R/3JyL93M6M2zZFJVUWyDmYSuSNMXkF
	YCYD9vQhDYtFm+GuIoKJtm6b4VUjap9aI7HOlQkyZMUrM2hWUsfxtguhvdTeR7lh2De/E7itPoTPi
	bDBFFi7GO1V24UDQzB7K9MgTEIuWlgCGBwkRHNNAjClK1Y3udQRyKrW4Zm+7az1/vvbxUwmNcfKSo
	AHIFONfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjG8g-00000009FU8-0Www;
	Mon, 13 Jul 2026 12:52:02 +0000
Received: from abscue.de ([89.58.28.240] helo=srv01.abscue.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjG8c-00000009FSs-3r8n;
	Mon, 13 Jul 2026 12:52:00 +0000
Message-ID: <2d34c3f6-5f66-4b60-b9a2-180163964552@abscue.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abscue.de; s=dkim;
	t=1783947103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jzVe8atkrU+j+S9mStRrtWyJtCiaN5tTvQ4xvIGKY4g=;
	b=TfnRqYCjfBvrXj255IPTjN/a+2WqhfzYlNYRwwgkTzsAZghsBX+j+IFD3Sm0Jm1J253j8C
	LIFgZHSnhERrtO5gD1FtHfosFOl217I05vxwWIjmR1ereLDLyLq2rgkdVDF1r2Pc1WoaXS
	8phx60lWlBl8U7HmgzV9b0HzZVB3Tdv8GdzHwWF5YcFXkGAB/CN4vVLFLcKtvPCi63Uq50
	KqcmE/hMF05vOd3Fqm81umPnyewCDTJTxAqukIiOJ06c2wE8KaAaxb16H5qYQ/tQR+CLth
	1SzGtzdImvS/B2sG8uANcSpQsk0UK1nvZ4hTlKjA/b1foUCa8SiPjQCL0LhOTQ==
Date: Mon, 13 Jul 2026 14:51:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] pinctrl: mediatek: Add driver for MT6858
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Content-Language: en-US
From: Nikolai Burov <nikolai.burov+review@abscue.de>
In-Reply-To: <89e4eb3d-a61c-410e-8ad5-e845b07f8029@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_055159_409340_321BD0CC 
X-CRM114-Status: GOOD (  16.39  )
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

On 7/13/26 10:01 AM, AngeloGioacchino Del Regno wrote:
[...]
>> +	[PINCTRL_PIN_REG_MODE] = MTK_RANGE(mt6858_pin_mode_range),
>> +	[PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt6858_pin_dir_range),
>> +	[PINCTRL_PIN_REG_DI] = MTK_RANGE(mt6858_pin_di_range),
>> +	[PINCTRL_PIN_REG_DO] = MTK_RANGE(mt6858_pin_do_range),
>> +	[PINCTRL_PIN_REG_SR] = MTK_RANGE(mt6858_pin_dir_range),
> 
> This is Slew Rate, not Direction... And I think this is wrong.
> 
> If you don't know where the slew rate registers are, or if that is an 
> unsupported operation, just omit PINCTRL_PIN_REG_SR.

Thanks for noticing this! This seems to be a mistake in the downstream 
driver that I unintentionally copied over. I will remove the slew rate.

> 
>> +	[PINCTRL_PIN_REG_SMT] = MTK_RANGE(mt6858_pin_smt_range),
>> +	[PINCTRL_PIN_REG_IES] = MTK_RANGE(mt6858_pin_ies_range),
>> +	[PINCTRL_PIN_REG_PU] = MTK_RANGE(mt6858_pin_pu_range),
>> +	[PINCTRL_PIN_REG_PD] = MTK_RANGE(mt6858_pin_pd_range),
>> +	[PINCTRL_PIN_REG_DRV] = MTK_RANGE(mt6858_pin_drv_range),
>> +	[PINCTRL_PIN_REG_PUPD] = MTK_RANGE(mt6858_pin_pupd_range),
>> +	[PINCTRL_PIN_REG_R0] = MTK_RANGE(mt6858_pin_r0_range),
>> +	[PINCTRL_PIN_REG_R1] = MTK_RANGE(mt6858_pin_r1_range),
>> +	[PINCTRL_PIN_REG_DRV_ADV] = MTK_RANGE(mt6858_pin_drv_adv_range),
>> +	[PINCTRL_PIN_REG_RSEL] = MTK_RANGE(mt6858_pin_rsel_range),
>> +};
>> +
>> +static const char * const mt6858_pinctrl_register_base_names[] = {
>> +	"base", "lm", "rb", "bm2", "bm", "bm1", "lt", "lt1", "rt", "rt1",
> 
> Fix ordering:
> 
> "base", "lm", "rb", "bm", "bm1", "bm2", "lt", "lt1", "rt", "rt1",

The bases are already in ascending address order. I don't know what the 
1 and 2 suffixes in the names of the iocfg regions mean, they may just 
be a historical leftover. Are the names more important than the 
addresses here?

[...]
>> +static const struct of_device_id mt6858_pinctrl_of_match[] = {
>> +	{ .compatible = "mediatek,mt6858-pinctrl", .data = &mt6858_data },
>> +	{ }
> 
>      { /* sentinel */ }

Thanks!

[...]
>> +	MTK_EINT_PIN(119, 0, 72, 0),
>> +	MTK_EINT_PIN(120, 0, 73, 0),
>> +	MTK_EINT_PIN(121, 0, 74, 0),
> 
> Looks like you're missing ~70 pins here?
> 
> If those have no EINT support, you can declare them as
> 
>      MTK_EINT_PIN(122, EINT_INVALID_BASE, 0, 0),
> 
> ...or you can add a macro to add a (sequential) range of pins with no 
> EINT support.

Adding a variable number of mtk_eint_pin structs (with a different pin 
number inside each struct) doesn't seem possible using a single macro, 
so I'll just manually add all of them to the list.

While writing this, I was looking at the mt6878 driver, which also omits 
a range of pins. Should that be fixed as well?

-- 
Best regards,
Nikolai

