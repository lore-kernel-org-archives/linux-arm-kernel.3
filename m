Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B2AC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eEcBT0DqDFqRvEXW/LVtISbv9SdiNpotZ+Mcrmq9BAs=; b=G8K2qyUEEClVd3Bx1ppI68QtN/
	3Jj350LDdZprHxaSUiXMLa+Uoqz3fDUGTEXwaYluFTyjzHCx7HPgX1fnA/iuSoVYAtZw+gNDvEaVZ
	IJKCXm40S16wAuDXVTG5nyQ6W0Ep+Ok6yoUYSr2kG1fzb7e1OOq8zc5sU9Qs78WS9cEDSXObpnt7/
	S40CVDoQCGy0e1PMG7u1JJLFahjSN1cmzWrlqyOh++B8BPMyuWg3iHe887SdHV+pTidWnwuIA+Cwo
	n0z5JR4VZBlLTzxyOUlcI91TDhW+cMuOXq28vMFj/9bDbH8Op54VZOvPD7L/qovvuZylphaIgKIhx
	7LZc+KkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokB5-00000005k9d-3vKW;
	Tue, 28 Jul 2026 15:57:11 +0000
Received: from mail-qv1-xf64.google.com ([2607:f8b0:4864:20::f64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokB3-00000005k8b-20yp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:57:11 +0000
Received: by mail-qv1-xf64.google.com with SMTP id 6a1803df08f44-8f18d92172aso49555506d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 08:57:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785254228; x=1785859028;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eEcBT0DqDFqRvEXW/LVtISbv9SdiNpotZ+Mcrmq9BAs=;
        b=DDNU6WGEhTUQYSrMHOAf93r19s7+Lsj6vii8hr4GAC4vdpMFHyTeL3G0zOMspi/lOv
         3it8zuML1peKkEVLzOvmRRc1TMQX+wQP0ov6068sgFsjXkgvhpgBRSFsQJcBBeC+UO2h
         t4Ez5XCYvl3/DgHRm7w9wo+jkxjjvULnemWm+rYhVTKdZ0H8FgwKT8wU3HjUf2eds6DH
         nazzvyQmdQG76fK21eSteGsb9q4caR0gsY1yapSAPQ7gdYJv65md6vIk0676+U3IvKuy
         bu2YDPaZBAeCfHDpzqcpbYv2zIwbETarqSQMu/mUKXWW8JTHFbrnlJLEmgWrg6STjdVq
         MURg==
X-Forwarded-Encrypted: i=1; AHgh+Rq1nrVcFrQAXg3RvcnzFBfoyY0mgqyHjM/pyXht8xNGeqGOx8Vsx9YHim8bVJDksPeme3VKJOzZWoXjbKUdg/h9@lists.infradead.org
X-Gm-Message-State: AOJu0YzjiU5eKxpOfMcJjc7xTYw3r2p4auxP2LxdbbaYSnWO9rle9N8R
	FzVqKrTmCSK2gIQzp1SgaSpdgd3CUI1QjbRDYdUItTnaIIBfNprc1qz4wN8usWu+dylvJ0lq01B
	6LgCLf6vFUxPFCgRDSnNUPzNU+klWkqWUKyFs6b8IqVK8cmarXjYTM5UXWHcP6ytOScTXbEesfS
	9oZJ5jSRB0gxsg61OhL69zAMSf5b0mLON8c0D7RWHH2aTXqF3Q30bz2ssnOq7GIoF7lmpCm+jrS
	sTqtZWKf7vpJCPxP9X4CG7nkbI2SBJN0kY=
X-Gm-Gg: AR+sD13EaCrNfzTt1+E5JNJWdRuLgc9Q2eDkwqI7fZnHs3SJsL0oWymUAADErm+3FGh
	rSRePCD6Qm7eOQ+JW1fRPIheQtr6ELsy9GpKv8Inyyt+Xzo81gyg613Ygu/2f2cML+Wtp3qSmi2
	Xidux3nX8oTuVX9r9mHMSk8oUgXS0/xz9cu/DHCS2KLBpEwWUFbDvs30brOzksxVdz8g/M/XiO4
	VNx1DmO2H19UCUfzsVmphKcTnFuzj5MwHgJQxUEtZM8k1EuucfEkNfngMcWhVnVUueldqCxxXRt
	9jZyrGnB+SBq+yozY2Ntg/Q77aPDSXzYbONMGeJ5a8jVdwrvXVAhwVaIV5LC5JMnTkQAOQUe2/Y
	Srb1apebtx8YCe+dTUQqrwl4eI0pzEGxTgNsNOgroLY2bDrU2d4a1EZW8EO4SGK+NS+YD3uzEz5
	COqXK3eiS7pen5Ga5Y+QV7Axnmmatgr4Q+Ure3w3Z0
X-Received: by 2002:a05:6214:40d:b0:8db:1179:d180 with SMTP id 6a1803df08f44-908172db0a0mr35196386d6.23.1785254227571;
        Tue, 28 Jul 2026 08:57:07 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-73.dlp.protect.broadcom.com. [144.49.247.73])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-9081dcfa47fsm141646d6.14.2026.07.28.08.57.07
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2026 08:57:07 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1e6f602cso72081261cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 08:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785254227; x=1785859027; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eEcBT0DqDFqRvEXW/LVtISbv9SdiNpotZ+Mcrmq9BAs=;
        b=LT1LFmMgYknVt1bmwxmM+yDO/hi22O3f58GXcQq9qej9UYMlNiAeIRQA1JjlVi8/Iq
         A1w+MSY09Q3o/qqZ724K8RM13a9/GQpgxfsL4rr6i/nOBj+noLBTY8suTlP6/Ao73hH/
         8iWIoG4/aIhGijrCLXb021SVbsy9Jg4v+qXkE=
X-Forwarded-Encrypted: i=1; AHgh+RrmqT0jUXYWEEO4nt6aBxC/2Uj3wkfmgKqD9ARhrEIo4aOiVyoRU2APCk/nKG9zVZM16hqkmiKj+ZUB42DIJatq@lists.infradead.org
X-Received: by 2002:ac8:7f48:0:b0:51e:47a4:4851 with SMTP id d75a77b69052e-529d7056a7dmr29635821cf.8.1785254226868;
        Tue, 28 Jul 2026 08:57:06 -0700 (PDT)
X-Received: by 2002:ac8:7f48:0:b0:51e:47a4:4851 with SMTP id d75a77b69052e-529d7056a7dmr29635321cf.8.1785254226245;
        Tue, 28 Jul 2026 08:57:06 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e2db86dasm596251cf.20.2026.07.28.08.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 08:57:05 -0700 (PDT)
Message-ID: <d6d9b8b9-ec15-4305-9072-235e119cf46d@broadcom.com>
Date: Tue, 28 Jul 2026 08:57:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/16] irqchip/bcm7120-l2: fix parent IRQ count error
 handling
