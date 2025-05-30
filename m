Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E1EC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 23:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/crfMUaUSr7Hvxl7AwB/ydPc7uMgzGaWk+2fxYyCuRQ=; b=HO+6VQJPA8UknSX+XFZv2Mu6Rr
	ADeTRliHtdTri7kFXG/xzhh0QLdrL6PAaiZmBzFyqEj0jwk3VOiki2enGCxu4ebZ38+7hS27ZBaYL
	DvkGzAWpPqLMctwXmj4p8NhxlkLwnIdBJrbMSecofR+gS6lqqNJgF7fcuHXmrqtoXb5rrFAawqCtm
	Yo4Ya1/IL9bqajw7tnE0X/DEKnkBYTzGh9jMSnSd1jI/Zj1se4+8Oz/owLvPlgeiR/Vat5VN2NcoB
	Q6MhjXxYDHkBWATOz4lMW9p9FSY77HAygfVORt06cXgg6gbRk/To5IE+lWzb6YyjbmVw9KcP1gMWS
	5WnzsqJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL9KU-00000002QTc-2bdc;
	Fri, 30 May 2025 23:40:02 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL9Ei-00000002OEl-2lyk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 23:34:06 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b2c4476d381so2302529a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 16:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748648044; x=1749252844; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/crfMUaUSr7Hvxl7AwB/ydPc7uMgzGaWk+2fxYyCuRQ=;
        b=HCKeUgJThA7aPK9ZeszSLmn5OkqK8wxhS42HmlFcTGkmlDH6gZjb+hOAdGuxBDPOAb
         pvl7eeTQEuRijIbkdQw2SemTg9cn7wtmqpvpXA5hQtACmWAsyeEJ5H+JELnt2Di9j9/f
         5OkXnumTKf46r/u2VnXPolBYTyrYgjrK8a0ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748648044; x=1749252844;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/crfMUaUSr7Hvxl7AwB/ydPc7uMgzGaWk+2fxYyCuRQ=;
        b=Qa6HU1VUNAmz2eMtRUoz9xH/01jQdmsuXgrZ7iEtTOgENFJ95zYvNarzeaPDOegm49
         dajOGrpQ9qIAvEjhsYr+fTLBF1/OPPf5d0wAjGOw3RNumhaMj+9HC98HrSC4KdQgqPGd
         S4INukgH3SaLQ0THfMU7odOmKFWriyV/8SAQg9Bu9O5m8ZdE6AYikxJqc9O6qVex6+eX
         FE6lJBfh1aOCAAvWrHMddRccS+Sz8WBV8O+IkzSzwha4eicRVFv/sB6gtSg2TfbDdewg
         9OwaBq9PnY0CIhzUaaF63DyeF/AIEbnjJyQXGB1+Yb8LSXwwaHtULU9TWXTA/YcWz3cI
         HHEA==
X-Forwarded-Encrypted: i=1; AJvYcCWbHgt905+ccbhF9AFNf1UmAZJGamwAtJYpdvYHiXZ60KHUoNEErKkTQVPLuZp4G3OsxXWNhb+rd+YoWybU9bQf@lists.infradead.org
X-Gm-Message-State: AOJu0Yxoc4NnJD3rjQtja3GXTa9yn2tPSwa7OPKSVJ0LJ1LoAW5oDYHP
	2REXiqzWG7zHWDe4rBTqYSHNw62rPRqe3dkbDUQk9H1xuOoAuJvVrjlWO3bSaxF51Q==
X-Gm-Gg: ASbGnctmdAdQujDmE/ArIFUTeoMSsYX7hJw6m87Jy19TMqGb6FnljBNtAIXP81ZVY8W
	ZgCMf+E20vLD47hD7TN71so7Nulg6QoYeqtoEiMVyEDoTEs6Nw4thezcPagVHfHCwkt820HS0mQ
	Y+2Yz8b4D5FIoJZJ3EzzUBFZwiP7Jc+pLv6m+cBOZil5YqmPlNMSzld7TGNjiiU45N3PVyIvvoc
	WRIR/pmEIofHK2HhLiPw7JcvLySd6CSsoA7bSZuiCzMJX9z3N95/9yq43b0xm1OHh/wzeuDLcix
	r0PLTrXsv4FtHk6B0n4bqNoGoDFgwPnUkBDQ8sXZEozAAPCH+Ze0YL/e1uyfkQ2oIDDZwr1FOd1
	bCxjbULdiKgcmHwQ9ujkk+KwEIw==
X-Google-Smtp-Source: AGHT+IH8xoUQ7HZKe3s4g11l9T+D/ytNA2kGbgDPz7ZW8AsmVJXcmTTpj9J9ACTwaSJgs0MLJB3hAA==
X-Received: by 2002:a17:90b:2f03:b0:30a:9feb:1e15 with SMTP id 98e67ed59e1d1-31214e2efabmr15616943a91.8.1748648043815;
        Fri, 30 May 2025 16:34:03 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2b51f5sm1728093a91.9.2025.05.30.16.34.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 16:34:02 -0700 (PDT)
Message-ID: <7b4f2dfb-cf4d-495b-8bcf-82e802bd3eca@broadcom.com>
Date: Fri, 30 May 2025 16:34:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] PCI: brcmstb: Use "num-lanes" DT property if present
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com
Cc: Rob Herring <robh@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>
References: <20250530224035.41886-1-james.quinlan@broadcom.com>
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
In-Reply-To: <20250530224035.41886-1-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_163404_703860_80AB6FCA 
X-CRM114-Status: UNSURE (   6.30  )
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

On 5/30/25 15:40, Jim Quinlan wrote:
> v2:
>    -- DT bindings: Add default, maximum values for 'num-lanes' (Rob)
>    -- Add 'if' clause to clamp maximum requested num-lanes

Subjects should have been "PATCH v2", FWIW.
-- 
Florian

