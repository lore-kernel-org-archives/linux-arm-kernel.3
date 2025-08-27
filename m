Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65292CA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 19:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8dktpCBHOsNkqxhCr4VDQbXXVvhYTbllt04Kcihkl8=; b=pgqr53jtEfU/sKpJEYxSb8mjsH
	Yv6gZ3XX1q+NdYDQHbgyB+8+3XrEC4WhzWlUJBKLrx6TO/fXptmd9XjFwJQ5y6+c1uxUyb+i3HWtQ
	Z5uJsOr+VkHaSv/EXWwxqsG7Kod74egzx/8XoCk1p8cD5/lUICh+0+DE/SBEsOQMdwdsc+1C1rhev
	EbNqIXKnLvP4NPtaybhUtSS78YtE2lpYoV+nuYl6fOHSdnwfiEW/858SgksEWmNBSfjv54u+u+85v
	t43/asTvQtm4aPP35Ld6bKIdHBpDTVZ5lmDxJnSwSohaugNkHK1wRyF4gvSro/eDnhgdf14CKrpUm
	EbRx+GzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLc1-0000000GZOq-42mx;
	Wed, 27 Aug 2025 19:15:13 +0000
Received: from mail-pl1-x662.google.com ([2607:f8b0:4864:20::662])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJ4O-0000000GBlb-3ahM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 16:32:22 +0000
Received: by mail-pl1-x662.google.com with SMTP id d9443c01a7336-246fc803b90so62545ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 09:32:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756312340; x=1756917140;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8dktpCBHOsNkqxhCr4VDQbXXVvhYTbllt04Kcihkl8=;
        b=GOJgtjRFaDvVqzGHZxCtUiepOg9VZs+YKF4DA2baRHb73x4zyaZY+/JWDrRpe7JtmL
         M38unocKz00knbkaPtJEdl6k3NGRJ9oORgosPexvD7F5pW1Zt6nJN+pShulKTvtzNB6L
         6ebdTT9GGqfgKqGnEUnIe7JQ5DP4AfeJcGnTsH4ENVsCRo0IqWeur2e2UaU9TZmYbfb0
         8soXoBrn5XhQn+lToFA4IZPHST3Rr0+hfti2FCeGi0Vh7h93otlW0XFH4+Gavr2U+J5u
         GUljbweNs5BceGu57k2uj3CE/Gr31QfaPPRta1KJhrw+EzvPAtIOOIL7bgklrVeL5ZFE
         7aHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFZwY0+cY1D2k1zG5rWdO87TLJFystj01Emv5FdQi/B0atuszdw8XrBVHIGjSPof26bgNGkZSBvd5VWFexagZp@lists.infradead.org
X-Gm-Message-State: AOJu0YzSMZeWyHZKGXvZ5HHweSFmAAKygXLXKGDiwEqxMCLilmn1VGDI
	3yN8nYSQMtqmfblQZskCT3zQqH+ga2M6fwHle80biTQlKqhij4z/NemSigdfBvLAfHEXuM/GLVN
	XaEWe56sk2uDzRn9/3q5zvAuvpkqxdtHFw67WYTB+NLfJyGnLSbg4ablRbu3nHotCsVwwLVV5Wh
	5a4cTsUG2URsF6NNAm+c/h08bYImx+phmhgRpW89q8XO4Ahr+wqzujZUZSftt631Cte8/zhG/wK
	0tkEkogsi6biqWLWxkgJgld7Gnk86vx/0c=
X-Gm-Gg: ASbGnct4+QYnr2lkhue7WFytgn5IacOL0lgzL3AATb2FUy+LBND3WWWhZuqOQ4MNluv
	Ksk1Xg9UsyUh3ZjS6d20luvH0omtPjemv37mAtoRKJRfmTvI5EwMRWYMrcSKaoPs5C5+aCR0xL1
	dhtHInJ7osyyvyjaweOvOkZ3Kp8z2AYVCN1mlZwR6FA9BlB6ySM72uWtoe0LJkcnotWyGvntItV
	a/DRGjmUMMWHpLznCRev09v8Kyhnu5b2xRkcOnO7IG/Mpi1T6eKZeBxJUQ11OuTx5s3MXJOMFAG
	6xED6BYLeyNFvvHZW7yCqde96nDC+7RRFfCb7xPeVHX1YqDsOfVzXCx1fGICFF5LivDkmAy/fce
	o3OahlX6w52hLSm07suzRKVDYqiFA0u6pg8pI0OY3u7pB5oTy5vjFxMN/EC7HKekXvNg1hw5TzD
	FH8+tKRg4=
