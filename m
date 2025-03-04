Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3F7C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 23:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bpovz4p2dTADlgTVz2T00MypTvf08AyRC4B4b+S6SjU=; b=sE8zzzB6DZO9mOvGoz6vZyhJsM
	JHYxQhQMQBg1YfaJRhK5kmvhoxEK9VLBObqgQYt5NfFhCk9ERV+7Gdo84OWDWMuUi5daaRoKfln0w
	6z/L6GyzHSC3LYPgcRT1EQf6YYAmLdXV4wYSoDARzg0HxWbzrnbjeJuhqHIdI6Fph+Mc/HAqn4TmT
	vgjejOy9hFZiNzLrrJwmD1fqR3s2/BZE8T1LcUaGhKQLuNjLEpSCYKDEvI2Tk9Xf+FxHNhJrpaAgA
	W6xLXVoM79RiZuRZSssluZlWsmleCjWoqV/CpSZeu8+AKWf3pXqTDs/NQWZVftvxvwR+ONIkPRjTO
	9TosTnUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpbKL-00000006UYo-0Ely;
	Tue, 04 Mar 2025 23:05:29 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpbGx-00000006UC9-2x3C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 23:02:01 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22113560c57so117193645ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 15:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1741129318; x=1741734118; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bpovz4p2dTADlgTVz2T00MypTvf08AyRC4B4b+S6SjU=;
        b=J4+BZc5Iyi4AvVjfvmevdO44ckR8emszAOP/da1rd5UXd8CCUwmZBJXZcyXKIJii7l
         TQhfzbrfpUox9i06Ef54JARxOxrH6vzkSZHogxVHS8M0BN1OIEKw3KfOoto8SFj5O/Up
         ygWLjBxpmdzonl4CdNr0CIc4MuaSYJISPin7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741129318; x=1741734118;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bpovz4p2dTADlgTVz2T00MypTvf08AyRC4B4b+S6SjU=;
        b=EiyuYdP58aKxfh2k72degCeYXeSuj8V4nmRta4dySLjKxRyDADpZB6oUTr94FF8I7G
         mkOOZhEUC78MGAC43JZzUP0FQ3hznNCxhF74iQdq86NXNWtgB4fvfx9Ik59SnH2RWqg6
         NsVV7QI5COSroVvzeEEzsqwHCWHqRCfh2rGYwppt30Lk6gyLDwQ15nL0oFzmLzZmX3d+
         C1RLUVZTf56VAMieJRTh06qbY5qTBk/gLQuvks+IuuWblNhCfhR6OzbYuUe8EOzSqSwE
         UacT3OAAR4hmAvWycZOEd4RssQJTyhQoQIlX9CMJ0mThN2tURGY827Wbmg2ENN9j6ctF
         tSKw==
X-Gm-Message-State: AOJu0Yx7sREOehZ6bS+z8lcc9jPr1tSZkOwffFZ/sts0gNEbzr7HhK1p
	LwmgOHW/8lQRPFcUdnIUka548baXW23J3tpWubQtyW4h31PIVTKqjkDY6D0aF5Co8TgFlpN6agt
	huw==
X-Gm-Gg: ASbGncuHwo5lakrkO1/p5uQzBC+dGQphDDlu9zaC/kv6BSsvURF2ZxsvBVe1q/EAS9U
	KTLgVqwIzkhGcmTQ7yYTwUSkVgzemPWb9pwyuYuVomNeyEMz5XXevaezPQDt5zGApQypD+t83yK
	lCzxi6/7ttyXq7v6dmCS6f4DF+Zy53IXeC2y31dL5ysNmNKlqRbSgIlPvzDhKJBjHdQXrNJmjT7
	OJRsE5aL2NF+ZS/KbxI5FyP0EIUCgeYR8opTzzq6Zjah4QJb/hyCqECKzdy/Y/mjNiMGipiLKN4
	EKZ51VNOOBH3r+B9/2k/S56y7fm5sAw6Ouz9weQr+yHxSs7jNJIIhTyW2r2VHJBGYdKW9R/gxnL
	DPgqOC/uk
X-Google-Smtp-Source: AGHT+IFZi2Lb1U/NQYFlwnnXQ8TLKKp9ji4Z+/znszyXYFRD14/L5VVldpdyQoXzfxuxtr6DE0A7OQ==
X-Received: by 2002:a17:90a:c106:b0:2fe:b907:562f with SMTP id 98e67ed59e1d1-2ff49730986mr1913401a91.14.1741129317859;
        Tue, 04 Mar 2025 15:01:57 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501d4e9fsm101714055ad.28.2025.03.04.15.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 15:01:57 -0800 (PST)
Message-ID: <934529bf-d859-4eed-ade1-2917afb4e793@broadcom.com>
Date: Tue, 4 Mar 2025 15:01:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: BCM5301X: Fix switch port labels of ASUS
 RT-AC3200
To: chester.a.unal@arinc9.com, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tom Brautaset <tbrautaset@gmail.com>
References: <20250304-for-broadcom-fix-rt-ac3200-switch-ports-v1-1-7e249a19a13e@arinc9.com>
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
In-Reply-To: <20250304-for-broadcom-fix-rt-ac3200-switch-ports-v1-1-7e249a19a13e@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_150159_743679_664EB87A 
X-CRM114-Status: UNSURE (   9.38  )
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

On 3/4/25 07:55, Chester A. Unal via B4 Relay wrote:
> From: "Chester A. Unal" <chester.a.unal@arinc9.com>
> 
> After using the device for a while, Tom reports that he initially described
> the switch port labels incorrectly. Apparently, ASUS's own firmware also
> describes them incorrectly. Correct them to what is seen on the chassis.
> 
> Reported-by: Tom Brautaset <tbrautaset@gmail.com>
> Fixes: b116239094d8 ("ARM: dts: BCM5301X: Add DT for ASUS RT-AC3200")
> Signed-off-by: Chester A. Unal <chester.a.unal@arinc9.com>

Applied to devicetree/fixes, thanks!
-- 
Florian

