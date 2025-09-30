Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A77CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 19:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mEfsyBIOLNFZekIuKmhiFVgQSrwSDxg84Ts1cNcrGIY=; b=gcxYMVjQi5AxEeDFkcy7yUU0mO
	DAClv8FmEKfM+YZZkYebnQDb7sx3Bt2l5ORk+CIq6u2NbbbonKTNjcOdLi7y2HwisbWLV9wrMq/iP
	GilPwNHox30RRhaHpY1hTldluVQw6S2Y+jh+pe0dhggeMWeV14n1fEtrumLuA/uAli2HIxzXT3rUZ
	FIbKMCH9Sdu7Lq5wmzk8fYBRp1dkGVau5WzFzUxBPmm3Jj/CwGeO7rWrnVhifD7gP0xatdwtqEHE6
	AVQQSZ8rOKV1I6t9qTPMKfAXhFWtRwXUKoS1f1i6q+3jLVJyozhEenLBSnvS/l9duvOh3zpAgs1dC
	FI+DFqXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3fip-000000062iT-1nDS;
	Tue, 30 Sep 2025 19:09:11 +0000
Received: from mail-qk1-x763.google.com ([2607:f8b0:4864:20::763])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3fil-000000062i7-2PSG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 19:09:09 +0000
Received: by mail-qk1-x763.google.com with SMTP id af79cd13be357-863fa984ef5so510297385a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 12:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759259346; x=1759864146;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mEfsyBIOLNFZekIuKmhiFVgQSrwSDxg84Ts1cNcrGIY=;
        b=l8GWzf8SDKCqleWCm2S+B9+g7tI8rGxmJ243tJUwQdb2fN06pBjCWKt0g12ZKVRlkI
         Ej/9EVBhWlnWU+ZMnRP7WV+WrXoOCdzGVR4D9UinKgyM+HlFRjjafASw5bU/4UFNPnDr
         GE6KVqkmUiZXiQ/SpDS8HxvhWZGNCf2jL8B9ShfyFuwtQAPLM7L2aU17BOpRD8FTM59P
         VvzU81SZfgD2MYYnyLfFn4xokXeeHegocYdt5NWwhsg46LySI8f7+Pn57BVlS4juxBdH
         lVqBpXnSXEiGaZPZLAn8MywaHuchKXbtBYMXg7b9vdDs5755LHPWNUNnYc59od3p9tEZ
         aWvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnsTXuDZqbKjoacys1YlZP5AdUhu4mbfUkkl1XILLfQHVPlg0XZhV3T1w2mp8YDcv6gZAXVOYlaxxkANzXLx/B@lists.infradead.org
X-Gm-Message-State: AOJu0YyOnH9shWEInbYZ2sO4uPQVwOAwIhE30LWCqiSgP+wNkGZGJpNI
	9+r4r0Re+hPkm86/syStOEVpW+fZYMcYBB8zQiqm/HySqxJii74+I1tUJ9U1xOGxKM20d/fY3xY
	IMnQ0KphAcsSIITbfPeREDltrLDwa0HQ3y2jdC1bkX1dmSeMrkke+N1Zul/sf9HSgTlh1rQ+/kH
	zwuSjcMysE3Exw9oJ1MjJqbbPwlhWAHmy4gFx9JOUSa4x62ZMKfpdDCX9k+1naybbblm1cz/sQT
	Dc+6GqC3xsZ1mjVqMY+T9FPE0nSXrU7h1k=
X-Gm-Gg: ASbGncvFxFqZMeHqLpKSLdRA5Dsu/ndxJaEBoSXBh5bsbMkH3WZ3MZVj77Zj2mtkT9j
	h84gjcDIU3ZaH0NgGWAaMlSzwoq5Vtt0V6IHxetzGl7VhBJPgtIveVX481mnHfoBJCJ2huAjIqN
	7VT83bgMk60J0xh6NjBmzdmXd0o7QwGFeQuIgsUXu+Q9YXx3yN7XarUtNFfMHiOKRrcUeiv7w0S
	SiomPYXHk+NwYf0/2YB7aIdhKysno7vAg/fhim+Eyzm3cC8jtUTOwxF+JHyFE+awGQuviXKDMp+
	12IuXmIbmQn/lYse4DBd53TMVbfGFXKY1eq0p8ol4Xzvll7zoAVv3SrR1aQjEjf+BQbR3rWCKjI
	wWXXXLZYEl3zPfqlAOaFTfnFfFnNq8yCtShR/93q8gOk5LARtb7PQDym8s5s3/ap23zEzEKilcv
	PUzs4Lb+L7gz2F
