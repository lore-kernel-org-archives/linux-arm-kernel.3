Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F551099B3F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 21:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iHiAoV4+fwbAPfRCTePaiBsLGnqxTeGrcZRHEV+lAeo=; b=cI3fwDI9ZzB63JuBd179fZAf75
	338EDuM4kOl4yV3yn3sAFdasUVm2OMH/RxmS2VLjnvfaM6Z3wBB1bn7xX3uQtARjQfvUjnPwrnbBG
	h6jtFxRRz+jue6zB5cb2so/oSP4iDEczFh+4ayeE9nwgfWOEBsCbyhpB4RAXOM6Gy84tznpyGYAt3
	zmnz/unM8FaJT/lIjkvWdlpRkntYtyBL+yw0WkZ2dZUFfGHXhEnrUbjAnQhV8G48jiKrsbuzpYgZF
	AQptD18HW2Hze52ai9B6EsbTo1qt+EXbwxMt3CHwmA9UnCAkssohHmurTQw8Lbsj0y6Mov5k3rYPY
	gaX1pCqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hUa-0000000DdVv-2r8v;
	Fri, 20 Mar 2026 21:34:52 +0000
Received: from mail-qv1-xf62.google.com ([2607:f8b0:4864:20::f62])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hUY-0000000DdVV-2YxD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 21:34:51 +0000
Received: by mail-qv1-xf62.google.com with SMTP id 6a1803df08f44-89c4f7f8650so16117906d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 14:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774042489; x=1774647289;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHiAoV4+fwbAPfRCTePaiBsLGnqxTeGrcZRHEV+lAeo=;
        b=qNCVdwzsJq7rrLpzXX07f/AmGXlKdiQa41UuJLpNTtqCxdhDREyjZcp0CTTDc4GSUN
         SxqvI2Beu9pTzqDiO31Ele3IDsoM2mYIgd5EsKWpDeirWDr3L7PGnk4gccp0ZG231nsD
         g9MTOwiWwaDiBJQELRWR7jqZKbhcf+iA7iSVrJKZWHHAnLyMWouVFLVqurBRh+yLBOkY
         uleN24Swq3pH5nNbIDProrN9Rm1FHZh2WmyK2kKnwYcl780jrCld9jnJ8zwddyQyaQhM
         wuHFOf1OhQBZKtiIZECHoSJBZw8hVv77N4R+mLtyWTBxTahB0IRi0vFjby8VnnTMefdF
         h7fA==
X-Forwarded-Encrypted: i=1; AJvYcCVotIyeYAR4jjpQ4mT/ZGJPOehiNpHf/XBSKpuAXEdeCufuTLBWMvDsdRN/bbOBaWQ6FIqME+XUiJ7UoMxgZFYP@lists.infradead.org
X-Gm-Message-State: AOJu0YwGCdJO/p+9/yLekc5X4ovYVcug62ZJ4Usgmq6ut0kFD4okb6ko
	lMa13YnCpmIAuJg6vtLFIuV69B2nInIim5FP0ejYnNKi6QqbVAi5IbYcKQKnHjue5hgc65rog4q
	/IzLV8L3osMXTLvmtyUt4InBISgR8utqZ1D2IoHQ4cY50ZPUICJ1BWICw6tJ1ArPaRWgWtZWA0u
	GvA7roUI3sOwgyy+GcRqGBOWMOHec+5UyAmsj2y5po3JZxMCui/E5aFDx582Nk285xUpOoHfL8m
	7Q2whSAyNic8tFlEkvLA5l5bjWX+gb911I=
X-Gm-Gg: ATEYQzxDgicxYnP78SCwU/GretVjVYPe3KgN17jNC26UrTXt6ywRSo6rpl9b5iFdtnu
	ruzhVuG+g2QOXqkLGCMwlIX3Z989g++dxiVElvYfYNq7O42nV+i/ye338aaCXtzL/S0aMcrjr6F
	GFt+rrkrFWjofMRo8P2+ZK9LzeZ5ouy5l0TihcN9k9rqkYeNuXZoj+E5cOCq9CuLJ9TlieI4fI/
	PkNtguduwJ41pap5sdTnPlnvqD+UGpXdrJ+x+ZMGVvlDGmAmfB6eupKijHFtc2k0oQHlcybV9K9
	drUim5R9GofnJZBlU0OdBDXEYlwa+fqFP/CFg+WUQDp0oGZEDKDbl2D/JiJ3/IdhnKUIZffCwtI
	rapdpE+QeOHZoidbxwKmqvJzIVwN4lNIJHg3L9W5jn0cso7LzxKTUBhnwpeThf9OZ1iDTKOVBAu
	ebiyTCQmimSModPZOLQfUGA/iElR7N/s7HkW+SEfNhQQJBZHOBwo/XyY5tUPIZFA==
