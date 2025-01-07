Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706DFE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 17:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a2x6Czl6GO65kHVW9zAO9v64ouXW8ETVJWZJ2hxoejQ=; b=uF47E6D8IhZB+0vUQ9isO4r+Jq
	oOC4WYvrBGquFGnaaoUV+uuuzKALErXR+zxKU28rF6UOk4rF+BQByYBCXC+owQVtxQXFxg4TCsDQj
	5TbKo/Xcev61sRfJHvp8yphUa2jmqGgYkgh1Wb0i8ufjnMpPn9Pqkpdrpxp9KDDor6Z4KkkJKWQMF
	8zgxPGGSIi2jsxEg401U2RBWhOQVE+OApfU9AJw4aMOTEOhNML0KZCEB5S5xZuH/R0oYxZ+MntK1I
	r8Gil058sS9DLDj18Jw/tGvluddVsGNHIeUBnjKx1H97/K6PIqx38IFGp0U3Lp/Te/+iSB4P5GTzP
	52jxOTIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDc8-00000005tqr-48OR;
	Tue, 07 Jan 2025 17:43:36 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDLM-00000005qpB-0tyh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 17:26:20 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21670dce0a7so57213595ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 09:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1736270775; x=1736875575; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a2x6Czl6GO65kHVW9zAO9v64ouXW8ETVJWZJ2hxoejQ=;
        b=Gh9iIGfZDxLOMdj9bcWNV8BhC+Cn4/mWE/WOwhisbusWaaosJ8lGx7aJbp1NXmg82h
         lwt5c9zS+ncswxWdD3TYk2FYXjXYD1PZVt7PROToQS9FCCS5cngE7M2ghhc4q23BEinJ
         xPK0fzss0OPrdWnsbJZTl36pyG/ksqe1ztbD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736270775; x=1736875575;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a2x6Czl6GO65kHVW9zAO9v64ouXW8ETVJWZJ2hxoejQ=;
        b=w9deGUwqBMUmPMEyQwNEKag9eMNhNW6THqT6pyhBWmPMIXNQh1ZwgkSt0MEExgTO5u
         BYleQUUta3zDnu0am2pluIScDFMCLBwNjxocv3enUPOyIaaDDiKXsGULFhJ5mPVyVjgh
         tGNMiTZ4rlTCIuBdD8nM4hwdXH2keB3sOlsmN0FpuMn4HEfPfrMbWPqx/eg85xV4KvOB
         nfh7k8YxeOVGntuM1/m8U/U7MnjPEuyIKZGB5hTMTnMatBPSvYKc3+cjHNaF1Kxphh5b
         xym2Pay2HgjWcE7W1nWpw4X1cGVvZTvVnwayWipKuJd0SGFTsXJ/0vcPqLcwR6eH9PrX
         pUdw==
X-Forwarded-Encrypted: i=1; AJvYcCWuumFU0a92TQAT/wmj7nxOR4g+6Qru/AjpnQy/Ag55CBEEfmKTMk8D1RQNCtLIOG2wrJKzn+Xn9/5zEXa+ArWV@lists.infradead.org
X-Gm-Message-State: AOJu0Ywmx0Da9s1JQhtP3IVWqBJrBnKLgReVxAm1/uIHMBV/L/+Zw1ii
	pz7xjC3TvWNL0Jz7Jce57hrJ0JNuLDvQE/m7O1VB3F0W7CMYpw6mVNS7s9RG3w==
X-Gm-Gg: ASbGnctFh8CWwXp4YzG7C4Sw+aGgKP8ys09ruuOcRb58y6tBGnNH1sviDwgRdjtNeaz
	l4IXaTjZzKc1t0VzUoB/tHl9BFWdT9Xe88HZeql7+1REAJJql0u9Pn31rbB9ZmnypSzaW1ylPeZ
	5JJXt6g0PCrFfVb3UCnvn+VMC5ak7U7/s6wASSR6Vyfrdo6/yU323Fv4MWSDfPF0JJcHh55J1GP
	eZpu/CcOj6oJQg6FqSIuEca1OqlG6QsmojF+msKiST7vCcMe+RfnAZDEp2iBAN8x364JLBWIelF
	i9cDeNUV3kDVcRSi7tYL
X-Google-Smtp-Source: AGHT+IFzu1VIJT9VJiC2aXWDy+NgNyxkD0g/GqwTMrp+Om0AwR+ht03XX6NjXXazKeHe7i80AzxoTg==
X-Received: by 2002:a17:902:e886:b0:216:5e6e:68cb with SMTP id d9443c01a7336-219e6e9fd95mr929686065ad.16.1736270774736;
        Tue, 07 Jan 2025 09:26:14 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9716b3sm314412505ad.90.2025.01.07.09.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 09:26:14 -0800 (PST)
Message-ID: <901992c2-4c48-4534-bbfb-7b6b70d15d48@broadcom.com>
Date: Tue, 7 Jan 2025 09:26:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] dt-bindings: net: Correct indentation and style
 in DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Marc Kleine-Budde
 <mkl@pengutronix.de>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Kalle Valo <kvalo@kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Dario Binacchi <dariobin@libero.it>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>,
 Brian Norris <briannorris@chromium.org>, Frank Li <Frank.Li@nxp.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-can@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-wireless@vger.kernel.org
References: <20250107125613.211478-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20250107125613.211478-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_092616_347931_6259E5F9 
X-CRM114-Status: GOOD (  10.28  )
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

On 1/7/25 04:56, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/net/amlogic,meson-dwmac.yaml     | 14 +--
>   .../devicetree/bindings/net/asix,ax88178.yaml |  4 +-
>   .../bindings/net/brcm,bcmgenet.yaml           | 32 +++----
>   .../bindings/net/brcm,mdio-mux-iproc.yaml     | 46 ++++-----

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com> # net/brcm,*
-- 
Florian

