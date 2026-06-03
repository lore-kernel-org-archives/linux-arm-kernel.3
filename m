Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62840CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 03:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X9JI8nlQhsgi6jVORje76ie+FBqkJZd2ksOQfkbJQkE=; b=WtM5cGbQT4tYBeyRBWbfkne3uS
	IjRscfQaBZL19HpTO2qk8CJhnUhQAygHvTogIcZgI3kOXH1nWbZUCIVG/pkHgc2s0GSUkTy75q3BH
	s8nbXoBM+3UBb4MExJyr7X6gbEWFyfGpxj4GXpQDenxzs8lVLZvIb5zbl7tepQD5koQs8g9orFy8b
	Ftns4m6n/ZVnR3kXH8zDObAeHB6HyYz7s5S2456Fm30/M3RhdUwJkieFm3fOdudILTLn2WABBwYL5
	EFrsqiVlkYG1NGHZBAiEAtccwA68IBeJWgIl7Gfp3R7Lg9hd0gLOX9uUaf3bJNwyoP8/Po3Jzrngc
	N7xotBRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUcSc-0000000ECec-0xPS;
	Wed, 03 Jun 2026 03:40:06 +0000
Received: from mail-ot1-x363.google.com ([2607:f8b0:4864:20::363])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUcSZ-0000000ECeG-2D3M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 03:40:04 +0000
Received: by mail-ot1-x363.google.com with SMTP id 46e09a7af769-7e6d2f297f4so998235a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 20:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780458002; x=1781062802;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X9JI8nlQhsgi6jVORje76ie+FBqkJZd2ksOQfkbJQkE=;
        b=FF/OS7P78VvIy88eAF7i5uZcl7384yihGhh+zxjW07ze8s9+Ld2KSCW8LImDD/Fy3w
         ISM2rwRr5rmZTv5oBX6ypPpNRPTKwIEcanaD96qdj8FkFDMwqmEIXMZFG33ilO+Y/bG9
         yScdazwHBzYpUTMK73G6Jhgbt/r8xLVlRvqcaey6Q/Dm1frxeVyRFFnZxvphDhP3kjsG
         Ckp4fij1AsT+7Pc/1n56l9ubwR+nI4ZtQ6we6vxpBoychfRUHccuP2x4yxP8EiWpv9yU
         KChcSp92AqXorqNHoNVeDtSpO8wFdBxZRT6h+MHpRsGUD2kyKhd8/UIPtFlBvR5+Aash
         WVOw==
X-Forwarded-Encrypted: i=1; AFNElJ9x0i/bIJCSf/DI23v3yjqHj7bKztJj79ppBSOc3YVO3w+43gJEubdNw2RQOqEEZDOQWwxwygeQVhzLavxkqs+v@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo/aeClIh8S0GpT6hvisP6JKY4Pb59dmEMuDiZTayoHOZBjGCO
	SYbzo7Hrw3fMQEDwsq8HH7nUkZV/j5xvqX89JkOW6Z3tyFIhjcF3J7EiFuq8oDueAsdxaiPguHb
	nREzRL6i2tRdgHejrHnrExAA16ag53Uu618CZ1ODhuToOp6tT1vAAP0xgNRQUU7C7X4e1jNBiOu
	NwxpIs0dREiTVnAZ6rX54j+pURwH9gVYlUjZyq2LAjR3ZR++uU6ASHlo4K3fdXQ+QkybqSSjedK
	1t6l72RdPBh2Zbt/0VqVSedqT36FOGUe5w=
