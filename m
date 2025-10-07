Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66056CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 21:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Yf9bQ86CY94L4VUItHhrop26PnQXUpjnSRZHnRMXkc=; b=syjuz8t5DSGr/YvTDT7Vv9LCLj
	kBV+7l/G51FpMEzVXhnoRu+/PQBKL0Pw9Br3fFuYrtX6GPsb6uP1hrRvqdwjwTEnLQ2+cTmgC4y4E
	bDETTcUKOXg5pQ2CTi/+NvT8ETBxuIhZMsjgiCcbs3h79G3/TOym6PVLDjcY2d6auSGcBKSn0Mv9L
	/cgfBY90f2QSS6z2xch+8jstuqp5/s5YNmWkn/sR0MPs7Lc+AG0ofSdLtoFzSZa3nt9N8LZKRZWEO
	IeXKJ9Q74IbnblvG7hcB5FxfO2wIepLkxMQDU+MYUAbMg1tl9sLA7oeV/mZtCXLIkuSRbaxsQe/kL
	4BJDU9sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Ext-00000002nPO-0oCQ;
	Tue, 07 Oct 2025 21:11:21 +0000
Received: from mail-il1-x164.google.com ([2607:f8b0:4864:20::164])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Exq-00000002nOk-0XCZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 21:11:19 +0000
Received: by mail-il1-x164.google.com with SMTP id e9e14a558f8ab-4291359714eso58869945ab.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 14:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759871477; x=1760476277;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1Yf9bQ86CY94L4VUItHhrop26PnQXUpjnSRZHnRMXkc=;
        b=cB54y8/iorymsBpWZ3Pnlam47iMaQtQbNJlbCod6YwzjG51bIAA6EO6mwXf0QkWh6u
         PboF0t/YVxCtEfOnVkYacJy/oy/KKu9Noe9K1kzylwNqqD4z6NzBbYkelNxVH5Z0w8Fp
         kDveUWSrNSMQhfwOYCQcKrbk5gNF4Xi1GlL4Je1KINmXafHnX9PhEzlGWc+Fxm9fuXGM
         2IUwjXkTjMF8ep0LgErwrtIQJVJe5Ftm/mIReIKRPkz7R35e22B7IuPmeRBFVX8EOW+M
         c3OfROkPpTgKBGtzIzdq07QsgibstNzarhbNOB1S2SJjgkgCp5Oll1w05OExe/3iXY+F
         rzvg==
X-Forwarded-Encrypted: i=1; AJvYcCUe9nBaxV81HzUojSkdr6gFJBYUiT/v1nxM5Sw2VJA3T2i8q8oMr8/+ur0/YZWdsllOiOFrTkNfMHeOdfQU3Go0@lists.infradead.org
X-Gm-Message-State: AOJu0YyyDFciamZ26OV/hOzHJ1DtmmbPLgyTzMyfwjccHkpVk0MxCzmJ
	rs6wmyIUdw1aCx6L9+oZ3IMY0nhnqjT6irmtD8USKW2oXi1P557s5Kdc1EyPCswjDzoANkSoL+c
	rl1RsQUV0y+LaN6+bD7BGWq+OUGzP19Ny3KEJqihXc3aRJcS5+AFScn0Ljru7aH6LyO/O3MjwJT
	AYwjzGHwKz7RTw/uHnJK5I4AL3ujAyBvtSfDk6804uFeDTn3LtxGtJm1ctdcS41kVca1WrJ64BV
	3je2TudfvRDgJ418yRJOH6/4mlvhWMjZ4E=
