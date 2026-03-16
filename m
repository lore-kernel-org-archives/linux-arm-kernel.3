Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EC9F53D9A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 20:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QvbxHo1CougElCHCr3l0nzNQ8aTJ2JJLjNphgZvEFfU=; b=cwcigfukhg9oJ4gawJjbWWoKKY
	dV1Q3I54dIwjhebIze/8pul0mZyZXRB+18fLfjCyPmrNEMSjndugDmlLzTCr6fa5MSZ0Kf/DzapSx
	SLsUGir3H4McPkxeS81aU9rf5u88qImpTnqzrYs4vvt8Tm2yP/cllb2o6i3sbytI4jpU8kcHM2SS2
	sg6jRN0Drdx1vEmIptLytEOFNRWP/OwYTdGOXTfktII1D5Hr9MdQ6HhAL+U8X12CEBEAiTR9tY1QB
	htyVM+xP/JKN0Lxw4HIgC2L8WwT4TzUW4RyZx7/uzryYmDgR+6E4+vEvF5eeVUICgyXwZKeLr9/27
	CDnVpU4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Ewa-00000004qeS-0AFH;
	Mon, 16 Mar 2026 20:53:44 +0000
Received: from mail-pl1-x664.google.com ([2607:f8b0:4864:20::664])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2EwW-00000004qe3-2zZ9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 20:53:42 +0000
Received: by mail-pl1-x664.google.com with SMTP id d9443c01a7336-2ab232cc803so23460715ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 13:53:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773694419; x=1774299219;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QvbxHo1CougElCHCr3l0nzNQ8aTJ2JJLjNphgZvEFfU=;
        b=o5H06XKkw0zvDsEwEzmSdZCNnpp7iOfJ1txjKyM1cDSXlAgOnc0DzNFg9QfAQGVid2
         g/jb+t5DhnhG/hxRz1d9YDGhj1xUbIaRo9LJagPZ2/CV4MQ6uk8ctWbITL9f9dce/3vA
         QHtMF6yQ8c4UAPLakERIuS02QineV0t44rdzv11Ykr84d++HLI1M9WehsEBUQPT8ZAbU
         T13TD7/rrj967Ut5HSYVtUL7kMpf5ub7Zb2QZAMdS1SgeiwB0RVLh5Exxv7kTXbMi8eF
         x/Z+mZpvRzoqO9tZB+u6R3noSPaINrxLmDU5ri5MiVQrblQ6VMVMButt8/gffOB/37Ky
         Kw8w==
X-Forwarded-Encrypted: i=1; AJvYcCX/nlAvXGuuT6upc2FBnP+W6ZMuWnhAAv948xp1nnProZmbwwyFxSEd6/7aTLNQoPZ9jZu9Q2VHBlW0L6/X6pHY@lists.infradead.org
X-Gm-Message-State: AOJu0YwKoKFON7gz8CHAonH8HHlUDFTxFQVRqJuWUDrzZ3v4eT1SEhtr
	jW8gOYkLD2ov56uVFi95hOsNfPnLKQvT0PF3rSJ9KU4G/8WdZvwz8dkEhQJgAqKEbiuG2TmIRnd
	jtikjq5wzeNMiQvKwoNU7nioCk9UO5WwoqbdAAFOu1oiUmcO9i47kOE5LAF01KxpQ6buPaYD3h4
	oHHN1Mak85kSATAtEpUb6rC5U1gEyOh23GiJpPt7GHh9H33Q9dLSTsaEP/XGP2oYYOXLLwfo/8e
	CoeuEBa4G7kT/z5eFv2IQWocTIFiYw+lgY=
X-Gm-Gg: ATEYQzxueqInwxOz0BT5YPDGLp+n5dLHgXpBGMjXBRRyFBwBeB/qcCbrP7KKYjaVwXJ
	lO396vHPCim2lX6j61N2CyaHROfGlDRnd1CFIssYyL4pmjzsLPkv1bW8pTimnX0IY3CTrD/WSYJ
	JGPOqzIx1SiHbu8tc42Gx/RQG198PAfs8DmDPgwa4+4NiHtX501EKEnBlGbjDgW5i681p9kZwLg
	UCNm9Ol75C9aZR027kXVgxRJpBpNlhqE8/39h7q/qT0D3ng3n0Fn+9kJCdNiHqFR+CF3HsJbKU0
	LZTpCprpcRe5k7iaD06TAETyO1AvNzMir87O6QbZFfwRVZEaK9vFDwdfbRIEJMcma2eyRmrREty
	jD08NAjlyvS5gLBZuoklsw80L8Sv27/E4zlERCgHd0uLT/bKhJlr0SBc6N1zu9Qou4RkEsqWYTN
	IiLTsWmRrG35ccWTWA8Sgfyk0NodSTk7xRF8Dpn1U5jSt6pzxziyxOIIgc/Sjq7A==
