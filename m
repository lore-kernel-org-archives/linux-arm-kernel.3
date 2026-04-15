Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91889F428F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 20:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCY2zTuKCD2oZKU0TN81PGUoMFJNm+Dpvd0IWUv+sgE=; b=aIwx22FMPcBUJst29Nzvj16gnu
	+hXZqoNhwxxht3jO3MQch24DR9veNF+SWG9/op4hcRwS6g2Aq2TliCdg7NeK7Qo3dJndPfBb6QG32
	3z9lrG2+QyDczSF5J+6tceqE7x3PgXDAFz5g18/BgE7qscvAN+Eon+hN8ZB3OgXzYtz/5H/jAc7U+
	uklrUEzQZgBMX3PMAfL4+7ZGaNcAisgNQ/ZDkjBCLU+3KaDLx54nW83ErZ4DD6s6r5WcGgp6i98aC
	R1HAYMwDuLQuFOFXyV7lB9y0sVZVCFihNTosQVWg60SphshyvRjjZnMRD+bchaRM3uHgqzLWz3nTV
	xfIZpEzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD76q-00000001bCd-0qo4;
	Wed, 15 Apr 2026 20:45:17 +0000
Received: from mail-qk1-x761.google.com ([2607:f8b0:4864:20::761])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD76S-00000001b9y-0Wwz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 20:45:08 +0000
Received: by mail-qk1-x761.google.com with SMTP id af79cd13be357-8cfc5941028so1041599885a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 13:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776285883; x=1776890683;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MCY2zTuKCD2oZKU0TN81PGUoMFJNm+Dpvd0IWUv+sgE=;
        b=s4sbzXc99K8eY/f97LvC75N5E3dAnJ3wlnApJIz4c9AWPLOJa4As9v3w4CVWRjjqUb
         Pk5R93d7bge4kxJT5iOSJYltlmmt4/jO88TRcub7wE17dYgDGqrenCPpZ33x8vRpGzZT
         nZtOgiVIbrG47GUS7dqUTPV7U5t+DS/rKnYC5UvA4HYC5uOBXroHY4KUNtfwYr55vLC/
         rbzXc0LNuLFmZQMefRQS2/Fthi1rIidi4k0AYN3HTmZKFO/tWzUE6rCZ9Vq039q+/oTC
         oXslgiarecguGSwMmGz1ZuzGVnTzFI8iv2Hj+Y1W11j8Q92NsO0GNHnzs5RcWUTIaDxG
         5AoQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3EgsURxLBu69hUEQhegng0YqjfChy0PT3isXBcRZSEsDFcxpuwYzqhjKdnFYYETUN37ZuFsOIF2M5HyKsHm8L@lists.infradead.org
X-Gm-Message-State: AOJu0YxNsOWTKRB4tAd8CRAvOwPnTF86jMcK7d+VIlYzSjznbbjCP9OS
	HXe6crHW06MBfHhYy1D/0prWRPnTekz8Wo4fHKObesCsCM5yeULvr5KEwBIjQxoBQY8ohzziBTU
	+DhpdKVn94u3qZ/pNzMKnrfunvLCIvLeBHzI15yuuu016Tr0xf3O+J8TmIXWKUHodXaDqyafjv6
	aFj8uyg/78mUAK8x7tIuYoOCm0afaJZJuPLv/qo6S9h8YemkxVYFd/sDjrRzzuK2HlbP7LOtWxD
	W4UUMnxPUzNS5gpNNDdm+FqMbV/Q9+Wask=
X-Gm-Gg: AeBDiet9on8CcICwSNhjF70AtraAhCvqV5FMiHaSgySg4u9WzK1NseNUetkb17WAz5y
	QVNIIFl2Cgr6Yb1oXc6zl7MtCc18+xOFU/mxh5Ea17GP0fZGi+YEYCKkPwNAGnxqk+mG2R++tzg
	B4SOU47iPpLtlEN9sXcqQOImT46jhkFS/WmvTv4M2VGGfwxQIs/6MzUJpdX21OkidsNvzXhWT22
	yoJapi3D6E6jUC42VD8tPDt/8H5CTIJP0W9DpskHfFNJwFJ3g9rAsW3vIlmCcSA4y0guSPAPa4r
	OH1U+QMwCtYwPtR7Zw6ptYeOp8+hvQwsx5RZVMk2u/lybBX9e/uVhB/xTkvYrFD5XBC/5Vy2lP1
	8J3Xng2O7kM4b88vvbhl2A0ZNnH6bUh+ChcoMsIT2f95F7TOWk5Z/CRh3blcC3SZtgxbTn+GJyw
	Sk2Gb2rj0A+bplx3EcdedTSQWymYcpZFM6gJ6rkc3Fqw6m7K4eZ4mSIaSMlxvG73gP
X-Received: by 2002:a05:620a:4722:b0:8da:d152:b7c9 with SMTP id af79cd13be357-8ddcf4b5d13mr3380137885a.30.1776285882352;
        Wed, 15 Apr 2026 13:44:42 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-102.dlp.protect.broadcom.com. [144.49.247.102])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-8ae6c95f866sm2085716d6.10.2026.04.15.13.44.42
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Apr 2026 13:44:42 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1275c6fc58aso10642809c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 13:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1776285881; x=1776890681; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MCY2zTuKCD2oZKU0TN81PGUoMFJNm+Dpvd0IWUv+sgE=;
        b=WDLrIYSH7NhGkPwNKawEFYWGLgK2Hzcx6zd9IC5wsbfqNMDY+2PqUdRyMx/SQ+ZaQo
         C87Frhms0NErL1OshjLvGcyetkZIANwmrzUCo34v2lPdwHBxUg4A/RIQXvcHbIE+42Jo
         GEKFPtG7Irycq5QXc9jRP2R9/N6C/BcWgynA4=
