Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F7ED5B871
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 21:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WDtbqIG7+Eh3r+44039T7Pz3MN5wwnQSOfutcxi0ME8=; b=e3GUqhyA715mpyBMXaKORJEilB
	9/dHywQW2N84h0G1/pX1mFYnDGPFH9dJ43E53WfBTVBFR1G1eVlKb3z4R2WBOoMOfK2lQ8EbEwM04
	zH4DF7IyWONSPPF28r6M0HWdH6e+BLP6c4ARvXkn8VFxCfXSyAQ97RKKfkipHaF0IaPOM4JySv4JF
	CbNfhlQgmkmIJMfe6XskDL74pwUiv6VKapwzlHgMNeGI0EFSd5cdA1q4EVvURMFaoYYH4dTq9hohr
	wqnShaoF4/dMGSA9IXracrta3GBfThX1UQp97WJnkwdTeH5cFmj1MObpNVarLNAuvymyTVLikEuEW
	J9NYF0PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVGGa-00000004J5t-3rYA;
	Mon, 15 Dec 2025 21:38:04 +0000
Received: from mail-pl1-x663.google.com ([2607:f8b0:4864:20::663])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVGGY-00000004J5H-2ynI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 21:38:03 +0000
Received: by mail-pl1-x663.google.com with SMTP id d9443c01a7336-2a0eaf55d58so8554855ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 13:38:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765834682; x=1766439482;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WDtbqIG7+Eh3r+44039T7Pz3MN5wwnQSOfutcxi0ME8=;
        b=q2l05a9KCBfLHGfNPhSN2d7TAIqeizA3h56ozq2E8WrTJCD91IPjbvLyVSuJLyD3C3
         4D6cn0WAtERIQ366inUCzT0Rd7ILYGGLPjM6/5uIQe6TRD8mm+bm0NxsYKKqiRtUIzVn
         IrFPFmYIkdhwiLJote2So8SHwhgg1qdVcZeMn01HAxf8/uxrBVRlAU/CZgzJU125wdv0
         F1lJZPutldq/GBk2u1pNOvyp6Wk2Bjm7blAZo9v9JrYa+IFGbxEbVg/YlD1s81HBZhnC
         XXsnYySVBreYE3f4w9Ead+4j1C3XAFcM5bQF/VoEn80mKkni3SBOyR9BB4InodIeScOE
         IadA==
X-Forwarded-Encrypted: i=1; AJvYcCUdTUHL8riTUVZzsFxEqx1UCTH973rYIKIZpRmLHDzPuKFbUoVbSMZXYMeLlq5C33y4d3Njr5kQ8PJvTq6O8hT5@lists.infradead.org
X-Gm-Message-State: AOJu0YwzHO3PPN1yVy3XdScPNE+DUNnnwvbZY9IvieRRxBIzH4M24X/R
	ul/vsj1A19ZqI7OCmY/5s9TV1zyDtzGNG+4/nbmg+06+dokxSuu4e0ofNIcMxpjtQnCVk5/AUzm
	9dWvyIv9hvw8Io61KmFfMqL7AGcfQB4ZaxX/1rT1ByyDp0tiZrk+mg6edxtxIkIirtEmfQnLQgL
	Fi0HLYwGwTSiwg+lDqsO3IteaJClqdq4CWnQRV32+kMCV7MisTPpCTugnNqmd9ZfS8k+JU4Mcai
	CAqcVwFnI02gLmwh0r8rYQndfboFvVusqg=
