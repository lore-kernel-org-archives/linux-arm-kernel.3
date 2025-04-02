Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931B6C36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 21:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rpKPz3l8OSe/vCN0NmJ1oJl75HKKP7ZyAqkRiw9RE+g=; b=ITNHxUDa4yxw9bSgj4iQyNjOc+
	GQxfcSfIk6fR5I0+Scqgg4heyRgytapzOWVUynv+C8+9TPBEv3KU3B7B+lLJZ6XzxtqY+pKi3uxdH
	MyBlF9pBLmVKQEQO6dl9PcOSYpMCnghn2LLp9WsCS+tUxgQ24mnBTM/MWXBDw55NS/HlXB7p69PU9
	fxB8SfrDT8nwAJmtwdMo6B88Bx798mAX9eR+uDqPB3FOs3zm703ErjIramIhG+kwPp0EYTHdqLWG9
	Rv+9P1tOOWzQDJ4ZYH10r9nsWxyj2mhKJi05srt+PdQY+PBJ/DsdfDn8I7ViTkPSwGsVd48e4GryE
	C+B5WMJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u05DO-00000007CEh-2Mgs;
	Wed, 02 Apr 2025 21:01:38 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u059G-00000007BhO-1mWF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 20:57:23 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-72bbc03d436so177971a34.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 13:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1743627441; x=1744232241; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rpKPz3l8OSe/vCN0NmJ1oJl75HKKP7ZyAqkRiw9RE+g=;
        b=XwGkzbiWQQ8qPJQ+cKr+aC7YssGFlImeenax0qMKH4+QgQBWVgYV0yjbkwJ1/uMX9e
         dx40J81Zrn3ZU0B83IydOcYwrSPl0x7xqDbIEeTmnPcrFGVJ4rxRGYrAWYs3fYKPazP1
         Q3pHTpZhGKmAJa87QUaBhX2dRornKgybGnimM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743627441; x=1744232241;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpKPz3l8OSe/vCN0NmJ1oJl75HKKP7ZyAqkRiw9RE+g=;
        b=Dk+SheeJgsU/A+Ifvx3gIqr1MKIrtxJhfjq5p4gZZf8TRWdX2cygjTzFaARxASM/l4
         M1NnXOHi9MKC5xXUCeEiWZB4xxsN3qoI9mKnwO4rrqd/7aeZ/VEeX5ysvIk6Km8uNmWL
         +zadtGg3JEbt0+ItFBbczCK9MpJf+297hzvUAv3tSe72NDmXnbwiFATsVHXtXJunhtm6
         0vTjTygKVRGQBAhDlBVapcZKt5eDMUY8PUEqEaAB5vuW6Gspgx2zDY6onDUNpWhr6WSv
         bVJ5+0tYTQySyQr5AEpePELq3NC0y2yZ0jyqUdO/P9Vcb6ZzOruBKNehM59rqw00RCXY
         QoIw==
X-Forwarded-Encrypted: i=1; AJvYcCUjp/INAo4No+F4ARdWXNe2oY0htAaBumChGVNmLOQc+yeNcUtb9vCvmP40040sQKWaykO375w6x4Tl1ThyrnGN@lists.infradead.org
X-Gm-Message-State: AOJu0YxR/2kUdbo2q7Hl9oPbHZJV4LRQ0Qtgj+pPqjiuh24kDbVNKp1b
	2+pUAj4EpXsPq8hzko/XMrO9Z94MxZ3fafQQ5oAOdGvwtG+Pukq33hkpnMGPSA==
X-Gm-Gg: ASbGncuj9GOkK0Bu0eLsU7+pC4pFDVpcm39nO1nIN57uOp1asG20o21DwEJixkuMy0p
	lXMAnJ3/O78B9ocBftJtlKKgiVnODVXCR7KC7GbYzOCA+SA++hnBQGM2FLnoAe3YcTSs0SXMNHS
	lQ+vZnC8lKj4pXuX//oEpeySss7hJ4cVBzchQHxDC9beizis45v/xCknGNkOZIgkdrSjjxYwj4U
	WleG7B3+naOkgE/knezGZAxlc9RS8pbvf3FmY9K/XxTj1mAGTsjOhIpT3t6CjBPc+Qnxm7L38bB
	Nv1cvvEcTmStvTsPomJK0ivCVP3bNhnSNPpcTPZbqENB59JppAJKvlZ+QFXq2Msm/sMF+++3eGg
	musQY8rp5
X-Google-Smtp-Source: AGHT+IGQbJ8Ul1tV+oR7fGNXEKGhTjAsFXMi+pHNNFqgdxqtIVwd7TZXEP10p9WO1jQ5NcUbbYlHFg==
X-Received: by 2002:a05:6830:638b:b0:72b:84ab:b1ad with SMTP id 46e09a7af769-72dae59cea4mr5135994a34.1.1743627440747;
        Wed, 02 Apr 2025 13:57:20 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72c580b5401sm2394329a34.18.2025.04.02.13.57.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 13:57:19 -0700 (PDT)
Message-ID: <cf7661e3-9d6b-4164-971e-0082468da0c7@broadcom.com>
Date: Wed, 2 Apr 2025 13:57:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: brcmstb-usb-phy: Add support for
 bcm74110
To: justin.chen@broadcom.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org
Cc: rafal@milecki.pl, alcooperx@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, kishon@kernel.org, vkoul@kernel.org
References: <20250402185159.2976920-1-justin.chen@broadcom.com>
 <20250402185159.2976920-2-justin.chen@broadcom.com>
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
In-Reply-To: <20250402185159.2976920-2-justin.chen@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_135722_654624_DF72389C 
X-CRM114-Status: UNSURE (   7.20  )
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

On 4/2/25 11:51, justin.chen@broadcom.com wrote:
> From: Justin Chen <justin.chen@broadcom.com>
> 
> bcm74110 brcmstb usb phy adds further power savings during suspend
> states.
> 
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

