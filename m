Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E113C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 11:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AAILDNKPNEKGe4car8WKpeE8gJXp2VdN72qfqPkhrdI=; b=GYMVnX5YarjX1nhj5Q1hguNFbo
	BtQituJkyi0tn3E85fgTB/jPoTBu9lv1Tn8m1QKW1FkCvYoeKhHs9BxjqTd/Rs0rPCEUcDow3xgOG
	/onJbpFNjb/yCH/ArAy49OdjZyJlmui81Uuf61STSjCXHtQy9o72MX4KeSAXkWC/7A4LaSuMEyJqk
	8CANyf3c2pWDLXjoAGt5RZdK8nY8zK9mwwL5txdjVSMeHfYm3ooJI4XiFYmuUxkR/qvc/D17KRpS/
	alxPp/tjb0yk/9z2Fqj+384W3Gv+rqbqed0sd1nrnLbLoObFaFX1YDWBln+x7pcf0ehaEcdD0LwFv
	xmtsPaxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7YKT-0000000AMFz-235y;
	Wed, 23 Apr 2025 11:31:49 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WDH-00000009ubU-14Ev
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 09:16:16 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-401c43671ecso389628b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 02:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745399774; x=1746004574; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AAILDNKPNEKGe4car8WKpeE8gJXp2VdN72qfqPkhrdI=;
        b=T4Hypmzku13Ly1qzJntmrNxav3A3wqcC3guNz8bHurgJa6nmI+YY4/v6h7FncEFZf/
         1f0CbzQJGs1xTrVSJTsDnHvFKltNBkJ0EXGUxoU5vqE5y5mL/Bs2OgAFVRoXr3Tfzp9A
         OK/kQF4acGKnR6G1qgJ27+hvWkpcy634jPBGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745399774; x=1746004574;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAILDNKPNEKGe4car8WKpeE8gJXp2VdN72qfqPkhrdI=;
        b=ErJeW1PTmt5iBPqXD0E/F1eycS/HuuhViPCgWni2427LV61xN7Z22M6rA+lFnD+NJ8
         OQWMEQKXf8dcM5yOuyLQNztjKZurldh/xVFkFjUZUaBENw95IwjtMMHNQzpY7ESMjrE9
         uaX1EmOFbk4rwwxaJt0rnMsdIef+fd7lk/ahnOfxxQ0gm8oT4V+WsQSHsIyNRKEp+BAR
         b7YO6zo2FLA6WxMW8Y4OGLhgnyhQW1ykYqQmbcAvmMBfMOA+hCH2t6bKDbhPDK+DYLgS
         yXr0SC7O1xCRmejIc1H0w5MiKGaLCPVt0vFgGrwimARvGKo7+Wo3ZwBGlIBGqEPXL54f
         lM1A==
X-Forwarded-Encrypted: i=1; AJvYcCWrbtzyrpHkgUVo9yoNrXO3Bm56v3cs3VKiZlm8m69ZPpvHaqHCVhZeb36N+3GQShG2ebuNgy8QCJxF+5Hc9D2I@lists.infradead.org
X-Gm-Message-State: AOJu0YycS2sxhv9lOxFvaf3ZPAzhCyh2CxOsBqNMy7iFftto1wg5z/QQ
	btJjviINwBcolnEaBb1bQ2J1vvdJwdDlPt8qO8LCnDsBpZRHbfVUFR/XgIaafg==
X-Gm-Gg: ASbGncuqXY3VLLMIJpnB5eXvFo1YerFGWmSoYGFgZ2gKJeOO1a+8nQcb97wvNi+MNpi
	W27U0MxBb70KQHPGcObp9/C2joY3ctgukkWaEfa2ZnVYwvMSbNRLw4/tR67hIdUkNcIZE02gzGA
	PBHdS5zb9CXITBuL3B880rLL01zhDW7czLkx5MqKvg9WGWOb7WGhiurIlsvBSJ7/cP1jHtAH5Cz
	tHiAQnpsBh5SR/IAztb16pIiEYr8k/CWhgmD7laTgysD/2YEl08SsOmwqvXNcotAWWrbppA48HH
	eogoGm6bOO3MFWEpt6RRmXd2jnOrmmZUbdfVWVKq2Z8FnegDf7RCgyz1xj/DQ517n7SJuaVlJLt
	uDD0=
X-Google-Smtp-Source: AGHT+IFXraHU6tyE5Hug/omFPjCYu6OiPQ714dJZZL7AVyIrDSRTncHCvWK1B8ECGGFlXX9pLgWcCg==
X-Received: by 2002:a05:6808:6f93:b0:400:e771:ab80 with SMTP id 5614622812f47-401e3e73e78mr1355466b6e.0.1745399773788;
        Wed, 23 Apr 2025 02:16:13 -0700 (PDT)
Received: from [192.168.0.24] (home.mimichou.net. [82.67.5.108])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401beeffe05sm2590955b6e.30.2025.04.23.02.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 02:16:12 -0700 (PDT)
Message-ID: <67298e07-7608-45ef-b8bd-c219419549d9@broadcom.com>
Date: Wed, 23 Apr 2025 11:16:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 -next 10/11] arm64: dts: broadcom: bcm2712: Add PCIe DT
 nodes
To: Stanimir Varbanov <stanimir.varbanov@suse.com>,
 bcm-kernel-feedback-list@broadcom.com, Stanimir Varbanov
 <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250120130119.671119-1-svarbanov@suse.de>
 <20250120130119.671119-11-svarbanov@suse.de>
 <20250128215254.1902647-1-florian.fainelli@broadcom.com>
 <24a6236b-3e4f-4174-914a-373ddcc90fb0@suse.com>
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
In-Reply-To: <24a6236b-3e4f-4174-914a-373ddcc90fb0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_021615_347894_1E11455E 
X-CRM114-Status: GOOD (  10.10  )
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



On 4/23/2025 11:13 AM, Stanimir Varbanov wrote:
> Hi,
> 
> On 1/28/25 11:52 PM, Florian Fainelli wrote:
>> From: Florian Fainelli <f.fainelli@gmail.com>
>>
>> On Mon, 20 Jan 2025 15:01:18 +0200, Stanimir Varbanov <svarbanov@suse.de> wrote:
>>> Add PCIe devicetree nodes, plus needed reset and mip MSI-X
>>> controllers.
>>>
>>> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
>>> ---
>>
>> Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
> 
> Florian, this somehow missed v6.15?

Yes, I was busy and did not have time to send the pull requests for 
6.15, this will be sent out for 6.16.
-- 
Florian


