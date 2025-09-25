Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0040ECAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 21:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jz7G9/EUJnkW1Chp9iRbyaB6CAs3zBGi/9nIuJuFHpE=; b=Ra6+HxY2xsIewlSr/ZsAQRSNtZ
	c2igbG0B4oRHEetXHJl6du2iBFjfNFwTVqz8izl3O4+rHbDn7xwsJaN8rFQPuwtDuvZDB0/9xqzQF
	ecEQTbz0Jyfawfl/7yLCMx1lp0b38a7GtQhRA7xb8ApeBM7nlOxEmYAK92KbYlJoGDu+L8vC7CWin
	nrM9l3kU2Up9RDEU6T2bd31MMW449kDtBUlsWWlu8m8XgIvEviJvpjxnAB9rstKpNEeZ/AZUSxvhF
	RQXp96QOQSRS7+WLwXIzfOuh4a80XJnmoOHF/yNg6+dgPuCm8XK6HXFMykeIyfIvy2VXZlhq36Ho9
	l0VDfvDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1t8S-0000000CzJy-37hu;
	Thu, 25 Sep 2025 21:04:16 +0000
Received: from mail-pl1-x661.google.com ([2607:f8b0:4864:20::661])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1t8P-0000000CzIg-2zE0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 21:04:15 +0000
Received: by mail-pl1-x661.google.com with SMTP id d9443c01a7336-269639879c3so14005635ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 14:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758834253; x=1759439053;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jz7G9/EUJnkW1Chp9iRbyaB6CAs3zBGi/9nIuJuFHpE=;
        b=EglBQjsj9hmS1lPqZJ8iNE+N+wkwS/nVHgXY2TKObhBk6zUf2NE7o3PCbEM7Qb5e62
         dS9S3nEJq9e2Dpl/gbFg40G3EDQ0FnS4SaJBLBTiUbmNTgblYzg0LGnzT6F1xDRmHczN
         YOq0E9QeSOi9Ul5Z3PQFzeyeXq/rnxacONqVDgDlshhbok38zXWZ4p70cnV2en0AvBHO
         bx9Gn7wbUMp+1RcGcVACnP0RBIEV4HCGED4fyIG8f4sVPRbpuw3bGHJ0PsYF/AIItm8H
         Np1kc9S6cuD1dk0kRS1ljAsMHIEhdH3In4tEPTj87pkESRZaRZpES6M3WFAQtryNUbAE
         iLbQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5/lqx6cvTO9WvIehwZT7zWmzXO2eDHop9oAyVAcD5I/Ezhr46JJqvnk+0VgEKMUcQpq0hd7Qau7wXRe/qAjJA@lists.infradead.org
X-Gm-Message-State: AOJu0YxZprqC7P7MV2vuZ/k+8JTPs8PZwFwE0dk+7ZCRfVN/qY9O0KMH
	E2AzZjDnwtseZSO0RWGz0cre1X6kemLWz/PJ9I9Y+wrE8dVAUAb8tQUGP6XuUNhJ+W9ZI8nSbmr
	7iwHgK3wu14jkHdLqnFRRlmVGrIC1VOJny8G1B1PilJcUtc+hm+K1M+PqIot+13TN4tgW6Nl9vh
	EyuaSy4reuABcfCc9Nn3Q8y+3fEIDHDxvGt0sDVmuKAyIcGrFmEp8synHHQJvKATumFrvise9Hg
	fG46PVSPgHbUDEgQK+qM5rZuIW9YtxjztA=
X-Gm-Gg: ASbGncsmA+W1vbAkzO+Pa0FfO8TlNtMHZ92UkvXj9PJEveoCh/l15GnJCj94uaN/pY4
	9iNa5y3zTjnmD9CzY2kN7yllZt0Cy10to8qyXJf7nd82qtLixkS77MabC4sOPwe+zv5V782f0fA
	A1FfuItt2f6MFCyJRA4JM843dnvGn4GkrUZhn5X0WN+BMZ3ZW0GVYLj/+9dFrlypfVVtn1xx2Pr
	OWy98p9Z2vh1ceD1PV7bXzFgqSrpZ0Sng0inOwMtHldXPIdWSV0fE39aXp3FLNHGaFrWIT45NaX
	6stVXSEJucWmoEDkcC7g6xwNU7TArhXkbTiKzzyU+0tuvY+bAdTQjsFMPGkPCJE7t3j+8KwlIBl
	yJoRBIzMfcD9wzN0gleqst4UbqZm8Sa2L9B1xXcjjlLgHW0kf/AlDn2z74eCb25hvJPvNfROlyQ
	luGXks
