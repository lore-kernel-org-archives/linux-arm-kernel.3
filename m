Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D7AC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 17:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Drh/AKRgmJ45wLb23S0mcSch3Lc8mZPLWiINbN0C9w=; b=yh4oxnZuqRi6DPu5D+FvfvJ/d0
	st7BXcAP/2d8eHJZxqZ8VMk3sAJ0yvjf7g6+Q4tgcIkg2koeGKFSYwb9iKpBeK4AlivXIKsIcaT+i
	RBgNLzAptMqVRzsRsM6XDPLRqf1kENJP7+Ydw5+fHHrkxybe4ZzM52okZC4TO0Xujr2W4/F3Q15Eg
	Evzuxo9OFgHgX3644LR/xH+VQepdpt44Q32iiTl5Pc2cuMeX3Ghm1/aTm9QBM6dunUyq6VSzcLAcB
	qRzg3xoqhL7CyUHYKMyHtEK+pm8ZeM6Xr/67BW5Ht9NS7o0+UeujKiYUL+oA8wndYOH4Lb/vlwmws
	uOX2fRpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYU2e-0000000Fjzp-44N9;
	Thu, 16 Jan 2025 17:52:28 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYTwH-0000000FimY-2zlN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 17:45:55 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-216401de828so21631755ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 09:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1737049553; x=1737654353; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/Drh/AKRgmJ45wLb23S0mcSch3Lc8mZPLWiINbN0C9w=;
        b=JEj5nbvhxECfb5n4szFyRiT5UeSuGOkEMHO7ozUBJEvu2bkDHbiuIh2ks0637I4SkE
         KrNjhNLe6Sfh0zydRENsFg9yGIWeTbCzmMVtR8jJhtwsPDJ6XBZ3hnYhyWfXu4O25cyI
         HM34MZZ4VMXE60yKDCA73PJfleSKvVtdJ1dA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737049553; x=1737654353;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Drh/AKRgmJ45wLb23S0mcSch3Lc8mZPLWiINbN0C9w=;
        b=Fi66bBMDuiG0d90LX3lRxRPatMkBw62gThQQtAWhteweDu4WSbgeofnKmqkAYZsPOQ
         4/itWFZyPD0IM7WXRXn5Xr2XIIHLiPubFbLWLTj1zZp7UrOeFhTjiDmxBSeOtt5YzRb8
         JcN/pIIXRilAOPoPPp6mA+eedOEQq4UbwU7hkhz1sJOxg5Q3iIFJv9oOiRYKpSjIy8pW
         m/2eAkaTzgolyMfLZbw7T6CLfTgXE5f7VvSIn5elyYlu5Ip2JmWBuW3Zd/xQanLROqzV
         mGWqjxL4TkUPtwb6a7VzI0fnKrK75SVMx6IOwiWZFy02zTzoq0PeADTgIygZ44hez/ZJ
         PHyw==
X-Forwarded-Encrypted: i=1; AJvYcCX7E4lmo/KXmrePDAsBTyEhMAjpojg9Ab6WRMXh2cP1StV7mh0nfCZGQJlEnLk73n96py8p6IjEz9v8wJGke996@lists.infradead.org
X-Gm-Message-State: AOJu0YwCCmpzfzfK6higk4hIPcANe5JgulbP+hCHWc+PCBf0HnE1Dz+Y
	nPwVpRBYp7Qgg5tLLBulSFBchb99koO78TbHs/3n1MruhfYhBpHjQuJVZH1xdg==
X-Gm-Gg: ASbGncvgtXIbhfsWm9rM8gRmo6CCJF6XtbFE4G0+Gvzi6AxmwEqRMmzW7aLLAVbPcbN
	acQl2bm5Qqm4nTDctUC0VU9DbnTvM4GfrgStI45pgPKy35NEDjt7WoZeVBIXBRW1Leuptn9gD9R
	wM4RAcRgKiFGdxlq13n2CXX/cUYl2IrIB6VeGvgwCP5rbZ3n5M6pfQiBthRNs+HZ+rJzfQz8vJv
	QlcPM2Veq6UE9H7KidVzeGhSjKVglVOtCliU8Q8304sbc4Emxls/jLZ9mMKuv+6gCmI6BtdZ/o7
	N92zKTmQLUPNXyw2zizG
X-Google-Smtp-Source: AGHT+IEskbseMrNOLzO4Ty9QgYY/5V8mUDrEI0MQIq5RBcUkt4Ka9C0lmr7fyEy1Y83gdeJwn6nPiA==
X-Received: by 2002:a17:902:e5c2:b0:215:6f5d:b756 with SMTP id d9443c01a7336-21a83f36e79mr450089655ad.7.1737049552978;
        Thu, 16 Jan 2025 09:45:52 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ceb6fa4sm2986535ad.53.2025.01.16.09.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 09:45:52 -0800 (PST)
Message-ID: <af83c932-3fce-4814-b20e-8445138a4532@broadcom.com>
Date: Thu, 16 Jan 2025 09:45:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: bcm: rpi: Create helper to retrieve private data
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>
References: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com>
 <20250116-bcm2712-clk-updates-v1-4-10bc92ffbf41@raspberrypi.com>
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
In-Reply-To: <20250116-bcm2712-clk-updates-v1-4-10bc92ffbf41@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_094553_755579_E2F88AD1 
X-CRM114-Status: UNSURE (   8.04  )
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
> From: Maxime Ripard <mripard@kernel.org>
> 
> The RaspberryPi firmware clocks driver uses in several instances a
> container_of to retrieve the struct raspberrypi_clk_data from a pointer
> to struct clk_hw. Let's create a small function to avoid duplicating it
> all over the place.
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