X-Gm-Gg: ASbGncuI3DAUe0y63isRA+kQ+LEycMhaBxXXyhcMXJdrAW4WvSKKmQrjbkIIKqlz+Gt
	Ye4LRfEuwKSQN/ul3tElZVhpb3cGN8QHK1eQYUa+hsiNjUn383Tjx8w1UEAiuY+mzS6izqNJrEk
	7lpV5E6z33IXumNvOyc3BgqA9OecnYm1kgzE7YzRB7pKNtqhRFyzAA7Wu3NMvyUjuA9eXbdQF2u
	ZwXtEyMqn2mqblJLyrjjZtcpWDbjOUnhRTepdSRtM4LW5+mU2mnxWzzaywI6LWccQtiIHXOKxyZ
	D3ZlBeiDbUbN8yj6AbwG9aRG7uXyHCkoddBB+Ls3xaM9tccRxEhube1uRxSr+XjkzQ3czWRPp8N
	IpT6fZGke34SAq2UwzzZSmlQFOUNqElbE7jCM9rOpI5mEaUK59pfHtQ2zQnrRRziRIaX6I2P8lD
	RkZ8syEFrFhX7d
X-Google-Smtp-Source: AGHT+IHGXG7o+6iLdinyxRVeLNBe1M3k+kX1DZTurL5FIhXjCV9g8I8K7RQjjvaZhqnyTvV3l8BbFsnuPi5M
X-Received: by 2002:a92:c24b:0:b0:42b:2a51:f50a with SMTP id e9e14a558f8ab-42f87410341mr8780625ab.31.1759871476528;
        Tue, 07 Oct 2025 14:11:16 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-118.dlp.protect.broadcom.com. [144.49.247.118])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-42d8b1fc07fsm13583975ab.7.2025.10.07.14.11.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Oct 2025 14:11:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-272b7bdf41fso76637745ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 14:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759871475; x=1760476275; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1Yf9bQ86CY94L4VUItHhrop26PnQXUpjnSRZHnRMXkc=;
        b=Z4EMNIA/iVV5QQmloeKJn9fn6ajL3n2Teeo6pU3GAn7L6vLPPZr6uDSmDOnr9eK9+R
         wpXJKZOvnEsaU259nVVUPmzvaEa/ScFWKWoGKJZ+tD1YAfbenJ0xvs+Aej65zDSudn8O
         CdIN1tPG5Q9SEM2IOCr2AIKSYwmT0Co/2bGVE=
X-Forwarded-Encrypted: i=1; AJvYcCUxFjAWSS+ClqB9OIPgBpNftxgE4cXJXuMj8In9it6KE845feYJi4/JiJH1oYhPcW4MZ4Gmkw0/ZO5IZHYZO5Na@lists.infradead.org
X-Received: by 2002:a17:903:3c4f:b0:25c:5bda:53a8 with SMTP id d9443c01a7336-290272b5529mr13211445ad.37.1759871475140;
        Tue, 07 Oct 2025 14:11:15 -0700 (PDT)
X-Received: by 2002:a17:903:3c4f:b0:25c:5bda:53a8 with SMTP id d9443c01a7336-290272b5529mr13211165ad.37.1759871474709;
        Tue, 07 Oct 2025 14:11:14 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d135d71sm175727765ad.58.2025.10.07.14.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 14:11:12 -0700 (PDT)
Message-ID: <37220187-7369-4b20-8e00-0846ee0ee6fd@broadcom.com>
Date: Tue, 7 Oct 2025 14:11:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: broadcom: bcm2712: adjust display status
To: Peter Robinson <pbrobinson@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>,
 Andrea della Porta <andrea.porta@suse.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250924085712.1040284-1-pbrobinson@gmail.com>
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
In-Reply-To: <20250924085712.1040284-1-pbrobinson@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_141118_218053_593B360B 
X-CRM114-Status: GOOD (  12.17  )
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

On 9/24/2025 1:57 AM, Peter Robinson wrote:
> Typically non critical IP in a SoC are disabled by
> default in the SoC .dtsi and enabled on board specific
> configs. There are usecases, such as some CM5 carrier
> boards, where display output may not be desired or
> connected. So disable them on the SoC .dtsi and enable
> them on the RPi5 board.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Andrea della Porta <andrea.porta@suse.com>
> Fixes: 25d77bdd7df2 ("arm64: dts: broadcom: Add display pipeline support to BCM2712")

Applied to 
https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
-- 
Florian


