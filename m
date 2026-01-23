Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A94D778AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 19:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cT5TBo/dI90+wcDSKNtZ1iy//ljekx3o3pFpFS1CjKM=; b=u4hSwrrVXS2o4xDJgZCEIgA+fV
	BIyBo6AXWIwAh3n7P1SGAtfRNdqpTxDKL/ybncXb4UuVCl1bR/B+AwCRiED0B2nqU8MkeznT9H4wI
	16VjAOAQKGpLGnH+Ssri4HTEp7q7rWdJ6LQvX+KhTI2xw7aWJHQ0Rh6HbFGWhasbmUcODJYSFyUzs
	4R8jWferD3TGpoZckyRqA070OdPpTJ7XG09FTS7UFSV207dh6Xi6+DqJpMqscFceOKAjviyO34tRA
	O2KQYQca85rM4g1QVHEWwb48xHI+lC+eTOaeJ4urBEYqX4Lfp1ZKRWcAYXkCN/3kHpQJwl0lkO7FD
	ijOL+n8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMPl-00000009NRc-2x3M;
	Fri, 23 Jan 2026 19:01:49 +0000
Received: from mail-oa1-x62.google.com ([2001:4860:4864:20::62])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMPi-00000009NRC-3Gn3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 19:01:48 +0000
Received: by mail-oa1-x62.google.com with SMTP id 586e51a60fabf-3f9ebb269c3so1165930fac.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 11:01:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769194904; x=1769799704;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cT5TBo/dI90+wcDSKNtZ1iy//ljekx3o3pFpFS1CjKM=;
        b=jQaiFTt1l1zn9bB+HXpakcaMYZcEQ/xuL+MEHRuaMhS2d5mStEQ/4oo+5ynEoBkOZe
         LLMbCERUJMPXzmUfHJ/OljcqyYp3I4a3eOxgKEs0kJfHniflzWuHs6EuT2z4p40nIDBR
         I/w0B8hy18TKN6ZQidMHHD0ll/gS+8J0Jd42JqbSwRc98DX8hEwX2pSC6125e29Aultf
         ZC9Opjc16vhmW9VXRqE3WRCo1sgYCZY2u1uw7ZcC+hZtRKulnUN0+y3pDqbRyfjA3M1J
         p+yg/dK5xchVowCBthx+XXL2vB7e8s+09aKsaFVuVp1L4BaeThhNgpOVqPmXjX8ABimf
         9+ww==
X-Forwarded-Encrypted: i=1; AJvYcCUoerZzioic7cbUSLYhsqKznFYq69I22+ZocA1RupGaKRocFWmbD2WItVGggDS7BKJhGPX47XQAnf6M3xZB6mgh@lists.infradead.org
X-Gm-Message-State: AOJu0YwoSou3sZKGE+9AvDlqlNjIqF2ZCMi+QRhtnLaH6JRe7zvvC0As
	KDWPQd7r+/6e8qeAJWCxIxaM1+j2OKtQoLkKkS7QxxRQYZxH39AhwK4kM/sjzT+1EbkPSaFuB7N
	QboKbYJIsb6qsFJq0YhCoC7aAzeeeJQG55Fa70CoZaJXwvBZgGobRadFCCgyVxu7hGM0YDlySN5
	Jj0PdiX+CkZcbmAQUBwjb3LC1Y6eGkO4CV1OyV2Bl9SrvycT024H0FsvbnMoDbxxjyQmDX7vpXQ
	0PAA+0b4PgChfrF+vkfKaHi5Cwlvq1oKto=
X-Gm-Gg: AZuq6aJNYpWmIKoxtIB2kGA7/ba05y+EPfgtQ1ssfxm1HW9CHIhidELIynVmCyNHKSq
	vSGOfAdVG8b2kMtlHewS012vAgqkY97GW937QPwsWUcUtRwG4PkiTQe4ey8kYxlG5KrWxVQ3QB8
	c+r6bdF5e6DKRvJB/QOKglsMAXT4n1JYpCpv2hFaHJ3eXrjw+ueaG/K7gt8DQ5CrAnaHqvud+j0
	DKCIiEZCRLwaxDFVoifD7hk1RT5DqvCbDUZNE/Epmp2x0QEJR94AZkTCLWumqVcnb5MV1v2xUIF
	SnNYIkrKuOlhNY7670soTzocguBWoAUORyJw0Qg/ZimDNZo52CIny42eJmInHuCjcbyFt9NNfVc
	RA4RCWQTnR9Hi+wvQCkksEX7xGxZ9+OqMfssjYR5pjwWSZ3yi7e6Q+ZmHt2C1dzNZWBbw6KsT7l
	HOBxYjKJsnH3kXUavycVimE0iADnb27nTf5l6fJcaMgsf3iBclCcFj
X-Received: by 2002:a05:6870:b50c:b0:3fa:6ac:ec6f with SMTP id 586e51a60fabf-408ab6a47e0mr1996121fac.26.1769194904217;
        Fri, 23 Jan 2026 11:01:44 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-102.dlp.protect.broadcom.com. [144.49.247.102])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-408af888d37sm310147fac.6.2026.01.23.11.01.43
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Jan 2026 11:01:44 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b7174ab5faso2755340eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 11:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1769194902; x=1769799702; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cT5TBo/dI90+wcDSKNtZ1iy//ljekx3o3pFpFS1CjKM=;
        b=P7aBAfuk6V57UY/kce7TTTyySz6aMpLi+sR93NP5IlRlJflB4lZVTOuclBg/L3SH4q
         EQyD6jmHhNrZipTknHuqVdcAD3ejEJFRG03Spn3UYqwjBW+svQmGK4a91VQqYK0u+PrS
         dzvlHlsgCIG51enbluOWxLQzbKReP2OXCqcjI=
