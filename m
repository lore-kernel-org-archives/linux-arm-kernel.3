Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFED7D64061
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 23:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTR8sWzuQg6qCv7sqYnowcXeRDt8t5dlxcGqTpMBq4g=; b=HhkThSyHoxdKu0YJIsX1tXSY5w
	swknsn2Tm5/U9UsNHoU+Nj1HoEw7VUo/0n7qYqI4vMHE3vGYUpI4/AfkbuFzpbR2yKzCY4xf3CjAP
	1VprsAhOfbD2JAqDNj0cB/jG2Ky8m/vDV/4oE+nH+OjNEzS480BrWQlZsZuyC5DOIdYYguvWd2p/N
	MYcOrVgo7eadG/r7CMxQKgTZfKj1NKntP3kV+oWF2QWyBJRTnWqI1GbfxSxBH6cVNOAbbfDYB9l+F
	1L2bC3WSOf8P+jjF0UoeAN49YyBzX1acPWTthPIoQn2rLTzncR9EzNbdD5H+3wN8gIzIO/GTlkevR
	nzL5Y4WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVewi-00000005xyo-2uDk;
	Tue, 16 Dec 2025 23:59:12 +0000
Received: from mail-qv1-xf61.google.com ([2607:f8b0:4864:20::f61])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVewg-00000005xy8-09OI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 23:59:11 +0000
Received: by mail-qv1-xf61.google.com with SMTP id 6a1803df08f44-88267973e5cso28992246d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 15:59:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765929549; x=1766534349;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qTR8sWzuQg6qCv7sqYnowcXeRDt8t5dlxcGqTpMBq4g=;
        b=N9xvEcqIPgGOACzrmebv9gJEQ/YeFNlfK4w4yWH4+Crx3gORW7S7g81C+aNgUKfyOq
         DaFs+mg2DHylsNsB/1eZHiJiw9ismiANv3mDBgLg747ZZ1dR8hNPT2tLXQ94WnshrPWj
         gzyX9ewJJWsyZ3/ZzFmyAtV+KQtxY5C8zPniLeqW88zg4VdP/0KC91zMy1avBoS870wq
         f6u7kKLJpXwNaE5Vjy2CjA7jUo8o3dmcGSF8IXH7is+4yAjLKzTXYWZliqy3wrvE+/2i
         2VWP4ZfoH+2bSfXr4RrU1hja+FuSJ+EcckWJHFfZ7cq2iScqfV3xaI4m3TxD0ptWo1EF
         oEGw==
X-Forwarded-Encrypted: i=1; AJvYcCWeRE5ha+9MTPzHJYYtUJU+vocREIIB2MAkL7hd1Le/MLJ5DWmyhx/xMjDYudxpsFyIcojOfA9xUvIRXjw31WVr@lists.infradead.org
X-Gm-Message-State: AOJu0YwtHV7q+eYt/Naguj9P54wMaRovNCXwdA/FemO1YZ/yi7sRMn5f
	StYBQgsFf/srBqN2u5N7SOk37FNh3UIlJ3FPQU6JVEBH4mmCrneY0N8tNP6xUXtKua+omDlgMYO
	gPEWJaLAKI47Hz15kYUHk41VpqEuBUj3DoQ/8W6/wIL3txzKLedd3d9kCZRGmfikeSq5cHOXLbU
	GywWNWD1f5Z96O25LkztLhtzN5ZcF+v38fBLXOCjLL4/HGk/6TZbVxH4I+RZzSUW+crdulvTuip
	8MTHhSR7Gnst+ISkAeJ1u+sY9vtFxHwtpg=
X-Gm-Gg: AY/fxX6E4UNqEa/Ae/tdRGEXZxAhCnBZ5OlcjVmRsuyInEb7O7rOo6etTsSxM8EpNn0
	KtR6cvXltthjO3Zx/myAiEzOAIH/6ssUS1+ivanCnQlhsaVcPWLdN1DPTzwuQ2np/j9K1niiIwr
	s2cXfKK8AM9yVbMOWUBhrRcIYKHPS8ZE5fhqHX8R4XkyyZlDDQ7rYvJoR5NqimPnnVeWY+quEMz
	/1l2E7vMeuOQsAq3wGGNpuwzDB/OUSvuntBy/zqwgNAPdc8W4ZKc0of7zN+pXeYEkeOpDg/onm4
	8Rq/e8hE5ZljSRBYbwwZWdg9HTIJBPS+ZTIif//U248Y1XBbBbGNCyCxv4iuePvn51wWFPVzo2t
	EGarA99UCX9l2jzWpB6sGfQ9QOVuOsZktPIRJ9K7v6OPfYaCJR9CDnHj0ZfdTV/BAKpouNabU8R
	hqsXydgt+B0qnzNo0JyWASAWTENctPYhiccSHoB/XZs8mtgSFFuQ==
