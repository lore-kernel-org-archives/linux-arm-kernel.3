Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F47EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 23:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JF2SO1JNjZFS/AW+/qwVSLc3H3ROwf+oLgiJ6Im/2BQ=; b=iLMmwjY0UM/xLlUdFbRLgNlyxA
	C6+H+tMoyk/BUErC6z0d6qJqQe46Znhu0CvUx0I972lgzgvwnnS7UihAXrNgBqslWmgq806WkS2Hb
	K5RXiIQPlJFOxtk3alUlfOaIiw/f4VypSVUb+D4e2Xc7GUKGZVfsAsnE/kqY88hBuoGfgsTfSaB0u
	KpKAZzuX6gPNlQ+8KrBigfVcCXNTGL9cdhH3YcUKD//aPMdolxByYMe5MTNDkz5vs97g0lB8KD/uC
	MhmS7OtjlZC2WJ/uo+A3hOqzeP1aAZbDeu26CE/g6e5t/gADG0Lp3YhQVzeSgiGoVWMHd81eFjubb
	30PTsjJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXqQs-0000000A7Wm-1LJ2;
	Tue, 14 Jan 2025 23:34:50 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXqFr-0000000A5kV-0X58
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 23:23:28 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2163dc5155fso111835655ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 15:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1736897006; x=1737501806; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JF2SO1JNjZFS/AW+/qwVSLc3H3ROwf+oLgiJ6Im/2BQ=;
        b=fZvc+ME2UdvSUOLMGTW1J5WuP3HDx3W5f1k8VHu3f/GTwIpRHFBD/jfYMHTQw45xIU
         Y8OIXP41Bg5vp+QKRH9/GgY+dKW9CIkoIoFZyO0qJeaDwwPlYgrMMQ5UHBnCKdas6aD3
         7h84E7wnSwN3cNCzx58Z9yMzt4THF3cdppynY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736897006; x=1737501806;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JF2SO1JNjZFS/AW+/qwVSLc3H3ROwf+oLgiJ6Im/2BQ=;
        b=oWDvhswnynjyBRfNOdXk8VLv3L8D9+ug7d2xF3sXqUiEkJ5YiztObR5aumOzvF7UcM
         Vc8eKaJDB1SKTmbHDZvDBhBt1RjWu/kkVf4mkR/w0ygWFCYQOiIT1NWu5lDNAdfdluW9
         76noyoON/cDcOsQVsUQUTG0cAIJ/57oquYoclx2ssF0wpyPBpwgiihg5KZILKiLYuFSf
         Vu6Pe19hIl6C+dfLTRCvfeM50YpO5pixrl24djEwojeH3vNJunNn2gt8bS0d3mFCIusu
         gNKJ+eiVumsKcRRv0tKjEu2jo//nRb2nY5GabfDX1j3Z0U0C3pRdV6QUHEalJjq62Vhi
         Nffg==
X-Forwarded-Encrypted: i=1; AJvYcCWTahibr2eaXlCXRJUS7NiCGa2i1cUhzCVeKee1m2xhfVD2VqACV+OZ15nINQTmHlQJ+7BxAVIcyIk7iY4Ss7E/@lists.infradead.org
X-Gm-Message-State: AOJu0YzKfEIvyc+2Bdqy3UNnpxdeYeZjPWvL0p9E5WU+MR68q3trKU7q
	muP6d4EXfeaCoa4jpZHygl7BAWtGyS88BrIs9gwGKEZU/saezER1HTFvoX7LLg==
X-Gm-Gg: ASbGncugl3PCFTXwC16tOdfZ433nI+JmFjLlgdT5dQRzk3Zd/Z6Xrs1zQ/A79sYU9Qx
	I/Eb++PhHspLi7dZxgJ3bwxPe+fUQ1jgg5E7FzNo9jRI04BnoCSkLsMPyc/2KjnubNZr1XYk2qD
	9KzECTvEHz41mSMDK1b+uSHYmZuAz65uzn/nwFTpUIxRyMnxfI52uZZni9XPwSLLPC82oLYxotP
	aZ77GQj3dGB5o4vQkGadGbuXYGCSz6LB8YyLpcT1tGcjkFci4SK2xsThXx8TbOUP8U9YEDDG/H5
	MAaMXf64HbUE9rQt/mEORhHsQt2WzP0=
X-Google-Smtp-Source: AGHT+IFP+iDz9d53FNYprYxDfsZHKpRDF3bHc76kCec6tsY8vy4yCwcxXTB9ww6UWz6UHEjmZYk7/w==
X-Received: by 2002:a17:903:244c:b0:216:725c:a137 with SMTP id d9443c01a7336-21a83f72472mr455838475ad.28.1736897006461;
        Tue, 14 Jan 2025 15:23:26 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f22dd30sm72193155ad.171.2025.01.14.15.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 15:23:25 -0800 (PST)
Message-ID: <511eb6d3-ff74-43e8-ad27-808ecb53e698@broadcom.com>
Date: Tue, 14 Jan 2025 15:23:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: Use str_enable_disable-like helpers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250114203537.1012955-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20250114203537.1012955-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_152327_175914_10D0D534 
X-CRM114-Status: UNSURE (   8.79  )
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



On 1/14/2025 12:35 PM, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>     operator has three arguments and with wrapping might lead to quite
>     long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>     file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