To: Haofeng Li <920484857@qq.com>, tglx@kernel.org
Cc: linux-kernel@vger.kernel.org, Haofeng Li <13266079573@163.com>,
 Haofeng Li <lihaofeng@kylinos.cn>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Marc Zyngier <maz@kernel.org>,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260714122351.3274006-1-lihaofeng@kylinos.cn>
 <20260714132453.3302672-1-920484857@qq.com>
 <tencent_C245DB15F66403C1D9EA90BC06987A016509@qq.com>
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
In-Reply-To: <tencent_C245DB15F66403C1D9EA90BC06987A016509@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_085709_592989_6BE22D36 
X-CRM114-Status: UNSURE (   8.37  )
X-CRM114-Notice: Please train this message.
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

On 7/14/26 06:24, Haofeng Li wrote:
> From: Haofeng Li <lihaofeng@kylinos.cn>
> 
> When platform_irq_count() fails or returns zero, probe reported -ENOMEM
> even though no memory allocation failed. Negative values such as
> -EPROBE_DEFER were also discarded, which breaks deferred probe.
> 
> Propagate negative errno from platform_irq_count(), and return -EINVAL
> only for a zero parent interrupt count.
> 
> Fixes: 3ac268d5ed22 ("irqchip/irq-bcm7120-l2: Switch to IRQCHIP_PLATFORM_DRIVER")
> Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


