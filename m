Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D37BEA7942
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 18:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGuRQ2UhGoW0FlZN1bhb0w2yF6YY8mq/eTMETgEFt2Q=; b=TnX5t2zqNl9iS7MMOdwBShDltc
	IJDjaSIjsq1dgt5L/wSBowImKSD2wWtz95zI4UkRvGCPTpyy4llmwzIQTXsnl25vGMU8OjfLGxsQG
	ztvjqCNKdTiYId4CYSHkBxbhMkOX3lRAsq59gMCKU/CBD2rmipO2DcdS3ORfhwNAZDi4wQCdlWkfB
	dTnRLaXs1ZYF+zxM+0BEF1ymjkhDojQUzPy47wocF09KgmvH0k3IY9oC4/tacKAGWD32zXJtsJ2u6
	fIivX3qzI5yB6B6Xkjd+3MfgyI4JrkfN3LD06nqAr2aO8nNlnDsEjsmSAniYMl0XbnKXu1tX55qsS
	1mLCNttQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnhiD-00000008w8w-4Bw5;
	Wed, 04 Feb 2026 18:34:50 +0000
Received: from mail-pl1-x664.google.com ([2607:f8b0:4864:20::664])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnhiB-00000008w8W-2jak
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 18:34:48 +0000
Received: by mail-pl1-x664.google.com with SMTP id d9443c01a7336-2a0c20ee83dso134365ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 10:34:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770230087; x=1770834887;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GGuRQ2UhGoW0FlZN1bhb0w2yF6YY8mq/eTMETgEFt2Q=;
        b=q/Lt8Lp6U+A0fnHyD/2HGOudmu8z17MRk8YgMFLSWKuC+yK5c4GERPfM5fPdVZsR6/
         MRbVicfCYFUNw7jGWkvhISKwMM3Udr7x+d9v9ratQtxMLeoGm7QnxdEGVpvtJMWT8tLo
         NqZdApW8OAdCbh7GCzoS+Ge7C84hNd702/qCjstXjjvNKi3lgdNyxVMwGk1lr39rcAQG
         hHICWdmWnzICoGoFVjtAwhVUpv3LnnY9bhzUQyGTpIaSgcwrx+PPVopJTEoeX5KoUKXG
         mFwfpYVbxppXbFTzQHd4qnzT3njK/+tVar/zlPg5MqzKSKJr7P+f7YkzvspQcM/XGyQW
         5a/g==
X-Forwarded-Encrypted: i=1; AJvYcCWpiAA3+3Vs9+CnKuXv898YCxwrqKp3URjjeGPNj2Lw45Dz4D8yVld3JMoFTOqNRrdgNJ7O+g3zP3k46gadRwOn@lists.infradead.org
X-Gm-Message-State: AOJu0YxwOSGgO3oSYUoLEx/D71BH0pR9quT4ZZc6IAaRSkq16Kv4+AGE
	2U1KIOFEaX0mNo/pGVVdkJKAnhlHNOHMPmM0vLaZBuQ+BlCRNofmAcHgu9SafwmQsWTmVFp3RkZ
	lXndEBSINsoIhOyRvifpKuuCYNwFi+zwUHOdAcvs3yj1YyTRAwr2mQMacIHXvixmYy1RALOkKe5
	k7RZroXuqrv8xohGFwIVIhLwOBVs4W5usmQ48nH9DPyU7PeNR3i39nJhJhYvG08Eu1RUppycwIK
	ij4vEM7t9YKvjsRg9yMuvgn4Ko+F8d1slc=
X-Gm-Gg: AZuq6aIA5PGwmgS7PDuB8eKkPvX3/Zj/WauxlGcfUnY4dYJ7ShS/F46li3K4vGXBfdX
	PukGAUHmfqfQ0QNPc598EjfvDlbqdD5XoNeI/EkIcTHA/Ppt+Xsdin1oK83u6zknfSHa7lFef7p
	Jg42ooHVhcEYnMhD1/vAuD2Zz9Ma0wshvLAnizqKNvP0VANITTa97cdXXTJZmAPUXvqjrevaNgL
	/9LRhE3hKID8uK9eBeXAVtQ2+yAJ98+JasY0OwgCKpM6I7U0lryYNJb6S/pX/7+ET1o85tAMGoJ
	0HcaIdlfugGerzQ7+iNZG+c2NchJXC171C952ijvazzw0/9RjiSlyDYjTzBuuHpk/n6EAhGWOIl
	BzMmPG1S63rJOaIWTbYvXLPTmULXcw/9Ua3GkIN9kKoPz+2k+Pczy6fJnOufL/FAgBRBxZY8urs
	5QG+ti9bI7wQyNUGKD8ZcWxL0xb9VLWDXh6bcZBHU+KS2Es0Q=
X-Received: by 2002:a17:902:e806:b0:295:745a:8016 with SMTP id d9443c01a7336-2a933cdd167mr38892295ad.11.1770230086555;
        Wed, 04 Feb 2026 10:34:46 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-0.dlp.protect.broadcom.com. [144.49.247.0])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2a9339076f3sm4292195ad.32.2026.02.04.10.34.46
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Feb 2026 10:34:46 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-45c91358254so364344b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 10:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1770230085; x=1770834885; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GGuRQ2UhGoW0FlZN1bhb0w2yF6YY8mq/eTMETgEFt2Q=;
        b=Flk74Nt7totzYOKvqw0Gf73GuvjiOWiHilaY9s+LYJLGXaek9QQdLO0OXIBlGjV9Yn
         rEJes149Z17C9dqLqTpDBxIFtKr8ArDM2LYuherE9YSRLNk+0bPH5ISQhFIoS3ditILx
         A/WAYSA8uLGH2s06FKVGWmbYvsyJ8FUBqUG/U=
X-Forwarded-Encrypted: i=1; AJvYcCWARLoIT/9UeKdZS3ghw+bP8G30/sM51iUqLWZZ838fKc6NNHU3O6NsKJwCMrUVHMWKXIC16NKvB04aEj8xbOkU@lists.infradead.org
X-Received: by 2002:a05:6808:c1e3:b0:460:fce5:2fcf with SMTP id 5614622812f47-462d59f2b33mr1635192b6e.37.1770230085205;
        Wed, 04 Feb 2026 10:34:45 -0800 (PST)
X-Received: by 2002:a05:6808:c1e3:b0:460:fce5:2fcf with SMTP id 5614622812f47-462d59f2b33mr1635185b6e.37.1770230084888;
        Wed, 04 Feb 2026 10:34:44 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-462d67773ecsm1714650b6e.11.2026.02.04.10.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 10:34:42 -0800 (PST)
Message-ID: <c98ed62e-482b-434d-8a22-3a9b8913e7eb@broadcom.com>
Date: Wed, 4 Feb 2026 10:34:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: brcmstb_memc: Expand LPDDR4 check to cover for
 LPDDR5
To: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20260122003501.1191059-1-florian.fainelli@broadcom.com>
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
In-Reply-To: <20260122003501.1191059-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_103447_703493_C5EB3143 
X-CRM114-Status: UNSURE (   7.94  )
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

On 1/21/26 16:35, Florian Fainelli wrote:
> The same limitations that apply to LPDDR4 also apply to LPDDR5. Expand
> the check and rename accordingly.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Krzysztof, can you take this patch? Thanks!
-- 
Florian

