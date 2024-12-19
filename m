Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E52BE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 23:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6u0WGZX5bevNCSER8rkacAs/YIoLEm2PS2d0eBud4o=; b=fm5VlybK9arvCyVsw3VT2qRZ5Y
	L8zbTo/tkbo72g+sZYCH2hdk6Tacn/HKOJuxafUfEy3TSbjBIPohmaQDZYinebBTgnLyEDyXxEGnF
	kLUJOeLgJHbffX85GtUniVO5Y23KyrnHnF1Qbsb0LDDo38ve+VnMsqcnFs8VdgNNqkMkgAbstHC1D
	ovGBUiqNbaP5eF0pWz+U22UTXr//y7FxfklIZpf2t6e8tujYM4ymYHu/WPXli+p1c9Y++qtTvLYxF
	bbePa0j8V9bpnRUAqYpgSfYaUmUHSf9ruBz2vz2BOASp7XpDRiUkyD1wFwec36n6gA02sLbkt7rA3
	pBDJWIJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOQC0-00000003ODp-2Qi8;
	Thu, 19 Dec 2024 23:44:32 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOQAt-00000003O5a-17J9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 23:43:24 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-46741855f9bso12163021cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 15:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1734651801; x=1735256601; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l6u0WGZX5bevNCSER8rkacAs/YIoLEm2PS2d0eBud4o=;
        b=KHSnAJdSy3a6caOCYann+CtTML1VO81Y/E8GDoBYWacUTWElppgUfF4ZUBIGNsoMC9
         tFSocV4SRqZbFUHAIDxrou8UOODcWaEu1mqkbbqiVx59OsKc44gMmXa3Q3UsPvhFguuv
         rMGilxHzn8YST177xpY2z+0ySKYe0lnhJD+Nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734651801; x=1735256601;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6u0WGZX5bevNCSER8rkacAs/YIoLEm2PS2d0eBud4o=;
        b=ei3S6LoHMKQyokFag+OhhH4B1bwPEm0jCQ1JsZpR9s4S/fM5ZjJIMooU06A0yI5AbY
         ekh5W/85W2Z24ALzJ6sCLloTy6C+urnm2AzICLr87hd0Os3YVcb/oL7emB9HSHoz5iW+
         IKkeOqvBQroIyWfPm0QKU6DKiogkXAei3QpRoGjoQualLnzNrHIl3pU2GRUvaryNgUgY
         pj8lRoq05Ht487aLhnaLoQFCgJD3J/rXCvpwFUn6Y9/MEEle0fX8725qONC24ypF9F9c
         NGwoDIqC+Bh7uCu0g2sFiF8AEizbBxui/6SdN1FufxpZGqvCjnZSNW4G1GN3SOBAPcJ+
         80eA==
X-Gm-Message-State: AOJu0YxDGXUtYYiURewQJeJ9hUZTIaLXgmtZrB0/eFvsjJSS7Y4wRLCF
	LUQyaAtvbZqFa13Z2PiqNuQPf07MYf4MI4/6PvF28KHUQEZUM/7Oj8tCXzqAhg==
X-Gm-Gg: ASbGncvUSxrfog5rMZXNsMITDpw+Ayxof84jdGSCK+qyLD5LCy9CAZrLOOnrUV1b++z
	9A6H36kcKBAIAO+goXmVPhedsvteSL+0aEjHdbLYlxRBN8WWLeIhanRvn1xYLa7gnee1UNlwMhM
	zpPxLwjABsL4N7iHJ6IVwiVHzO0ZfFmq3/WBUbuw0CqbKbEqdfqV5GLo12xqI/3ZdNAqFGAHqJa
	6HG5CpurupdNuHz8kfTQTKINUyRfWUae8Su9xkMQNX1RoN5aIEpv30iLUyMD9I06Q31TiPHujEC
	q/GnL3SFDKFr8SIMGXg5
X-Google-Smtp-Source: AGHT+IEjd8IiHxml5lbZa6gNKaiW0KSQ9nxH/Dk9j8Q1oe17A8BPbx9sEBBLtJ3uAYYOg9WO0aTQVw==
X-Received: by 2002:ac8:5854:0:b0:467:6e45:218d with SMTP id d75a77b69052e-46a4a8af764mr17603711cf.3.1734651801237;
        Thu, 19 Dec 2024 15:43:21 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3e6a61cfsm10954571cf.44.2024.12.19.15.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 15:43:20 -0800 (PST)
