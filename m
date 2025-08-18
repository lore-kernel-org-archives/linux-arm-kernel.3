Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88572CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 19:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71UA1WWX1hhVkvrWyqtzDNWMkAC/enCB7vGXFmfaVDQ=; b=HSQ1PfiA1O7V19THb3Saa+8Wg1
	E13UJi2g+bQnLqKqgCI5xmHDjABl/CMRUKB8KyMm45OAW45Fp/hSiSJYN91mSDoWP2RhDh0p0gi2p
	hFcJZL7x+Cnum4hMdFhK6r8YpWy4xtNVHtZi/37lQqSalyoOSqb4lUCgasYhac2TpxeNYDVIWAU1K
	JXG5CRV29g4BG+NZBvcybl5ZKKKRu0UQCxI8HSoe/cKDN9sfK3KgieDk6sBD3l5DCbdrC3ExBNABE
	+EslurXdLu7dQ/k3rXzCiAM1dr0RSICz5SFZElV+E52padaQk0jZ8b4C6ikLBIsT1X9LeZm6h94Vl
	Atqc0GXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5UW-00000008VdL-1zD8;
	Mon, 18 Aug 2025 19:26:00 +0000
Received: from mail-yb1-xb62.google.com ([2607:f8b0:4864:20::b62])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4yB-00000008Q54-40QN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 18:52:37 +0000
Received: by mail-yb1-xb62.google.com with SMTP id 3f1490d57ef6-e934724e512so1712178276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 11:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755543155; x=1756147955;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71UA1WWX1hhVkvrWyqtzDNWMkAC/enCB7vGXFmfaVDQ=;
        b=p2ZFL5hsfc/rONXE4SSWOFxshXGRclT6+P0aznp4H78FCbn6bsf2vpFfnd8ykCvtYP
         0WVtBJsnPBsEX20loUQzUH241F6XfRplTZbVDsb0UBbzdhJCAGOG+zzPR0DgNa02b4o/
         0ykPFHHyynAHhBhjWf6a1X2KEqu12DOahKUvo6WCDFw1VuF9XuWy8sgH1zU/Cu+2iuuv
         b9cyAydXLpA8LcOmardrRrWiR2iymJoCu8KemyG294RYkh6FaFTU0+YpGzHRe62YfE1C
         E+C+m1tjIa+hl/Vof4nUh6vZ9XN82toO6d5F8x0DynBwOqb54Vjxi1UKvLpkQrziraf9
         Fxbg==
X-Forwarded-Encrypted: i=1; AJvYcCWjfFnrR8+5g+H9POtPHT+HTV1xiTTs3e9jSnL02PbUvR4SPwvG9rufHQUpfjLq+hp7oVHcLjTD41qMRaw93f13@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf5TMZvR8sw6Mg/MQJShoqglvdJDsvKXH7CPg8Zj371wLPLKdW
	obtoML5saXgVI4VMmqnT1ydc3jcNI0ndIYP/uW1o9b1N6Z+SbOp0bRRIcHbmuqk943abV2XshwJ
	i69ONu8WDP/6kNFLcAlpPALdQngXv4yeMu/HTLSjRktoTUCLsRTQPc4vggDZEVDk1+mMlzJxPmq
	j7PP0UvVE3oHkl9e29VFrpLae5V1H9csgr6bY876wbQOM1xSO4zC3I0903Bvu85Gnx7VErK5qgS
	AwLwqPzjBTVNIlShBFHPc/+esjNj6qaBQE=
X-Gm-Gg: ASbGncv0axMuWtaP77SlyBy68dG8HMDVkFwElWYG5H+hYCAJkYo7e0hQ8WBhETGFWMO
	gugoc9GJJA+tU3ibAMk0NdUhU89nP8VeA8T23fO50RT0sGltAePe3w4iixUzt33Asmel8h5d/vG
	xa/8Xe6UfVj9qGzNAz0fbiua4cb894jlJOMO7KHVa+9h+1WRldso8mP2a+NutPXZNvx0Vr4CmMM
	10+S9/mX3M0RPjl6mRfPkfo8gtHNCVxEHDd8+aZz8yL1HVv5WQu9jq+wDnKCiugU3tBW5jkcIZA
	+wKHdtXIemSO3cSHpPE71Dg4TwdlifvMuDD8vbpZQu06Wxe8igUR2LdJGh9nbLQwT+6Lewc70UE
	Xdqk8V50uG9D5OhiSX+FUGUJLomZPAbLpxKwYe6i1TSu5VY3Oc24bG76eM7IUsJhGw8PnbA8LqT
	J3S9DS
