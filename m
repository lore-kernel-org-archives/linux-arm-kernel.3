Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DB4CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 16:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xx31lKioNXTd656SFk60BU+Dyp2fe1w4rAJW/22lkGo=; b=k6DOjYnbyZq86AUzPoLId4J/Ri
	d3weRnrrWUuZYfAMmqoPJGNpguussn7veQ5L40/k7XGT26HEDAsh5wNrSxORXydLVt9de2rx0rmzo
	lcm6T1cWuUUILwwNfIyBVU0TpDY5ZXiuv+edkpYZ5bipEg/HLq8HW4lBv8bP2GC6rg0E7l3jjU5/g
	ftQTSKLmqT+XKmezkClbb0s+7n82+eEmVCFXxZ7+CWXMh4qcxBuwLEvWoMjcpInnxeWXDnmcoOzOJ
	uCBPciDaIK0KFQO47sJjUFjU7cdWGV4JQRxnOuhlaUFPgQOJIUML+19OnwYpgrgturMnuMmIZ1b6+
	doJ4Xq1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6XCy-00000004K4W-1uWZ;
	Wed, 08 Oct 2025 16:40:08 +0000
Received: from mail-pl1-x662.google.com ([2607:f8b0:4864:20::662])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6XCw-00000004K3U-0OST
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 16:40:07 +0000
Received: by mail-pl1-x662.google.com with SMTP id d9443c01a7336-2680cf68265so24405ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 09:40:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759941604; x=1760546404;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xx31lKioNXTd656SFk60BU+Dyp2fe1w4rAJW/22lkGo=;
        b=wAlz4zcTq8ykLrEgBhk7P+tmMJvdsg7ypAHBfzO6fMMxfleHA78AqCfUmCOIzM7DZo
         zVTo2e5Xu4woHhrPRCuVVnHHi251hjN99zKQw1TL69VqWnPAlAOZ/2czJPWFFISdH9rV
         eUhaI5rKdfIWcDcm7qPydYbjulr/NTNBOTgfAhXGRQzLmRgLMM9TuZQQrsDwhCd+ySzQ
         35DbG2uk1cVPgbINdBW9sHk1FBnTd5Be5Z+dDn+kF1S/JUHuBfdUVmUvQcJuCzDiwzJI
         40ik1i0Y3AakEFuzRSIBhXxoC1KC55gh/aRCPDjT2OPYgi2By5y/TOuAIn8iJepmwvuV
         H67Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNPy9EzRx90g0rdV9hlMbjqF5umkIBG3lgOX45Ybd40tbgNY61a6YKt2Qy9E+KSRiX7NNbWSDqmK/1oFmyXr3z@lists.infradead.org
X-Gm-Message-State: AOJu0YwLq44ueniM6cWaTkvaYD7zMAtJXnjaHRqDxH+z0luJdZ8SqXV3
	dlv6YjWMCQjMQLspYDzLIrhvXXLfYhWKzgV/Is5Vcdrse8WpOWd9FikXZF2Pg1czfAa/LRIFaUO
	JHlIeJHMFadSYwxRuEv6gr4YcmuhR5nbVafm5YO6L6GU51K4VJLQLdmZ2oPso7Q6g2NIpWDkeTk
	Wr9x+s7GPRkrq9OCD8KWcobbPdv5SJZ/xoIePBo+oFC1Q6yYhGl8gzmT4Yv6Q8wROEato7DoJQd
	keX1lT/+2837rPeiwFh3/N/09KgIORDaLo=
X-Gm-Gg: ASbGncuJ/6T2aMKVFJaU6s12RLXx7oR18Un/A+oahQeG4rmchpy1O317n1mLs+vxdCM
	aXepm4ylUvyXgWlWrzkZUonJyPtcbyE082o52UWpsGyGi5yBg79WV5+vQ2OqRWr6z1q6LjFZYZ9
	uUrWU8xbutSY3cfHIEg8xnMLyf2MNsexbEQHr+i1fylHlic0ogywVBpitbafS2Y6Br22Nbj+fC2
	xEdP++my15SmkN0UCYln327jBBehFwqHx93cKiSuLElyWyo9i5iEKIL+CTq5YVH+A/+6Nl7fg8V
	YsTL0GFpBp0q5LQI3V49QBHMbgR8rQON+7FRGnMyCDB2EmcoqmVj8e2rULodDMjvFv3xgw6XDbf
	NvarvSSaE7Fd4L4ersvA5bxdVWoiRyoqYM6N4xo+gWVlMrFQmgCkr0pJr5hD8pXzvV3rCJE3tVL
	+T1/86sNvnuk5n