X-Received: by 2002:a17:902:f603:b0:2b0:4ec8:fb8f with SMTP id d9443c01a7336-2b04ec90003mr75449455ad.40.1773694419474;
        Mon, 16 Mar 2026 13:53:39 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-63.dlp.protect.broadcom.com. [144.49.247.63])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2aece7e15d9sm14314365ad.34.2026.03.16.13.53.39
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2026 13:53:39 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd81506677so3199439085a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 13:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1773694418; x=1774299218; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QvbxHo1CougElCHCr3l0nzNQ8aTJ2JJLjNphgZvEFfU=;
        b=Jq5mt+xRvvWV6H+WRJK3bZBt3LbDxZPNwR7jFE3PXkglwHx545IBi6CZ9WoEr16h3w
         XIuWFU8PHwr9wYTkXuM+k6y/i+JCgrd0hMWF10lJgdB1MZ7eTX3v+u4rRkA6d+ykzqsz
         dL83WsXd4dDcSM9GgqTTgXjI/vZ3jOVr5l4Ik=
X-Forwarded-Encrypted: i=1; AJvYcCX/8B2U941iq3ef8TWyA+diaBhNHlINhDOI50bmsQmlHMrOGPjdBEcRnPhop+odbO3w9W4z2Jrjm5LtQmLGz68B@lists.infradead.org
X-Received: by 2002:a05:620a:2910:b0:8cd:94da:433f with SMTP id af79cd13be357-8cdb5b5fc6cmr1816166385a.48.1773694418095;
        Mon, 16 Mar 2026 13:53:38 -0700 (PDT)
X-Received: by 2002:a05:620a:2910:b0:8cd:94da:433f with SMTP id af79cd13be357-8cdb5b5fc6cmr1816164385a.48.1773694417631;
        Mon, 16 Mar 2026 13:53:37 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c55d00047sm28524996d6.9.2026.03.16.13.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 13:53:37 -0700 (PDT)
Message-ID: <cde82a14-671d-4dea-9212-740467dce128@broadcom.com>
Date: Mon, 16 Mar 2026 13:53:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] ARM: dts: bcm63138: Add I2C block
To: William Zhang <william.zhang@broadcom.com>,
 Linus Walleij <linusw@kernel.org>
Cc: Anand Gore <anand.gore@broadcom.com>,
 Kursad Oney <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-arm-kernel@lists.infradead.org
References: <20260218-bcmbca-i2c-dts-v2-0-5373ef82c50c@kernel.org>
 <20260218-bcmbca-i2c-dts-v2-6-5373ef82c50c@kernel.org>
 <CAHi4H7EeeotJEi_k+khUOP8Bgc7XG0uc6y9_MrUvSCNaK_Rj1w@mail.gmail.com>
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
In-Reply-To: <CAHi4H7EeeotJEi_k+khUOP8Bgc7XG0uc6y9_MrUvSCNaK_Rj1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_135340_779096_705E35F7 
X-CRM114-Status: GOOD (  17.38  )
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

On 2/19/26 10:29, William Zhang wrote:
> On Wed, Feb 18, 2026 at 1:31 AM Linus Walleij <linusw@kernel.org> wrote:
>>
>> The BCM63138 has a brcmper I2C block.
> I remember there was some discussion on whether this driver really
> works on DSL chips.
> Did you have any way to test it?

I did a long time back and staged my changes in this branch:

https://github.com/torvalds/linux/compare/master...ffainelli:linux:bcm63148

where the SFP could be discovered properly on the BCM963148REF board.

> 
>>
>> The interrupt is at INTERRUPT_ID_I2C whic is
>> (ISR_TABLE3_OFFSET + 19) = 96+115, convert back
>> to SPI interrupt 115-32 = 83.
>>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>>   arch/arm/boot/dts/broadcom/bcm63138.dtsi | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/broadcom/bcm63138.dtsi b/arch/arm/boot/dts/broadcom/bcm63138.dtsi
>> index 8e41c7130406..4ca4ec2ffed6 100644
>> --- a/arch/arm/boot/dts/broadcom/bcm63138.dtsi
>> +++ b/arch/arm/boot/dts/broadcom/bcm63138.dtsi
>> @@ -312,6 +312,15 @@ bootlut: bootlut@8000 {
>>                          reg = <0x8000 0x50>;
>>                  };
>>
>> +               i2c0: i2c@be00 {
>> +                       compatible = "brcm,brcmper-i2c";
>> +                       reg = <0xbe00 0x60>;
> reg offset 0x3e00 as  the translation window starts from 0xfffe8000.
> Patch for 63148 has the same issue.

Agreed, offset 0x3e00 is also what I used:

https://github.com/torvalds/linux/commit/01e1e67b294127562294802914ca0741ae7808f8

> 
>> +                       interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +                       status = "disabled";
>> +               };
>> +
>>                  pl081_dma: dma-controller@d000 {
>>                          compatible = "arm,pl081", "arm,primecell";
>>                          // The magic B105F00D info is missing
>>
>> --
>> 2.53.0
>>


-- 
Florian

