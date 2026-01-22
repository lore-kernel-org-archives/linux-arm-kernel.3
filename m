Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6484D6CFA2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 19:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1gfDRebGX8h9HwfZ81icDjDx7dxW6g0V3ctKkIDrxQ=; b=hbN4PfpJ1HF8Rk9p81cBo1gj78
	8kouuS1EIX5gY2NdN5S7Xcr9qwVohNSnKTOYyb5CdsTckLMGu1Uc+8RRUXZM0sxDY4eLQZ1zdPED6
	Ca707NPDIBjIjZK05CclEO2HHxwaU1leFXF9hATKkxoyzdAEmSXKMsCEgy6Re/WzC1W8eYKOvuYqB
	4sZdeXw4q/whkM6gR8tktJBc/opz1cKiGkgZt51xlwYtfJ2JABnRa3JB9Q8DlTric2Q3pQyH/v2mx
	9KnfqvNW6RqQcKJReAZr5Z1BEyM0KCh7hcbOzzLzIjJQaNoB3JEwsKWj/wYQx7kjoOC/5A8t5fapK
	VeoF84vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj0IN-00000007h5f-2ol7;
	Thu, 22 Jan 2026 19:24:43 +0000
Received: from mail-dl1-x1261.google.com ([2607:f8b0:4864:20::1261])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj0IL-00000007h5B-3ABt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 19:24:43 +0000
Received: by mail-dl1-x1261.google.com with SMTP id a92af1059eb24-121a0bcd364so2462691c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 11:24:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769109881; x=1769714681;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R1gfDRebGX8h9HwfZ81icDjDx7dxW6g0V3ctKkIDrxQ=;
        b=sJ8vnl2KwnD1PoTXono8JErZWkUWg2Wonb7Rq6R7GlAIbMjq01Np39jPgw6pUjkCYl
         ka7b4lIRM3FHJQFOjEqXfKGPCMKkJ8BcsXQgRlKiH7HKLb3QtpI8/WOSd7UfHZDYn3k3
         fJi5ehE86j2qN9txocv8xu7qPVXXq3j37xgkgSTMcvOse+qbYZXJ3b2sa+UiLFcBajfK
         g2qyKd9X2Lz62Miu68BHvUraGH33OWUNHXAiozKHtuNkzMwIe7BQglmF4Fs49qlLBJ8d
         D0GuuOTOpAALVd1nGIuiYY0NC6dYKhuGmh0GjhvtE5jp4Ek7H096H/0vJNymv0u8x5Fu
         WrvA==
X-Forwarded-Encrypted: i=1; AJvYcCUTFC+CHn7TD/V3RaQX/ZpWslIRgjL7EQXVzEGJH8CytRJId3hi+NuTTLQHHq4QAh37p+DtpSMeCngdgmRS74sm@lists.infradead.org
X-Gm-Message-State: AOJu0Yzsh69O1pBh7tZnp+591OQd0VRquKXvfqRCmOAPA1BcKfXMYFa0
	GrTPbZ66N3cXIgokMmV9pCc2rb4/kdw4RGxY0awWnVHyXYqVe0ZqDDrxiDiFZox8KR0LPiwnCp6
	dxMDdKLiannQI8yGGnu1wHkMU39mROIegVVsqZRQRiYNEzo8T4hq0usE1OLlLHkKQP4mQNpSKu6
	NwIlFhq7L5KAkr+kh41D8xH8vQMMHxkiyNIdkxNQrGHV3ZOqCHr9cwJ6BwWQyZRWmKY+jdYB/T3
	eu5KRlHtv3qwkSy1Bp6p1Y4gaSEA9idklg=
X-Gm-Gg: AZuq6aLynmxZjxlaWasgog5xwySohnZIVMW/QQqSBDJpiB3z7K4xD0kkkjVP3qN153E
	2Fk49k3V7w8kJMPzQCCsHuPPMXEjxtnrH2Rvxm3iVlN7GEZHy3StmA1RHD98QNvfHmW8wYHMPuN
	mqVRcU31B7BTYeYxsHSP+5Mx1tfeT6nk8R9fW2VHtMaeuVG/wJNS5C1ViAc2t9TQwr1z//652sD
	19FxaTOm/54q77v9aMzBu8sH6xIhv3fS/Dlyj+AD4zjjJ7JB2oH8qmjVXI0b8xaWvgQh5DN2UFt
	m5bU0AO6C23bxWo627re6g53lw8vFTCmAnicMZr0TG10RZnlxV7BGpPZQoioX1x3B2MJLF2hy7y
	ks3ev0vcIXb5Cjyyz2iUUu8fA0HHsYAQDgZyrSXA2L+o5XKhW0B/EaMe+9Pla+gctY3owsHqTfz
	53t9ki+lxNi3zu/JBJdB2n9F4Tzpm2wJxrMVI/V/kBay5sC5M=
