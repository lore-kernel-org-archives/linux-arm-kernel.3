Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C802C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 21:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ifqxTBeQ+hR1fKmYKfMtsbKbYA3naoBciBfh4zZv5Y=; b=zV5W8Ex4fnrQDbcmJuto2UDCq5
	PNvTTeGpmK5T65dHXpXAD3hAbhPHY+0HhqOfiCS2Ti1TPS9ocKoCxUirznJsPRQUWNf7L9dQzuA+X
	+6k+LUqvLW8rjFX7VFy4kJPQocnkhMs8TzsXB0cjFGgtGOOJi3cpmuo2nl6jthgGK69Yug+A0pThx
	O1sct9LyFWg5BdRb2brEicoAS6X56K9Gl6vKQYb9XRjkmVgbGtodoWqBBxP0CnW0YPvGcNEtzsd8d
	DtHLOOuXx6Xz34o3EAmcicaSW1tY+/EIdZxRIoBhAIko6m870xzbIENE1CJt7qdHWI2bNoC1UV8wf
	ullmwwVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWMAF-00000003UyY-3Qwj;
	Mon, 30 Jun 2025 21:35:47 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJpk-00000003Flv-373T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 19:06:30 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2363616a1a6so19345755ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 12:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751310388; x=1751915188; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1ifqxTBeQ+hR1fKmYKfMtsbKbYA3naoBciBfh4zZv5Y=;
        b=MNxEqIxA5NQnWxjxfWGaWGsz8I2jZvAosMJbExwAwVpX2GAJM1jYuKhdiXJSIRwR9w
         DDkWCqgiKZmQObrIh2DF8BbBLpo7TgxWLeryrG9O8SnaTnPxf6LX/3l4/9AszruWXgbD
         R1s3pSAYaGwijRal0iE8oq3IeP/HRRxE1vx7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751310388; x=1751915188;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ifqxTBeQ+hR1fKmYKfMtsbKbYA3naoBciBfh4zZv5Y=;
        b=hOqDVH5OGwKGjEpHl877aawSTS62mCifKT6LWc1ROZouuCp1HrHiHFDiyk0U6e+mj1
         HE7XvAHuI3T6twz2KScnyrObdKuDnBY3u9dBr5GOn2QNzz5jCFcM+UtZ42OFTzthWoQc
         wXKoa2PLyczrX1QCEyXZnOqRE+gPaVjhR1TTYqtzSDdww5B3FcY88QCyLJ2qQ3pRZ2EC
         ZS0wea8DQEID3u/y3ehAGp2rV/HibInxCZbj8YFip9jLO55MkKXCfaG5bnMnKV46ASor
         3c/LlEdv0CWz85fobMtq2mZT2xXxkxK9sOqxFiIPzRUkIeGEQESgFmv+XzulLzusimJ0
         rZHA==
X-Forwarded-Encrypted: i=1; AJvYcCULbkcuRg3QuiVlCWXvUTe6IMfWJQ3XJ0BaFh1NCqmF1ldkH2ZRpoJ/Ur6LGgglLDGu6aFFh4uqN6bbYE/njn9N@lists.infradead.org
X-Gm-Message-State: AOJu0YzT2jS9XJUKN1wJEy7HeiCcHW7qqIBXVJz5j6ALuhBf+xgoCy2r
	RrU+NNk1XUdBwFBWy4jFP7b93rtL3rfZklZqQiNj6bFJFweKXtUTd6k6oZAzwKZznA==
X-Gm-Gg: ASbGncvhGD5gl2j5fm1AbPRB7WZN7691sEK2uQ5b7PULt9xWEHzZVy6GcdwAczs6wXw
	p1iqCoda48ZqoZ5SCPjpU7tzy/CrMPMMC00uIvDx87Lp8SWeRkaKlx6n089dX07gaPl7cdV7yCi
	3FCg2c92TxvPBd8RqFe6mCufM/l5zKpjduaUzNLcmBw/IedrYAi65HMNrPPO51n608R2OesTCp1
	bV1h2YIgSPOhdx3ds2GiVFYvFG5N4HP8176kHV/8Gwgvvj1NX2FxiivzaXGeOO86rHniyRGOX4V
	Q+O+KJnShtUf31u4ZOb0HF9a1VRWXe0CSjodY3qp3E7VVbYi+DdSc1GERzT4+j77wEognMERbc2
	qY/DBpraTHlB8YN61seCsVdPRAA==
X-Google-Smtp-Source: AGHT+IGrr+s2yHRofWEifQmJDsOPRoZeaxvkG2kjOYNFEpJTQ0qMZgmXnhWfnA7mYAH2pHmMqgczjw==
X-Received: by 2002:a17:902:f606:b0:237:cc75:77b0 with SMTP id d9443c01a7336-23ac4633f4cmr184335375ad.30.1751310387627;
        Mon, 30 Jun 2025 12:06:27 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3ba530sm85783255ad.200.2025.06.30.12.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 12:06:26 -0700 (PDT)
Message-ID: <5a374bbf-8f2e-49fb-9e9f-a55a8362e134@broadcom.com>
Date: Mon, 30 Jun 2025 12:06:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: phy: Convert brcm,sr-usb-combo-phy to DT
 schema
To: "Rob Herring (Arm)" <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250627220126.214577-1-robh@kernel.org>
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
In-Reply-To: <20250627220126.214577-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_120628_786337_3062973F 
X-CRM114-Status: UNSURE (   7.24  )
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

On 6/27/25 15:01, 'Rob Herring (Arm)' via BCM-KERNEL-FEEDBACK-LIST,PDL 
wrote:
> Convert the Broadcom Stingray USB PHY binding to DT schema format. It's
> a straight forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

