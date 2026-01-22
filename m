Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA631D6CFA1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 19:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71tizYyQqK+qEeiQ91p1bi+H6ziLWzyeylLQFrcF44E=; b=bkvOduLPpsq/hTFIfM7Wlflgfu
	TZdKX1SyzAYAQByq90+Tgfv6Zh/82HqTuw4cQuRo62l9IPRsuuRa/5MZk8uMfnNzZS6TRHhcXXIqo
	N2XxBI75W/87cI+BlzANj9QEu6Gu8QO6XCRPyzfLD7qLBx3IYxwEU9G2tw54KjXVuRBeNW1aMoDB+
	tdqPtWEzXdypD4Mi48mjcXPRTvdqXXGwTcMUxyqynIj3hRG8+qBUhuZ3tdezUbXm5TFKi3yFBhqig
	bUbne6DWw0OMyD5QA4Q8DW+7GxVWHMrU8gugCKO4yvv0zcdZ/24RUzZZNmK7/bwEmsDBLHxEbgmRl
	4HaexYxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj0BU-00000007geL-2NLR;
	Thu, 22 Jan 2026 19:17:36 +0000
Received: from mail-pl1-x661.google.com ([2607:f8b0:4864:20::661])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj0BS-00000007gdx-01aB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 19:17:35 +0000
Received: by mail-pl1-x661.google.com with SMTP id d9443c01a7336-2a09d981507so9377975ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 11:17:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769109452; x=1769714252;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=71tizYyQqK+qEeiQ91p1bi+H6ziLWzyeylLQFrcF44E=;
        b=XJE9q25gA25m45tfTtVWmRdJvp26hII4efk499c5tHG/uG/Ds+Lhzzw5NjikZDe5Lt
         MBpLJJDTrhVbulvutg/WI6iJBf/ylUjUSk/ldyGWzpNTyvlOUyglbLA19ntlF7oVDjAa
         69bnCqBKsUE1XxhEaG53G9oDK4gOxH+GqLl5DuXaCAOJXB5S/rPqY7RiJ1mLdMo+3Kop
         yL1md6bvnN/1/h6JW1XRL855uA/1ULobSU0QWTfUfvsTVl87dEA1mOb6/DR3A0fdbAnd
         TdN5hNUdAD3cB1hyYMmBUKhtwLHTYTKlxXe6eW3k/E3ri1zxhytPwSq/v8S9BgBC0YvG
         5JVA==
X-Forwarded-Encrypted: i=1; AJvYcCUU9ICtVVTibgq8oz/8RF6FrHXm3eIhTL3AIJy3E96PlWl2p2HU9LdzNm0NViHesG2jL6GbIZzH6oD0fLyJDd35@lists.infradead.org
X-Gm-Message-State: AOJu0YxruwfccrtbCOxT+k7pyliCHPt8XxQctOhUKGHaULgFiu0hjpuq
	uO5aBHMur/twek+uZAuL+GbL3BbL6X2Jd7kNrW/qPaPQUdMcj6Dj/qY8JxOhefXP2i5X1+KFqm1
	9Li6KfD2SE9ResHzffdNrspQdriJ4QI4AmV0+7GqQwqE5jGzhZt4ZwTput3f39f1cJ/lfbe7wzq
	ToKl+k6W3oHGPZcZB7FTLZ8F/SxHFQ001xU97mGpoSvGcgNrMiEApwSAxXPueU+FfFgyyxtAn+l
	+TJdG1f3S9mMdYCSGIUSUa4GlGeoPHrTvs=
X-Gm-Gg: AZuq6aLEhtfYgi1HHBv4U3p1K15Y9oLdp7j4NxtQRl/JHAr4r2OsYAQNsAtGwt9Udlj
	o7+bxyNQAd5vU0z9cfOMHPrcnCIMA0DgCrVrwR4bDJWZYmtL8QPh7o9iNYhEeQ0N9rxYe6Twzy8
	eaIvUA/hEbeL73qGAXcpqcB4NcHN6NugjvHvJF5cA0j77EW54eS/qyeuBa9x6DYUw9lJzACXAf4
	BYxgxThHshwBTpD5eRhprPH4zWD9l/HqFjIlE7HBab7021Ea/6mFpQpNkjI8uatBdZS86q6sh7m
	8342Rzdsd4GpyNly8ZRXtp732AB4keqcug0Gbg9gjLCfS0rXaSZ3qeHAV+KzSbwDw0BrK+WQD+l
	OZgCcXX+f7upVl1IrE6vr4UD1bmiB5Z8s/52FlHN6N4fYICZqu0HSWK3VOu8ISxjZmRzUf5cbzT
	fjbzL9GVQh8qNJaHjbzfx+8m+QP3wZoiBgcNWKMtoo2BOvBn5O9A==