X-Received: by 2002:a05:7022:608e:b0:124:64a7:db0c with SMTP id a92af1059eb24-1247dc09391mr173051c88.45.1769109880701;
        Thu, 22 Jan 2026 11:24:40 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-2.dlp.protect.broadcom.com. [144.49.247.2])
        by smtp-relay.gmail.com with ESMTPS id a92af1059eb24-1247d99b08esm59753c88.6.2026.01.22.11.24.40
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Jan 2026 11:24:40 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b71c5826fbso1346993eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 11:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1769109879; x=1769714679; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R1gfDRebGX8h9HwfZ81icDjDx7dxW6g0V3ctKkIDrxQ=;
        b=CQbkoTPBmk5bM6c6xiU3r9/QSF7Avd1hF7VzTaHAfYSzDoVxWttuWjx9MmpatzOEE4
         bMXMzOZdGKuMmqlDMaEPTb1mpOrKsXQLApPq5jHv5/0PDAqakpU/1BZVA5R0ZzlgbXtK
         Jfzy9L7TYmHp5ZQ6+H8yg2bYrP3dpNNlb+24g=
X-Forwarded-Encrypted: i=1; AJvYcCVIq2tQ7aH98WodgVpJZOeY0R4FH3g5Ei34iASNWNz0G3X//jgy2QBahzqrMOu/uQOD9B443ez8vNf1AijSwYoG@lists.infradead.org
X-Received: by 2002:a05:7300:2150:b0:2b7:29f3:8db9 with SMTP id 5a478bee46e88-2b739bce1d7mr176225eec.40.1769109878699;
        Thu, 22 Jan 2026 11:24:38 -0800 (PST)
X-Received: by 2002:a05:7300:2150:b0:2b7:29f3:8db9 with SMTP id 5a478bee46e88-2b739bce1d7mr176213eec.40.1769109878206;
        Thu, 22 Jan 2026 11:24:38 -0800 (PST)
Received: from [10.63.25.133] ([12.75.221.34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73a6c4a68sm400450eec.12.2026.01.22.11.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 11:24:37 -0800 (PST)
Message-ID: <a7b2f013-965b-436d-95f0-8ce1e2ec0c41@broadcom.com>
Date: Thu, 22 Jan 2026 11:24:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] gpio: brcmstb: allow parent_irq to wake
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
 <20260122010516.1200630-4-florian.fainelli@broadcom.com>
 <CAHp75VfhEZ60F7ZHkjNDZ3JR6B6tNF5ORUDPoN8ZibbvF=js8w@mail.gmail.com>
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
In-Reply-To: <CAHp75VfhEZ60F7ZHkjNDZ3JR6B6tNF5ORUDPoN8ZibbvF=js8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_112441_797489_E010290E 
X-CRM114-Status: GOOD (  20.31  )
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



On 1/21/2026 11:42 PM, Andy Shevchenko wrote:
> On Thu, Jan 22, 2026 at 3:06 AM Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:
> 
>> The classic parent_wake_irq can only occur after the system has
>> been placed into a hardware managed power management state. This
>> prevents its use for waking from software managed suspend states
>> like s2idle.
>>
>> By allowing the parent_irq to be enabled for wake enabled GPIO
>> during suspend, these GPIO can now be used to wake from these
>> states. The 'suspended' boolean is introduced to support wake
>> event accounting.
> 
>> Signed-off-by: Doug Berger <opendmb@gmail.com>
>> [florian: port changes after generic gpio chip conversion]
> 
> Likewise in the previous patch I think this deserves the Co-developed-by tag.

OK.

> 
>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> 
> ...
> 
>> +               if (priv->suspended && bank->wake_active & (u32)status) {
> 
> Why casting?

status is an unsigned long, which is what for_each_set_bit() expects, so 
it is intended here to ensure the top bits are not participating in the 
comparison, I think this is just being extra explicit with intent here.

> 
>> +                       priv->suspended = false;
>> +                       pm_wakeup_event(&priv->pdev->dev, 0);
>> +               }
> 
> ...
> 
>>   static void brcmstb_gpio_shutdown(struct platform_device *pdev)
>>   {
>> +       struct brcmstb_gpio_priv *priv = dev_get_drvdata(&pdev->dev);
> 
>> +       /* disable interrupts */
> 
> A useless comment.

Indeed.

> 
>> +       if (priv->parent_irq > 0)
>> +               disable_irq(priv->parent_irq);
>> +
>>          /* Enable GPIO for S5 cold boot */
>> -       brcmstb_gpio_quiesce(&pdev->dev, false);
>> +       brcmstb_gpio_quiesce(priv, false);
>>   }
> 
> ...
> 
>>   static const struct dev_pm_ops brcmstb_gpio_pm_ops = {
> 
>> +       .suspend_noirq = pm_sleep_ptr(brcmstb_gpio_suspend_noirq),
>>          .resume_noirq = pm_sleep_ptr(brcmstb_gpio_resume),
> 
> May we use one of the PM macros for these two assignments?

Sure, can do that!
-- 
Florian


