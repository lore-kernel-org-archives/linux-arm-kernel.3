Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE9ACCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 20:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YaaO5Vz4QQWSkxbqCuHg6fzGeHTGukM8RnsOYsz8pwE=; b=0vksDa9VbcKmkthXXOeKcAEyBF
	kWbV07DQoDEycvyq7ldrK+MfbyMgQSAfEeIng6dSrNjqelydOBZOtqUSg0j5B0HiPw8h3pWsII7IM
	V4eBSZz5VXNMt68y3PTMYznGuFS9Gpm25omXbWBQKETMO+i7oV9srBQwamdtNtaUsspxfYVd0rzSX
	iYuY5OvYCPq6VgLO3KzhRTIrJC0fPdQKEJsnZAh8Ym5ZWOWJarPvWW9zHGV2GjhR2vSeAAmqTEFIV
	CQcAhaYl/+9Zy2mI8Xgp9OFPGH1ehmNI7B2LGm2oirR1ncvtrM9OIXZJENG9BPUAapAiUlzMjjXT7
	5l2D/nHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH6wx-0000000GFci-426m;
	Thu, 06 Nov 2025 20:51:22 +0000
Received: from mail-pl1-x664.google.com ([2607:f8b0:4864:20::664])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH6wt-0000000GFc6-40oU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 20:51:18 +0000
Received: by mail-pl1-x664.google.com with SMTP id d9443c01a7336-27c369f8986so382555ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 12:51:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762462275; x=1763067075;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YaaO5Vz4QQWSkxbqCuHg6fzGeHTGukM8RnsOYsz8pwE=;
        b=GhZN7AiJfhjjXLtUveaCq3rFBotcj6DmvvAZBXzA6um5ERrfgwi6PdkWG1z1PAh8+k
         yPm+Xn/S9XwqZFnXAW+iMT+bzglaks9ONKhlQkgp1FsC/H9QKc8L1mFvyDF1kmEZ/CpW
         0n5GkFKYcANALdVpwApV3aCWRe8IH87LCxnPPJAf2qFSvETkZ5z6izSG5UgMHIweWAfm
         8Q/qe2zBie9o67qHSRy0T1kIQk/ZWqoTgOpYaROqujNJJ7649xYJsxz+8pjjiswD6AJj
         ZHDnfrI9AdwbKTDTYsrhFWppG1ib4Ca5PDjgZhkCdLwvhHISBi4OBeOMxilVlQtrVJGm
         XIQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGsoEgoFgMCmBqfYozmZw1wd0x1KKyL1uie7Nj6N+4Vm78s8JYZR+JaakyxKyBmZiIgGWoCP2cdtBz8nN7JaPX@lists.infradead.org
X-Gm-Message-State: AOJu0YxM+EPcEUHB1aSvZLXMzHXr6n1PIOFnfZL91nDiGFttx0NKPHZj
	kOmuq2BKdy+xf8gkhzpKqt8R+h+05jipqEbvSyZlBsIPFnUgaUHW2WkxkQOnpgNGB0XgFH2kGv9
	jjvHNBJB566RioKEFwjpCEF4QwLlMVTN9+gyfpNDBH4ADO1+y9Y4DuvTf+vKmKAXP1NMFD3hA2i
	dv6oyTO3b8c+19sa08ciuL4Q9IsHMxm/K9wgftxUJbfhLMpbjx9Lj2yB+dNk03sV5fDHDrKxMpZ
	B4a/tF3vmGVtP+97NStOmj3XDVmy7PvZr8=
X-Gm-Gg: ASbGncsgnc4OC/F/bRW8UzrW2T/7y6/KzQPqtwfI23eLF5jZTS7tx5RBauFZlgCRnuv
	1DSGf6PE2r3fbJ8UAF+ELU8seJlipztefvFVnwPfTbO6AhKGoOTxTnSGyIqdNM0IC6beT2gHDQw
	FypFnPqWMtlwlVHzi4h+6+t0Wpyl+4V4KPixD1tODTDYhLUP1H63tABUlT0BV+XeEaEVhuZCskV
	io4Nnyr7V0vvZL5G2opp9c8ON1GEFXb/2sClyt1UIzF9L4FBy/KKsiVZyr3nz6c0jqBe8jFMHs8
	mOSAWdXc5sCpcjh5q6Kn2dA3kCAtt74mAgKN20zJp/STrB7A9XBpzaMqOOlnx3q6ppb8Ior8ST4
	uUqApjRzC4uFw/+dyOJ5sj+Py0bX775QxzrjMPAAFkDg4QelyaTAVLlVuLAN++/FytVJnj9iljN
	SOpNd5BEEfHPSJCxUO2PjeDQkw2r5S8C2kzHkKnD0=
X-Google-Smtp-Source: AGHT+IHiD7zZ4Xk4EcEI1eZDKejSeUxkm4Ic3QbL4hOjHeiLcE6+V97cDwNQln38a3A6Y0nuiyc/IGeOh8tB
X-Received: by 2002:a17:902:ced2:b0:295:7bbd:52fa with SMTP id d9443c01a7336-297c0480282mr10866095ad.56.1762462275159;
        Thu, 06 Nov 2025 12:51:15 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-11.dlp.protect.broadcom.com. [144.49.247.11])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-29651c6afbesm3217865ad.39.2025.11.06.12.51.14
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Nov 2025 12:51:15 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso139521a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 12:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1762462273; x=1763067073; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YaaO5Vz4QQWSkxbqCuHg6fzGeHTGukM8RnsOYsz8pwE=;
        b=hQcao0tosV1dbKC5aQTVnb2Fz93ZeGF+w/FSNxxKY5FxiHBBMjI4IQyyT2kF3iEf1s
         Qdfl47013qA8O+vSLFopjk3pLcVFuZAPQejloAKikQAHkMpeAP9lN42xKd420VAYOsBL
         dnXr3mX2CHTkKS/lRS9oZRIkr3ZMUz9dreur8=
X-Forwarded-Encrypted: i=1; AJvYcCWHfXUgOXQkXm5UOzIED90m88BpayypN/kRMA9PXimpTpLL8jjKAcnDsmiRngslKGVLJ3cCIkHD1zejZSiwnyii@lists.infradead.org
X-Received: by 2002:a05:6a20:394c:b0:2f9:39b0:fd88 with SMTP id adf61e73a8af0-35229745d5bmr1072789637.21.1762462273467;
        Thu, 06 Nov 2025 12:51:13 -0800 (PST)
X-Received: by 2002:a05:6a20:394c:b0:2f9:39b0:fd88 with SMTP id adf61e73a8af0-35229745d5bmr1072772637.21.1762462273108;
        Thu, 06 Nov 2025 12:51:13 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c6951633sm513373b3a.0.2025.11.06.12.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 12:51:12 -0800 (PST)
Message-ID: <af73cda1-b1a3-4b06-ad70-84f59b0a4527@broadcom.com>
Date: Thu, 6 Nov 2025 12:51:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/irq-bcm7038-l1: Drop unused reg_mask_status()
 function
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Thomas Gleixner
 <tglx@linutronix.de>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20251106155200.337399-2-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20251106155200.337399-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_125116_006315_8B682E09 
X-CRM114-Status: UNSURE (   6.41  )
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

On 11/6/25 07:52, Krzysztof Kozlowski wrote:
> reg_mask_status() is not referenced anywhere leading to W=1 warning:
> 
>    irq-bcm7038-l1.c:85:28: error: unused function 'reg_mask_status' [-Werror,-Wunused-function]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

