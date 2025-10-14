Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A322ACCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 22:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2e1fK4ITdfQE4nTPV/5xAA7Q8Q0cuPRv06tROKIa50U=; b=jzCyOxSjGT//4nqeymy1QxbKx+
	iecGqQ50py2xBdCzzieob3Qn+9i70CPv7R/GE/rAg4n3xWmLLMK4lbhDcxmIrYWfs3VNJnlaewCEA
	NTq+mvtSbZ4KVkgGvrIRynJoDg4vTkWzUlGb88KBdu3gWz/sai64BnstpO3G3R4IFWSiyZ4lXfXID
	+EWbuoLAyMqdprnWTyQQU1rtPC+/MBPsOLJssdnQTfKMG+0gXSMxr3/GadlcyQmiXmKwEhSiyOjEP
	u32SbmqY/jrCs17v9LAvHzkenAWEzSZkFGz5+eI11153EGYtllntdW3fbifjtjeOqYAG1m/QH4RAX
	6XqietWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8n5o-0000000HViP-2fJx;
	Tue, 14 Oct 2025 22:02:04 +0000
Received: from mail-pl1-x664.google.com ([2607:f8b0:4864:20::664])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8n5l-0000000HVhk-2p8V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 22:02:03 +0000
Received: by mail-pl1-x664.google.com with SMTP id d9443c01a7336-269af38418aso68029365ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 15:02:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760479320; x=1761084120;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2e1fK4ITdfQE4nTPV/5xAA7Q8Q0cuPRv06tROKIa50U=;
        b=ZLo1QiCcITQODbrQ09jkHavzNUzu6EtAvvfbeymAnPkT9bSO+T1tvQA8Xvh/x4qSCI
         mKgmIcAVjlmbyYxcI2ws2U2aIbzdXW7UI4ksmwZW8JlDteVXsETAHQ/e7jDmh2Cq2WpJ
         IhEdPxeDjIEuD+Jcrj+xTjNUzK9+pNwr7WV2XK69AJg9BndcE8A15Tq7n1XYlkasCAIO
         nAOVr253bQljc943eZYf8tYSUU6B6APmE0JBMx2kjeUmmiMR4cyY+/ZQXkNm+ok/a9/G
         tji5/uszBEXLmrbaFlVkeES6yol2doHuUNwqyzQ9wSz3dRDGhTDkZDi64YUFA7lYEdLl
         8M0g==
X-Forwarded-Encrypted: i=1; AJvYcCVPsc8awL8G1dno9TnSMot/RVwBpFXRjfIHmXwaX08P4n9bfX4mAcyaefQuTlthvdJq2vMH9h13oVuCc6pQQzGE@lists.infradead.org
X-Gm-Message-State: AOJu0YyiFz6UUTG93tfJACalyolzLJp2I4Sn1OgpsrQVs4lugPd+0c6+
	jpW9s6eX+xHHhkNi/qdFugfrDSNOMUsYQFmwksqZ2HYKV/f47qaCsdnq4yTSHIFw6qaFtrsrRL1
	bmmmpafhSz+EIz6NiA4QWmooXshs4D1uiDcZoQBJeCrQP5Nhe65uGtb3AEmE0qvOvTnHPjS8T6N
	Oz1VtaO4rdZTGnYJk80S/e0HIg1mxQbG7rQQ+wKoaOhJcSNZMRhshjzQvS4YLcciYZ5vDAstWfe
	cyEr7YMONm0v4xjIg2pnUIpegXqMDh/JXE=
X-Gm-Gg: ASbGncv1sJJA42HxcgA73hJVbmu2TwpdOUO/NzsjMMR0qj/rt6O3FdcAqhUK+MnPBrs
	8/Y6bk0AhN0818dzAI4VNxT7/xepbe4RpWSTJeM3et/4CPszpfX12wOYZ+BiseE1/sJ7pfWzSoy
	acn03s2/nxwUeVFRzJ3NBwIQOxHVc2GUSL6jz7EClyZAKkyMjl4/A68wBtsXsBMmz3tDkkVZAzp
	Hc5vvIo/mP8ylHsaAQxELcmvhRqC/j/P/t/9w9ybeoLz/ZN4Eb2qlrYynfMPNktWAn7fe8N91m0
	LHPVvOUuahcS5XH8Kl7XuM1FhD9FXpEEjcCUY774kuxfmSMQ2230rAhKkpLuVoyhuc7j0I3+5Za
	yoaqmeDJCqKhZjjHTbW7nd4629Ti3swwmbPz5vl4MI3NBGbFyKB/2p6/W9XRDIPO8QfdH+kEUxl
	/lR8nU3To=
