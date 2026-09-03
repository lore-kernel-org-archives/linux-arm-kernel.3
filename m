Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6B6C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 19:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brNSF6ql5aevmqbGax3CboePf220/VniLivOauNNsPk=; b=pFEnj2UHosEhZfT0XnQ5PZ3RUg
	/zqHb8XDSyByew7Wg9dcLIqFDZ/7qWolp4Tw3BTmfaV5Co7+jko4+Q0OecBzaCneSgZDL2r8cAN1L
	kNSLoFWlJo6EAf0K42gefZfzvt2swNVYgosMH6uWZcGY2Ysvxcv94bugq1pdid3DXicrw/InKtziN
	WdpHGSiWJLD4W0MVTvo0bHWCkJ243/gcaHSWO5NYuIvqFdA4+dmGjwu+0mfnbOVZmhuUKWegFaTeC
	Z3xxpPEKkdNVXKAHsOVIRRlGIJW1e6S3FzKOD0Uzdbuo1ZU70PVNG2NPxYjBUZCm7LSIyXUIy2GME
	QqHKv3gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2DGs-00000000Uog-0vD6;
	Thu, 03 Sep 2026 19:38:50 +0000
Received: from mail-pl1-x662.google.com ([2607:f8b0:4864:20::662])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2DGp-00000000UnO-1y4z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 19:38:48 +0000
Received: by mail-pl1-x662.google.com with SMTP id d9443c01a7336-2d91ff7d9acso2113105ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 12:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788464326; x=1789069126;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=brNSF6ql5aevmqbGax3CboePf220/VniLivOauNNsPk=;
        b=OwiU2RQ06uOR8ZSjTrKGVygMYjVnH/j+J6oEzCIMMGy9Cp0PdR36D0BHE4VJCafbTj
         MrsPDrL9tKNoDn7ViPq4e8D0RUKnObpUZOUoIWtl1i5Cu6aJduPBy6YK1z9Wojn3yXzJ
         csrZuDyb2nuXjEz8YWJVy3T/I7mzLAQOKAA8d2QjGIei1clqmapNpYuPK+WQzoJ2cX6j
         8rQ+sJLQ+mZOr8AdlEwHAP2yEyB8xju9hTX49HTCtdLw9YtVIlSJv1YlAz7tM6UqfP1J
         kMYcD/ORtuV0WirM/bwu5sLJL71NVaPKO2i9S5aWIiV90cKi3WGd7kgEYgi860bpKQ/S
         04vA==
X-Forwarded-Encrypted: i=1; AKwUvBx8/WURnkzAGMBRbdPbLHBQAQGYCdNR7tObWFtJsc5o1/nfzdoBJfLmK2UXHW9j4z+TjBP1/WS9+fpfShPv8tKc@lists.infradead.org
X-Gm-Message-State: AFuF++lk18SVteLqAKLLBh2Eo+MFD2mhy5efLMi3Rcrt9RvfJegsvJCg
	B68K8iUlN658YPLJT8gfeLQUg9/LN4qKK2StTeM1N1oM8Iub18ZlOYq8R9VJZUZ06SYGYnzbiCi
	JgbBTfGK0NcissA3fwORepNGXOdZfWwcz+a0OQtbBnO6PxGjNRGYJSlEvkNJd8e8FFi6x1TOKF0
	kTUmcITbLpqJTyg8+c2gFwgEaCMNGx6AqT2is8+pfBsMgrIWJNLFsnO5XJZOKYqVhaw6kiJZGOS
	W4sjXNKicdM7+T2Pt+0ph4AqTWN6rpjfjU=
X-Gm-Gg: AYBFou1lUIPYd0wUtJoyl8iUVYMqzMEMDS1Hid7Ujko2iqXR9ef1p7qXek4fU15Lv1H
	o+wPqMkIJmw3fLJ9ftXk0jpnXTgPqcXv9KiL2j+bz+aHSfXL8V2zsRTmwRVQqFDAOkEFmwBQWOp
	f4w/gN2x3Q7gDgBVppTaNE0RL8eTZdFB6k5usw3kKwUeMRqGPztA+OgV3K8q3P19tZHgESC/Ub4
	jPrwrPZbpZ5mjnKOV7cSsjLtrT1TXq0O2oLmtIuTgkYUjRqij8E/3yUWqzezuVIS9kIRCVpdZ1D
	QHzTHv/uZKvJUwKWM9JwnJFJ4sQtc5T2maHNZcCXWWMInvMb0izPX6KVoQ7UxWckcLfoA/+l8xO
	ml+l4WxD0/XDQINUbRVs406tyyQAEJNozokXaqv4Y27n1+YrviMB7gGE4hm7OZyNdZFJa/K+b3f
	eihJBygr7Km2A4a/3J/AEKfpfpKyg8VNJ6zHhaCOt3udc=
