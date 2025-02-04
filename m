Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CFAC02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 19:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rr3YMX43/Tloo6QL2s4yaCM8c/Si1AW2XmMJtfVf9E0=; b=Tq1nhCBBFr1dOw2ge98zX3DHxu
	rfnsHPtSvyT6DWJx7S+BdFqBmzq6XhjFPCtE0n1ziBut5HNXj5o0Y2KI7NRF0bvEKKnFGplyuFzik
	MXfRZiRi4OwoT71eQfykCR7APsIPvnSb0EoU9Q2PvjpKcNC/Xg+xq53a7jsKCucYwX9+RHF2Hrw2Y
	zh2+V3Bb3DTd85lWvyp8po3/uNsY4EEXgG1dxs7YmQLKmkjvZD9Xp7yFo+LhqE0koTNzgZVRIcnGU
	vVHffHTEGSvb4ny12/4n3+SMiGCj6bCJO3V1hteJK6Hrk2Ej3GwCmtYYUuIZ7AsfWQeCwYYm7N8up
	YxFi/2YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOCz-00000001JKc-0H6Q;
	Tue, 04 Feb 2025 19:03:41 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNqk-00000001FkO-1Cuo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 18:40:43 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2f9d17ac130so976996a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 10:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738694441; x=1739299241; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rr3YMX43/Tloo6QL2s4yaCM8c/Si1AW2XmMJtfVf9E0=;
        b=KBL3bASoL/85JbaDBjk4jeURyc2/Km5DJj9p8uj8aegTsQbP0mWuRtQyxY+apz6bjK
         GPoYsUxS+okuhC31QZljLtsQ11H82Xza3fLp3zsCbd89gFVaSpe/UKJeLrYQE39G6LiP
         /FZD8zSfU5JZu26f9RQ4SCZXg1BOCu5hIW11s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738694441; x=1739299241;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rr3YMX43/Tloo6QL2s4yaCM8c/Si1AW2XmMJtfVf9E0=;
        b=LrU9M6Akv9+yRlSa3DmGZb/njR0yFM/vcM3y19dWUc83lBYCzKReWhu0AbwR89axB2
         7xZKNKLdk4bpfbxc38Kjr+uPilhGbTr6hlRfj9ZfrXYhXPImhwFetWWXKK9amSyTn78R
         V5/iztvL+EVwRNlYgkXyoxXApQRWntc8QZW8FzbHN7CbYf3oSfbfLwb5TFv8lmGdtFfY
         PJswq31j3/aTlayqpDK8LExWQakvAG+o3U3WkoFMZSMXG8c+UYFBdGvhraC/JMDbGShF
         GF0XHPSdcon2U0fGEKtpWJZRRgc/PbfQUEIBtsZ8/ouo+MG3mrGTUPC6r4eQtzithEQh
         rONw==
X-Forwarded-Encrypted: i=1; AJvYcCW2tNLrI5yW1U8fXHouxdFG0uvLRJoVGkLbVWBVi+39wSfz3PmO8Yx4IHeYv9J5R/OwTirDFedLvjTWKBY+stAB@lists.infradead.org
X-Gm-Message-State: AOJu0YwvOxA1gyE1bdp1cbpfyjj+0LteVasY+sALOXtOPdq5qvh3Z0dU
	VndzzOJCLhpPkR2elYd6Du8xDvmnPHMo4xfsdDeFlyJD8Hv4owwTbnv6j6jwTQ==
X-Gm-Gg: ASbGncuf7zx7WCg4/AnFB5aF62+oOTQfhpvRKN1tUK0wSHSfyX9QNftp7c3JVo8q98r
	vv7pNp9l780pu4K/u7O8wugWHP+rzpokjsdle1dWQuYiL3mv/7D3C3RUT56DSZLPzz0r2+QfKZl
	1MpkTGcbaxs0YaIvoZoFp0mqF41MzyCAKH0ROX51puth5/EkbeXXTwQbLixvbk5mKbHHZq/8+Tr
	hvzNohp6w7Ye0ttESMYIgFq741jOZsyq/6Wu4zJb+K34yY4OJd/+rtIkZjksHahI6o9hZJcO+ip
	6B1qYe0h54ejjbZQLgPaqbOwdvyZQjs23vKBgD0cz0Hbqc4h+QkrsY8=
X-Google-Smtp-Source: AGHT+IGJndWAWJ5vbNbdd6bjRwA+UbEuIyBJrgJX2s7NpyKketJ6Ni4wV9ZRPzf7pgw/PGeNk8p+jQ==
X-Received: by 2002:a17:90a:dfc5:b0:2ee:9d65:65a7 with SMTP id 98e67ed59e1d1-2f83ac86a84mr38834985a91.29.1738694441007;
        Tue, 04 Feb 2025 10:40:41 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bc97ca8sm15322901a91.1.2025.02.04.10.40.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 10:40:40 -0800 (PST)
Message-ID: <a7a5dbb5-25ba-4bf3-9f36-f188f2c6eea8@broadcom.com>
Date: Tue, 4 Feb 2025 10:40:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: brcmstb: Adjust message if L23 cannot be entered
To: Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>,
 Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pci@vger.kernel.org
References: <20250201121420.32316-1-wahrenst@gmx.net>
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
In-Reply-To: <20250201121420.32316-1-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_104042_378913_D21C9ED4 
X-CRM114-Status: UNSURE (   7.60  )
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

On 2/1/25 04:14, Stefan Wahren wrote:
> The entering of L23 lower-power state is optional, because the
> connected endpoint might doesn't support it. So pcie-brcmstb shouldn't
> print an error if it fails.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