X-Google-Smtp-Source: AGHT+IFLDkJMBs0egTzaSj0ho6nFOhkU1Km5/r6z2oJlXJ9PF5bZj5N+nbctpTP0FMJBBQPakLC7hWMZB+q0
X-Received: by 2002:a17:902:ef4e:b0:28d:190a:1913 with SMTP id d9443c01a7336-290273edfcemr353155725ad.38.1760479320009;
        Tue, 14 Oct 2025 15:02:00 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-29034efa8f5sm14633645ad.48.2025.10.14.15.01.59
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Oct 2025 15:02:00 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8589058c59bso4172747685a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 15:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1760479318; x=1761084118; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2e1fK4ITdfQE4nTPV/5xAA7Q8Q0cuPRv06tROKIa50U=;
        b=Lv7EsbUaF5FMfumiHUMfzkz8U3uz6XaNoSCSD+3ipWvhjYKSQUoDy7X8/5KQe2vYGy
         fDodI/z4AoC266TsSGnUTLNVf3oqQh/T51zG3IFUqlzuWplrylv3k2HvDLpmAj5Uui7O
         q+kdDQMmZikMoYgBM59tx3iORlQQC4AxyJlt8=
X-Forwarded-Encrypted: i=1; AJvYcCXsi8RP1/dIy6gSKxxK3eDkiEx3fpkXVE/RKmDa3YAPJieRu3Qx4Y6uduv7KqlDvYHfIKLzHZwxY1MxyWB4OrmB@lists.infradead.org
X-Received: by 2002:a05:620a:6910:b0:850:6d5e:cbda with SMTP id af79cd13be357-88353177b8bmr2980896685a.79.1760479318462;
        Tue, 14 Oct 2025 15:01:58 -0700 (PDT)
X-Received: by 2002:a05:620a:6910:b0:850:6d5e:cbda with SMTP id af79cd13be357-88353177b8bmr2980890485a.79.1760479317875;
        Tue, 14 Oct 2025 15:01:57 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8849f3d70easm1299924985a.12.2025.10.14.15.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 15:01:56 -0700 (PDT)
Message-ID: <cd174f01-30f6-4a6c-b55e-a15c088eded1@broadcom.com>
Date: Tue, 14 Oct 2025 15:01:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock
 support
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Kamal Dasu <kamal.dasu@broadcom.com>
Cc: peng.fan@oss.nxp.com, andersson@kernel.org,
 baolin.wang@linux.alibaba.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251009212003.2714447-1-kamal.dasu@broadcom.com>
 <20251009212003.2714447-2-kamal.dasu@broadcom.com>
 <3791aa93-c1c0-4fc9-9706-91f3f62743a3@kernel.org>
 <CAKekbeuDux1oOOOKK8Pq-jYRzScCDOEXw1w=JBodaUQ4PU2=cA@mail.gmail.com>
 <c6b68ec7-9195-4961-86dc-802a7cc55e38@kernel.org>
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
In-Reply-To: <c6b68ec7-9195-4961-86dc-802a7cc55e38@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_150201_847755_A6772654 
X-CRM114-Status: GOOD (  15.09  )
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

On 10/14/25 14:46, Krzysztof Kozlowski wrote:
> On 14/10/2025 17:40, Kamal Dasu wrote:
>> On Thu, Oct 9, 2025 at 10:00 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>
>>> On 09/10/2025 23:20, Kamal Dasu wrote:
>>>> The broadcom settop SoCs have hardware semaphores as part of "sundry"
>>>> IP block which has other controls that do not belong anywhere else.
>>>> e.g. pin/mux controls, SoC identification, drive strength, reset controls,
>>>> and other misc bits are part of this block.
>>>
>>> This does not explain why this has to be a separate block. Rob comment
>>> stays valid - this belongs to parent node.
>>>
>>
>> We do not have a separate parent node where this will fit in. We have
> 
> 
> So what is the parent? simple bus?

Ultimately yes, there is a parent node which is a "simple-bus" but what 
we effectively did is break up the "sun-top-ctrl" node into register 
ranges that are on 4 byte boundary, because the functionality offered in 
that aggregate is partitioned on a 4 byte boundary.

Now, we could utilize the fact that the node has been exposed in our 
Device Trees using a syson:

                 sun_top_ctrl: syscon@8404000 {
                         compatible = "brcm,brcmstb-sun-top-ctrl",
                                 "syscon";
                         reg = <0x8404000 0x708>;
                 };


> 
>> the DWORD aligned  register defined here as organized in the SUNDRY
>> block.
> 
> 
> I don't know what SUNDRY is.

https://www.merriam-webster.com/dictionary/sundry
-- 
Florian