X-Google-Smtp-Source: AGHT+IGNtuCKCrsIucy5IFCCN7Kx5c9ML/1y51EiRpF831dK/6esWbEQOT2dwee9OtE3cyp0OI36xccfxjXy
X-Received: by 2002:a17:903:2412:b0:27d:c542:fe25 with SMTP id d9443c01a7336-290272e3d3emr53659215ad.41.1759941604216;
        Wed, 08 Oct 2025 09:40:04 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-118.dlp.protect.broadcom.com. [144.49.247.118])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-29034e2b480sm174265ad.27.2025.10.08.09.40.03
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Oct 2025 09:40:04 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77f2466eeb5so3190b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 09:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759941602; x=1760546402; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Xx31lKioNXTd656SFk60BU+Dyp2fe1w4rAJW/22lkGo=;
        b=DKjJK5L/hXnco8S3GTrnKpGpbZ6uxwiiHhkmQQzZrRRpmtmGiR5FBjkxVTsNTXT8kw
         xWbZinZjCnwJAO1Qp2AUEOd6HrtqqbMjlnvVU9YBu5dLxy3RIkczYMJsLxkQ5dZttibd
         zmE7M/bTbR7zW903exjsp+rKJI007xibC07jY=
X-Forwarded-Encrypted: i=1; AJvYcCVJOVizmdnvO+jjCsPxEQaGlAkOdT9/OUs+FWWcM7m4nOkFPTngLzgtKnjfLQqrbg8CtR+HQmQghPJT6v60joPM@lists.infradead.org
X-Received: by 2002:a05:6a00:92a2:b0:781:1784:6dad with SMTP id d2e1a72fcca58-79387c19ba5mr4718159b3a.24.1759941602378;
        Wed, 08 Oct 2025 09:40:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:92a2:b0:781:1784:6dad with SMTP id d2e1a72fcca58-79387c19ba5mr4718107b3a.24.1759941601632;
        Wed, 08 Oct 2025 09:40:01 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794e33f0495sm186997b3a.76.2025.10.08.09.39.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 09:40:00 -0700 (PDT)
Message-ID: <7d96e604-e485-47c8-a0fe-64201f30eaa1@broadcom.com>
Date: Wed, 8 Oct 2025 09:39:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock
 support
To: Rob Herring <robh@kernel.org>, Kamal Dasu <kamal.dasu@broadcom.com>
Cc: peng.fan@oss.nxp.com, andersson@kernel.org,
 baolin.wang@linux.alibaba.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251001181641.1561472-1-kamal.dasu@broadcom.com>
 <20251001181641.1561472-2-kamal.dasu@broadcom.com>
 <20251008155639.GA3512742-robh@kernel.org>
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
In-Reply-To: <20251008155639.GA3512742-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_094006_291411_8753EDAE 
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



On 10/8/2025 8:56 AM, Rob Herring wrote:
> On Wed, Oct 01, 2025 at 02:16:39PM -0400, Kamal Dasu wrote:
>> Adding brcmstb-hwspinlock bindings.
> 
> That's obvious from the diff. Tell us something about the h/w and
> convince me we don't need per SoC compatible which is standard practice.
> 
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
> hwspinlock is the name of the h/w block? Use the name of the h/w, not
> linux subsystem names.
> 
>> +
>> +  "#hwlock-cells":
>> +    const: 1
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#hwlock-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    hwlock@8404038 {
>> +        compatible = "brcm,brcmstb-hwspinlock";
>> +        reg = <0x8404038 0x40>;
> 
> h/w blocks rarely start at an offset like that. Is this part of some
> other h/w block? If so, then just add '#hwlock-cells' to *that* node.

We've answered that in the previous review:

The block is part of a "sundry" IP which has lots of controls that did 
not belong anywhere else, for better or for worse (pin/mux controls, SoC 
identification, drive strength, reset controls, and other misc bits).
-- 
Florian