X-Gm-Gg: AY/fxX4zTqYrsA1Se6UzJTawY6Bj3pwNlJvSsYIugKyFL7Zr7jPUbYp+eunEtd3yzND
	TV1d+F6ZpfLKap8/z4hKZu6ZqDlRXrVwLG8k2vecoU9wqkK3D26jzduadg9eSTJIkbVdH+GpRk4
	qvhWGby7ET4A8DwU7a9cqjA+JZjqx7ZeLV2yJ6vL16pX6qvILLSSRF3ltyeS/WcYQ0Wl6Vu9lbn
	j6ZPZyJoRTJzk2u+10zWK6G1272BBvp4h7fMkf0RqCOLqGcjGjRHXxmB70J7mMu0yum6ed/EjFb
	J8gKEwxH9IPhd/NMHKH3K9W4tvG/xs907rIew5FkLYXk7U7pyfmt6Gkt/dmZ2yvaVU7t7w1QWxy
	67W7TnqIPFldU6c0SNWAP7qW30goM0HMYMFGFBYON1sBRSr+8ERenwuuaol22Xf3XBGeQyk6Lzo
	zINLxqLq9Xq2oVfMSZS4Mq4XnVnHThPmcVoMOvaCXywj1EN8po2A==
X-Google-Smtp-Source: AGHT+IHpL8xnU1ZijpW6vuahk8EfTtjDfAnCx1WGjHMS6u+aJTqCk3tDpwyaPYgVpebIsVgK+FpJupMpWjD9
X-Received: by 2002:a17:902:db11:b0:295:50f5:c0e3 with SMTP id d9443c01a7336-29f24e6fd04mr138198375ad.14.1765834681736;
        Mon, 15 Dec 2025 13:38:01 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-19.dlp.protect.broadcom.com. [144.49.247.19])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2a0904591bbsm13707815ad.33.2025.12.15.13.38.01
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Dec 2025 13:38:01 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0488e746so87462231cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 13:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1765834680; x=1766439480; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WDtbqIG7+Eh3r+44039T7Pz3MN5wwnQSOfutcxi0ME8=;
        b=eQwToTJu2iNfYvgvNpwpgzZDv4pEn1CB/L78mEyisdX8iI5PuJICD9n/0QOtT734pE
         8v5TLt6D0RKOoMerEBnXH098vSgo5FlOGybd+/sUuqLyHei2TbwihbT+YqHfQyqNa3qR
         1SR2nvtxelb9tgxqOrkNIbZw/GzbWbRwvrqBY=
X-Forwarded-Encrypted: i=1; AJvYcCVF87MqFBqyVO2ZPwR4izZF1xbVvhkSFj4IK8plaKd6pwk5eembDjtkPYStKwowbI1TUOQs0dUys+pcFFLPTqiy@lists.infradead.org
X-Received: by 2002:ac8:5a0b:0:b0:4f1:af84:387a with SMTP id d75a77b69052e-4f1bfb9d159mr211751951cf.5.1765834680677;
        Mon, 15 Dec 2025 13:38:00 -0800 (PST)
X-Received: by 2002:ac8:5a0b:0:b0:4f1:af84:387a with SMTP id d75a77b69052e-4f1bfb9d159mr211751661cf.5.1765834680115;
        Mon, 15 Dec 2025 13:38:00 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-889a85eaac7sm58926146d6.45.2025.12.15.13.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 13:37:59 -0800 (PST)
Message-ID: <ddbf78c7-539c-42d9-b3dc-0d51ab52e2d2@broadcom.com>
Date: Mon, 15 Dec 2025 13:37:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: i2c: brcm,iproc-i2c: Allow 2 reg entries for
 brcm,iproc-nic-i2c
To: "Rob Herring (Arm)" <robh@kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251215212805.3322218-1-robh@kernel.org>
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
In-Reply-To: <20251215212805.3322218-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_133802_758731_50BF5B44 
X-CRM114-Status: UNSURE (   8.92  )
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

On 12/15/25 13:28, 'Rob Herring (Arm)' via BCM-KERNEL-FEEDBACK-LIST,PDL 
wrote:
> The brcm,iproc-nic-i2c variant has 2 reg entries.
> 
> The second one is related to the brcm,ape-hsls-addr-mask property, but it's
> not clear what a proper description would be.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