Message-ID: <f906a056-3c6b-4115-9fd0-e50da8fc049b@broadcom.com>
Date: Thu, 19 Dec 2024 15:43:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: memory-controller: Document rev c.1.5
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 "open list:MEMORY CONTROLLER DRIVERS" <linux-kernel@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
References: <20241217194439.929040-1-florian.fainelli@broadcom.com>
 <20241217194439.929040-2-florian.fainelli@broadcom.com>
 <2e33t7ft5ermsfr7c4ympxrn6l5sqdef3wml4hlbnhdupoouwj@gfjpbmowjadi>
 <93a1333d-442f-4cec-b823-9b1a5ff6dc6b@broadcom.com>
 <wxq5zzfh5jesucbbste2j6x2jtj45wjfc5xzjkqbqqta7cprda@oaf5arr3z6pt>
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
In-Reply-To: <wxq5zzfh5jesucbbste2j6x2jtj45wjfc5xzjkqbqqta7cprda@oaf5arr3z6pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_154323_319493_3B889469 
X-CRM114-Status: GOOD (  28.95  )
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

On 12/19/24 00:58, Krzysztof Kozlowski wrote:
> On Wed, Dec 18, 2024 at 09:15:08AM -0800, Florian Fainelli wrote:
>> On 12/18/24 03:37, Krzysztof Kozlowski wrote:
>>> On Tue, Dec 17, 2024 at 11:44:38AM -0800, Florian Fainelli wrote:
>>>> Document the revision c.1.5 compatible string that is present on newer
>>>> Broadcom STB memory controllers (74165 and onwards).
>>>>
>>>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>>>> ---
>>>>    .../bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml       | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml b/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
>>>> index 4b072c879b02..99d79ccd1036 100644
>>>> --- a/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
>>>> +++ b/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
>>>> @@ -29,6 +29,7 @@ properties:
>>>>              - brcm,brcmstb-memc-ddr-rev-c.1.2
>>>>              - brcm,brcmstb-memc-ddr-rev-c.1.3
>>>>              - brcm,brcmstb-memc-ddr-rev-c.1.4
>>>> +          - brcm,brcmstb-memc-ddr-rev-c.1.5
>>>
>>> You should use v2.1 fallback and drop driver patch. Or explain in
>>> commit briefly why different approach is suitable.
>>
>> Are you suggesting that we should have fallback compatible strings, such
>> that we have something like this:
>>
>> compatible = "brcm,brcmstb-memc-ddr-rev-c.1.5",
>> "brcm,brcmstb-memc-ddr-rev-c", "brcm,brcmstb-memc-ddr"
>>
>> and the driver only needs to match on "brcm,brcmstb-memc-ddr-rev-c" and
>> apply the adequate register offset table?
> 
> Almost, fallback should be brcm,brcmstb-memc-ddr-rev-b.2.1 or whatever
> was in the driver first or whatever is the oldest known common
> interface.
> 
> brcm,brcmstb-memc-ddr-rev-c is not a specific compatible.
> 
>> If so, that is not how the current binding, and therefore DTBs are being
>> deployed, so that will introduce a breakage until we update all DTBs in the
>> field...
> 
> No. First, I thought about new comaptible so the one you add here. No
> breakage, it's new compatible. This saves you these pointless updates of
> driver everytime you add new compatible.

Yes, but that is not how the binding has been defined until now, so all 
of the DTBs out there have:

compatible = "brcm,brcmstb-memc-ddr-rev-b.2.x", "brcm,brcmstb-memc-ddr"

(where X is in range [1..5])

and there is no fallback defined to "brcm,brcmstb-memc-ddr-rev-b.2.1", 
so it is not like we can retrofit that easily by adding one now.

 > > Second, you can introduce fallbacks to older compatibles as well - 
there
> will be no breakage, because you add one more compatible. The old
> compatibles (covered by fallback) of course stays in the driver, so
> there is no breakage at all. We did it multiple times for several
> different bindings in Qualcomm. People were doing exactly the same:
> adding compatible for new device to binding and driver, without
> considering the compatibility at all.
> 
> Except being logically correct choice - using fallbacks - this really
> has huge benefits when later upstreaming complete, big SoCs, like we do
> for latest Qualcomm SoCs: several changes will be only bindings updates.

Yes, there are advantages to using fallbacks and we (ab)use that 
whenever practical.

The driver only uses a very limited subset of registers (for now), the 
registers change between minor revisions as well in a way that using a 
fallback like "brcm,brcmstb-memc-ddr-rev-b.2.1" is not accurate enough 
not practical. In particular for some of the changes that I am thinking 
of adding later on, we would need the precise minor version because the 
behavior and/or register interface is subtly different that this matters.

Thanks
-- 
Florian