X-Google-Smtp-Source: AGHT+IGMCrmwPdKOnPLXj0Bs0Duzy3rYoASrMj4wPug35AUckdaWQS1zfuFr94Wwq/q0heouf20i17IEnpp2
X-Received: by 2002:a17:902:dad1:b0:240:86b2:aeb6 with SMTP id d9443c01a7336-2462eeabb40mr307382485ad.26.1756312339766;
        Wed, 27 Aug 2025 09:32:19 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-24896ca3a91sm2200165ad.10.2025.08.27.09.32.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Aug 2025 09:32:19 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70dde77f3e9so1961026d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 09:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1756312338; x=1756917138; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p8dktpCBHOsNkqxhCr4VDQbXXVvhYTbllt04Kcihkl8=;
        b=e/ucCwejy9xlJeDHEjYD6XFn+g/SeHKD6Zw2tmLiFytKEgdOAJ/g+fIQG0d6JhJwmN
         cZ8Sqn3TTKtE39LQpMEemLMPyuJlFtU8wLAQ6B/sVpt+v9Z2GEjZ/KxO3u4H2/Dn3m+I
         rnIBIh/BXrOFb79wlPFieRK9h7B7aTyef8BkA=
X-Forwarded-Encrypted: i=1; AJvYcCXWBPFE94O2q6sJ+Ig9sltBsxkHK2H3DphlgPnA7GZwARgUeqn0kymQ8r4mLru0l0S9sxlYel8CXxInAosesFL6@lists.infradead.org
X-Received: by 2002:a05:6214:5344:b0:70d:9819:879a with SMTP id 6a1803df08f44-70d98198d82mr255971476d6.58.1756312338170;
        Wed, 27 Aug 2025 09:32:18 -0700 (PDT)
X-Received: by 2002:a05:6214:5344:b0:70d:9819:879a with SMTP id 6a1803df08f44-70d98198d82mr255971066d6.58.1756312337610;
        Wed, 27 Aug 2025 09:32:17 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70dc969f011sm44700806d6.22.2025.08.27.09.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 09:32:16 -0700 (PDT)
Message-ID: <2ff3ec4e-4824-4d03-bab2-a69229764692@broadcom.com>
Date: Wed, 27 Aug 2025 09:32:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] pinctrl: bcm: Add STB family pin controller driver
To: Andrea della Porta <andrea.porta@suse.com>,
 Stefan Wahren <wahrenst@gmx.net>
Cc: linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 iivanov@suse.de, svarbanov@suse.de, mbrugger@suse.com,
 Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
References: <cover.1754922935.git.andrea.porta@suse.com>
 <bb746d2fd50ecbb9963438fae8601c2e4901a126.1754922935.git.andrea.porta@suse.com>
 <6d812c08-341f-4f7f-a9ed-4545217cb8a8@gmx.net> <aKc9G9owEfYD-_qM@apocalypse>
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
In-Reply-To: <aKc9G9owEfYD-_qM@apocalypse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_093220_901934_3B0B9E03 
X-CRM114-Status: GOOD (  15.99  )
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

On 8/21/25 08:36, Andrea della Porta wrote:
> Hi Stefan,
> 
> On 11:18 Tue 19 Aug     , Stefan Wahren wrote:
>> Hi Andrea,
>>
>> Am 11.08.25 um 16:46 schrieb Andrea della Porta:
>>> From: "Ivan T. Ivanov" <iivanov@suse.de>
>>>
>>> This driver provide pin muxing and configuration functionality
>>> for BCM2712 SoC used by RPi5. According to [1] this chip is an
>>> instance of the one used in Broadcom STB  product line.
>> i'm not sure about the whole driver naming. The cover letter describe it as
>> "pin control driver for BCM2712 SoC", but this patch is described as "STB
>> family pin controller driver". So as a reviewer, I'm a little bit confused
>> of the domain of this driver. Is it for a single SoC or really for a whole
>> family of many SoCs?
> 
> It seems that this is indeed a whole family of which BCM2712 is the (first?)
> incarnation. I'm not really aware whether there exist other physical
> implementations but I'll amend the comment accordingly.
> Please also see:
> https://lore.kernel.org/lkml/d6ab66cf-09ac-4f53-9102-11f207d16db5@broadcom.com/

It's not the first, far from it, that pinctrl/pinmux design dates back 
to the first Broadcom STB SoC (BCM7038).
-- 
Florian

