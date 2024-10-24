Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A11CE8E8C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 15:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKTwxUMy4dC0SefPcl6pteogfwUbKpmnuD/CCVEZxC0=; b=tX55OYblXXDsvcpkyXeW+/i60v
	zHgiRjmYGYVpbzmiomAtoBfa2JuAOV5mxV6Haigja+ta8sMPkJqJIqvME78tgQQ8kOTpS9SQyrAhy
	s/kW6DloHw+Y7xwfNSHE8oRheoUd5BkRefSIJ+D5lco41l/Mt4Fqjj8tceCOXW7DJGrF6Vt7hjW2h
	2WJ6+YM8f+A6reNjVy75nE+ZFAR8jMq0xMkOiGLXBbtn+Qpd+k1tjdAUyQ0iXPRv9ARu0LZ1HxNYz
	ulpFgnnTJi9G+9cojVDos65OB3z3cEOt4Iego7jHbzN9F3wYes1Dm/m50EkILjrqK1/Xt7cl3f5Hx
	2daQNATQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zps-00000000vPI-0fWn;
	Thu, 24 Oct 2024 15:33:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zaI-00000000suB-0vpC;
	Thu, 24 Oct 2024 15:17:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729783027;
	bh=2Kve0loElZNKii6MgyGBUDusGqHjRRmkEVjHcH8MDHI=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=jHIPwf0da3VkiA6MyWCQRxgWZMsLgxaXSmYoBtUKQPclhbCIjta2dEo48riMRAvS/
	 IR60w0PmCG98ZQeCVU0WSbwYlOgmdZfTPQj3Ulwg6H5UDySFiXjF7RV/D5CskfYdoH
	 5JjB74wb4Bd2kfaOTPYr4q2hUw1HX4TTho8rMLR40duK+qL98i98jnkZL1kCnMDNqx
	 k27UlrSnqGk5PeTfaM/pEAip5Oa/4gRZTPjmc0Is219kemSiP6pkNXsqqNRYupcdJn
	 u2rT9NPZjRqisz8L6AlvkoxqERXHP8TyyDLCwmgi5BHdltbvl9UpNpA0Pl1XDxsOB5
	 z2hd18mJStVjA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A23C217E1543;
	Thu, 24 Oct 2024 17:17:06 +0200 (CEST)
Message-ID: <8fdeec5c-5de7-44ae-9086-7930d02d610e@collabora.com>
Date: Thu, 24 Oct 2024 17:17:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] pinctrl: mediatek: paris: Expose more
 configurations to GPIO set_config
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bamvor Jian Zhang <bamv2005@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: kernel@collabora.com, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 kernelci@lists.linux.dev
References: <20240909-kselftest-gpio-set-get-config-v1-0-16a065afc3c1@collabora.com>
 <20240909-kselftest-gpio-set-get-config-v1-1-16a065afc3c1@collabora.com>
 <01020191e0901d10-d427a5dd-af4e-4ecf-99e1-4bb051ad1475-000000@eu-west-1.amazonses.com>
Content-Language: en-US
In-Reply-To: <01020191e0901d10-d427a5dd-af4e-4ecf-99e1-4bb051ad1475-000000@eu-west-1.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_081710_462818_27464515 
X-CRM114-Status: GOOD (  19.05  )
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

Il 11/09/24 12:10, AngeloGioacchino Del Regno ha scritto:
> Il 09/09/24 20:37, Nícolas F. R. A. Prado ha scritto:
>> Currently the set_config callback in the gpio_chip registered by the
>> pinctrl_paris driver only supports PIN_CONFIG_INPUT_DEBOUNCE, despite
> 
> [...] only supports operations configuring the input debounce parameter
> of the EINT controller and denies configuring params on the other AP GPIOs [...]
> 
> (reword as needed)
> 
>> many other configurations already being implemented and available
>> through the pinctrl API for configuration of pins by the Devicetree and
>> other drivers.
>>
>> Expose all configurations currently implemented through the GPIO API so
>> they can also be set from userspace, which is particularly useful to
>> allow testing them from userspace.
>>
>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> ---
>>   drivers/pinctrl/mediatek/pinctrl-paris.c | 20 ++++++++++----------
> 
> You can do the same for pinctrl-moore too, it's trivial.
> 
> Other than that, I agree about performing this change, as this may be useful
> for more than just testing.
> 

Nicolas, please don't forget to respin this patch.

Thanks,
Angelo


>>   1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/ 
>> pinctrl-paris.c
>> index e12316c42698..668f8055a544 100644
>> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
>> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
>> @@ -255,10 +255,9 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>>       return err;
>>   }
>> -static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>> +static int mtk_pinconf_set(struct mtk_pinctrl *hw, unsigned int pin,
>>                  enum pin_config_param param, u32 arg)
>>   {
>> -    struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
>>       const struct mtk_pin_desc *desc;
>>       int err = -ENOTSUPP;
>>       u32 reg;
>> @@ -795,7 +794,7 @@ static int mtk_pconf_group_set(struct pinctrl_dev *pctldev, 
>> unsigned group,
>>       int i, ret;
>>       for (i = 0; i < num_configs; i++) {
>> -        ret = mtk_pinconf_set(pctldev, grp->pin,
>> +        ret = mtk_pinconf_set(hw, grp->pin,
>>                         pinconf_to_config_param(configs[i]),
>>                         pinconf_to_config_argument(configs[i]));
>>           if (ret < 0)
>> @@ -937,18 +936,19 @@ static int mtk_gpio_set_config(struct gpio_chip *chip, 
>> unsigned int offset,
>>   {
>>       struct mtk_pinctrl *hw = gpiochip_get_data(chip);
>>       const struct mtk_pin_desc *desc;
>> -    u32 debounce;
>> +    enum pin_config_param param = pinconf_to_config_param(config);
>> +    u32 arg = pinconf_to_config_argument(config);
>>       desc = (const struct mtk_pin_desc *)&hw->soc->pins[offset];
>> -    if (!hw->eint ||
>> -        pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE ||
>> -        desc->eint.eint_n == EINT_NA)
>> -        return -ENOTSUPP;
>> +    if (param == PIN_CONFIG_INPUT_DEBOUNCE) {
>> +        if (!hw->eint || desc->eint.eint_n == EINT_NA)
>> +            return -ENOTSUPP;
>> -    debounce = pinconf_to_config_argument(config);
>> +        return mtk_eint_set_debounce(hw->eint, desc->eint.eint_n, arg);
>> +    }
>> -    return mtk_eint_set_debounce(hw->eint, desc->eint.eint_n, debounce);
>> +    return mtk_pinconf_set(hw, offset, param, arg);
>>   }
>>   static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
>>
> 
> 



