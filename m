Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E997CC98305
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 21:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vCA+R5fcMfO5sPq0PNAkA7jYgGsq1t74maw1JK+ZqY=; b=DOjdGANdBP7KySa+82e+9gG8KT
	8NI0i5Cv6HMMuZq2G7IhYPLmq88xLXNgq+0sqxmJ/bOwwZDS348jhe7sbKDBTACUptpd+9DmBA08G
	8XxYgnbf1rPv039fcsP6w7PHBa0cjS24IDmJfuwdcS3r13yJlOHHopfti515KgIb/RubDiPApURGF
	t4NYj53SIAZAbtK9fss0OumSl/0kvmMfUywoovcnhNhErzuJ19HWJuPsNmZbZn0zzELzEjv93pgkI
	SkLhme0VGGypIkf/RE/hsOjS68tLATTykJL1msYCALFKDQJea++vTV7YQqWVF/8TxiABPQvR8zfrc
	dHD8aP/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgrhR-0000000Ewsh-0XA8;
	Fri, 16 Jan 2026 21:49:45 +0000
Received: from mail-ot1-x363.google.com ([2607:f8b0:4864:20::363])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgrhF-0000000EwpC-1rWO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 21:49:35 +0000
Received: by mail-ot1-x363.google.com with SMTP id 46e09a7af769-7cfcbe7d176so1692137a34.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 13:49:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768600172; x=1769204972;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1vCA+R5fcMfO5sPq0PNAkA7jYgGsq1t74maw1JK+ZqY=;
        b=Zs19qcVtkskt4H5/0s8rU0ZhX40M+AmAwTb1iPA8KbGjH2ISb6Y/xygtg11pVEZBQq
         n6aL04jL/JY4a9KlozJkd288mw9d1cklKcRqWBEKvAcBKohcXyha53JeijmITbVG70pr
         Bj5b9nqxMvj9Ge1z9ZN2iNxWzzHHzK//0o8ZrVj7yq0YGgzQsAGK/KCR3kbCBOX7kZDI
         N9epv9vhbx5seZDfCpKrrifESycClLpKl6gjHkXAkZO1WsNJs8Bbqe5UZnNG0aoyOfMy
         g4sz/W9cn5caA3pj6kzHFzuiuPm2VVw2qeKsVVGc+HCmGjyhNu5JEUQbnQDwJ0xxbkch
         5+4A==
X-Forwarded-Encrypted: i=1; AJvYcCUQnzxWEH4pdsMcP7u3aUuWEEOys6gG8baw/66X+0KYgU9lN03+KWEGUBOtI6tbmUsu74r7z0XOe4/J6xoa5mIE@lists.infradead.org
X-Gm-Message-State: AOJu0YxC26pQtj2XXx7L5Vei/6qErM4+C/baJVSXFGfCpgDqz8X510lH
	d1bDSRQxuDjYNH0zsZS9KjFvi51C4HHEVZUhxYJuQ/XROmalTzKGEW+HZJi1xdqh8iArh8DovDX
	eKvBFgEeRnQtKzqkH4ppul4Ev3ZkDVvMcR3kgzZR7rmpVXsMWGGZdtp/q96OzGTQfsiU4egMjyR
	qfNpABnmmEUOPtBcU4a0K4r/r1YGMZD+/+pd83hWgP6POgsuOJlCSkQ0TqiqfWwtVNN26O6+Hvh
	vj/wJKp2ZNIhZhxH+m27wKRhJM3EE+V0kk=
X-Gm-Gg: AY/fxX66htXTR1JZ49CweCJ17QsE8iPRJXg+0s+yJjy9Lr39paIny6vvs4i/ps+ocds
	jac/H1FkTZF4q2a7mOLx752PxDaNLA4OLHabyoSx30g0/q6nmopaJCUECgh0JP1eK+BPog6c0z9
	PLqWG/fDwCeM8xDX+P7IbzH3OkKZhz64iVU6lduSLB+7I2RRniaBGLawhCzbS77H0TdWfKMVQcn
	/sFn1d/pCfQvL/Un1cuZU7T2ddDMZ++y0pBO1TgIEKLgsPbJnnk/gs/f5647iJKWMw/zbZrhApI
	l1KydYDWsIZFxOyHJie972koyuUmT+BFXsGYer8xCg9NHeyHcnT8+Y9eKsg2dcOgXx46/xL2+2c
	c4W4ngCXM1BxBvAdFvtAlF6jHWDHzQk82x+GKI2Bsb2F2pnM+vXmbf6/O8teFO4atP+zHpHOzW8
	zPF0z4+5Jr0Y+OhETwX/6X7IAo8dBWZcewotomGHVjjZKo8WBnDSQu