X-Google-Smtp-Source: AGHT+IFC3OdBDC3Sw+dHCzKXcaw0Oo895kdjw8m5AnrfzVtO0NpdisJoHzt+zKMkaOxVpBpWzRF/ZAzYko2p
X-Received: by 2002:a05:620a:4481:b0:85c:b613:633f with SMTP id af79cd13be357-873754829c7mr135042985a.44.1759259345655;
        Tue, 30 Sep 2025 12:09:05 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-85c2f199368sm109580185a.8.2025.09.30.12.09.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Sep 2025 12:09:05 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33428befb83so7115689a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 12:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759259344; x=1759864144; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mEfsyBIOLNFZekIuKmhiFVgQSrwSDxg84Ts1cNcrGIY=;
        b=Taf7KzmzKLdC4pk2rXJjuloS9nd6tziV8PhC7nua7JY4pAZA5dGBKX0QT1vRzUjOfw
         o0kVve8fvzAfNjUnAUtw/xt9x/AemFBlY6ml4R1ZNE5TK+ro09BnlnMyMOlNLzZ/xwhY
         i28J48E+gycIinC/toVJnJjhkBFf7d4InHG2w=
X-Forwarded-Encrypted: i=1; AJvYcCXI2mZPj+e0nAQeVVqr/+xfCUqUOi02tkZSoazHwjv3304Qah+0g+zRRpPo6K+1FzL9+vS5pIPkCJKwcGFZG5Y7@lists.infradead.org
X-Received: by 2002:a17:90b:3a92:b0:334:29f0:a7e4 with SMTP id 98e67ed59e1d1-339a6f36cbamr634149a91.21.1759259344376;
        Tue, 30 Sep 2025 12:09:04 -0700 (PDT)
X-Received: by 2002:a17:90b:3a92:b0:334:29f0:a7e4 with SMTP id 98e67ed59e1d1-339a6f36cbamr634109a91.21.1759259343918;
        Tue, 30 Sep 2025 12:09:03 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6ebe5f2sm297610a91.11.2025.09.30.12.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 12:09:02 -0700 (PDT)
Message-ID: <1bb0f2f9-d3fa-42af-aa55-e9f0771ed5be@broadcom.com>
Date: Tue, 30 Sep 2025 12:09:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock
 support
To: Conor Dooley <conor@kernel.org>, Kamal Dasu <kamal.dasu@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com, andersson@kernel.org,
 baolin.wang@linux.alibaba.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250929200628.3699525-1-kamal.dasu@broadcom.com>
 <20250929200628.3699525-2-kamal.dasu@broadcom.com>
 <20250930-slapstick-volatile-60ad540f4b66@spud>
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
In-Reply-To: <20250930-slapstick-volatile-60ad540f4b66@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_120907_666974_1E5FB658 
X-CRM114-Status: GOOD (  17.31  )
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

On 9/30/25 12:03, Conor Dooley wrote:
> On Mon, Sep 29, 2025 at 04:06:24PM -0400, Kamal Dasu wrote:
>> Adding brcmstb-hwspinlock bindings.
>>
>> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
>> ---
>>   .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 36 +++++++++++++++++++
>>   1 file changed, 36 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
>> new file mode 100644
>> index 000000000000..f45399b4fe0b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
>> @@ -0,0 +1,36 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/hwlock/brcm,brcmstb-hwspinlock.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Broadcom settop Hardware Spinlock
>> +
>> +maintainers:
>> +  - Kamal Dasu <kamal.dasu@broadcom.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: brcm,brcmstb-hwspinlock
> 
> Is "brcmstb" actually the name of a single platform?
> Looking at the "brcmstb" pci binding, it looks like there's a whole load
> of different devices there and none use "brcmstb":
>            - brcm,bcm2711-pcie # The Raspberry Pi 4
>            - brcm,bcm2712-pcie # Raspberry Pi 5
>            - brcm,bcm4908-pcie
>            - brcm,bcm7211-pcie # Broadcom STB version of RPi4
>            - brcm,bcm7216-pcie # Broadcom 7216 Arm
>            - brcm,bcm7278-pcie # Broadcom 7278 Arm
>            - brcm,bcm7425-pcie # Broadcom 7425 MIPs
>            - brcm,bcm7435-pcie # Broadcom 7435 MIPs
>            - brcm,bcm7445-pcie # Broadcom 7445 Arm
>            - brcm,bcm7712-pcie # Broadcom STB sibling of Rpi 5
> 
> If "stb" means "set top box", it sounds like a catchall for disparate
> devices, which isn't permitted.

Unlike PCIe, the HW spinlock hardware has been stable across all Set-top 
box chips ever since it was added, which is why the catch all is IMHO 
adequate here.
-- 
Florian

