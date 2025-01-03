Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC46EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 04:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fk7taE5M7bddKxaCZpDwAIYeTaopdvBCG+mZ+qksddM=; b=Q3NoyTF5WJvK6J2+9pajyK5tHz
	24kASMw3MR8XXYH4iZ+dRkQZ169+LGXmaCHlHMAr6qg9iRWWYxxR56tH6zZsujfyWgH2VwFqW0yWP
	5u4TNORRn16OINLp1b7+KeEkZhrjv8yXk4yr+2/ra9sejDZtq6hPCqfsNBq+IVyxrz20CAS8kJEEI
	K47Q7yPeZs9/MjArSXQI9ymDwEnuPA5gF9HDAKBJvjqC0EVu08Igtk9hAJrwF1VAevxU9mP1YWxEk
	Hvw5lpO68kXmsXM8h+XfIwcSS5FefXMR0pidux1DxSVFnUdEPcG6mk2ZkWX2MD1kx4Q64FD6m5ZjS
	2AJZJjng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTZYj-0000000C5eB-1Anp;
	Fri, 03 Jan 2025 04:45:17 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTZXZ-0000000C5Z0-1OM5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 04:44:06 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-216281bc30fso189960135ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 20:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1735879443; x=1736484243; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Fk7taE5M7bddKxaCZpDwAIYeTaopdvBCG+mZ+qksddM=;
        b=AYCFAEGyaMXg5Gos2uFFylrunxpi3WpjsW44ggEkCUcErBZKdxGjVriMHeUkEVgFxK
         uxCXSnFoPMyZti596Y1SkCG1rwxDpxOqLmBKA1ra+UpQe5SH75LLrwf0sfg+ljCKi+1S
         qWjni4msWyD2dojbf0MEQ4Kv3P+w2OJnZ80qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735879443; x=1736484243;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fk7taE5M7bddKxaCZpDwAIYeTaopdvBCG+mZ+qksddM=;
        b=oPZoZHwJa6HNgXkj4ZyriY2h+am60ftimrT/SwdrcUVBBosAlI7QokCVeAw6IYARN2
         J2FrpWXiEnE93hnxr6hXhGVl0Pnn0+M3KXErqS8qG6d4h5lBgYiMKPxvaLwo6KmbH51v
         KRpZaIBmR2xh9TKdeBjQfapONLBOt3THjWFkIYep24T42IFoHHkEH89qhlaLpHHtJWMG
         JrJT+I7txhONzZSTBa6N8kuHREp1DeMLI+SEOf/FZOj0KwYFHFyaC4tmJmRAm/A36oXF
         Lz7HW8QA90ckczpoXow7kKUYJSC2nUv04Fz4Jo69RJXSFcQaMYkNncsDcpheOPj3PYGt
         fkvg==
X-Forwarded-Encrypted: i=1; AJvYcCXyteHn+8yS5R2aCH/NB+4Y67SiFrvM7vCK1gGcnTwlSuQqK3pIfkM0hCh/573hgGvbQo6TYqHEHiZ6lW6OP/Md@lists.infradead.org
X-Gm-Message-State: AOJu0YzS25j1AAzu0oVgqf0QKszaD2iYtO4sMN/gMo/7L1Bf5K9BMVKc
	kWbRlYqEwDHoBurSK/VRa6yNbtNQmsXj55OEUAzZyc5VY3+q5EPcBfJa1sPovQ==
X-Gm-Gg: ASbGnctGqBcL5cYayAOg2zLb9JU+77bls8/s07KwBzUw4pzi8nzNFjbPxafxJepZcq0
	19KbK84WwKE3Ue6RFOCr2j4Gmz14UDl0gn7w1/STfNRYcT0dgK1IA+2c2t2K9UOcPNy7LHren0N
	/MZVsH8mmVONqlIvy86g1+fxjXaThpFW370oHoy8Pu7PJWcYDJu/+HSZv3YaJ/kmNMdiYk10JWT
	1LXX2o69cAmlUDZnJzGqZIrFmD4wNQ0K11Ar/Y16pWtok5T+2vDzz7KwyNERyKcrQ/+E7ra1vf4
	i9uJHbTMXO76TpHr8+u+g3WZOnB+ZxNKWNk4IKwPJeaaIgpOzA==
X-Google-Smtp-Source: AGHT+IGfL9IJcm5g1F+XudcPCuXzEDmZxlbJTOeco5ykbb2a4RWAPmxzVgwPccNB9ns/vm1aAjdQEw==
X-Received: by 2002:a17:903:120d:b0:216:5af7:5a8e with SMTP id d9443c01a7336-219e6ebdc17mr717628075ad.26.1735879443169;
        Thu, 02 Jan 2025 20:44:03 -0800 (PST)
Received: from [192.168.1.185] (syn-047-229-241-210.res.spectrum.com. [47.229.241.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cde7esm235139825ad.152.2025.01.02.20.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 20:44:02 -0800 (PST)
Message-ID: <c50cbdae-61c0-484a-a5f1-9a9e08ff42b7@broadcom.com>
Date: Thu, 2 Jan 2025 20:44:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/irq-brcmstb-l2: Replace brcmstb_l2_mask_and_ack
 by generic
To: linux@treblig.org, bcm-kernel-feedback-list@broadcom.com,
 tglx@linutronix.de
Cc: linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241224001727.149337-1-linux@treblig.org>
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
In-Reply-To: <20241224001727.149337-1-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_204405_380864_15787928 
X-CRM114-Status: GOOD (  10.63  )
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



On 12/23/2024 4:17 PM, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> Replace brcmstb_l2_mask_and_ack() by the generic
> irq_gc_mask_disable_and_ack_set().
> 
> brcmstb_l2_mask_and_ack() was added by
> commit 49aa6ef0b439 ("irqchip/brcmstb-l2: Remove some processing from the
> handler") in September 2017 with a comment saying it was actually
> generic and someone should add it to the generic code.
> 
> commit 20608924cc2e ("genirq: generic chip: Add
> irq_gc_mask_disable_and_ack_set()") did that a few weeks later,
> however no one went back and took the original out.
> 
> Build tested only.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


