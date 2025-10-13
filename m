Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801AFCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 22:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Eyb/umL56dPGqEY4VTwLOjKTdYu1sJFdxZUnFgjKhI=; b=vMMNk0ToinzodwhfUK0Lmz/DjI
	OMo4fjQhWkPAs9KywtVa6y84RQQDNgXX+mcSNkj7gLHG1OSDlagTy40AXj+fTHIhfLgSO/s4YsJhu
	0oSikw+U5H/O9b+IbjfDVh1HnqvTTOk034p9nzcrUvN9yyilL7w2QZMCX8oF+43YPnpl6Zm6wLgqs
	77MA/hvOdXthXOfp6pynHQpIulnhACiTZ90aCkDTd9TJI8F8cwvwtDRTBHN+JzO6u2koZhvy8YZjo
	MDCOpfvX2tlVgaop0q4H9pvnqpgBXUKVpTjrFQl2iWj/+ZbyuMEjYD5RoIYjIeFb9LDKqpG3CKC/z
	G2BzbNZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8R8t-0000000Ei2W-18hl;
	Mon, 13 Oct 2025 22:35:47 +0000
Received: from mail-io1-f100.google.com ([209.85.166.100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8R8o-0000000Ei08-47qk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 22:35:44 +0000
Received: by mail-io1-f100.google.com with SMTP id ca18e2360f4ac-93bd394fab0so117918839f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 15:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760394942; x=1760999742;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Eyb/umL56dPGqEY4VTwLOjKTdYu1sJFdxZUnFgjKhI=;
        b=FspoFH+JCOMjOzPrWK3N2gH7EUjo0tBHRVPhOGlbRZ8i+VNiWCgPdlp/jgSpndOjnk
         ifLpSWv95B+jRJBQHBfJICI0osovjBzy/q0/jtmOwygvRwDWrIplIQz6lFzVIj72CZw7
         7eWmb4KxWRJb0hmVbes/FkRePrzcj+Sme28qu0FZb7Am548POH6xeSAu0o22u267/yvw
         xwQVV5WAYoILzLtIzGV1GNhZN3tgDGfwBU+b32o/2vOBj88AvABFiaKIV0bicxp/j7Cg
         vvuC8v79QcxLKCXXzhJQcwd3G6+y56hHkRXuRNrwEeoleekRocpW3PC8ZDCU0dkAXGQ6
         iOmw==
X-Forwarded-Encrypted: i=1; AJvYcCU06ogk6CxKqt0khGBMWGQ/yBd+wgU9LnV5B268buRrNnxRjL+H0JIjrjWLjoOteZTuc1nNnvWjNgKePhOv5BeV@lists.infradead.org
X-Gm-Message-State: AOJu0YwSmJ1frsCmlHS4gyko0NhD/1OV+73Ne6zOTfdrxR+3yA4kqFeW
	WJY6Du1l22dBF4grmfYHNkr7wck7JUvmB1nvmYiIo6Zpp3rFlRJyP5r4pDdDt/nSsWFpNG3Y2ZU
	u5E3WesG6cIiw6sp4E2GvkbFBLdGTbagTAXLJA3AuKVOXeTZMCA3wGSgocF9kkddI6fZi8dFglc
	rmKHGMnLLi+Fuo1cuctdYz91zQID/6EoabRRI2S2/SMvxl2k7eXtSWM90EfewPqd7C6EQ9O+F5G
	qED6c/BvdEAD/nW21/d55wNsclskK8197E=
X-Gm-Gg: ASbGncvPDVzSexUihDx17nqQ8dMnSqWglc8o6Z2tVKKsmLF5FoqjKCZn6W0Z9vCQfd5
	9rRv+X50/FE0xbFzkbArNLA982nr9IrKIlnjRK8XQJIF4daAlh6NTC+TDPMFY+hL5qTojZtsIVR
	p+8ZuvGOpAIdq3AsjhfTb1CszXkcbT5Ybl9Z6OjdCLv4PaSDiagKw27FOlKgd9IGckL8EqeNSB7
	8lw1o0F4Eb2TfX9S2QD3J+JUtbjXKV+3TlaBZLorQ5fmQyqI3uZ2o0WZdnLRRSCbeZLSv1TC6wm
	9QccceSol58D6/dH+OQZhQf1fkNrL+0+p4fqzSaq0SkDroc8vQx9nr3UkqxMV72YtftDaXuYPNc
	k0OBxfD55YOMfrkF/Xu+Ec/zyvq2m7W9dZ/nPt661YDQkYhy9rIsv1cJy9lq7kWbdt50ZTRN/Hx
	NCrTksUvk=
X-Google-Smtp-Source: AGHT+IGOSpYByBKobaPX7O+XpUhCg29zPPd8zw+Z/C/VRAizqPpKnlg9P6gtQfVxPT/6KhNWdqnCPzcQIBkI
X-Received: by 2002:a5d:9c45:0:b0:917:664e:c00b with SMTP id ca18e2360f4ac-93bc413f3camr2400890039f.9.1760394941846;
        Mon, 13 Oct 2025 15:35:41 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id ca18e2360f4ac-93e25789489sm69625239f.0.2025.10.13.15.35.41
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Oct 2025 15:35:41 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-870d82c566fso2251978085a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 15:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1760394939; x=1760999739; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+Eyb/umL56dPGqEY4VTwLOjKTdYu1sJFdxZUnFgjKhI=;
        b=Zw1VjG37GyvKZOWMcg+P3+CLU37c3eOLfv2RWahlGYP+PLkhZ2HW7i+gn0IdHIOiwS
         if2BWT0wOtNMBvYAmxBGPFUPA5waSTHjEWSykUOQOJwrVJROw9FgZry6XTxcOGSE50vS
         Yla13TnVilWsFGg+qpo01L6fx0dGZqw1weSzo=
X-Forwarded-Encrypted: i=1; AJvYcCXb8LKxI7urFe49UpAdfno12FUUQlEKD8qrPp2xvRM/QJQFT7HvuOqcK39lNtXt98V4ZYem/arjUa6NiJb0KomP@lists.infradead.org
X-Received: by 2002:a05:620a:1a04:b0:82b:33c1:69e3 with SMTP id af79cd13be357-8820b47b828mr3694939385a.10.1760394939489;
        Mon, 13 Oct 2025 15:35:39 -0700 (PDT)
X-Received: by 2002:a05:620a:1a04:b0:82b:33c1:69e3 with SMTP id af79cd13be357-8820b47b828mr3694937385a.10.1760394939087;
        Mon, 13 Oct 2025 15:35:39 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8849f9ac935sm1072961585a.15.2025.10.13.15.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 15:35:38 -0700 (PDT)
Message-ID: <0b6f0503-865e-455a-a43b-e9a53c673d92@broadcom.com>
Date: Mon, 13 Oct 2025 15:35:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: BCM53573: Fix address of Luxul XAP-1440's
 Ethernet PHY
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20251002194852.13929-1-zajec5@gmail.com>
 <4fcba9c1-ff83-40b5-b7eb-758fd43ea978@lunn.ch>
 <8f0b1ea5-6c38-4b7b-a8a0-724f7e317d65@gmail.com>
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
In-Reply-To: <8f0b1ea5-6c38-4b7b-a8a0-724f7e317d65@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_153543_147947_1E168519 
X-CRM114-Status: GOOD (  16.93  )
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

On 10/6/25 13:34, Rafał Miłecki wrote:
> W dniu 6.10.2025 o 18:09, Andrew Lunn pisze:
>> On Thu, Oct 02, 2025 at 09:48:52PM +0200, Rafał Miłecki wrote:
>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>
>>> Luxul XAP-1440 has BCM54210E PHY at address 25.
>>>
>>> Fixes: 44ad82078069 ("ARM: dts: BCM53573: Fix Ethernet info for Luxul 
>>> devices")
>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>> ---
>>>   arch/arm/boot/dts/broadcom/bcm47189-luxul-xap-1440.dts | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/broadcom/bcm47189-luxul-xap-1440.dts 
>>> b/arch/arm/boot/dts/broadcom/bcm47189-luxul-xap-1440.dts
>>> index ac44c745bdf8..a39a021a3910 100644
>>> --- a/arch/arm/boot/dts/broadcom/bcm47189-luxul-xap-1440.dts
>>> +++ b/arch/arm/boot/dts/broadcom/bcm47189-luxul-xap-1440.dts
>>> @@ -55,8 +55,8 @@ &gmac0 {
>>>       mdio {
>>>           /delete-node/ switch@1e;
>>> -        bcm54210e: ethernet-phy@0 {
>>> -            reg = <0>;
>>> +        bcm54210e: ethernet-phy@25 {
>>> +            reg = <25>;
>>
>> Does this really not work, or is it relying on the PHY responding to 0
>> as a broadcast address?
> 
> Invalid PHY address was breaking Linux's support for Ethernet device.
> 
> Before this change:
> [    0.986560] bgmac_bcma bcma0:5: Found PHY addr: 25
> [    0.991913] mdio_bus bcma_mdio-0-0: MDIO device at address 0 is missing.
> [    1.024512] libphy: PHY bcma_mdio-0-0:19 not found
> [    1.029358] bgmac_bcma bcma0:5: PHY connection failed
> [    1.034514] bgmac_bcma bcma0:5: Cannot connect to phy

OK, so the SPROM told us the PHY was at address 25, but when we went on 
to identify the PHY at address 0, there was none, and so we could not 
connect to the PHY, that makes sense to me. Applied!
-- 
Florian

