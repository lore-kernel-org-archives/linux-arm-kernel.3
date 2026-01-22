Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0F7D6CFA2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 19:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4UUagfqRa3jCP2fBiA3Ur8fXwirA3RKoOMc660AuSI0=; b=DQmo7WqSWOxMimGFxkVwH/v128
	Pdzpz8faIbGqkE1Kvn//RfHOctetzlU+dEr/WxglR76JcSjGE3Rp+hGmNLtOfylEg+Da/bFHOnDBk
	JXu1ozbPi6zsvC/WqO9MrUkB8nH4Q2ER4MSg1hKw7gaXLUa18331lM5WcBg/QJRQa+CknDZQ/byqZ
	1opvsps0wmHnfndwl/4y0vvdB31JWMB3NBSKL0wznlpSk0UB9/cQLR5eaSwW3sC4Mf0t9UiouIjJC
	0CmaLLem6JXRJckCPgm+PC5N2hrojbUcU2jAzGmNTZTybPaC+StXv5UPQS7ncgvGnfrOs3CnrXbgz
	YSu4qlDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj0KZ-00000007hKb-1l5V;
	Thu, 22 Jan 2026 19:26:59 +0000
Received: from mail-pg1-x563.google.com ([2607:f8b0:4864:20::563])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj0KW-00000007hK5-3hhF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 19:26:58 +0000
Received: by mail-pg1-x563.google.com with SMTP id 41be03b00d2f7-c56188aef06so566876a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 11:26:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769110015; x=1769714815;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4UUagfqRa3jCP2fBiA3Ur8fXwirA3RKoOMc660AuSI0=;
        b=rYs3DC+xURt6jx5+FqR2c71RDO0B3Z+3pdrAarQEV2G3UIZhumdhoBMrd5VUXCwmEg
         eCdecpVcCApWqKp8APFXRYOaiVcXvEX8Ndpwuk9lpjZKJl6IFs/QqBomffLRdpW20frv
         Dg8CiMFGbHNKyWXJW2nyTLVL1cZ042/35pyoK8Jwu8c4oHG99aKeYKvl0dGv4cXfQjOi
         9ZUIFPeRpKdonwtk3PsLkKxoJ35707B2iU2lHfAQVToMrBTcRylLZu/ugsoBai6Qm503
         DgRREmtyVoOhG7YyhfXnvWL+JV/uH0I/CCl2VVQ9MjKO3R4ax9J766CqlklsiSOt3ule
         oYVg==
X-Forwarded-Encrypted: i=1; AJvYcCUpHgg9zjxJAVksAJIuPFIS3ouPl4rOaMQC8k+Egy8kgI9hV/cm91pBL2dq8BYCrWDkxUvKl4S74PL2SbAnoam3@lists.infradead.org
X-Gm-Message-State: AOJu0YwtvlPFcVy6QzmkpWeysIlA+6lVW61LGgLo01uNs0HhaXYg+nfu
	QIR+eZGWSarebZlbMff+UisY8do9hoiE4aClUQMXcWpKj1azS+smBxY0qHnATPrEq3Kb7MGGV8Y
	j+eIpmOiaA6o6frOdlyawbiF8hIhFOIJRsyE3kqXHhIllnMHTrzMOXtnqOwy9kfj18Xxpq+8mnm
	3F2gSQKLq1Ahuopa3B3RTBJgoS8P0GhMN1lmMkr1gAepmHxCWNRTUsb+4NcOP7Hs+j16HBlZxri
	IbMxaolxzNZ1AVupylAEYfv9KcSuWkBIWY=
X-Gm-Gg: AZuq6aK4+O9/SFSiOja/OcPVlsmIbi1EL9bwTIV1G2RupTESlyhqtaIOWkF8is6O9Zj
	aCe9PgmAhY6rcqdjXgqIv79AZC2bL+6Xo+T2ff+jcZjHW1xOrvp5NUD3v0r3gJQ5a6QhUO2b8z4
	Qzfzdltq9t81oqU2FF4UjcmW/HCTkl0xSiLu+wcn0LG3DQYtdKg5jhI+rELYnUxhmbhbWuYrqyM
	BBs5+rEh6YFs3+O1YHVqKN20+5o6qtd9wFfRYl7IamALt/zGtjC3N5iby/Eefo7UhzZiRPBVc6x
	FJ/NEJTS4rDp6rgeASYLAPBYYSDwnMgmBixqb3Ah9B7uxcOhl+8RNNuJcT12YgN5CO8xa/T6K3r
	mGunmMzrGnHMgk2zNxjsD0qYb/RAf/s4fB74tP9XGZ4FmGRRX90rTjEqcg50FoT30lOu1fga5e6
	/DxCW3KPHP4qcMCTqyN4QXEVo6LrmZ+xmRW3/PvnATY4D3InE=
X-Received: by 2002:a17:90b:2749:b0:34c:a29d:992a with SMTP id 98e67ed59e1d1-35368b4c07fmr409798a91.34.1769110015463;
        Thu, 22 Jan 2026 11:26:55 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-2.dlp.protect.broadcom.com. [144.49.247.2])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-353354d8198sm470144a91.8.2026.01.22.11.26.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Jan 2026 11:26:55 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-123349958b2so5509010c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 11:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1769110014; x=1769714814; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4UUagfqRa3jCP2fBiA3Ur8fXwirA3RKoOMc660AuSI0=;
        b=c6opTB+GEL8ckDKRhL0CIo7hSKhT/Xnh6qcwHeKi5LyWJmE/2t7eXZ78t1+r+lRcan
         TaQxMMTiUich2rDX/yu7KYvUShAMI7bRqdOtOfi5eDc5szGZlFRVxiTdFmDujB2AcwP+
         w9w3xZv06qeUoUi6d2972jgZzWW1JsMxxU3QM=