X-Google-Smtp-Source: AGHT+IHBryQKu/4nUn4NOxO9NOTAXMYpGVXZt8hfblKI/8Vmx62DLM3xMNwmPewwCc0TBj65CFNK/U5H2OnD
X-Received: by 2002:a17:903:1c9:b0:266:120a:29c7 with SMTP id d9443c01a7336-27ed49df403mr51078865ad.6.1758834252484;
        Thu, 25 Sep 2025 14:04:12 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-27ed684a673sm2190175ad.70.2025.09.25.14.04.12
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Sep 2025 14:04:12 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3352a336ee1so206515a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 14:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1758834251; x=1759439051; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jz7G9/EUJnkW1Chp9iRbyaB6CAs3zBGi/9nIuJuFHpE=;
        b=Kc/ogWScGyT3hoIJHNiCmfAM+z+5E3F3cjnP7yBYKymgMP+CC9mstz/cYH4ID6MCes
         EjYAOsqueZKVCpEWlLO4YYVN3N/3aldlS/gtms1Y3ccc8XhHN4KEVcRP/LeU/OOg9Pq8
         HNS5aAvNtdGLtB1cupx7drEArZjRHenHsdF/Y=
X-Forwarded-Encrypted: i=1; AJvYcCXfB7qBMhIdeCnMaSKLVi2D2T5XBGWP2Dr/mAN1y2OvSSOAgE8EABxEUWDGHaUzv8qVHCJLvWqe9H9Agdo8HzZP@lists.infradead.org
X-Received: by 2002:a17:90b:3a91:b0:332:793e:c2d1 with SMTP id 98e67ed59e1d1-3342a2e560cmr4911996a91.36.1758834250926;
        Thu, 25 Sep 2025 14:04:10 -0700 (PDT)
X-Received: by 2002:a17:90b:3a91:b0:332:793e:c2d1 with SMTP id 98e67ed59e1d1-3342a2e560cmr4911968a91.36.1758834250532;
        Thu, 25 Sep 2025 14:04:10 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57f56725b7sm179631a12.54.2025.09.25.14.04.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 14:04:09 -0700 (PDT)
Message-ID: <7eed7848-b3ca-4415-85c6-7267c91560a6@broadcom.com>
Date: Thu, 25 Sep 2025 14:04:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v6 0/9] clk: bcm: kona: Add bus clock support, bus
 clocks for BCM21664/BCM281xx
To: Stephen Boyd <sboyd@kernel.org>, Artur Weber <aweber.kernel@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>,
 Rob Herring <robh@kernel.org>, Scott Branden <sbranden@broadcom.com>
Cc: Alex Elder <elder@kernel.org>, Stanislav Jakubek
 <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alex Elder <elder@riscstar.com>
References: <20250901-kona-bus-clock-v6-0-c3ac8215bd4d@gmail.com>
 <d36c5597-e26e-4ddc-93b3-222d8b40dab7@broadcom.com>
 <175834646902.4354.13114906749225372224@lazor>
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
In-Reply-To: <175834646902.4354.13114906749225372224@lazor>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_140413_787989_C86A489E 
X-CRM114-Status: GOOD (  13.88  )
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



On 9/19/2025 10:34 PM, Stephen Boyd wrote:
> Quoting Florian Fainelli (2025-09-04 11:28:34)
>> On 9/1/25 10:07, Artur Weber wrote:
>>> This patchset does the following:
>>>
>>> - Introduce support for bus clocks. These are fairly similar to
>>>     peripheral clocks, but only implement policy, gate and hyst.
>>>
>>> - Add matching bus clocks for BCM21664 and BCM281xx peripheral clocks
>>>     and update device tree bindings to match.
>>>
>>> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
>>
>> Stephen, are you OK with taking all of those patches through the clock
>> tree? Patches #8 and #9 have a dependency on patches #2 and #3.
>>
> 
> I don't normally do that but sure. Is that a Reviewed-by?

Sure, let's make it official:

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

if you prefer that I take those patches through the ARM SoC tree, that 
works just as well, I would need a suitable acknowledgement from you to 
do that.

Thanks
-- 
Florian


