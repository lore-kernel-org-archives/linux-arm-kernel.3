Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B82CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 16:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+S8ZLZuYEUhLxGBz9GbCPGNtlCQmD7r9ewmiP5lWBxw=; b=wd1jQfv+1zj/Fz1JNnKIL4kJKO
	gniuHLk0yFQzIvcWglyZ9UfhGoWw0gUe9ktzog+HaITh+kLHIJjkTiLYVMh+6PnsLSbCLOCMW4M2Y
	nbZ9yJ5WL2l8/IZQLOrDZK94AtVZrSUTbD9SMxtoGOemIt3MXV9iTgs5KqetQrQG9oyX3cIx6PvZW
	A9BuLBYu+9LFm/VfS5+8czuKDirWezlZtisV+pQwJGyiEQRA7dAolhHMHCNkjrdWMjivyeAZaseHH
	CoebmqSpLCHHe6a5YPIRGgTzjfC9tYC9qawoJrRSz1lDXIsZceYaacvmhoX246oM908nDHgZVkqsP
	zVU9U4Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJJp-00000009vPO-1SZf;
	Mon, 13 Jul 2026 16:15:45 +0000
Received: from mail-vs1-xe63.google.com ([2607:f8b0:4864:20::e63])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJJm-00000009vOJ-2dlI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 16:15:44 +0000
Received: by mail-vs1-xe63.google.com with SMTP id ada2fe7eead31-7380954d1c6so1205711137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 09:15:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783959341; x=1784564141;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+S8ZLZuYEUhLxGBz9GbCPGNtlCQmD7r9ewmiP5lWBxw=;
        b=Jfhd4m6+sh5VFu5t0LFaPS9KHqJlUXknO3mKsM3B18Z8m3A+C5J8q6806dU+3DBXDM
         KIw6dva2eiwKd9JgJP9lDC59+cJ3HAoE6WL4d0hNuBQAxOva84zKNZiVdZ7CaEBlGYeU
         qIXsIfdNjSlHrI3IEpbrAECRXsMDBjQnz/PWBsLq1Gxak7vBW+TTHwnRy7zeDGLy+u/B
         SXIdCDWzsCGYEZz/QeLEdTsByGpElwMKDZUB7rUhouNb9HHPEZ+ojH30ThxNb/t2q5us
         mZBRQMsvXNlSQCz4tgeVgCrOXhUde1VTmyWDbAdliK9jJlj56lUXFt6UlnvNJSlMnNNR
         tVQg==
X-Forwarded-Encrypted: i=1; AHgh+RpnzZAptzmhZDi3tez4Ync95w6mg8HzpdThjaXz0VgrhEX7LPN4oz806pIJSjfHdkhfCuCCtSlGV4ilIwj9p1KU@lists.infradead.org
X-Gm-Message-State: AOJu0YyaX2Zer9S9JRVQ7zKhegLLLJqgCUPdaX6PBb5rpseB91dQXRKZ
	EPBRVV4onsQvqhtOXby/g1nc4+E4BCKu1i3XnZNFPgs9fZ+Mx7gVJpnMEn1Rpm8HCKOT2OXAiMU
	YaHxCbNSZajcly3fEE9dBQGm9ThVS6XzBgHjZqyNlohZ/hcZ3dHnLoipbNiIJh1pNdgHXKD41Ia
	zqih/y9i82FKeTCRD8F0Nrr+IBqf6BnQzrgzNzJwylgr6bOZTcnKXEnojq/m4THl0nAGq4DCPBg
	iTd0BFa+4rpqrX6TwVozO5AglAwEgaY3xI=
