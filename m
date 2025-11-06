Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C40CCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 20:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzkV34otxN0ctVlzxZXpqYiYjaDeaTvbElNgle63bc8=; b=zFJdDJ5cUm/gF/ELXMgmt/aitj
	UUmhKZisJxtdtb6+L4X/RQAYBPW7PHDsqsV/oqQyRUO30RFPOiYcWNXR5WhbiYodk0OrqjRwfCbIf
	9yQ235TFDm5M/IwTKFOzGkbBPsWRVKB41Txz1kOVRpWFHnIY5RGFI48bLsbWRhHKU0F0Z+C5S4RMq
	gCqLQ8JFJLEKg6ZgTPeIJ08zKjJ+b6DAaegHTxVsTLlDnx3g28n6tQRNvYDvJ515mFF+JFpAAm2PR
	ivpvaRTcuFCq3Lu2E1rQTnvyhBJRjqA6G/3e26RWgM9DmvIZu3HrCb+aAGR0NgkfNjff2rZxixe2R
	5pLi5ezg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH6gQ-0000000GDiE-3dvj;
	Thu, 06 Nov 2025 20:34:14 +0000
Received: from mail-pf1-x462.google.com ([2607:f8b0:4864:20::462])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH6gO-0000000GDhZ-0JwV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 20:34:13 +0000
Received: by mail-pf1-x462.google.com with SMTP id d2e1a72fcca58-7a9c64dfa6eso48257b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 12:34:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762461250; x=1763066050;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DzkV34otxN0ctVlzxZXpqYiYjaDeaTvbElNgle63bc8=;
        b=uctZw9SCYaHR10e/4m30bCA8Jpk+kVZPDGmlBT5UwGeOgSe2KdRtz4WGRQ4ba4t3+a
         Xp573JnKVFw3uPpwKD/jNLk7xobZqJ8zSFXLOJn/hq+MqV8V+0BocpI3MjT0kI9UHDLG
         E80PJGL7SVh2hWlmHlvRjWX9llBt+X5pN7HGnAzSt1aKZgY37VpuYcsgq+1H/TXTRlQz
         kCXh+J5GxpF70eirPp+HEoIfJ9CGnRbLAhdAurbxMjGhURjsmJHZ82R67enQsz0m3yNf
         nvcTEnmtBZAFlA203sokX2NuoDy88YOtahgOC8fp5tiSdlYbTdRT6uxCzUV6eaCgnZ4D
         4Qlw==
X-Forwarded-Encrypted: i=1; AJvYcCU3x48uGxPKTwj/dO8suhXfWbdBu0QTvQ+bQLwTuGBCE2VIpZlJPS33+5EgAFfSvzEiQSRNc6yKI0TzFSb1Hna1@lists.infradead.org
X-Gm-Message-State: AOJu0YyAMFhZYyL7663bCf/q7iceq9A/1qAT8WuVw/spS1jS6t5AxvXC
	a5vAccX3/2W857DytDyu4TOVTw1INZf6farKu9ss1ASwU1Os4cSW++AHTd3e+QL7AofTtp9O91V
	Cjnltzna+rnx3mG9t0YgS9bYZ1p+RMOODoU/Z4OffeHbeB5WXIXvpla8v27pCKKvh5I3hMieaEu
	U/eFT53SJHmc3NMW2JT+4Y8t/UPisb9mcatfFjJczTa9clp61AVZ74TW4FYsXv01UvCSLGeVVqO
	kcgnMxwFOxd5Th1YhiiKJFe4BK2MHUeUnA=
