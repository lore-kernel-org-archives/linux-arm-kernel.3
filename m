Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CDDC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 23:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DvYBu1zMyFcdvaUSF433JILDGe1kYh6174QKF4dubts=; b=UdRVdMzOcX6mqSWP0lsRiyw5YM
	UfZ0uHT8YGgrB06IYliUVPj5pU59T+PsdAsLAP5c3wl4r7m7hH7GIV0GKE1nueBKR2T6+0JQBXLkl
	4YzK3RIY/tK9nKu6t12AD/k+0ItUv7D+nF87GMip1nGs9RgpyStEXBirLHFJZcHCavNodqRjKw7EP
	JxhDxYgkVOvPRpsEDSepRwY08fseTWHHOLgPRseAhbSdPIw7A2js4wpxiphCM7qPxwkavjVKpfeFq
	0UhGCGBoOhVv07wa+a1NG6srOpG89r+uTwNz0ouE4gT71PhmyOVdr0rtjumwKl9g48Fv3LccfaGXp
	WHL1OmjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL9Hz-00000002PXR-2y8Y;
	Fri, 30 May 2025 23:37:27 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL9EA-00000002O8G-2Jb0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 23:33:32 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-23508d30142so27059345ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 16:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748648010; x=1749252810; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DvYBu1zMyFcdvaUSF433JILDGe1kYh6174QKF4dubts=;
        b=SIyocCR7NontevSnkKC+vyBRNQgIPLt3vxlVfBJ0DHh7u4Ijt9A/IF3NHOdux0jMLa
         zZ+Wy8dZ1U5qLssHJg+xKd/YtH/zf8/bG4akIUEHMt7o134At4AIveDrvllEZTmSV8Vd
         FIZZuUWM+vom3sRQ4oYqWwBT0xhlQl6xSVTeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748648010; x=1749252810;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvYBu1zMyFcdvaUSF433JILDGe1kYh6174QKF4dubts=;
        b=h1o72Jl+7DrkRPQRA5NHhMNVNzUFWKJ+YNguulNPLq2dbhbvYCJo/vYFv4GpR1faNJ
         LFrTIHjuwfTtLb2AIXS5cjqQYGSJVSOGEuB4+kZg8nPTbpw+Qo0LMD+WWDZpTOc5OHuB
         rCeemR0DKRtao7D+CrNAsnKsnJksd/03bK0CxmdgvoBWaY44y6mksNdU4jXVTw0EmoL6
         0o5l+Mj5zsWNOK2gDwkRb430Jd+9zVo/TJ1TDeTHwXDyThfZ71xArgBD17+vf7aBZi58
         6zY0PczJX6Rvn8H7qeOtWGcMes2Lwo+BHOsAVCMjuRHB3386OMcoxcbIvh9dIce+TW6k
         /Dcg==
X-Forwarded-Encrypted: i=1; AJvYcCVPjaCXZaZt1s1QQOVN91oXF2fXrSVwuj1HSTBGxVPbb3ZbbOzrjiyK0fbCozOxRl3SfqiDvVXtiTc+75n3+rcw@lists.infradead.org
X-Gm-Message-State: AOJu0YyMBmZ9IaP74OerAbU69AoSCJGMFyLpX7Y6lgZ3EPjEAyYqNLhj
	TXFGY2kGSsAFbjAVP1TzTmPHCq5/qcucGTdZaO7fb1BIF46hUIoJqXyI/zh9QVAX0A==
X-Gm-Gg: ASbGncsKw7wMxDwAMvcYo4MrRd9Li3wE5QBsiRXyu4WZnPH/mPNmuQuDoKHrA8MegT0
	TMtyGkDcQdhLFCUzbs627QWHe0ENgNo4VDbJ5K5/HBn2HYkQmsDpHIco2eE+braUW/2MbZrs7l2
	M1s3wTC/Xia9Xh0/K4rg032CmK6/bGDmn4pqE+QA5quNYXdnWxFYFPZOpeKHWH5zOGzJZFnouFr
	OQusGiRfZaXuK1+H1yeLWgce8YsrlfSHoxAGR9fqKullosC7/NxJYLV0ve3DZAse533Jh6nNGOZ
	3gXy7qhyyzHIFdh5ZGNG4LCR5c6sEURy1AxJ8cSHE2ofIsq4MF/TlnIGeRJe4Vw9+enbya+C+wq
	ybDeBKkJPZYxswOA=
X-Google-Smtp-Source: AGHT+IEvSKsPxXesvS90MDpaHZgCv5Cx6Qzx3uPDHbElMUWPPIWKm/guAjLLmyBVXKbR6GLBqOyEaA==
X-Received: by 2002:a17:902:d4cd:b0:234:f4da:7eef with SMTP id d9443c01a7336-2353968853dmr52579665ad.52.1748648009734;
        Fri, 30 May 2025 16:33:29 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d14adfsm33352075ad.219.2025.05.30.16.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 16:33:28 -0700 (PDT)
Message-ID: <8ee3f021-a706-42d5-b916-ef2786de2150@broadcom.com>
Date: Fri, 30 May 2025 16:33:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] PCI: brcmstb: Use "num-lanes" DT property if present
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250530224035.41886-1-james.quinlan@broadcom.com>
 <20250530224035.41886-3-james.quinlan@broadcom.com>
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
In-Reply-To: <20250530224035.41886-3-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_163330_614448_86AB66FA 
X-CRM114-Status: UNSURE (   7.95  )
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
> By default, we use automatic HW negotiation to ascertain the number of
> lanes of the PCIe connection.  If the "num-lanes" DT property is present,
> assume that the chip's built-in capability information is incorrect or
> undesired, and use the specified value instead.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

