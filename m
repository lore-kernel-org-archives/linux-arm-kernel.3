Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779FBD5B86D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 21:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nAzhZfnq+Y+umpS+zHh9k29x4I1swYKfU58uwPItIqk=; b=ahDv8Q12rmYuGpzFaXa+UNJ4gn
	xMnEAIhTp8pgRdgudek04lUc8inTj8OOJShnfogJGorha5xhkyJ4/yUL3r2fWo5KKOCzzUwgQgTLl
	k2D9yHyWqztKhf3OSh690Xiz4FrIjkcSYhe2SIuwaBIrOMQPD4CjvB+pUBMmPGR2JgjOMx8B4vfDB
	ucLR1YHgJbnzpQprfVZS7jn/xG90qsOn/JXLERp/weQZjvdRbPxwZkHiijBbTtHAbkckmiKbisvio
	1NXmmB5vSresNRSuHJMKXBN5FIvYYmvpzvL1kB5Aocpqni7ZN5VDHOcgRe7+ltRACgZ35txeL6ofc
	6HbfQkCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVGGr-00000004JD0-35Bv;
	Mon, 15 Dec 2025 21:38:21 +0000
Received: from mail-dl1-x1262.google.com ([2607:f8b0:4864:20::1262])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVGGo-00000004JBK-21nH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 21:38:20 +0000
Received: by mail-dl1-x1262.google.com with SMTP id a92af1059eb24-11b6bc976d6so5181687c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 13:38:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765834697; x=1766439497;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nAzhZfnq+Y+umpS+zHh9k29x4I1swYKfU58uwPItIqk=;
        b=ZcepkBOT7LLz/1UxmvV8EP7cWbSStXZw70ez437Dyy2OCDST9IebAh2eZOumpTjFVf
         nbtgO/ikCbzTgHMio55Sm2dHxygm+rYq8riVgRhXSxjH0SpugVT1s1vZlsL3NvL6YwlQ
         KcbxoY12rEqaak/SxzjaL7J9xzvHKE2vMr7vIXEWotHWOccdsz3eHuDIysYOZ/FrGmTV
         Ib+4fqHApCpV/tM/VzPdknKY0cp+rMRLXHvpIFCZS2fzh6YHnbLRkKp8wWFSF+kr7oKV
         qPkb9rR98oAEs3LYdXyk3FQKHCZ5+x1TWFyGilaAIEmoTfIrb7i+gUIIN0S3no722eDR
         d+6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWai7iu3r/xNI6++5MQ5clWl2VVsYaJmJtOnBKEYbQxSLBXwRj0UTApJsv65lUYhKA0R3t5vzvZKrevkQWkwLSE@lists.infradead.org
X-Gm-Message-State: AOJu0Yxmf3mLLjx+q1DKzbp+wow0Wtyd2Sig0NrRHMnuy21jooTdM/6/
	qNWr1kWVMIfp2vF8oBKegWYKeTUnY59rsAg7sJCjQQ9TVJlguG2q/rCnS5dPSkgymY8wdrzVJOY
	dXTp5zAripEHMK+Z67L/XTZmTf76Do8/X5WQy34QkJWlbWTtUfAnddtW9W2DF9egEVvmdPqbEOy
	NXSbLvt05ZgmPxVVChR2tQjmD4QRLGsyUJNmzV4gRelJTLxG86f32Av2AsGAQ0TSV9j6TVsXVTJ
	UTTPuY6afkv/wQqIJj88Ma/RTsbHUIOCRo=
