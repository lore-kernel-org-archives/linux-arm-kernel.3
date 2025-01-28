Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CEAC02190
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 17:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WFaFXtulxARpixggrH83x42Uo27jjPVjXCZSK7e+S2w=; b=QWVEjEPrYXf08mnRBqbwQ3RGWM
	iJTHA0DVrW/KoUBcIMcqkoVBzieZ6hxBtex0ga4oe1YmOgeNJ5I0ytsaQDL0w+WTGNHxYLAZPFDOg
	MUfhOoa2pHD7zVgf+h76RYKpj1OGxV0F3rZK/ffASiyD7p66EU0iayyxX6LBgaXCXZU9wYqlWVAji
	MXbtxZ/DrjCLRoal/KUVy8iJVQZciPoc2C0x52J9oqSMYLCIBvkMDZC6TfxzHgCA/w8UjDKTLNtgd
	D++l1ve7RyyYMG5uI3EpkiRwmnD8/1kXbRyT2kzXjs54du4bc7e3X2wNwpGBimhHt+moCBlOkXoOc
	sNP72Nbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcps7-00000005Upe-3wFt;
	Tue, 28 Jan 2025 17:59:35 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcpog-00000005U1R-3TBY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 17:56:04 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-29f88004a92so2965826fac.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jan 2025 09:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738086961; x=1738691761; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WFaFXtulxARpixggrH83x42Uo27jjPVjXCZSK7e+S2w=;
        b=hur9jqMKtp6h7d4cOkZyJndntfn4x5gjHp52nHzJYDJZiquL0aZv5dhX3WZ4kXAXVJ
         WtaJbeyycc29a3h6O4locWM3fJ3UMBH8QTCVVndoP1Wz3NW1xGd5FkGxJzLCz1e4YKTY
         oA15XxzWPVctXDxbZyG7Gt2Y0PIclYJxrXd+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738086961; x=1738691761;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFaFXtulxARpixggrH83x42Uo27jjPVjXCZSK7e+S2w=;
        b=BbXwH8xjZEn7+DX8UZo6nfh4P87w/GV1Tsv6n9vaD9a5n2jyx9hOMdXB6aeUgStEdF
         oC2KBlvTBq5ty+BY5JZU5aWuK6kL/kqe7YdJQWj8bRblmfSLha7U2sm+v6bNH9oSc0FU
         L3o24lrQysd2XoBjxmVRCjOPzvcg7IMyzmhBvbr1howNsKX38ojRPw6tlRfdy8P4XIr4
         9/jnz/oAp8cOD5NCd6ivYLauksjAs5+mp+fGiCJbyi4ChniUJzCEQm7mS6BohgBtAN4d
         ZdwFWAQR9rOFf7aC+zz/i0jTj7usaFVkq9/bGgy0S7Lm78rRXcZVTpGLrbamDYHbYfTZ
         COEA==
X-Forwarded-Encrypted: i=1; AJvYcCVbP132xn+rItDwYrgJpjKU/uxsEKbAiadQfAMEV550LAXuruB0kYPJ+EtfEg44iMZZZoWwiMLJJrg1lTr8xigy@lists.infradead.org
X-Gm-Message-State: AOJu0Yz76U9nh8JR42EAY8mQjZbDJlPCfZWYWFPRNPUB7oP2s9qv1M7k
	ykKrXbQSxJExmVP5TzQbdZpUE3xzvZI+aHMA8mLMu9Ok20A9j/d6+/6Td0B0TQ==
X-Gm-Gg: ASbGncuTleP79q/yxRYrh29pGEVEyae88l5wwi9QyFTLCW19Yv2sCnrM118ZzL+7xXM
	lGYxI+iThdlkkY26h19zOJHQxEHZm8FOxxFtKGc8+MzsoS6zZOBbjooYCYGege/OJvpjEndMx5f
	fhXbYQp7vmvF6mNQBJ90lc0/i+s6Fz+KdnlKuZXw0hThOzu/b7xDhq26dD5nqHnqKTpE0weE3Wa
	CppC2NzX8hXRm86b7JpAdq7IVNxhlReWigp+ONiAPsoM22p/dywV+u+I94Pqkc4BO3695YtAHzX
	yWXx1/EVa1fivxSpKJY6GJtrcSMLKEE0Hn0EhmhtOdxb6rA68/5gHXA=
X-Google-Smtp-Source: AGHT+IHonHcVzin7MrMAMt5oJ799fuBp9FUDl5Ft2PJO7WbyjEeyBqzZqyWPnMPg9enCe9wWUd+Yxg==
X-Received: by 2002:a05:6871:a9cc:b0:296:e366:28ea with SMTP id 586e51a60fabf-2b32f3084demr35249fac.33.1738086960734;
        Tue, 28 Jan 2025 09:56:00 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b28f16aa2bsm3683130fac.13.2025.01.28.09.55.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 09:56:00 -0800 (PST)
Message-ID: <b1009877-6749-4bb1-95b9-ae976bef591c@broadcom.com>
Date: Tue, 28 Jan 2025 09:55:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 -next 03/11] irqchip: Add Broadcom bcm2712 MSI-X
 interrupt controller
To: Thomas Gleixner <tglx@linutronix.de>,
 Stanimir Varbanov <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Bjorn Helgaas
 <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250120130119.671119-1-svarbanov@suse.de>
 <20250120130119.671119-4-svarbanov@suse.de> <87bjvs86w8.ffs@tglx>
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
In-Reply-To: <87bjvs86w8.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_095602_867934_99E3F16C 
X-CRM114-Status: GOOD (  14.93  )
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

On 1/27/25 10:10, Thomas Gleixner wrote:
> On Mon, Jan 20 2025 at 15:01, Stanimir Varbanov wrote:
> 
>> Add an interrupt controller driver for MSI-X Interrupt Peripheral (MIP)
>> hardware block found in bcm2712. The interrupt controller is used to
>> handle MSI-X interrupts from peripherials behind PCIe endpoints like
>> RP1 south bridge found in RPi5.
>>
>> There are two MIPs on bcm2712, the first has 64 consecutive SPIs
>> assigned to 64 output vectors, and the second has 17 SPIs, but only
>> 8 of them are consecutive starting at the 8th output vector.
>>
>> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> 
> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
> 
> As this is a new controller and required for the actual PCI muck, I
> think the best way is to take it through the PCI tree, unless someone
> wants me to pick the whole lot up.

Agreed, the PCI maintainers should take patches 1 through 9 inclusive, 
and I will take patches 10-11 through the Broadcom ARM SoC tree, Bjorn, 
KW, does that work?
-- 
Florian

