Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A34A109B48F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 15:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aM0vCzSlnL1yo748oI60JSGgC3GnaxtG3fVPhDjexBg=; b=sqgX/OAg3BucJ43ukhNeuoLBpf
	aoGOnIEIvVw1k6P6ZHHOStghaKQqIEmuUxqIWixLl0yxxXWj10xG6rx/8BSFjHj2cL5LcpdOD0bIc
	UkGNYuNoVos7q7cGKQPtqb7HTvjRzYUMW6EYET3lcomby8HD7S/5ISvbSdmTskV3+ggFrw7VDkFyS
	2clAecOYuyxAhDTs/Z3CZYTsJRN8BF6WBYWQf7edW0HCzKXP+lrYmMHXBsMUlnRGqGNJk6KG8d349
	UwX2uF5hEK3KARl0T4sJpQtZBglDZsDn4QpYUNWt1v1/Ex8+XzHfcomlg8patIXJpjGFNvFCIR4Ii
	tD6On1Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7b5z-0000000DBjs-2TUo;
	Tue, 31 Mar 2026 15:33:35 +0000
Received: from mail-yx1-xb161.google.com ([2607:f8b0:4864:20::b161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7b5w-0000000DBin-23Vs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 15:33:34 +0000
Received: by mail-yx1-xb161.google.com with SMTP id 956f58d0204a3-649278a69c5so7920595d50.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 08:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971211; x=1775576011;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aM0vCzSlnL1yo748oI60JSGgC3GnaxtG3fVPhDjexBg=;
        b=JbPwAzVn7G4HNPfIJExE1zwC3mHdeuxaKnDuJJ89Vu0rWQVIrlKgwdBKbdXw07YfZx
         9hxL5dTVZfHFxmKVg8F3DPqtFtrDPmvPYvPAQgcGgf0BzsMfTmdaoX5AqdbugVT7hUXs
         gSw71XXP/rB21GIc9ShZ2yBbHnOQm9Q6kumU3OVv6qEKWN1uTAnn8hEVgoU0sDZkpg88
         80KOY8wLU+MczNea9ETdUuz2qIevZ/FGV2Bj2cjpqcdJ1xJj3ZP0ScMyM5jQn4dOjnSN
         rZYJKT5W8cbj2BnCyuRJEiZFG+jbBm2AftXu95ULF3ykaeHwv7/xkzSl3ZDHlT54V9Wq
         ThOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTSOJMysgEJQVl/2N+/dS6GazVXcEqMca0TqLvNnw0yqfajaGT1HldM6RdA9opdoq1kyo10EOgGaqux8BNZba4@lists.infradead.org
X-Gm-Message-State: AOJu0YyI9OkgbeYRLULy8GYvBsRB8qN8OduWqP7/FJeV8IHVUJvkOije
	lJJ+TqUzeJZLI1QIgZT7svyX5LXw2Et1Tpyv6Y6bN6Qf9dW5myRoP4yHw/wNPonphcgeitIysd4
	VB1PimFGHoJ9bephHVSD/RNsiwKL0wV9loGKrXUHjNeyagvHLg2hmsDVmNZkauMg2yxWUKcbQF+
	83dcLNTn607lO6CedvJybVNeNJ1ovHWzxFTbJDtGbKjQ34u/GGNHAbEGq8EZfJjD4FkBUbSy955
	OJZYOuTMNANlegCtPjU8xdkZIUzJiJrXFI=
X-Gm-Gg: ATEYQzxSoEzIWef36janKR9Id7GSq/mjv4U/WjRO7HHq+oKHW+3BSiJ4Xj0nIqKF7lU
	r9H6hCTzpCKgW/mDbfXpecEJGq/1I4FlN4vDa7rJh/lcRxPwnnAQup/EeJxFy12iNtP5xbB5LEy
	WehcyVxWYNyaYYGBQiajfNGdNygJZiNbdSoiia37UrLL+yNFr7+32Zur8wbxYTaHf1qMTYgkl1D
	nYY1FvvZYaPyJn5Kj7lrvq91H1NV0PCfdhsDYwHsDkYveqEFM2nlrkL6vAb7xRsyIMKQ+h3VJqk
	swzjVHJmKelVAjTqM2txPr2Z/wBdO37keQwUXkprMnh8YsMy/43i4ZVZJBM5PkwZDFT5xlize6m
	uHyjwLDuKfDZ2wiIzbC238jAi0JEBCBoMIroq1+HK7MAr3Suomx+oY4B770uUgpubaklBBZ0Inm
	8TylQEA4lUEA3xlV5N59Ow8Vc1O3j9Xd8cdJrgYbXB6IWiUEZ8djlAqvok81LNVg==
X-Received: by 2002:a05:690c:18:b0:79a:d277:21cb with SMTP id 00721157ae682-79bddd1b7a8mr163853787b3.16.1774971210489;
        Tue, 31 Mar 2026 08:33:30 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-15.dlp.protect.broadcom.com. [144.49.247.15])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-79cbac59ad3sm9243877b3.27.2026.03.31.08.33.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Mar 2026 08:33:30 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899edf01747so174424286d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 08:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774971210; x=1775576010; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aM0vCzSlnL1yo748oI60JSGgC3GnaxtG3fVPhDjexBg=;
        b=cQMi7gc6Q5XxsNP7KFQBycedQ94qm5+FZRcz9vkzcfmfUWsrEuPWdZgGV1AwPfeR7p
         iL7ExI3vCRHofrDbO3kxDeYEhs9CetyRXHkv0sRzhmsiHj+Morw9uI9HMnMDmSKuurPe
         Yu48AAFzGsRoXQcy/Qnekrv2lnGZFi6vSvUTo=
X-Forwarded-Encrypted: i=1; AJvYcCX695EnRSCF5FHdir1l0ibkxgH2a0w6kUq+Wg15DQk0bGqnS4XoTiQPv3QAx5dTyj14ljEPDFzxTBPQlRRf5w+C@lists.infradead.org
X-Received: by 2002:a05:6214:4012:b0:89f:2ae0:39f7 with SMTP id 6a1803df08f44-89f2ae03c33mr180966976d6.22.1774971209629;
        Tue, 31 Mar 2026 08:33:29 -0700 (PDT)
X-Received: by 2002:a05:6214:4012:b0:89f:2ae0:39f7 with SMTP id 6a1803df08f44-89f2ae03c33mr180966396d6.22.1774971209093;
        Tue, 31 Mar 2026 08:33:29 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecf281b2asm93232106d6.23.2026.03.31.08.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 08:33:28 -0700 (PDT)
Message-ID: <08a2bcec-aa0e-425f-b6eb-66eeaf0ef362@broadcom.com>
Date: Tue, 31 Mar 2026 08:33:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/3] drm/v3d: Introduce Runtime Power Management
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>,
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20260331-v3d-power-management-v9-0-f52ff87bfd36@igalia.com>
 <20260331-v3d-power-management-v9-3-f52ff87bfd36@igalia.com>
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
In-Reply-To: <20260331-v3d-power-management-v9-3-f52ff87bfd36@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_083332_574186_A08B3795 
X-CRM114-Status: UNSURE (   9.06  )
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

On 3/31/26 05:35, Maíra Canal wrote:
> Commit 90a64adb0876 ("drm/v3d: Get rid of pm code") removed the last
> bits of power management code that V3D had, which were actually never
> hooked. Therefore, currently, the GPU clock is enabled during probe
> and only disabled when removing the driver.
> 
> Implement proper power management using the kernel's Runtime PM
> framework.
> 
> Reviewed-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

