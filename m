Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD13C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 16:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PsTtB+z1bvDl4NGrrXN+rO6t/978g31yCeEcylF7R2E=; b=3w+nhxod7mz4mG+Ds9H2saXKAe
	eCRMP3Si9R9bBPfJpMeCH6bFrYz/7Ifp+71YO/ita5Bc9jJ19kzrZAzMtTjErA0oQ7lCMsomJLFOh
	m7ygi4ncFZjIC29KkjJutYxmX7xhT9NZJ/9REeoSnQwHWoIR+ga6zyWqhIB+tiHYFRUcLGUKvyjca
	vw8aAk5r75PHTsC4PXmo42TE7CINKLOYZcuxAjCbdpXI7NVc+QpmX1xyl05EIcKGsSuL39k0HTfin
	a2q7IPaghVQo9rgf1B0JvnJ9mqZMJg2qqYsr7eUXnkuC9/ODZZp/wSdN7rx9hU4O6/8UGgX+NMTwi
	tQSa0SIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMUTA-0000000BOVr-0YrG;
	Tue, 03 Jun 2025 16:26:33 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMUQy-0000000BOFH-0WHi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 16:24:17 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso6780436b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 09:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748967854; x=1749572654; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PsTtB+z1bvDl4NGrrXN+rO6t/978g31yCeEcylF7R2E=;
        b=Q186Lppbwc5/PNuh1cNoV383o+C68G9H9cN5Jbuf9eYcTmGV6GT+uFckyiz6olWgOI
         C2G6tznTILL3U3N+ArGEvfoHct55+vS+pE+lq775odSaJb+5LzeQC6HO7Gbobo2X7YRH
         8fAztFeTqhJea/eJV6S3jFqxBXt2FiLKhlRjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748967854; x=1749572654;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PsTtB+z1bvDl4NGrrXN+rO6t/978g31yCeEcylF7R2E=;
        b=LlAuzwkgjRJwYyuM6CrOviEqQbV/ERywJvUQtVnt2zbWN8i8PXSgb7fOp0gqhNDLhG
         YfCbYhEbZab5Lg/BNs5FR8M6APLRCaij/avUaITTb1paVXPOHlxiEWuqNLn/qegwdZ0W
         BqFDzw2Y7C7TDOjt+CcZDuoUWNDpLkQMLeajJT95qK+OgPu53LHDWqI2uaRljuxw5xIp
         SrJmFLtIPu160YORqIkoABDNuACZxHFi9lgGtzXR9B5TTaMVbvwWkuiwNqOVcRLAAkfY
         qbr4z4qTPHkdu1cBcgo3Sgtpm+35v/hLi3jqZtkPkxPh4WrVLFSabiI3PZZCIR85pFz9
         CgHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlyFWeX/AEDuMnhbaLtq9lVV0qjEq4zQgO0o5TClbXWtpLWfwAkjDXDamyElDuucsS/dcfVFgyYx09ZL2MUaZm@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0EvVhgLciEs1XT32Ymh/cm0bri8FmzlM3UU0jdbgsq8juaOlb
	oAML0OaSOs7sr5q1eKSLWJbbpMKiFI7cVmpFxdKglZBTqIZIGfA/tXL8cBsA/8Ne0g==
X-Gm-Gg: ASbGncsGCRdWB+ynnNt+DGgIqbSzYdF/EPH9KYlgPlkG/t13C9vsXoi05QW9lET5w7M
	Ic7CLY5soJgR8vaTVEfzhuf0HyBrcC3JBuv8LhJ9Y24o3RL/WP6xUYLFAZMYdpL0fFbuG2D+AyU
	NxjzEM52r7qc3MoYFtvJ6eoAtgnQCheB7Zo13dWNDUSRdkCAxvUOG4ZsodyYdq7ypdfC+LMQ1Mm
	4K/HRXP9I4vBB3KhBduIXRv/Eww4pt1XWo5ljPNT/r8rdpRScCZUAHeWGJLPnYlRtjbGeM6Uzm7
	QvQTddaPgL2LGxvJYgh+/m3UeFqcBiBxxN1ixFF9XcTdAzKglf8H47zrTmOYfcfLoOaRHmOpP0e
	z2ti0jCHpP2bQNzU=
X-Google-Smtp-Source: AGHT+IFKXHZ6CeWKl/ulfOEKEnune82cj+P2dFCkcmW9aLp6lK2qD/Lt2Jxz06XEpxzVljkgg6VJ0A==
X-Received: by 2002:a05:6a00:b49:b0:736:6043:69f9 with SMTP id d2e1a72fcca58-747bd9e6d31mr25070378b3a.19.1748967854532;
        Tue, 03 Jun 2025 09:24:14 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeadda3sm9579151b3a.71.2025.06.03.09.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 09:24:13 -0700 (PDT)
Message-ID: <2f79ae4e-6349-472c-b0cc-ea774b8ac7cf@broadcom.com>
Date: Tue, 3 Jun 2025 09:24:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: PCI: brcm,stb-pcie: Add num-lanes
 property
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20250530224035.41886-1-james.quinlan@broadcom.com>
 <20250530224035.41886-2-james.quinlan@broadcom.com>
 <6c3ec1c3-8f62-4d76-86d3-c1bbe3e1418f@broadcom.com>
Content-Language: en-US
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
In-Reply-To: <6c3ec1c3-8f62-4d76-86d3-c1bbe3e1418f@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_092416_167651_5CC55A1E 
X-CRM114-Status: UNSURE (   8.18  )
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

On 5/30/25 16:32, Florian Fainelli wrote:
> On 5/30/25 15:40, Jim Quinlan wrote:
>> Add optional num-lanes property Broadcom STB PCIe host controllers.
>>
>> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> 
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Sorry I take that back, I think this should be:

num-lanes:
   enum: [ 1, 2, 4 ]

We are basically documenting the allowed values, not specifying that we 
can repeat the num-lames property between 1 and 4 times.
-- 
Florian