X-Forwarded-Encrypted: i=1; AJvYcCXLpSynZZoYioDnR8Y9CFzSsVhfZBYquS4TS67GDVOQbUSfcvNchrnSg/KNtxOJh6O2zoeDrmvR8PLcFDIkzENL@lists.infradead.org
X-Received: by 2002:a05:7022:438e:b0:11d:fc72:e17f with SMTP id a92af1059eb24-1247dbbba5bmr270192c88.18.1769110013236;
        Thu, 22 Jan 2026 11:26:53 -0800 (PST)
X-Received: by 2002:a05:7022:438e:b0:11d:fc72:e17f with SMTP id a92af1059eb24-1247dbbba5bmr270169c88.18.1769110012532;
        Thu, 22 Jan 2026 11:26:52 -0800 (PST)
Received: from [10.63.25.133] ([12.75.221.34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d90ce0dsm597516c88.4.2026.01.22.11.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 11:26:51 -0800 (PST)
Message-ID: <ba9005ab-f757-4018-96ed-a10bcef08165@broadcom.com>
Date: Thu, 22 Jan 2026 11:26:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] gpio: brcmstb: implement irq_mask_ack
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Christophe Leroy
 <chleroy@kernel.org>, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>,
 "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20260122010516.1200630-1-florian.fainelli@broadcom.com>
 <20260122010516.1200630-3-florian.fainelli@broadcom.com>
 <CAHp75Vc=ejHPwA05MHBxJQdJWv49pcuTNax0VikXruvwVM+Y9A@mail.gmail.com>
 <cb4ef2ed-ba94-4475-b02a-5b6e39943e81@broadcom.com>
Content-Language: en-US
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <cb4ef2ed-ba94-4475-b02a-5b6e39943e81@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_112656_928412_B1AB6DEB 
X-CRM114-Status: GOOD (  20.30  )
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



On 1/22/2026 11:17 AM, Florian Fainelli wrote:
> 
> 
> On 1/21/2026 11:36 PM, Andy Shevchenko wrote:
>> On Thu, Jan 22, 2026 at 3:06 AM Florian Fainelli
>> <florian.fainelli@broadcom.com> wrote:
>>>
>>> From: Doug Berger <opendmb@gmail.com>
>>>
>>> The irq_mask_ack operation is slightly more efficient than doing
>>> irq_mask and irq_ack separately.
>>
>> I would refer to the callbacks as
>>
>> .irq_mask()
>> .irq_ack()
>>
>> et cetera.
> 
> Ack.
> 
>>
>>> More importantly for this driver it bypasses the check of
>>> irqd_irq_masked ensuring a previously masked but still active
>>> interrupt gets remasked if unmasked at the hardware level. This
>>> allows the driver to more efficiently unmask the wake capable
>>> interrupts when quiescing without needing to enable the irqs
>>> individually to clear the irqd_irq_masked state.
>>
>> ...
>>
>>> -// Copyright (C) 2015-2017 Broadcom
>>> +// Copyright (C) 2015-2026 Broadcom
>>
>> Shouldn't it be rather 2015-2017,2026 ? (In one case when I updated a
>> driver for Intel, I went via Git history to gather the info.)
> 
> Ack.
> 
>>
>> ...
>>
>>>   static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
>>> -               unsigned int hwirq, bool enable)
>>> +               unsigned int hwirq, bool enable, bool ack)
>>
>> This type of interface is usually discouraged as it makes code harder
>> to read and follow. Since there are a lot of duplication, I recommend
>> to move the ack op to a separate helper.
> 
> Good point, knowing the order and what set in those parameters can be 
> confusing.
> 
>>
>> ...
>>
>>> -       gpio_generic_write_reg(&bank->chip,
>>> -                              priv->reg_base + GIO_MASK(bank->id), 
>>> imask);
>>> +       if (ack)
>>> +               gpio_generic_write_reg(&bank->chip,
>>> +                                      priv->reg_base + 
>>> GIO_MASK(bank->id),
>>> +                                      imask);
>>
>> Id est this piece...
>>
>>
>>
>>> +static void brcmstb_gpio_irq_mask_ack(struct irq_data *d)
>>> +{
>>> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>>> +       struct brcmstb_gpio_bank *bank = gpiochip_get_data(gc);
>>> +
>>> +       brcmstb_gpio_set_imask(bank, d->hwirq, false, true);
>>
>> ...and call it here explicitly (seems the only place for it, so it can
>> even be just moved here without an intermediate helper).

Actually we need it to be part of brcmsftb_gpio_set_imask() because this 
is where the guard(gpio_generic_lock_irqsave) resides. I can't really 
see a better alternative, short of create two implementations: of 
brcmstb_gpio_set_imask() and brcmstb_gpio_set_imask_ack() which does not 
feel any better than the proposed patch.
--
Florian