X-Gm-Gg: AY/fxX7Zea0U0TKMWuTz0N2UFVeJfs2rU6Mu3iAsw+WOs3OX179qdE8lIXW+vYEKT4h
	5x6gekpY4lJxLt3cshFnHiyhnU81/vpWL3HIJwHlh1D9rXz/wQ9po4gFYXvjOs25iQQ7+eiOSJx
	vzQzM3vpIbuDRGNh1Opq4Fm5UxMrXG9N6YaSeg5AJsYQp8SStSo6iktNkLpRNQcImrBfaXJzCsR
	lcClWCIpNa3W5wi4j+5IRwsGX6s9Lx+1DPWrC5dKv5XyL2OV5DJEyL5P+L9ejVAybNFOMGmCJML
	Fj1jAQpzQjI5d7MuzWM5sMoSLN2oCwMLfkHe3cOj+gruKhHvGassVurVPjvEBFUZjY2IYO1gu++
	DHe5WM5bZDgPmpnXT6Y5Hu9KvZwySXP385FV5UPMT2eb3y0KnxFljSz3NfSTBU2KqqFKf+LaqXa
	ExqSpqqJ/KPTGY2iXU32PKk3F8fTkw49KUsPRu/c+OmA5d1E0=
X-Google-Smtp-Source: AGHT+IHGDP/yP3rJ335yCF7sVY3he0SL1Efd7GYlbn9dFZl1lFlW4OS3GBTPj+A6qnxJn9th2Z13NjkbEYy9
X-Received: by 2002:a05:701a:ca85:b0:11b:2a5:3b9b with SMTP id a92af1059eb24-11f34c2a79bmr7993193c88.8.1765834697364;
        Mon, 15 Dec 2025 13:38:17 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-2.dlp.protect.broadcom.com. [144.49.247.2])
        by smtp-relay.gmail.com with ESMTPS id a92af1059eb24-11f2e2dfa24sm2173687c88.3.2025.12.15.13.38.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Dec 2025 13:38:17 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed6855557aso80383691cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 13:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1765834696; x=1766439496; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nAzhZfnq+Y+umpS+zHh9k29x4I1swYKfU58uwPItIqk=;
        b=hlCNw3tt11zKfldwKaW/VTa+16xbCOm0uuPzDZ0QaHLlpY0twOV4kctj0OQ4iA9IvW
         Nhl7jRSVuXuSQHHOJvV4T1fmu47qPKRZ4agslru8b5lfu8ahCSXclywe/VKZBO5O+Heg
         /9tmM+/JsUtJEguBQeNX9qppIWLRHCVj9PbwU=
X-Forwarded-Encrypted: i=1; AJvYcCV/KxjHyR5d0eLscZCkN9Cfw/lp+w+Q5rKkTjwpF/BJL0LMS6jwUbzS9/cZuPpDWODoL9TYYxHgpNIEltVf9Usu@lists.infradead.org
X-Received: by 2002:ac8:5f06:0:b0:4ed:ae94:5f5b with SMTP id d75a77b69052e-4f1bfb9be98mr222583331cf.8.1765834696064;
        Mon, 15 Dec 2025 13:38:16 -0800 (PST)
X-Received: by 2002:ac8:5f06:0:b0:4ed:ae94:5f5b with SMTP id d75a77b69052e-4f1bfb9be98mr222583101cf.8.1765834695659;
        Mon, 15 Dec 2025 13:38:15 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f345902748sm3725431cf.0.2025.12.15.13.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 13:38:14 -0800 (PST)
Message-ID: <f14247e3-3c9c-47b9-b912-6eb4a4d34412@broadcom.com>
Date: Mon, 15 Dec 2025 13:38:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: raspberrypi,bcm2835-firmware: Add 'power'
 and gpio-hog nodes
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>,
 Stefan Wahren <wahrenst@gmx.net>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251215212554.3319105-1-robh@kernel.org>
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
In-Reply-To: <20251215212554.3319105-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_133818_518485_849097B4 
X-CRM114-Status: UNSURE (   8.55  )
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

On 12/15/25 13:25, Rob Herring (Arm) wrote:
> Add missing child nodes for the RaspberryPi firmware. The firmware
> implements a power domain provider in a 'power' node. GPIO hog nodes are
> also supported, but the node name pattern was wrong and failed to match
> them.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

