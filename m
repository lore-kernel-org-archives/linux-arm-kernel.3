Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7B0C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 17:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2XQEZz8DrQTR1mxU/ualC1FnFYm75rDAYl+kFwmjZuU=; b=fZX1LdbinDlOrfe/jKjb+jxutQ
	JLHla+LuA8mERLE0aP3b+qnn/LXYlV2auDG3EjxzCdCCriV4kEArk+ECyOU7MxXHWZNKT4kxbOni3
	igcJdEASzJhqjZqrnKdwpBJ1znWML0OfMeGafx6reVX6Vi5tddE4F3NdtWeRzix63TBztX7QgpVAG
	jH9Lp8Thjr52MexSamTkJpjnTFG23bo2beRhsSWCmTrnaECrFpokRm3l8evk9aLAVxfKsxmt3rSWV
	mKzLGQQ7B3+nl1TAdgdLbaBU2f5PYlEzuktMBPuf2DfXHdX8CcmwZhIxpfFx8UoCQfUrZ8xsMF51C
	3ZGiVfJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk41k-00000001D9Y-22yE;
	Thu, 07 Aug 2025 17:03:40 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk3zA-00000001CKx-0z49
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 17:01:02 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b3226307787so1008003a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 10:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1754586059; x=1755190859; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2XQEZz8DrQTR1mxU/ualC1FnFYm75rDAYl+kFwmjZuU=;
        b=Gd5l8fJ4s/40W8L1vau/hw+MRDG1JbzOBa7b8ujp8XMC+mSeYiZAyxDtpenKs0ew3x
         b4tm9861UzCvaOGE6o+SYQm/T2qoMSEnuwM60Bvm2KKG06JuNSvLMyXLLop9WIMeJRy3
         0Q77B2lNzasXr/GX9ul5EeYWCagHlpapwuCKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754586059; x=1755190859;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2XQEZz8DrQTR1mxU/ualC1FnFYm75rDAYl+kFwmjZuU=;
        b=vnDIEpZMWcAxdv2jBcGu6Fkd3vWbBZkpJI9TMGkPD2dmRRmvzefL7U1YfxB6C/2pqj
         lX34gS81zwHKlwjuA/STPUFpjhIHNcXWp5MhapZMvVeGuf59NEdH7caDgCMAGM2t8juv
         JJ7rKMYIZ0Zjs8uP37o2/qogmp1mRyA2mQkTnt06U0EbrDgSji0Cz6lvGU7azTPS7RKJ
         VH/dIf3ZBykRGyKcyDKZsEfkx7gNMq9aNEtTiA3srKlNPHZ3ehwb7C7oOmesA4xwF466
         dFDRxdE84Hbe4lMiiXBHeatspvxn2DKi4kGT2Z8zAjMiXdbctQC6xDlsmlKjzDsPz8eM
         Ed9g==
X-Forwarded-Encrypted: i=1; AJvYcCWDhr50pr6GF161qr6FWPRjThV+I8fQGMx4IDU+IIHjCTnVhcfPz93MYMKXMX4WMO9BnOXFFxqCK2z24JuReY8z@lists.infradead.org
X-Gm-Message-State: AOJu0YxIxBmbTcCU63G8PnywFne6CrPr2NKxMvH3+zeWftbrMGQ5yEjk
	p8hO4alKwaEkl0M2RVsBcikher1W7tPTTLBtc8BRO9d2ZtpJC0gNoghK75Unpf2vIaW+iWeuTdt
	zWM3Ddg==
X-Gm-Gg: ASbGncuFGCkg6o1uSGpmXjtP1AGXVq8Dqcg/WcJvr7koxIW2ryiiFJYyD9GYEsdVB1O
	uHXznWTkIiG2AN8dHqFKqg6CqhmrIiGyppruMXvZEIbLw8pyem5CjqmlWRfZcjWtv9fzWaj6/ks
	/UDgKKK13aGt+fehFrKiWCo4PtW3cO8QLiVTXBvPc+A9RjTsvp/pQ6lNJG4Xws8ASjCoSrPHKGv
	uQK/JU3FBd/LY2FYDplNXxEmTaUNsLCkrU/+krnONXGjmQree6hHKFss2wSxF7qgxg1uG4m2x9Y
	HFG5URK778VhmxCe7FnQDRH/u15oNiy5yS2quJ808diRaRis/Lsz4qV8HzeQUIUcuWGuozQZOdj
	dL8aZziI6/9KTkZkdl3qPrgq8ru+2zxQvLzy5sqQyhCsvgs+81OrGCgVBI2LEtA==