X-Gm-Gg: ASbGncuNl1CUo/5LuBU2BJH26MntI/y9WtLr2FWYtlfQKLC5BMakcZ1MIrAR3w8ciEl
	rAwC6n/uNmc5qYfQBevTLZIneGzuInZoDzXjH38gzZmzYTXhJ/N2NJCHAeD2j+m7iDx2sU4FN7X
	qpV+i0dPxjxKwOhvMFLhltPeHwW56RrZmBN0c1vX4sTs/X9uZDAxnz8ZHz00Hh05A7v/byKX8LO
	1PXvxgjLcMslbC10hovduO5w618mNUtCjF6zFTPftNNq3/ncEmsFRR915t8Y0njIP7P5onJLB7V
	QfrwQb6gC0KRAwXflxzHBHVaZ9P7SMVRGlmBh1KTj+i2DEmTyg3TEr8WnyUwfoiT2Hp+bPufVvP
	H+nIakA6igOnkB/86USQcIjrSqhE1CDMrO2/5sxPwZYgLhBWmIXcLOBw0sLaFN0veJLrn6AjbIK
	lGw2qSr5PT7BF0RDJyWaC/V9B7vujrKfe0XDh7rIg=
X-Google-Smtp-Source: AGHT+IE9KZUwn4vJM1BiP1H4IUsX89j3ApgecDqhmZP/jgpPpNk3d/jighQmX5Pts09+s/OVeaR4X6HD2tFv
X-Received: by 2002:a05:6a20:6a13:b0:34f:a16f:15a6 with SMTP id adf61e73a8af0-3522ad7858dmr1283148637.57.1762461250521;
        Thu, 06 Nov 2025 12:34:10 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-12.dlp.protect.broadcom.com. [144.49.247.12])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-7b0cce5c9bfsm40516b3a.11.2025.11.06.12.34.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Nov 2025 12:34:10 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29557f43d56so372105ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 12:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1762461249; x=1763066049; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DzkV34otxN0ctVlzxZXpqYiYjaDeaTvbElNgle63bc8=;
        b=Gu9Xj7uVexlvNCT8uZT30GL5sx9qjqmXM+d0ivuQds3nX+ayJMQ/DWPJ/WuIN4ng+W
         mUDCxShdfNlNP2DY1dHebPh3T6J4GvNCTT+6YR+cq3463xEvhh8pVdT8F5w1lFJl/nP4
         P+LmUXOcenvzae7KTOXvCyOhSuRKxil/wSk58=
X-Forwarded-Encrypted: i=1; AJvYcCXj313u5ffvMnOfKIuRlTCKlmnNlleer3gyML8KWMjn7HC8SgeCRA0sn6Pucc6UcFpji6Y6kdzRuG0PtRR8EdYI@lists.infradead.org
X-Received: by 2002:a17:902:f54b:b0:294:fb47:b62b with SMTP id d9443c01a7336-297c03be1cbmr9200345ad.21.1762461248974;
        Thu, 06 Nov 2025 12:34:08 -0800 (PST)
X-Received: by 2002:a17:902:f54b:b0:294:fb47:b62b with SMTP id d9443c01a7336-297c03be1cbmr9200015ad.21.1762461248558;
        Thu, 06 Nov 2025 12:34:08 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b8ffsm37038865ad.21.2025.11.06.12.34.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 12:34:07 -0800 (PST)
Message-ID: <c6aafc19-a3ce-41b3-b3ba-f82494f9c9e9@broadcom.com>
Date: Thu, 6 Nov 2025 12:34:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] hwrng: bcm2835 - Move MODULE_DEVICE_TABLE() to table
 definition
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lars Persson <lars.persson@axis.com>, "David S. Miller"
 <davem@davemloft.net>, Tom Lendacky <thomas.lendacky@amd.com>,
 John Allen <john.allen@amd.com>, Srujana Challa <schalla@marvell.com>,
 Bharat Bhushan <bbhushan2@marvell.com>
Cc: linux-crypto@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@axis.com
References: <20251106-crypto-of-match-v1-0-36b26cd35cff@linaro.org>
 <20251106-crypto-of-match-v1-1-36b26cd35cff@linaro.org>
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
In-Reply-To: <20251106-crypto-of-match-v1-1-36b26cd35cff@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_123412_180541_936F85FD 
X-CRM114-Status: UNSURE (   8.28  )
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

On 11/6/25 08:31, Krzysztof Kozlowski wrote:
> Convention is to place MODULE_DEVICE_TABLE() immediately after
> definition of the affected table, so one can easily spot missing such.
> There is on the other hand no benefits of putting MODULE_DEVICE_TABLE()
> far away.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
--
Florian

