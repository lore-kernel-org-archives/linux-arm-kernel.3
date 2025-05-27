Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6261DC5B542
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 21:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Fz2IwiKLgIvS2GyTyNEhioSLhVlP1wKyrLN1LJ9DDs=; b=19iuOPoZ9GMCXUZmEqfy4DS6/h
	079akclv+csrjE7+FLdur2vE14W0/Gyoi6HoBIOaGcn1X8YCwhRP3XcIWh2EQhUo3qiBY//RwUsGY
	tm8GSwEG2bmjQI6ohutrP59i4nO2THpd++cOCjGwNKvrknKYjjQ9rcYnJlOZyuiGfDoriIOr9d0Vw
	btLa9K8cmPFw+hXN0TLykT4YfIzyDSXrHWCDRL+JGoLB8rgxMSfF14G7g2tCUo6nHTzMFp6bp3Hz8
	TXYN/dMlsQR+NMuVtp3j9GyLw85ymAjrhlgkV7ki/6LyzjWxmGV7mpx6BNs3xMEJKjcYYurQZWJPU
	MAykqOrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK1vL-0000000BcbT-1xax;
	Tue, 27 May 2025 21:33:27 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK1p1-0000000BbIK-3vcL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 21:26:57 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-742b614581dso3533916b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 14:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748381214; x=1748986014; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0Fz2IwiKLgIvS2GyTyNEhioSLhVlP1wKyrLN1LJ9DDs=;
        b=dlD3k2JYOEfylCnsc2MUgINwVShCIiOWbxskTV3nvsAAluVoUdG8AahDMDIE+N+kfY
         Pt6A79MROApC8dPFd6BHbGepTH3iE+u5IglqgenCBJJuo445egVRxbIiJ3GGN5GOxe/m
         zIJvDPSKod+V6+8ffPm1wzpRsrAnEGGoUHWZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748381214; x=1748986014;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Fz2IwiKLgIvS2GyTyNEhioSLhVlP1wKyrLN1LJ9DDs=;
        b=ZqBiJzjN/2Bn8dldAMpBEpBaDA9UD+nRLsiVbf9AH7SWtZU3iuNQur/rEQOMrfNpUP
         bpIQSlxmHOhek/4rKUwWCYKXaBbM2ZCgjoD8O9AKAEL3aabbgvgrcL2AdZK4I5N86OuS
         E4+Q1SYwayGk+z9tWVEEFZhMg6E6K5i2DALlFHmZ/EdxzL0DNjkGqkot6xcpIF55D10p
         QkELXHdXzCrPAdCOro5+n9v3PoHTVMk5pfQyQx/3yO9YEtdF+emrvUSizxmEyz3Iz4Cx
         fB0wcRkt1h0lww6eGSX5zPggYLpWJ6a4X3XaPFKv8ZnCVR2Cwgv8xsO/fg5yx08SjwgA
         OWjw==
X-Forwarded-Encrypted: i=1; AJvYcCW69VOCv3EDKzaZwCuk/XB6wfdgxZ5YaACo7RCZGoWNKfOoMZSE1Ozr22g+o1QNfErAHK+DUW2w/rgLMeaBWTqI@lists.infradead.org
X-Gm-Message-State: AOJu0YyuEgUa6sufUhZr9gGon4t2mS1tUDBDv4MSjSoJ/MPcbENrsaI1
	IDWD/z22qdsXv2TlikUGAc/63uYxde7xIwzcHqIdk8a14AnaZ8/zIk9nxbSI0+X27A==
X-Gm-Gg: ASbGncsuz6yk43FzJUE2ba8DpMciNfFOlgMaxcDLBUx019Htg4w9HOYSKl/hSRWRunn
	+UfWqXb6vUWyvaO+MwoUBoG3vjDvhQDbpl4M3NF3KxihF/uLIN88lcTuT5yOVhdy8dD3D/cIMeL
	Bz6AsWvmU4sKAHeY5YzuzUSHRMox/p5GiTYGzhaMMSEELAo7jLOgI92Ul0LVVaTY4sRJgFYARUU
	lOQeJsVv6d5FU/hG0ScIYnzYmpjNoJyuz/Cuve8L0dzhbiMgbev/KkTTDjgF6MZzE7ucMFKGMQE
	u+rbXqqYTSkN+Yvgoaj9zAvXOvk5TLwyNC2N+jCXBNCtzCBz/3L/sfc5sg8rH7Lfj8Xe2OEeSxD
	dc39LsAlanSuqsaY=
X-Google-Smtp-Source: AGHT+IGbB4of3bVeCDZcaBDyBXB0MhYsMAeAxaUp2tSHxEQHByHVKBDEHHtoMZZUmLbInzOiyCiNOQ==
X-Received: by 2002:a05:6a21:483:b0:1f5:7280:1cdb with SMTP id adf61e73a8af0-2188c245222mr23547171637.16.1748381214325;
        Tue, 27 May 2025 14:26:54 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746682ee04dsm36539b3a.126.2025.05.27.14.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 14:26:53 -0700 (PDT)