X-Received: by 2002:a17:902:e744:b0:2a7:cb46:7069 with SMTP id d9443c01a7336-2a7d2fbaf36mr31617855ad.25.1769109452451;
        Thu, 22 Jan 2026 11:17:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-11.dlp.protect.broadcom.com. [144.49.247.11])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-353354ba8b2sm486157a91.6.2026.01.22.11.17.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Jan 2026 11:17:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-11b21dfe918so993089c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 11:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1769109450; x=1769714250; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=71tizYyQqK+qEeiQ91p1bi+H6ziLWzyeylLQFrcF44E=;
        b=YBVP4WuyOIsqP8/7CUi3/EuyXcDG0KCOV01rpMDoM7H8EQ3ZIoNXP+ADXyizdGOA2I
         qxEV66ShZjB6E3qzcaOqpzIg9+AlXq3CNdHYlsSk09UURUbVzTF/K5ERBouDa438xE9G
         J4xpUj9RjRb8I1b9tO+2vmjsndsHHr9E3TfRo=
X-Forwarded-Encrypted: i=1; AJvYcCWq/3cZnn8zRhIE+QEFqW9MCozs1258m5FFwGhrCPe0G/yXFPLni4XBSiEqxOn+CO8I9N/9FouTN9AXwIwhTBqF@lists.infradead.org
X-Received: by 2002:a05:7022:613:b0:11b:c86b:3870 with SMTP id a92af1059eb24-1247d74215cmr260418c88.4.1769109449829;
        Thu, 22 Jan 2026 11:17:29 -0800 (PST)
X-Received: by 2002:a05:7022:613:b0:11b:c86b:3870 with SMTP id a92af1059eb24-1247d74215cmr260397c88.4.1769109449292;
        Thu, 22 Jan 2026 11:17:29 -0800 (PST)
Received: from [10.63.25.133] ([12.75.221.34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d997f7bsm611297c88.11.2026.01.22.11.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 11:17:28 -0800 (PST)
Message-ID: <cb4ef2ed-ba94-4475-b02a-5b6e39943e81@broadcom.com>
Date: Thu, 22 Jan 2026 11:17:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] gpio: brcmstb: implement irq_mask_ack
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
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
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
In-Reply-To: <CAHp75Vc=ejHPwA05MHBxJQdJWv49pcuTNax0VikXruvwVM+Y9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_111734_089174_8C2991B6 
X-CRM114-Status: GOOD (  22.35  )
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



On 1/21/2026 11:36 PM, Andy Shevchenko wrote:
> On Thu, Jan 22, 2026 at 3:06 AM Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:
>>
>> From: Doug Berger <opendmb@gmail.com>
>>
>> The irq_mask_ack operation is slightly more efficient than doing
>> irq_mask and irq_ack separately.
> 
> I would refer to the callbacks as
> 
> .irq_mask()
> .irq_ack()
> 
> et cetera.

Ack.

> 
>> More importantly for this driver it bypasses the check of
>> irqd_irq_masked ensuring a previously masked but still active
>> interrupt gets remasked if unmasked at the hardware level. This
>> allows the driver to more efficiently unmask the wake capable
>> interrupts when quiescing without needing to enable the irqs
>> individually to clear the irqd_irq_masked state.
> 
> ...
> 
>> -// Copyright (C) 2015-2017 Broadcom
>> +// Copyright (C) 2015-2026 Broadcom
> 
> Shouldn't it be rather 2015-2017,2026 ? (In one case when I updated a
> driver for Intel, I went via Git history to gather the info.)

Ack.

> 
> ...
> 
>>   static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
>> -               unsigned int hwirq, bool enable)
>> +               unsigned int hwirq, bool enable, bool ack)
> 
> This type of interface is usually discouraged as it makes code harder
> to read and follow. Since there are a lot of duplication, I recommend
> to move the ack op to a separate helper.

Good point, knowing the order and what set in those parameters can be 
confusing.

> 
> ...
> 
>> -       gpio_generic_write_reg(&bank->chip,
>> -                              priv->reg_base + GIO_MASK(bank->id), imask);
>> +       if (ack)
>> +               gpio_generic_write_reg(&bank->chip,
>> +                                      priv->reg_base + GIO_MASK(bank->id),
>> +                                      imask);
> 
> Id est this piece...
> 
> 
> 
>> +static void brcmstb_gpio_irq_mask_ack(struct irq_data *d)
>> +{
>> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>> +       struct brcmstb_gpio_bank *bank = gpiochip_get_data(gc);
>> +
>> +       brcmstb_gpio_set_imask(bank, d->hwirq, false, true);
> 
> ...and call it here explicitly (seems the only place for it, so it can
> even be just moved here without an intermediate helper).

Will do, thanks!
-- 
Florian