X-Gm-Gg: Acq92OF/xaL18GgVpZhMVdg8N7O5BBLn/QMegl+aq0qOf5/2Ucz+GB2f+n6BcaobNQW
	94LfNH13wezYt8Z4VTkMGC3BHU8CUIDyzYZ/n4E+T4K8/QA/MX5cglwzCSaJyBWXufU6Vovh1zM
	p3b02WReRl3uNzrOif0XbJmg4BhHQUAbXqGgZLd2EuvriWTN5G2KRM+5BVKfrVmUCpvr8Giw2vu
	P3VaVdM4rq+nIhBjuoHOo16VaEnDtuyrerq9RY4hZj0OTcBLOdzDfXzMB1/TWhvLpRuhPglelGc
	pxj18Fwy5TLMpbeWh+yN4eWv7kx49t2xtQaaM8rhCgPnA4MtHY5xJLSriOzYq3QNVLBcZxlLyUP
	gCQpey/DONMRstlfEzfHvaerjlo7zPxFTbIbuGwlyd/7xKN9fuoXNgo7SMfGA4jPqhbXd/9pAfy
	WrS4KyErc5qLIuPmq/lyJqo3jr3CVCMk4T9EnnX31K1touEuOk+thrVtH/K6qfk1McYMK9VKKvF
	j0=
X-Received: by 2002:a4a:d746:0:b0:69d:c62a:f33d with SMTP id 006d021491bc7-69e4807cd3amr805580eaf.33.1780458001880;
        Tue, 02 Jun 2026 20:40:01 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-102.dlp.protect.broadcom.com. [144.49.247.102])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-69e462580basm77778eaf.1.2026.06.02.20.40.00
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2026 20:40:01 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304f23c55b2so4770472eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 20:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1780458000; x=1781062800; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X9JI8nlQhsgi6jVORje76ie+FBqkJZd2ksOQfkbJQkE=;
        b=VvzL7JCKn6m83OLJ42Y+IwqA9cly3TKfkQ0MxkOpIxNZP9c+JdUb8FO91Bw+Dp1A4q
         9lKQmx8vSEF/dUN20Z/Y44L+YP/6B1MqNUqu7nq/J35EESwoYgDanOPYn1+wSTbxhhQL
         TbVUAc5iaVIvwXnXTjypNP3g8cEZdZot6CclM=
X-Forwarded-Encrypted: i=1; AFNElJ8L8GzFrNveojn1Fa4ftcg14+mJsyDTq91vJG7jwl51vIoPgEK8maBTsBqRFlP4l/QKkBZzVNNHGPmHkbCBnWPn@lists.infradead.org
X-Received: by 2002:a05:7300:371e:b0:303:f2dc:8ab4 with SMTP id 5a478bee46e88-3074fa3d73cmr883757eec.2.1780457999563;
        Tue, 02 Jun 2026 20:39:59 -0700 (PDT)
X-Received: by 2002:a05:7300:371e:b0:303:f2dc:8ab4 with SMTP id 5a478bee46e88-3074fa3d73cmr883739eec.2.1780457998957;
        Tue, 02 Jun 2026 20:39:58 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df64eb9sm1109950eec.25.2026.06.02.20.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 20:39:58 -0700 (PDT)
Message-ID: <22348975-bfb1-42c9-9593-06215f961845@broadcom.com>
Date: Tue, 2 Jun 2026 20:39:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/3] Adding brcmstb-hwspinlock support
To: Kamal Dasu <kamal.dasu@broadcom.com>, andersson@kernel.org,
 robh@kernel.org, baolin.wang@linux.alibaba.com
Cc: krzysztof.kozlowski@linaro.org, conor+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260427201233.380314-1-kamal.dasu@broadcom.com>
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
In-Reply-To: <20260427201233.380314-1-kamal.dasu@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_204003_615580_A08C4396 
X-CRM114-Status: GOOD (  11.84  )
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

Hi Bjorn, Baolin,

On 4/27/2026 1:12 PM, Kamal Dasu wrote:
> This series adds hardware semaphore support for Broadcom set-top SoCs
> via the generic hwspinlock framework.
> 
> The semaphore registers live in the sundry block; the DT binding
> describes only the semaphore register range. The compatible is
> brcm,bcm7038-sun-top-ctrl-semaphore (BCM7038 is where this block first
> appeared on set-top chips).
> 
> The driver has been tested built-in and as a module.

Is there anything else you would want to see being done differently here 
or is this ready for being merged into your tree?

Thanks!
-- 
Florian