X-Forwarded-Encrypted: i=1; AFNElJ+5cRiE9zr9a4U0NZXLyWSPp56y3MqoxCSf7D5Hn5ZIy8sfA5BrIG59DxUB2JWAtshdHMxHREm2uHfpxpJ8wPwX@lists.infradead.org
X-Received: by 2002:a05:7022:69a2:b0:12c:8b9:7208 with SMTP id a92af1059eb24-12c34eeb95cmr13372199c88.26.1776285881093;
        Wed, 15 Apr 2026 13:44:41 -0700 (PDT)
X-Received: by 2002:a05:7022:69a2:b0:12c:8b9:7208 with SMTP id a92af1059eb24-12c34eeb95cmr13372166c88.26.1776285880292;
        Wed, 15 Apr 2026 13:44:40 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e61d0bdsm3503412c88.2.2026.04.15.13.44.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 13:44:39 -0700 (PDT)
Message-ID: <e1ba9b6d-0ad8-4336-a5f9-ad4777ef54e0@broadcom.com>
Date: Wed, 15 Apr 2026 13:44:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mmc: host: sdhci-iproc: implement the .hw_reset
 callback
To: Meagan Lloyd <meaganlloyd@linux.microsoft.com>,
 Scott Branden <scott.branden@broadcom.com>
Cc: rjui@broadcom.com, sbranden@broadcom.com,
 linux-arm-kernel@lists.infradead.org, tgopinath@linux.microsoft.com,
 adrian.hunter@intel.com, linux-mmc@vger.kernel.org,
 kernel-list@raspberrypi.com
References: <20260327222150.2108111-1-meaganlloyd@linux.microsoft.com>
 <3305684d-8517-47dd-8852-2e34d40fc712@linux.microsoft.com>
 <702c52e4-b0b3-4e1e-a40d-29e136e46d7d@broadcom.com>
 <448010ef-278c-4711-a244-447a2b1a22c1@linux.microsoft.com>
 <CA+Jzhd+_CKn1X0YDsoh9-OFeCG9sc2Q0OFfphkRaXpEA647xyQ@mail.gmail.com>
 <58294850-4ed4-4fb4-8f46-186063b76a2f@linux.microsoft.com>
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
In-Reply-To: <58294850-4ed4-4fb4-8f46-186063b76a2f@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_134453_876695_74D6BDBC 
X-CRM114-Status: GOOD (  17.53  )
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

On 4/15/26 13:43, Meagan Lloyd wrote:
> 
> On 4/15/2026 1:23 PM, Scott Branden wrote:
>> Hi Meagan,
>>
>> On Wed, Apr 15, 2026 at 11:08 AM Meagan Lloyd <
>> meaganlloyd@linux.microsoft.com> wrote:
>>
>>> On 4/13/2026 10:43 AM, Florian Fainelli wrote:
>>>> On 4/13/26 10:38, Meagan Lloyd wrote:
>>>>> On 3/27/2026 3:21 PM, Meagan Lloyd wrote:
>>>>>> Implement the .hw_reset callback so that the eMMC can be reset as
>>>>>> needed
>>>>>> given cap-mmc-hw-reset is set in the devicetree and the
>>>>>> functionality is
>>>>>> enabled on the eMMC.
>>>>>>
>>>>>> Signed-off-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
>>>>>> ---
>>>>>>
>>>>>> SDHCI_POWER_CONTROL[4] (SD Host Controller Standard) has been
>>>>>> repurposed
>>>>>> on my Broadcomm processor to be eMMC hardware reset
>>>>>> (SDIO*_eMMCSDXC_CTRL[12], HRESET).
>>>>>>
>>>>>> Can you confirm this repurposed bit is consistent across the Broadcomm
>>>>>> iProc processors and thus the .hw_reset callback can be uniformly
>>>>>> applied in this driver?
>>>>> Hi Ray & Scott,
>>>>>
>>>>> I hope you're doing well. This bit looks to have been repurposed from
>>>>> the SD Host Controller Standard's VDD2 Power Control to being used for
>>>>> toggling the hardware reset signal to eMMCs. Can you verify that it
>>>>> applies across the iProc processors so that I may finalize this patch?
>>>> Which iProc process are you using? If you are not sure this applies
>>>> broadly, can you at least make it specific to the SoC you are using?
>>> Yes, if it comes to that I can. I think it's overkill to roll a new
>>> compat string/associated structures over this small change, hence
>>> checking with Broadcomm iProc maintainers on this thread.
>>>
>> Which iProc processor are you using?  You will have to check with
>> RaspberryPI as I think they use this driver as well.
>> If that family also supports it then you probably don't need a
>> compatibility string.
> 
> The processor I am using is the BCM58732. Can you help direct me to
> someone who could comment from the RaspberryPi side?
> 

I will take care of that.
-- 
Florian

