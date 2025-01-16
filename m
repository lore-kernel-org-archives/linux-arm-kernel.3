Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C831C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 17:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdSRLH407KyVo9i2OulrASDf2FZjUK5HxCuQksYb0AU=; b=Q4IQX+ibVGuFK+CE/tr10EfSeW
	uv6BkYRGST/dTRTsKAtjeOvndN8vkOyn9EzGiXXONaMECHlegfJaek0z8OrszRA1GffBb2tfENJoO
	1aTyS6ojcfw+M4yTGUAbAy2UneGxQEgof+f+EYd9HJ56lM2H9bbSsH6Bw200jZTrFYoPu5NETAE5g
	l1cMZXNcMtaEV7APMheDoByMxRgOnvSCb1jxcKL+AZHH5H2VMqpP6ZlgBRKSOT05oSB1j5fcmtIwF
	tlAigcvbGS/JoGYwizzYDzB0Qrb01V3exTb5iXqr2A9Do4Yqyh2tBexHcR8WhuIa7qFZ+TWoUZbZd
	oxIPa9oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYTxb-0000000Fizq-1ItT;
	Thu, 16 Jan 2025 17:47:15 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYTvF-0000000FiWJ-2sB5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 17:44:50 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2f13acbe29bso3862265a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 09:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1737049489; x=1737654289; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KdSRLH407KyVo9i2OulrASDf2FZjUK5HxCuQksYb0AU=;
        b=LopH2bWW7y1yM99UN80Iw5fRyk62u83IaIlpxhj2xoa+cSBLzV6elMSOybjIr2yQdD
         v2yRfmlQvyU2Bp4IPRchWBEBhLSP4cBkOzCQEUmoB+wpmRZl2jkAi0d+gUjBikCXhntc
         /+K1wkugdvfJBZoseklf8Gpu57tF52vTQylIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737049489; x=1737654289;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdSRLH407KyVo9i2OulrASDf2FZjUK5HxCuQksYb0AU=;
        b=ORfzZlXcHK1HFOlgvCKpyeigjkj8phgZ41yXKzwJHswpMSSUFlRryeXxPQHlBWEiKs
         c9EkXiVCNU3uzInz7+YtU/ikn4nNOXKwLJf1kmraQYDSy4l3nq5yUiDLairEaY/JnpqJ
         vUJPQaT0gDtpfFWvNc8wpnSxgvasn5LHJX2f3kaIeXaWYwBcMbdSEkRA6HW8sTDWTDwc
         nrUJvrZMNUvRgf/KnKzfYoVSZ2JlGoGHeuy4X7nZ41RQOL7jzyE6BvK8sI+LUNnrpxIq
         6y6qn7O/918SJ0TeKVcauekrJy0yedkpjF+LlUkFJaN7PtBhZNImr8yUWS9ZW11oaP0L
         eVpg==
X-Forwarded-Encrypted: i=1; AJvYcCWV/w1juRIjv3MiSH5V2fXudD83jCgqXHIkAf54/XGKImsF9biEBWU0zmHiBv+sj7Vtp+SlJdoC6khzt6LJGO8l@lists.infradead.org
X-Gm-Message-State: AOJu0YwKHzHp6DVE8Vlxh/iGrunoE75771ho3vY1yGXQdSl/ce8MXdab
	Sdj57/fGfNbuNzHlXoEhBVyjNC4wVRc/yU6odmT2A9csaMPfIUeIOFTRv6SvRQ==
X-Gm-Gg: ASbGncsF6yn2aAUrbxPjOO5NKakOgXjXqdNdz50bOtPCZc6AgMbkAehUgyHYMBRYJO9
	YTznWXCYANxahGb4j9zGmWNcgXVBagC/cH9YJgqaRJqBT7Hd6Lw+8r0UbxvUnLEckzKRyn0nHHr
	Gz2mhwK72ViEIGUFa8bs7EgGNqM3KPGoLcurCkUBGb7+OBGK/7ePO7tuCC2vctLMg0Sb4rRrFHV
	5RU/02A1c1GJ0gqcFCxq07w80J2bC7E9ynez9HWwxtUue7BYyQZmpPp5x1RB5kKx/kuG0ow811m
	69kyFxxj7QssWUgbhr8h
X-Google-Smtp-Source: AGHT+IF+4R047Qzw4YHErXGtCBTYRApVnqgB0yLlDA9wlrkzE9bOj1bHitVqKoHAvbYcAqI9I/GHDQ==
X-Received: by 2002:a17:90b:4d0b:b0:2ee:823e:39c4 with SMTP id 98e67ed59e1d1-2f728de6649mr11843030a91.7.1737049489060;
        Thu, 16 Jan 2025 09:44:49 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f77629bf96sm419605a91.36.2025.01.16.09.44.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 09:44:48 -0800 (PST)
Message-ID: <07602a85-8ac3-4538-b2a0-65d917de6ba5@broadcom.com>
Date: Thu, 16 Jan 2025 09:44:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: bcm: rpi: Allow cpufreq driver to also adjust
 gpu clocks
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dom Cobley <popcornmix@gmail.com>
References: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com>
 <20250116-bcm2712-clk-updates-v1-2-10bc92ffbf41@raspberrypi.com>
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
In-Reply-To: <20250116-bcm2712-clk-updates-v1-2-10bc92ffbf41@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_094449_732778_D72A146F 
X-CRM114-Status: UNSURE (   7.70  )
X-CRM114-Notice: Please train this message.
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

On 1/16/25 08:24, Dave Stevenson wrote:
> From: Dom Cobley <popcornmix@gmail.com>
> 
> For performance/power it is beneficial to adjust gpu clocks with arm clock.
> This is how the downstream cpufreq driver works
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