X-Received: by 2002:a05:6214:3018:b0:899:fcce:b1f7 with SMTP id 6a1803df08f44-89c85a7e246mr72986806d6.45.1774042488790;
        Fri, 20 Mar 2026 14:34:48 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-89c8522b587sm3405186d6.8.2026.03.20.14.34.48
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Mar 2026 14:34:48 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c105e5ac70so1041898eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 14:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774042487; x=1774647287; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iHiAoV4+fwbAPfRCTePaiBsLGnqxTeGrcZRHEV+lAeo=;
        b=c1L8vnf2UwvrJ2Eev6YZAJ6ncFa6Q153bBXBAdj6tYPcYDQi7vH/1ciIqcIggkcYGj
         0VVgt82i5mz5AMrZck01MkeEKglsWH13DxyH4B7FeGN42ZB0RyJJZ4MqycWBhOVR5RUS
         Iahsm0Nu3Wm45wcd5LQRTprKJmz4x33UChc5o=
X-Forwarded-Encrypted: i=1; AJvYcCUtScnSTr+7GMvSeY+Bmx1ibw8VAD3V3BIAqyCVHpcuTWIMmEGx7KHFBLLNRrGM+E0QMpFcoaGbciyBdCt+3AJW@lists.infradead.org
X-Received: by 2002:a05:7022:6728:b0:119:e569:f609 with SMTP id a92af1059eb24-12a7264f4demr1889994c88.2.1774042487051;
        Fri, 20 Mar 2026 14:34:47 -0700 (PDT)
X-Received: by 2002:a05:7022:6728:b0:119:e569:f609 with SMTP id a92af1059eb24-12a7264f4demr1889984c88.2.1774042486387;
        Fri, 20 Mar 2026 14:34:46 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c99bsm4972628eec.1.2026.03.20.14.34.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 14:34:45 -0700 (PDT)
Message-ID: <fb4c139a-1abb-410c-950d-97b1ed44c9ff@broadcom.com>
Date: Fri, 20 Mar 2026 14:34:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] ARM: dts: BCM5301X: EA9200: add wifi definitions
From: Florian Fainelli <florian.fainelli@broadcom.com>
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
References: <20260319035324.269905-1-rosenp@gmail.com>
 <20260319035324.269905-5-rosenp@gmail.com>
 <CAKxU2N8Vb3D0oEGPzOqvwsXSVLhJtxh=5xrd6qq-Yj2X8Rt5Rw@mail.gmail.com>
 <b3212a44-2783-4c37-95d4-56e0b486c73c@broadcom.com>
Content-Language: en-US, fr-FR
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
In-Reply-To: <b3212a44-2783-4c37-95d4-56e0b486c73c@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_143450_690256_81271576 
X-CRM114-Status: GOOD (  11.54  )
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

On 3/20/26 10:29, Florian Fainelli wrote:
> On 3/19/26 17:29, Rosen Penev wrote:
>> On Wed, Mar 18, 2026 at 8:53 PM Rosen Penev <rosenp@gmail.com> wrote:
>>>
>>> brcm,ccode-map and ieee80211-freq-limit are needed to be specified on
>>> some of them for proper operation.
>>>
>>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>>> ---
>>>   .../dts/broadcom/bcm4709-linksys-ea9200.dts   | 50 +++++++++++++++++++
>>>   1 file changed, 50 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/ 
>>> arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
>>> index 617fb55bc52f..7b1363aa1144 100644
>>> --- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
>>> +++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
>>> @@ -93,6 +93,56 @@ led-3 {
>>>          };
>>>   };
>>>
>>> +&pcie_bridge0 {
>>> +       pcie@0,0 {
>>> +               device_type = "pci';
>>> +               reg = <0x0000 0 0 0 0>;
>>> +               bus-range = <0x01 0xff>;
>>> +
>>> +               #address-cells = <3>;
>>> +               #size-cells = <2>;
>>> +               ranges;
>>> +
>>> +               pcie@1,0 {
>>> +                       device_type = "pci';
>> There are typos here. "pci' vs "pci". Should I resend?
> 
> Not necessary, fixed it up while applying, thanks!

Meh, this was not even build tested, even fixing that gives me:

  ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make CHECK_DTBS=y 
broadcom/bcm4709-linksys-ea9200.dtb
   DTC [C] arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb
Lexical error: 
arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts:107.19-22 
Unexpected 'pci'
Error: arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts:107.19-22 
syntax error
FATAL ERROR: Unable to parse input tree

Please resubmit patches 4 and 6 since I dropped them as a result.
-- 
Florian