X-Forwarded-Encrypted: i=1; AJvYcCVl0KubNTUswzNL3AQKbQVEWujUTP/ZLLw2NtRlT5xO55K4x0d1AHW/750vf592Wd83F9k3ZIIyWKcttJ0G6R3t@lists.infradead.org
X-Received: by 2002:a05:7022:248c:b0:11b:2de8:6271 with SMTP id a92af1059eb24-1247dc0b07emr1814345c88.39.1769194901686;
        Fri, 23 Jan 2026 11:01:41 -0800 (PST)
X-Received: by 2002:a05:7022:248c:b0:11b:2de8:6271 with SMTP id a92af1059eb24-1247dc0b07emr1814325c88.39.1769194900947;
        Fri, 23 Jan 2026 11:01:40 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d91ca0fsm5379709c88.8.2026.01.23.11.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 11:01:39 -0800 (PST)
Message-ID: <ad346f69-c2f1-4319-ad59-cadbf2554322@broadcom.com>
Date: Fri, 23 Jan 2026 11:01:37 -0800
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
 <ba9005ab-f757-4018-96ed-a10bcef08165@broadcom.com>
Content-Language: en-US, fr-FR
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
In-Reply-To: <ba9005ab-f757-4018-96ed-a10bcef08165@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_110146_917976_E011CC5D 
X-CRM114-Status: GOOD (  19.18  )
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

On 1/22/26 11:26, Florian Fainelli wrote:
> 
> 
> On 1/22/2026 11:17 AM, Florian Fainelli wrote:
>>
>>
>> On 1/21/2026 11:36 PM, Andy Shevchenko wrote:
>>> On Thu, Jan 22, 2026 at 3:06 AM Florian Fainelli
>>> <florian.fainelli@broadcom.com> wrote:
>>>>
>>>> From: Doug Berger <opendmb@gmail.com>
>>>>
>>>> The irq_mask_ack operation is slightly more efficient than doing
>>>> irq_mask and irq_ack separately.
>>>
>>> I would refer to the callbacks as
>>>
>>> .irq_mask()
>>> .irq_ack()
>>>
>>> et cetera.
>>
>> Ack.
>>
>>>
>>>> More importantly for this driver it bypasses the check of
>>>> irqd_irq_masked ensuring a previously masked but still active
>>>> interrupt gets remasked if unmasked at the hardware level. This
>>>> allows the driver to more efficiently unmask the wake capable
>>>> interrupts when quiescing without needing to enable the irqs
>>>> individually to clear the irqd_irq_masked state.
>>>
>>> ...
>>>
>>>> -// Copyright (C) 2015-2017 Broadcom
>>>> +// Copyright (C) 2015-2026 Broadcom
>>>
>>> Shouldn't it be rather 2015-2017,2026 ? (In one case when I updated a
>>> driver for Intel, I went via Git history to gather the info.)
>>
>> Ack.
>>
>>>
>>> ...
>>>
>>>>   static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
>>>> -               unsigned int hwirq, bool enable)
>>>> +               unsigned int hwirq, bool enable, bool ack)
>>>
>>> This type of interface is usually discouraged as it makes code harder
>>> to read and follow. Since there are a lot of duplication, I recommend
>>> to move the ack op to a separate helper.
>>
>> Good point, knowing the order and what set in those parameters can be 
>> confusing.
>>
>>>
>>> ...
>>>
>>>> -       gpio_generic_write_reg(&bank->chip,
>>>> -                              priv->reg_base + GIO_MASK(bank->id), 
>>>> imask);
>>>> +       if (ack)
>>>> +               gpio_generic_write_reg(&bank->chip,
>>>> +                                      priv->reg_base + 
>>>> GIO_MASK(bank->id),
>>>> +                                      imask);
>>>
>>> Id est this piece...
>>>
>>>
>>>
>>>> +static void brcmstb_gpio_irq_mask_ack(struct irq_data *d)
>>>> +{
>>>> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>>>> +       struct brcmstb_gpio_bank *bank = gpiochip_get_data(gc);
>>>> +
>>>> +       brcmstb_gpio_set_imask(bank, d->hwirq, false, true);
>>>
>>> ...and call it here explicitly (seems the only place for it, so it can
>>> even be just moved here without an intermediate helper).
> 
> Actually we need it to be part of brcmsftb_gpio_set_imask() because this 
> is where the guard(gpio_generic_lock_irqsave) resides. I can't really 
> see a better alternative, short of create two implementations: of 
> brcmstb_gpio_set_imask() and brcmstb_gpio_set_imask_ack() which does not 
> feel any better than the proposed patch.

Or creating yet another set of intermediary helpers that are not 
including the locking, and then using them in places where the locking 
needs to be used, yes, that's probably the cleanest, let me do that.
-- 
Florian