X-Received: by 2002:a05:6830:dc3:b0:7c7:5f09:879c with SMTP id 46e09a7af769-7cfdee52e12mr2061480a34.26.1768600172393;
        Fri, 16 Jan 2026 13:49:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-118.dlp.protect.broadcom.com. [144.49.247.118])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-7cfdf2c89fdsm432554a34.8.2026.01.16.13.49.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Jan 2026 13:49:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-502a13e3e55so38435791cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 13:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1768600171; x=1769204971; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1vCA+R5fcMfO5sPq0PNAkA7jYgGsq1t74maw1JK+ZqY=;
        b=MTnsuSn4m1Ox8LXfxeu+mLY70yW+of1r56k6eMx1kkmOarlhlvz+wwISh6uta6Z9Fz
         fYtQtL+vNZNSCmIoHXq+ymIJOBroRhrs09QKrIzIUWO1JV5Ww0G6a26QZlxzZx1Tpuul
         swRBIEP7aLfD8XpbA2LubrnGsWrhNyLN3O1h0=
X-Forwarded-Encrypted: i=1; AJvYcCWrhm5fn6k4F/iOFV6016OGTN0JcdO2osq7HEwJI4YlMcCHvnmcakvZ6pVAy6GUXJOpX2SU1uLeyPpHkMRV0eDU@lists.infradead.org
X-Received: by 2002:ac8:7dc7:0:b0:501:3d25:18e3 with SMTP id d75a77b69052e-502a1714fc5mr74271091cf.46.1768600171658;
        Fri, 16 Jan 2026 13:49:31 -0800 (PST)
X-Received: by 2002:ac8:7dc7:0:b0:501:3d25:18e3 with SMTP id d75a77b69052e-502a1714fc5mr74270911cf.46.1768600171268;
        Fri, 16 Jan 2026 13:49:31 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1ed1de6sm29437481cf.17.2026.01.16.13.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 13:49:30 -0800 (PST)
Message-ID: <ded7193d-ab5e-4f91-9b64-142a886fd792@broadcom.com>
Date: Fri, 16 Jan 2026 13:49:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] ARM: dts: broadcom: bcm2835-rpi: Move non
 simple-bus nodes to root level
To: Rob Herring <robh@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org>
 <CGME20260109120137eucas1p221b9dd341c2319c0f9d0da1fbd48d1b3@eucas1p2.samsung.com>
 <20260106-dt-dtbs-broadcom-fixes-v1-2-ba45874e4553@kernel.org>
 <e98ad883-7ba2-417b-8cd3-19f5f863b03d@samsung.com>
 <CAL_JsqKNKCOWj_eSTtDwsex3pUhgc+7QwAwLZn4MWVzOkOOHcg@mail.gmail.com>
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
In-Reply-To: <CAL_JsqKNKCOWj_eSTtDwsex3pUhgc+7QwAwLZn4MWVzOkOOHcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_134933_516561_3149E3D1 
X-CRM114-Status: GOOD (  19.47  )
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

On 1/12/26 10:09, Rob Herring wrote:
> On Fri, Jan 9, 2026 at 6:01 AM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>>
>> On 07.01.2026 03:09, Rob Herring (Arm) wrote:
>>> The 'gpu' and 'firmware' nodes are not MMIO devices, so they should not be
>>> under a 'simple-bus'. Additionally, the "raspberrypi,bcm2835-power" node
>>> is part of the firmware, so move it under the /firmware node.
>>>
>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>>
>> This breaks operation of all drivers under the firmware node. I'm not
>> exactly sure why, but they are not properly instantiated. It must be
>> something specific to "firmware" name, but I didn't dig enough to find
>> exactly where and why.
>>
>> After changing the "/firmware" node name "xfirmware" everything works again:
>>
>>
>> diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
>> b/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
>> index 9ab70b519a63..464f032ccb71 100644
>> --- a/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
>> +++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
>> @@ -1,7 +1,7 @@
>>    #include <dt-bindings/power/raspberrypi-power.h>
>>
>>    / {
>> -       firmware: firmware {
>> +       firmware: xfirmware {
>>                   compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
>>                   mboxes = <&mailbox>;
>>
>>
>> Same issue occurs with bcm2712 change (patch 3/13).
> 
> The issue is how /firmware is handled in drivers/of/platform.c and it
> doesn't create a device for the /firmware node. I think the fix here
> is /firmware needs to be just a container node and move
> "raspberrypi,bcm2835-firmware" down a level. That also allows for
> different types of firmware such as a TEE or SCMI should those or
> something similar ever be needed.
> 
> I'll see if I can get kernelci to test that change. I don't think my
> branch boots all boards though...

Dropped this patch for now, until your of_platform.c fix lands and I can 
apply your two other patches.
-- 
Florian

