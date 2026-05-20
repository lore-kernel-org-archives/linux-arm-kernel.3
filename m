Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34143CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 23:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3A6KecpmtrAbT/I3Gx73+8JY/faMGZWGqkIjOiEJenI=; b=kdhWuhcwkUeGxQBw6um4Sw301F
	h129+T6Deb3HpFLefj4JY/V0if/+dp41mLFPbSjur+FhxX6cwqUZPjnC9XCzlq0qA+5QfnU9rHgcK
	+Ph7QeNrNwCmnyQzoa8SFFfv+8APNrj+0Xsgcn47jgMMy2xPyf9hJtN4SBdhaaVA5l38evocK0rQE
	sSD1Q4x4B5XZLljAC4eln273zB6dDn/K3uMUNqADv86ZlIWCgvXPQLBp84tRsTwEyWpT52wmshqpt
	qS+ASPdgTgBeMMDrZkODq4Y/saJnTKcCSp0fsakNo9bbXtCHuuOdXY9aKNkVgpZ4BPIAi8YrKzsrd
	AI9btrSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPqKE-0000000693O-38hp;
	Wed, 20 May 2026 23:27:42 +0000
Received: from mail-yx1-xb164.google.com ([2607:f8b0:4864:20::b164])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPqKC-0000000692q-2Iol
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 23:27:41 +0000
Received: by mail-yx1-xb164.google.com with SMTP id 956f58d0204a3-65c1ba7eeb6so5597876d50.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 16:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779319659; x=1779924459;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3A6KecpmtrAbT/I3Gx73+8JY/faMGZWGqkIjOiEJenI=;
        b=r9joS8MLh6QdLgkDkpoJRRqSafwlb8kNLwwgleVyiGrTAtcCMjvpCGDpf0weuHTghB
         G4IL7z1EA6DUnqLP4r7rodcJMa64b4hgKQNvVN78Igvafki+iV8UdlSpYEUnuL44EnHR
         +oSa+lcDwbEPVQUdtCobsQ0tnLg+XiYA/TLv5VKOsWeq/ISRwd7/4O6YHDdIjzwkPHRH
         3xtEbx6QEHfnVyUcbHjY5OwDQKGY/s9gcOPBmAsCsNrbJ2w+KWEbQWvri2EpKRUcgOet
         NfxNzgZTFLEO+ugooiX8DcMz+jaICU3w+ccjYmVzeXOb5Rp/EMtKXxpfzpmUSpVBD8QO
         0qQA==
X-Forwarded-Encrypted: i=1; AFNElJ/0FkZx7XqMRcdzoktExi2dBHbYFV4PCxZDSOnD5rwbp6lucvuVD5q/eLKw+XHIUswwACPTweVm9q33OkxWXg2V@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/Jqc66UzabhL6YmGmUXTCsqlQQsH6F22q8/1wQPaTLk66jyVZ
	yQLhe7OCSb8G/IPOTuDsrV0BVaeAxDNwU6CsAjqMiAESYVKyr0FPB1/PITbLeT069DstxqUpto7
	o1Ll4BHC71GDUlSJfwf6VqZWRFWwn6oetQ+RKqDBMXwZ2hicT65/YA5a5zZ4ZL28oEP2OBuC1RE
	Eyb2KspMCxlpE6IxwriLTaIb3p3KSwegU3pSFSguDrVdx1YHgzsCds+WTd6BUyIqMrw1zIiB8Ca
	FuMJhd1z91S0QULtqXOKx3DnTRvgObson8=
X-Gm-Gg: Acq92OHpSogWA0mfZz5XxiNUkOgxx23hjjxPyXtLIDCRkEN6Ra+hcBKnFJtfsGBX5gs
	dhPB20TnykP4J3cPG4MYoOBxV3y5h7w/ANeZ10kZuQglKPRe9iKNvoP7CQXileptOmkhZZSEcBY
	DhZeHEFGYQzOEdv+PlQIxjbQJGNcHX5ZmZ96+NL6A494AYuB59hdA3AS1Fv7plMNpCXOlSFjJ5J
	9Qbdovx9t24Gx/3wqyV+uj3Yg9Bn1U0HigEhsjSe1aOAH+oIyo4GQA/xf8xEcYYjOJ7q49cOlsO
	H8iLTQyMv31bLZs97BbPOu9w4ZbLxyI0fu09CS8XO9mKFm+XOKa+G/YWN0yNo5oW6thuzQsZCk9
	h/UwXYJvSJ7W6pCfNIHO7W6x4D06gFH8IGIO/AF8WHiAEkWRFpZk9K5zQ6bJE9jJ7eAqRYzPEKT
	jfO6sqJDmTUhRfG9ZYUSi9GWyugCZXk83A3C1gOOiHYpHh0LejglKXBZnJkM3jsdHH
X-Received: by 2002:a05:690e:441a:b0:64e:a9a1:fdb9 with SMTP id 956f58d0204a3-65eae1fce88mr192001d50.34.1779319659157;
        Wed, 20 May 2026 16:27:39 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-102.dlp.protect.broadcom.com. [144.49.247.102])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-65e5d9659d3sm821158d50.10.2026.05.20.16.27.38
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 May 2026 16:27:39 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-13537722193so7123082c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 16:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1779319657; x=1779924457; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3A6KecpmtrAbT/I3Gx73+8JY/faMGZWGqkIjOiEJenI=;
        b=aEU1QnTwow3CnL0D3cfNIWNUYoyYZVwLRaP+NRPRmP6ELSq9Tk4VP7xk+9PegCCfLp
         GCPpeOkPyy71gkcg1rZv3tEesKq5jyL+PqkR5SCcmdmurIWLQlvFGYKHuqG72utyCiR5
         Jlfro1g+zHRuOPKxoyklfZq6Fzy4Qkadyj6sE=
X-Forwarded-Encrypted: i=1; AFNElJ/wX2K4fzx6zjQPP2RXBu6DAS6Q+vk0U/31zL23HJRSw79Upl+URMzMvNNC1T4DXNDSXLNfWCkojYk81jRYWCcz@lists.infradead.org
X-Received: by 2002:a05:701b:220b:b0:135:d104:3612 with SMTP id a92af1059eb24-13632d47372mr203980c88.24.1779319657089;
        Wed, 20 May 2026 16:27:37 -0700 (PDT)
X-Received: by 2002:a05:701b:220b:b0:135:d104:3612 with SMTP id a92af1059eb24-13632d47372mr203962c88.24.1779319656503;
        Wed, 20 May 2026 16:27:36 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb9ed3sm28333258c88.1.2026.05.20.16.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 16:27:36 -0700 (PDT)
Message-ID: <a3985948-ef14-4998-a632-ee50a5b34ce1@broadcom.com>
Date: Wed, 20 May 2026 16:27:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: BCM5301X: EA6500v2: fix USB3
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "moderated list:BROADCOM BCM5301X ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260406220603.101494-1-rosenp@gmail.com>
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
In-Reply-To: <20260406220603.101494-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_162740_602138_0F5E58AD 
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

On 4/6/26 15:06, Rosen Penev wrote:
> USB3 needs to have a GPIO pulled HIGH in order to function. Add vcc-gpio
> to do so.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied, thanks!
-- 
Florian