X-Google-Smtp-Source: AGHT+IG1bBL2oQySi+K0k5iOJwT9pr8OKXIeKQOlPuvjdUAnInwVIDuPNbh6rF/ytsTKp8wb3JxMMA==
X-Received: by 2002:ad4:5cc5:0:b0:707:2472:dc3b with SMTP id 6a1803df08f44-7097afbe83emr93427616d6.42.1754586047987;
        Thu, 07 Aug 2025 10:00:47 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077ca464acsm102096016d6.36.2025.08.07.10.00.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 10:00:47 -0700 (PDT)
Message-ID: <8ff6c436-74bc-43f0-b5a6-3085ded52d02@broadcom.com>
Date: Thu, 7 Aug 2025 10:00:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] PCI: brcmstb: Add panic/die handler to driver
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Cyril Brulebois <kibi@debian.org>, bcm-kernel-feedback-list@broadcom.com,
 jim2101024@gmail.com, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250806185051.GA10150@bhelgaas>
 <0a518bd3-0a20-4b69-a29f-04b5cd3c3ea8@broadcom.com>
 <yqtfhokgfgiwk62lhxkxna26lpexgnlvcmwgfopewlj5u74drt@q6adhcvm7hqz>
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
In-Reply-To: <yqtfhokgfgiwk62lhxkxna26lpexgnlvcmwgfopewlj5u74drt@q6adhcvm7hqz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_100100_307457_BBC8BE3E 
X-CRM114-Status: GOOD (  20.09  )
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

On 8/6/25 22:26, Manivannan Sadhasivam wrote:
> On Wed, Aug 06, 2025 at 01:41:35PM GMT, Florian Fainelli wrote:
>> On 8/6/25 11:50, Bjorn Helgaas wrote:
>>>> I'm not sure I understand the "racy" comment.  If the PCIe bridge is
>>>> off, we do not read the PCIe error registers.  In this case, PCIe is
>>>> probably not the cause of the panic.   In the rare case the PCIe
>>>> bridge is off  and it was the PCIe that caused the panic, nothing
>>>> gets reported, and this is where we are without this commit.
>>>> Perhaps this is what you mean by "mostly-works".  But this is the
>>>> best that can be done with SW given our HW.
>>>
>>> Right, my fault.  The error report registers don't look like standard
>>> PCIe things, so I suppose they are on the host side, not the PCIe
>>> side, so they're probably guaranteed to be accessible and non-racy
>>> unless the bridge is in reset.
>>
>> To expand upon that part, the situation that I ran in we had the PCIe link
>> down and therefore clock gated the PCIe root complex hardware to conserve
>> power. Eventually I did hit a voluntary panic, and since all panic notifiers
>> registered are invoked in succession, the one registered for the PCIe RC was
>> invoked as well and accessing clock gated registers would not work and
>> trigger another fault which would be confusing and mingle with the panic I
>> was trying to debug initially. Hence this check, and a clock gated PCIe RC
>> would not be logging any errors anyway.
> 
> May I ask how you are recovering from link down? Can the driver detect link down
> using any platform IRQ?

Just to be clear, what I was describing here is not a link down 
recovery. The point I was trying to convey is that we have multiple 
busses in our system (DRAM, on-chip registers, PCIe) and each one of 
them has its own way of reporting errors, so if we get a form of system 
error/kernel panic we like to interrogate each one of them to figure out 
the cause. In the case I was describing, I was actually tracking down a 
bad DRAM access, but the error reporting came from the on-chip register 
arbiter because prior to that we had been trying to read from the clock 
gated PCIe bridge whether the PCIe bridge was responsible for the bad 
access. This leads you to an incorrect source of the bad access, and so 
that's why we guard the panic handler invocation within the PCIe root 
complex with a check whether the bridge is in reset or not.

If this is still not clear, let me know.
-- 
Florian

