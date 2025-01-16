Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CC8C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 17:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXUWRfgVPfjqjzYqB9ylCsJuqBtySkaQuKmwFGwuG4s=; b=BchPYV/AOkWYa+soiRtMWi0eYp
	Yx3CnGX4r8qOnFMGJefG3LY027zo2TRnOLDtgAZ789ojwS1setswPnQL4vmIo08K2MKnENB7qOyzS
	eKn/A1UTwW+fX6dJHD77raElY3bM01LMdP5K/jIeUD0a/IXY9gP7bRvoYOe5iyUP8AtsEIBikJHED
	YosJEXIS0ibYr+2DANFJqGpTwYA3NC1aOHqjGnVz7ZzOle2y7utXoljlVL/8JL65d6K/+9N/O/bay
	Kn/EoheO2QNyhXRL6I0YBGGHmBzpn5iRfY74CeTbS9RFkxy8bvvVzpuNBs6sg/a+BZ0s76Jxf37AK
	AlF/yw8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYU1Q-0000000FjjH-1QBI;
	Thu, 16 Jan 2025 17:51:12 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYTw9-0000000Fijw-1Bn3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 17:45:47 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-216426b0865so21827445ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 09:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1737049544; x=1737654344; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wXUWRfgVPfjqjzYqB9ylCsJuqBtySkaQuKmwFGwuG4s=;
        b=ASefdBmZz7ZEzs95FiRvd+vHPKX2NVKxDb5A/UtaN6gi1xiDJ74HYxPoNg6a5nKP67
         iWXuXodesWgLmhDDpGVgDl8b4wsVEQ6AaExcnL15wooMQlNIqWPZqoB5dD0Sxe0CCcTR
         i4tnHVCBIkYsAKBN0BoIApsfyBpx910QtV6wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737049544; x=1737654344;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXUWRfgVPfjqjzYqB9ylCsJuqBtySkaQuKmwFGwuG4s=;
        b=ciNrBMNZoIhRC0WTJC1TjLMo/hdiGai+6dX30n67qg8uaBNc45hTfpqm0dxq5z2Uk6
         vnqlGpWI+1dPFEWWYGnLNuqdbRiSWKIAWRK0Cowa31U6pRxmL5gjX+tVxxyyzsYU/a+w
         PnLJufZVQAxRGVhq0OpY6JNY/cSYpvtk5R+7kS0w+51tg63OlL5SPEbpft+b8q6OYwOw
         aHYgt9drge4lCX3EnjHylGDYdF45nwCRwKlWM2Hv1wHJHM7sJ1uLp0kqz2ncyTI0zeKr
         ixauWKhzGm4G5+bebEVIt0CPxvNdLV7bj8BFC1ohAFQkKszi7WRQrQzGYkndIGM50N2t
         ZJcw==
X-Forwarded-Encrypted: i=1; AJvYcCWNHlqTxiQt5zq8QL86Q0+jQnaxbveSCMwtcLSlHSj5csvLjiW19jh+HoGiaEMud//olc03Tq291BZp9hGZNf3O@lists.infradead.org
X-Gm-Message-State: AOJu0YyJFVGGJ7jhGyA7RYd1NPTITEzduqrZaIgq2fJY/8hFTPBOoeh/
	Mx8lrJNffIgeQ7k90sduw+47JwlHIbGaCPqU3CNdATZQLn6IjTLwvLoZsU5J5g==
X-Gm-Gg: ASbGncsL4OH/YXv5JQxLoEBAsHQbBw8oa+stMSOqDPHkh33mMUuRBAOF25EAY/JU9AS
	GX+m4G3MEXfuM/uNoFSepXr0ZshpP/icNME97sO5FUDsehmVk6GT779zeM9X8zBy0yL5VZbcRhn
	eIafeXCPNTevO+cmUn89TJjn73mdFC9Jd/lFz0ptzyGlWn97zJe8vWPqaLy1pIAhE4SmqnE7jIm
	OspHOhY8ogqo44vfgSPVWbqRo+Pfdm+oAGN3Yf/uSyi81/zRMzS8iZBnZXXKQrQ4nF2Uo+9H8aC
	ijzA+QzGOi8frKy31c5cx9j3SnCyIycnVg==
X-Google-Smtp-Source: AGHT+IGoBD+SJJ/QxFGJUHj4pfv2HQPwrV6pTTrXBMpFdFvwdE9zjwq3erFQ6AqPAJfgHcS/8RJVag==
X-Received: by 2002:a05:6a00:2406:b0:72d:8fa2:99ac with SMTP id d2e1a72fcca58-72d8fa2a067mr10388358b3a.13.1737049544402;
        Thu, 16 Jan 2025 09:45:44 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab9c8e65sm278973b3a.103.2025.01.16.09.45.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 09:45:43 -0800 (PST)
Message-ID: <6645f9bb-7655-4d89-8aa1-220651e3c26a@broadcom.com>
Date: Thu, 16 Jan 2025 09:45:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] clk: bcm: rpi: Add disp clock
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
 <20250116-bcm2712-clk-updates-v1-5-10bc92ffbf41@raspberrypi.com>
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
In-Reply-To: <20250116-bcm2712-clk-updates-v1-5-10bc92ffbf41@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_094545_322186_15913944 
X-CRM114-Status: UNSURE (   8.98  )
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
> BCM2712 has an extra clock exposed by the firmware called DISP, and used
> by (at least) the HVS. Let's add it to the list of clocks to register in
> Linux.
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

