Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6ABCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 15:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kA0xbWBKz7CEhEmimLuZzTtRlEkl5OY8Zl0ZAfchvHM=; b=oLFM/OeivrilgMv4bXs82KUaH3
	2Znf7DJPyhsYMaqTkpgU16h7/CjEcd/3meSKLl95wu9O37NPC6Yb0yAHmspXUMwC0nerQ9Mxwtgr3
	u/YTkabnrFOqZu/ILoI2yb5HKkwm/AyaIdlvqnaP5nXLTFmgiuY36eyZgkbRLfMMnUK4hMqLURhbB
	AA+FYg1Ax3hr3daSq8VbAETy97lMthSxyWw/Ni4xU+VMvozpAnk+fq201XPt0F3XnWaNl4RYNEWBS
	sTKojDH7O3e3u5WCxGCfh6FzdnONdRPk6fTzo+Jde3OYqqicrA9rAmWM9cLCChfdxJosxsHqMpi1i
	GzU4j2Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHnQ-0000000GfI4-0qby;
	Tue, 05 May 2026 15:34:52 +0000
Received: from mail-yw1-x1161.google.com ([2607:f8b0:4864:20::1161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHnN-0000000GfHU-0nXB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 15:34:50 +0000
Received: by mail-yw1-x1161.google.com with SMTP id 00721157ae682-7bd9f61458eso14973967b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 08:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777995287; x=1778600087;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kA0xbWBKz7CEhEmimLuZzTtRlEkl5OY8Zl0ZAfchvHM=;
        b=eNsi3vFKN4Qa+mZNWYekpOVz5ehLkjHp+mTKMrf5hLdPS1bYFB7OfWUgidNi8aYLn6
         quJkOSouqp2gQ/ygkN2gTKw9moUCm9tuYc5ON6KFgZ2iOnV2JEONIGLXP2gwBiECLrXg
         Z/ylXOAIatZOKXtTZZlZZazEi1KG2+lKR7Or3K7IUHdK54DsmcZa14LyVs070sZ5OKBB
         3zeyvGK9JPLPL6IdoKQxWguJq7e2Tiq+3SETiTzT4ysAf/xqbGOypY6EAlTP/Qno7uYv
         UTkvCZ9p5s8Oq4YXvlggOwVHEAI3EJHzwwCFMn8+AY6jH0vOfhTKMm61iD5ZbveEBGaO
         7kZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8nh8SD9JJRH9C3yPqUzCC8x053QCKDG7/LxP8jm/qyW1CS4rtEW5ST5zB7szRliSCk7MaZTJzBFCykG7kl+Bob@lists.infradead.org
X-Gm-Message-State: AOJu0YwVwbaKwNQA95/O37b/sleTd56BdI7DSUaFQZz6rCvcVJuffF2p
	Pk/lUPMAnhPa3E+Qiq1XLJ+so3wLdd3DiJcE6LnkOFtvpMDmR3JmXlV2bC51idScaKAl2Zo8bmW
	oIN89zjvENfpR2zN20SBY4Kv7Abl2CnH0g9m2BhYEe0VfXoHG7S8KMTNwDbbcybLMihh7kpsA/K
	zQ0QWodPAAsL1HL/RHX/jBhfPaJphdU07WZzxBP9mKgYtFVsUTSRTQc1IrvAnS1+dMmnoaOEBAq
	GGRrd8Bq0J4X5YNhXoZk+6eMIddK4X7HDk=
X-Gm-Gg: AeBDiev72LD50OPtH8az9r+7cy4ECSCyTjYxLAU1IsR2ext2tozfg17ni+f9NELM6uY
	Sy30kbAwBvmxuSvhDcvUCvh0tCANSqa4AHAAaph2KOk30vqHRlLkLhFDFEq6LyuWqXmzrZKBxJo
	BpGkDhMDqRHI//4zDtAWh/AGpgMEUBCpenaqkm8fjAUckZAiD1+laMZxPdVYFI1t3P0DGNOwwKA
	t5S7hZqGALIc3iGtFTC1pqvZvEBXoyoSTpbwFWxWJZJswz3hsk+nwBf7cJyl4O0y13TtVHHGRW/
	tz81cYWIFznRUBDCPi6LOsxjKMryjewrFfUWEAqhRxcGkhU6Qr0yEZlyq2QqzNSh0xI9QqR73fK
	pobq0iLFtb9BMFhQN6iVCj1BK54uDs/BN5F1+NlJE7xj9PFLLBuHZHDV1wyU6XQUTvH02qOiqRA
	DvLv3zs4r4/T14/XRUzp+M
X-Received: by 2002:a05:690c:c50f:b0:7bd:5cc3:f8e4 with SMTP id 00721157ae682-7bd76fd74d0mr165822277b3.13.1777995287131;
        Tue, 05 May 2026 08:34:47 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-7bd664fba41sm7967407b3.6.2026.05.05.08.34.46
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 May 2026 08:34:47 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso9086729eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 08:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1777995286; x=1778600086; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kA0xbWBKz7CEhEmimLuZzTtRlEkl5OY8Zl0ZAfchvHM=;
        b=F4Y+tnBFxqaGHnuN0IXhfvnKzMN1fC0b93bc0XbHA4d/vETT85jGw1PlrL8NQis0Km
         DNVAAiMO1QEUJt0SufDZTxUU5DMRQNNF0idnNO1slxaypfLmlFjoCEpnk6L5fmT3xtQL
         DXF7z1KVzWp9PFYRe03RiKfO9fqfz5kHjHrRM=
X-Forwarded-Encrypted: i=1; AFNElJ+klQ1bI6qHT7xwGkNSbmbCGcgWiq1cmgKT1P7u7yykuL4TMJVn2PMdhWtbCb7Wm1/NZnZRbT42kcb/nr7O0kJo@lists.infradead.org
X-Received: by 2002:a05:7301:1001:b0:2dd:2d70:8aba with SMTP id 5a478bee46e88-2efb78d70ccmr6578843eec.4.1777995285439;
        Tue, 05 May 2026 08:34:45 -0700 (PDT)
X-Received: by 2002:a05:7301:1001:b0:2dd:2d70:8aba with SMTP id 5a478bee46e88-2efb78d70ccmr6578827eec.4.1777995284858;
        Tue, 05 May 2026 08:34:44 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3bc6a79esm24306770eec.26.2026.05.05.08.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 08:34:43 -0700 (PDT)
Message-ID: <8f1380f4-6ef8-4fc8-b72e-4df7b6b3cbad@broadcom.com>
Date: Tue, 5 May 2026 08:34:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: Move MODULE_DEVICE_TABLE next to the table itself
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 William Zhang <william.zhang@broadcom.com>,
 Anand Gore <anand.gore@broadcom.com>, Kursad Oney
 <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
References: <20260505102846.186219-2-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20260505102846.186219-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_083449_290020_21BBA72C 
X-CRM114-Status: GOOD (  11.11  )
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

On 5/5/26 03:28, 'Krzysztof Kozlowski' via BCM-KERNEL-FEEDBACK-LIST,PDL 
wrote:
> By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
> exports, because this is easier to read and verify.  It also makes more
> sense since #ifdef for ACPI or OF could hide both of them.
> 
> Most of the privers already have this correctly placed, so adjust
> the missing ones.  No functional impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   drivers/leds/blink/leds-bcm63138.c | 2 +-

For the above:

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