X-Google-Smtp-Source: AGHT+IEI8Kuyz6NGqbphnyQ1ILIBjxgc5gAbLW8vZXeHZSI70qZgkCCzcZ/fQSWhuLFB4/bMQEgHa4tHbwdk
X-Received: by 2002:a05:690c:9a13:b0:71a:2dc9:a209 with SMTP id 00721157ae682-71e6db0e092mr165809777b3.22.1755543154805;
        Mon, 18 Aug 2025 11:52:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-10.dlp.protect.broadcom.com. [144.49.247.10])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-71e796ec4f4sm5153637b3.49.2025.08.18.11.52.34
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Aug 2025 11:52:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e8702f4cf9so1221014785a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 11:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1755543153; x=1756147953; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=71UA1WWX1hhVkvrWyqtzDNWMkAC/enCB7vGXFmfaVDQ=;
        b=Jn9TVB1G3MImepTXrWqqfymaHpb/P7m+pfftC5ZujqxaKvTy7ETpmM7F6Ctcl/P3Y0
         79NCNpSNdFn83k6zMVMA8KQ8jD4xX1i/F0Qq24y+WDGdBu7t9YHuWk36KfTY+iMG14P7
         M9FvLKVEJmimA+QLQEbtkTyTppSN8Rs5GFxDg=
X-Forwarded-Encrypted: i=1; AJvYcCXuHrC3cFxr3SQVU9WHlVVWF63AmdScSa0wlfKhvRsYxui/wGmx37t6+/CpfXMlDFKrUYP7Vlbf3iFg9Eud9DcG@lists.infradead.org
X-Received: by 2002:a05:620a:31a2:b0:7cc:8a39:29df with SMTP id af79cd13be357-7e87df67ef3mr1518462585a.9.1755543153125;
        Mon, 18 Aug 2025 11:52:33 -0700 (PDT)
X-Received: by 2002:a05:620a:31a2:b0:7cc:8a39:29df with SMTP id af79cd13be357-7e87df67ef3mr1518458785a.9.1755543152694;
        Mon, 18 Aug 2025 11:52:32 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e19b14dsm632355585a.39.2025.08.18.11.52.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 11:52:31 -0700 (PDT)
Message-ID: <68c3db9d-daf5-40ed-91a7-1d08b9c8cb52@broadcom.com>
Date: Mon, 18 Aug 2025 11:52:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add ethernet support for RPi5
To: Jakub Kicinski <kuba@kernel.org>
Cc: Stanimir Varbanov <svarbanov@suse.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Andrea della Porta <andrea.porta@suse.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Phil Elwell
 <phil@raspberrypi.com>, Jonathan Bell <jonathan@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250815135911.1383385-1-svarbanov@suse.de>
 <4c454b3c-f62c-4086-a665-282aa2f4a0e1@broadcom.com>
 <20250818115041.71041ad6@kernel.org>
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
In-Reply-To: <20250818115041.71041ad6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_115235_988384_BD51484F 
X-CRM114-Status: GOOD (  13.78  )
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

On 8/18/25 11:50, Jakub Kicinski wrote:
> On Mon, 18 Aug 2025 11:02:15 -0700 Florian Fainelli wrote:
>>> Few patches to enable support of ethernet on RPi5.
>>>
>>>    - first patch is setting upper 32bits of DMA RX ring buffer in case of
>>>      RX queue corruption.
>>>    - second patch is adding a new compatible in cdns,macb yaml document
>>>    - third patch adds compatible and configuration for raspberrypi,rp1-gem
>>>    - forth and fifth patches are adding and enabling ethernet DT node on
>>>      RPi5.
>>>
>>> Comments are welcome!
>>
>> netdev maintainers, do you mind if I take patches 2, 4 and 5 via the
>> Broadcom ARM SoC tree to avoid generating conflicts down the road? You
>> can take patches 1 and 3. Thanks
> 
> 4, 5 make perfect sense, why patch 2? We usually take bindings.

Because that way when CI runs against the ARM SoC tree, we don't get 
errors that the bindings are undocumented.
-- 
Florian