X-Gm-Gg: AfdE7cmI127HhWIqSGOB1ntSIEYHxbvjN3yfX8Y06FnI5AhdCSX+ubC1a1rhqw2rbxn
	FRK7yViA8kyumL+WZnVazxQ1VPZSuJyLIRD7De2CVp3BR32TiFcJ+bD2z9YNJh+OUY6vrSsO7ZG
	q4hJO0AyRlM5NhqC2WwOSdVZC+mUhI9s+kGie5Xnt4E9/bNT6BQhipT5dEiNRkojOj094vLlqyz
	PI0WTp76hcRORPXWFwjbsGqNKQH5lVvBD+mlZ4p4MdyMNPJG613wqbxgLcjPSKbXILUW+fkoYEi
	rTxdWbk7VCidwV3aUuZHiuiaX02hakZlHfes3FjfYCDYYRaODPC4W2cKkaaAO3rb44ww9xAJNxg
	TXyMvkI3Q6nivXt8x15Dp6wSn4YEYbMXLBwWwa6c+d7iB2cxFNrulEWvj4uBPEVc4pGlnkjTqSq
	MYhZjSK1u6UnOp3WBofB1JO6tSyEZg8AobDTt8xGKymyfRxK3p
X-Received: by 2002:a67:e701:0:b0:738:cdc6:f59a with SMTP id ada2fe7eead31-74533bc077amr4644535137.9.1783959340792;
        Mon, 13 Jul 2026 09:15:40 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-6.dlp.protect.broadcom.com. [144.49.247.6])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-744d6ea3857sm1358130137.24.2026.07.13.09.15.40
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jul 2026 09:15:40 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c19493ac2so47166521cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 09:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1783959340; x=1784564140; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+S8ZLZuYEUhLxGBz9GbCPGNtlCQmD7r9ewmiP5lWBxw=;
        b=KrArP6nPmeTYhQt/OhJ3v5uHQ3D8pjnDWOjYM/iOdId1/SSeGI3mhFte7XSwG9u0jT
         b2JlZ3IFMee+EmNDbzbrdRSh0UroKwE2sdgz44fmV21dgL7XjuZbK6yOy6y14BmUJkHY
         7TcmYbpGb4y3xo34zCFvjSBZRsqdjHosJ0C/I=
X-Forwarded-Encrypted: i=1; AHgh+Rq++XbMkUNxde3SZ2Yx3gK4jvSLHIxW9ToVnmfBNFvYJT6NA4xTUedU1dWX8KMxA8w2Gir+IR/ekB2lXr100cmP@lists.infradead.org
X-Received: by 2002:ac8:5fcd:0:b0:51c:7b11:41b9 with SMTP id d75a77b69052e-51cbf3304admr95112351cf.85.1783959339566;
        Mon, 13 Jul 2026 09:15:39 -0700 (PDT)
X-Received: by 2002:ac8:5fcd:0:b0:51c:7b11:41b9 with SMTP id d75a77b69052e-51cbf3304admr95111761cf.85.1783959338898;
        Mon, 13 Jul 2026 09:15:38 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caab6e33csm84054751cf.5.2026.07.13.09.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 09:15:38 -0700 (PDT)
Message-ID: <1c23b437-609c-470a-8b14-34288cb5aaa3@broadcom.com>
Date: Mon, 13 Jul 2026 09:15:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/arm_arch_timer: Workaround bcm2712
 broken EL2 virtual timer
To: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: John <therealgraysky@proton.me>, Daniel Drake <dan@reactivated.net>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>
References: <20260710080958.491620-1-maz@kernel.org>
Content-Language: en-US, fr-FR
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
In-Reply-To: <20260710080958.491620-1-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_091542_695786_8FBDE683 
X-CRM114-Status: GOOD (  17.75  )
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

On 7/10/26 01:09, Marc Zyngier wrote:
> It appears that the bcm2712 SoC found in the relatively popular
> RPi5 has a broken EL2 virtual timer.
> 
> We do not know the reason why the timer isn't working (the timer
> is ticking, but the interrupt never fires), and the SoC vendor
> doesn't communicate on the reason why this isn't working, leaving
> users and maintainers in the dark.
> 
> Paper over the issue by detecting the broken HW, falling back to
> the physical timer instead, and let the user know about it.
> Also taint the kernel as the machine is definitely not compliant
> with the spec, and we don't know what else is wrong with it.
> 
> Reported-by: John <therealgraysky@proton.me>
> Reported-by: Daniel Drake <dan@reactivated.net>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Mark Rutland <mark.rutland@arm.com>

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>

We know why now: the virtual interrupt timer line was never connected in 
the first place because it was not clarified that it was a requirement. 
I will also take the DTS patch through the Broadcom ARM SoC tree.

Thanks!
-- 
Florian