Message-ID: <c291e9ee-7ad6-43a2-a686-a518b56eb8c1@broadcom.com>
Date: Tue, 27 May 2025 14:26:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 -next 08/12] arm64: dts: bcm2712: Add external clock
 for RP1 chipset on Rpi5
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Matthias Brugger <mbrugger@suse.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Linus Walleij
 <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic
 <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>, Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, kernel-list@raspberrypi.com
References: <cover.1745347417.git.andrea.porta@suse.com>
 <38514415df9c174be49e72b88410d56c8de586c5.1745347417.git.andrea.porta@suse.com>
 <aBp1wye0L7swfe1H@apocalypse>
 <96272e42-855c-4acc-ac18-1ae9c5d4617f@broadcom.com>
 <CAO50JKVF6x_=MUuzjhdK0QotcdUgHysMb9v1g0UvWjaJF2fjDA@mail.gmail.com>
 <48AFA657-5683-42A4-888E-3E98A515F3B1@broadcom.com>
 <aCIk40642nXZ3arz@apocalypse> <3899c82c-d6a7-4daf-889b-b4d7f3185909@suse.com>
 <6953caf0-0fef-4bd6-898c-4f86ee738f30@broadcom.com>
 <aDYthG54Wz3khQ88@apocalypse>
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
In-Reply-To: <aDYthG54Wz3khQ88@apocalypse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_142656_029469_6A36551C 
X-CRM114-Status: GOOD (  22.33  )
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

On 5/27/25 14:24, Andrea della Porta wrote:
> Hi Florian,
> 
> On 09:18 Tue 27 May     , Florian Fainelli wrote:
>> On 5/26/25 07:06, Matthias Brugger wrote:
>>>
>>>
>>> On 12/05/2025 18:42, Andrea della Porta wrote:
>>>> Hi Florian,
>>>>
>>>> On 15:02 Mon 12 May     , Florian Fainelli wrote:
>>>>> On May 7, 2025 5:01:05 PM GMT+02:00, Andrea della Porta
>>>>> <andrea.porta@suse.com> wrote:
>>>>>> Hi Florian, to accept the patches, what would work best for you?
>>>>>>
>>>>>> 1) Send only the relevant updated patches (maybe as an entirely new
>>>>>> patchset with
>>>>>>     only those specific patches)
>>>>>
>>>>> Only the updated patches work for me. I don't think there is
>>>>> that much coupling between the DT changes and the non-DT changes
>>>>> (other than without DT entries nothing is activated)
>>>>
>>>> It's a little bit more involved than that:
>>>>
>>>> - Patch 7 (misc driver) depends on 6 (RP1 common dts) which in turn
>>>>     depends on 1 (clock binding header). Should be taken by Greg.
>>>
>>> Greg gave an Acked-by so I think Florian is good to take that patch.
>>> Which leaves us to the clock patches (driver + dt-bindings).
>>>
>>>>
>>>> - Patch 9 and 10 (board dts) depends on 6 (RP1 common dts) which again
>>>>     depends on 1 (clock binding header). Should be taken by Florian.
>>>>
>>>> - Patch 4 (clock driver) depends on 1 (clock binding header) and
>>>>     should be taken by Stephen.
>>>>
>>>
>>> Steven reviewed the patches (driver + dt-binding) so he is waiting for a
>>> new version which addresses the review. He offered to either take them
>>> and provide a branch that Florian can merge into his branch or provide a
>>> Acked-by tag.
>>>
>>> @Florian what would you prefer?
>>
>> I am fine either way, it's definitively simpler if I can take all of the
>> patches in the respective Broadcom ARM SoC branches, but pulling a branch
>> from another maintainer's tree works just as well.
>>
>> Andrea, sorry to ask you this, can you post a v10 and we aim to get that
>> version applied?
> 
> No problem, just to avoid any confusion I'll summarize what-goes-where with
> respect to branches in your repo broadcom/stblinux, so I can adapt each patch
> to the relevant branch:
> 
> - dt-binding/DTS (patch 1,2,3,6,8,9,10) -> devicetree/next

Ack

> - defconfig (patch 11,12) -> defconfig/next

Ack

> - drivers (patch 4,5,7) -> drivers/next or soc/next?

I will take them in drivers/next.

> 
> Also, should I split any patches that have MAINTAINERS changes so you can apply
> them to your maintainers/next branch? Those are patches 4,5,6,7.

Not sure there is much value in splitting the MAINTAINERS file apart, 
maybe one initial commit covering all of the entries you are right about 
to add would do, up to you.
-- 
Florian