X-Google-Smtp-Source: AGHT+IGj71uJG7ySIi/dZdQbWrY9w9UNOZJx/gvGqmwYXxhuVL3YEUpV7wFWH6h55TvQq/0Evxeto+I9v9xN
X-Received: by 2002:a0c:f78b:0:b0:888:81bd:785e with SMTP id 6a1803df08f44-88881bd79ddmr171701716d6.50.1765929548559;
        Tue, 16 Dec 2025 15:59:08 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-19.dlp.protect.broadcom.com. [144.49.247.19])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-88a525a8f2csm1549296d6.14.2025.12.16.15.59.08
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Dec 2025 15:59:08 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f13989cd3so162624955ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 15:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1765929547; x=1766534347; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qTR8sWzuQg6qCv7sqYnowcXeRDt8t5dlxcGqTpMBq4g=;
        b=fYH7ELOJ8Ul6E4aGeT1iIMSbi+TyBaDglZsSCo6yZ96+IW+X1mK8Jt+OYjK23T0Qbh
         lNuHY7bI+cSJg/ct5WTXMGr2jHzL+mFsY+g7R+99sCl9p+c9iyHsqd5zZ7fJxkkHsjf0
         Y4U8e9i3n939mlR8qs11tamWDMBQrKNhwerRQ=
X-Forwarded-Encrypted: i=1; AJvYcCWdKZzWM9czXTaDnlEFdQBBZfJGqkj/lqoEB+jnQb38drP2rP7ERDO4CJ4O0YkO/jS59kIWFpi7baZ8OFaaq1Js@lists.infradead.org
X-Received: by 2002:a05:7022:ed05:b0:11d:f440:b743 with SMTP id a92af1059eb24-11f34ac5471mr8397466c88.7.1765929547282;
        Tue, 16 Dec 2025 15:59:07 -0800 (PST)
X-Received: by 2002:a05:7022:ed05:b0:11d:f440:b743 with SMTP id a92af1059eb24-11f34ac5471mr8397441c88.7.1765929546752;
        Tue, 16 Dec 2025 15:59:06 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb28dsm58042465c88.2.2025.12.16.15.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 15:59:06 -0800 (PST)
Message-ID: <351d9321-e5e9-43cd-bd74-68aef80aa177@broadcom.com>
Date: Tue, 16 Dec 2025 15:59:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: broadcom: bcm2712: Add watchdog DT
 node
To: Stanimir Varbanov <svarbanov@suse.de>,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Lee Jones <lee@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Willow Cunningham <willow.e.cunningham@gmail.com>,
 Stefan Wahren <wahrenst@gmx.net>, Saenz Julienne <nsaenz@kernel.org>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20251031183309.1163384-1-svarbanov@suse.de>
 <20251031183309.1163384-5-svarbanov@suse.de>
 <20251105165553.3910996-1-florian.fainelli@broadcom.com>
 <189702e0-e6f0-44c5-bed6-eef058d90b76@suse.de>
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
In-Reply-To: <189702e0-e6f0-44c5-bed6-eef058d90b76@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_155910_118485_7EB1756F 
X-CRM114-Status: GOOD (  12.13  )
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

On 12/16/25 05:00, Stanimir Varbanov wrote:
> Hi Florian,
> 
> On 11/5/25 6:55 PM, Florian Fainelli wrote:
>> From: Florian Fainelli <f.fainelli@gmail.com>
>>
>> On Fri, 31 Oct 2025 20:33:09 +0200, Stanimir Varbanov <svarbanov@suse.de> wrote:
>>> Add watchdog device-tree node for bcm2712 SoC.
>>>
>>> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
>>> ---
>>
>> Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
> 
> For some reason this is not part of v6.19-rc1.

I did not send out the pull request, sorry about that. Let's see if the 
SoC maintainers can still take it, if not that will be v6.20 material.
-- 
Florian