X-Received: by 2002:a17:90b:3b52:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-39b26101d25mr1150591a91.8.1788464326296;
        Thu, 03 Sep 2026 12:38:46 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39b16055f3fsm1438743a91.6.2026.09.03.12.38.45
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 12:38:46 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52fc1e88189so6002741cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 12:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788464325; x=1789069125; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brNSF6ql5aevmqbGax3CboePf220/VniLivOauNNsPk=;
        b=CoWf1HL5cKo8D1+Ji9BaU+EMT99nGJPYvgq9mYc4dUkeRL4TMsejP3AuJQaokN47aw
         +yKUkW3PYrzxWcFm07dotIEuLSbHSFPqsmukl2dhurSvDsfJHxX/KrYDAiL5CMpck1ta
         wKc2MeuF7QkWwaNqWaB2SAqXRO1vpi+HTVeGQ=
X-Forwarded-Encrypted: i=1; AKwUvByifZ74JLmn0BlP+4coHhqq/SGrEW4P+7CqSaMPnfZSQQT1AiGxzaq9wJmnpIgz9Ww+J7N+j+9danR84BHseAqi@lists.infradead.org
X-Received: by 2002:a05:622a:2505:b0:519:f884:b587 with SMTP id d75a77b69052e-53054961822mr14588851cf.27.1788464325195;
        Thu, 03 Sep 2026 12:38:45 -0700 (PDT)
X-Received: by 2002:a05:622a:2505:b0:519:f884:b587 with SMTP id d75a77b69052e-53054961822mr14588241cf.27.1788464324657;
        Thu, 03 Sep 2026 12:38:44 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530541eab6csm5221631cf.26.2026.09.03.12.38.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 12:38:44 -0700 (PDT)
Message-ID: <1f4a0df1-97e0-48e7-bd08-6b31c8dcd0e9@broadcom.com>
Date: Thu, 3 Sep 2026 12:38:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: display: bcm2835-v3d: Add an optional
 reset line
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20260816-vc4-reset-control-v1-0-896444373716@igalia.com>
 <20260816-vc4-reset-control-v1-2-896444373716@igalia.com>
 <20260818-idealistic-chivalrous-sawfish-08ddae@quoll>
 <3ab273be-e811-45e4-adf1-75532c840bc8@igalia.com>
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
In-Reply-To: <3ab273be-e811-45e4-adf1-75532c840bc8@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_123847_533388_1B8A3BA7 
X-CRM114-Status: GOOD (  19.01  )
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

On 8/18/26 03:35, Maíra Canal wrote:
> Hi Krzysztof,
> 
> On 18/08/26 06:05, Krzysztof Kozlowski wrote:
>> On Sun, Aug 16, 2026 at 11:05:41AM -0300, Maíra Canal wrote:
>>> The BCM2835 PM block has exposed a reset line for the V3D block since
>>> commit 670c672608a1 ("soc: bcm: bcm2835-pm: Add support for power 
>>> domains
>>
>> This is a reset provider driver, so not really relevant here. Driver
>> commit would be relevant if it was about consumer who implemented
>> undocumented ABI. I suggest to drop reference to driver and instead
>> describe the hardware.
> 
> Ack.
> 
>>
>>> under a new binding."), which allows the GPU to be reset without
>>> power-cycling its domain. Document it so that the vc4 driver can use 
>>> it to
>>> recover from a GPU hang.
>>
>> Does every device have it? Cygnus as well?
> 
> I'm not familiar to the Cygnus hardware, only Raspberry Pi, so I'd
> appreciate if one of the folks from Broadcom could help us with this
> information.
> 
> However, just like the power domain, I added this property as optional
> to accommodate the fact that the current Cygnus DT doesn't expose any
> power domain or reset controller.

I really don't know and have no visibility into these older chips, let's 
assume they don't.
-- 
Florian

