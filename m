Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDD5CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 20:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Fd8815X1RUqCabuTvLuXZbJKbv+i/J65/QtTSTp+uo=; b=bHiv2T+9fvWEElMywiLgDGDnJ+
	b1RiWki7UifH2LOq11165sFvywa9jOVldJrXmIfgxzAWvwubIAHEE01AqCDHh9cTsNkYRZKoA0Nwc
	Ujk2Fv2k4AsXI6HVgYbb7feu6d3lWVI6l/rrbtHEzaGhy16eW54zKAxTtwlh5tMM+6A/+oXQUO5io
	niReyTSkzm36n4eEZJWSWQ+Kw14tTBrwQAUy/dqsHfFkxbE80uaWZNrhZgQEMzseEh+C0BWSFSPgS
	dZaBN5wmpbCP7xJgrUkhzNpcmQQxKRPBTSZw4vaZBK0cbvjIl7UM7Shh4lMw2AkDo4pmInV8mzI/1
	8ckWTk4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vECVs-00000002k5p-15QG;
	Wed, 29 Oct 2025 20:11:20 +0000
Received: from mail-oo1-xc62.google.com ([2607:f8b0:4864:20::c62])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vECVp-00000002k3x-2AgQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 20:11:18 +0000
Received: by mail-oo1-xc62.google.com with SMTP id 006d021491bc7-65043e595a8so115529eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 13:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761768676; x=1762373476;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Fd8815X1RUqCabuTvLuXZbJKbv+i/J65/QtTSTp+uo=;
        b=gpWuXPMMDWoCHKEY+YS/cF69KhYPyue/XtjCCMJYnGr622+OGYPYqF8LE8pmYDbzo0
         o+0L0wvmRSK8WEgCSAx0kn/7Rq4SGZbNqEwP+Flsf6bWqg3HXmidInpbYMPlwi6IEHsj
         uEIIPZi9YmqNfZmuI3Ujx3ovJSw591JlGuiVXKAnV/ct7R74IL0JqR49EGFI2arqjrUE
         fTFrgHglUmWStQ1R9XEYpq9BxliLgkT2EO+7j9lf4hVXDYidIbBu/3NflKFz90jVryyI
         zPDZdyl6KDoeuhd5+kSEQGKi2DQ0ALGfF7p9AephIwUnBJ+e1h+5HpaK5I9mM5gWIv0Y
         AeqA==
X-Forwarded-Encrypted: i=1; AJvYcCVlgBe+j7MAktiN/f6adLNPtej1hzBFJMPa/9gCBeoTvaxdY8OMTtfMhUyLyenUn7MLPYL9VG5IqxfFLHBMV/Ps@lists.infradead.org
X-Gm-Message-State: AOJu0Yz++uTRMau+T3J4tcjI7akFvOs4BsiC8JS6/So7jXuHrKtuNV27
	+NiGIc6MiAtdC5P7BmY7olg0HjU08MxULOfyir54SuwV8wZGcad5dEe7JYaOpemMpPNmssXaJkQ
	hBr4zx60rkI8gIQfB9OEptKTJkF69CT0uAXFULzujseW3v9xGC2KhIDe162VZaAGtZNkAIC/9LS
	RJNMNEABZ/Z34/vYRZBVaO/6RA6bATTF7V9hJYKFXMSn2AN0PFis/UZUEne11qam1HR2NwrT8iU
	IxhUPtq8YROWYIgJTgELbB/XPdeILD4pts=
X-Gm-Gg: ASbGncuIJvfKzgaHR16JY1gGga9TWCK6D6nLvIPg5VTnWSsUZW9tkm/GfNQonkLauS9
	oFG6X/cFqx8mv4QVvpetOATyNpXzBTz3Y+GB8xcPz2umwVcczUjdOS8sHJgKj2fENOL/9WKqnB5
	Z4A8NL8ckuVTKcA2I/o3wPPAiBwbJdpgRs++6vjJBPmGH7apiXqWvjjke/qhJgyYnl+3UWcygn+
	BYGj0SRdQbF8p8X64kHQ9QFhDZrp+onfs7/ACGgKOiemTasw+uIKo2FMWD+ccl7Wjz/UX3S4L7S
	pXPTvWKHZ0heDg4GJlnGSbKNx9D+7sRdrjN3462I/WtfBzMJkhkWTuKJAGQ3qF9nU1sZsUHIFBy
	TBGkTFkIYj/tNwin/fwTYvZur0FvXGPsEvGPt6p+27GtZSNc8n7lgqOuxBEBQPhktqD2xDCWlfg
	FA0OVooh5CI589BsqYjWNaj3C+6yiPk2923dezPfJqFQ==
X-Google-Smtp-Source: AGHT+IEqHXrMO7x0xap9Sv4mF1gIGyt+1TjnDQ0vFICBzlvO6elT8w2C62XKE6/uWcEE+VPmp09YbWg4pPPP
X-Received: by 2002:a05:6808:1829:b0:44f:6d6e:14af with SMTP id 5614622812f47-44f7a420012mr2354548b6e.12.1761768675581;
        Wed, 29 Oct 2025 13:11:15 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-7c530000195sm1274957a34.0.2025.10.29.13.11.15
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Oct 2025 13:11:15 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87c0f8cbe6fso10522836d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 13:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1761768675; x=1762373475; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2Fd8815X1RUqCabuTvLuXZbJKbv+i/J65/QtTSTp+uo=;
        b=HG1ZDmXvv0GGV1D9fbIdiTG8QcjEl6LoaL4rthCiiWardMoEIx4XjJXvlv2onPpKr8
         ChBcHQO/vyq/IgMXRIjrYmjLoSyqpj2wQfTB1qwW5d6z4r23IJIOKfpVnj0SYZ4EEkGc
         bvt1JGA/DbYwUwn+c2df8ZtA9k31BaD75ZDJ4=
X-Forwarded-Encrypted: i=1; AJvYcCWwr1E3bdTKhdqgusLNpF3L1m2FdLGkmlz8F+kgfKx8+JvtCQ8Y8FpAyc49mSyrxkJyipMK13QqoNPO2wYDrx77@lists.infradead.org
X-Received: by 2002:ad4:5d44:0:b0:87e:d590:89b7 with SMTP id 6a1803df08f44-88009afcaa5mr61772256d6.19.1761768674872;
        Wed, 29 Oct 2025 13:11:14 -0700 (PDT)
X-Received: by 2002:ad4:5d44:0:b0:87e:d590:89b7 with SMTP id 6a1803df08f44-88009afcaa5mr61771726d6.19.1761768674483;
        Wed, 29 Oct 2025 13:11:14 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fd3c48f20sm91342686d6.32.2025.10.29.13.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 13:11:13 -0700 (PDT)
Message-ID: <e71b90ba-176b-4178-812e-2437bc81ce3f@broadcom.com>
Date: Wed, 29 Oct 2025 13:11:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] PCI: brcmstb: Add a way to indicate if PCIe bridge
 is active
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Cyril Brulebois <kibi@debian.org>, bcm-kernel-feedback-list@broadcom.com,
 jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20251029193616.3670003-1-james.quinlan@broadcom.com>
 <20251029193616.3670003-2-james.quinlan@broadcom.com>
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
In-Reply-To: <20251029193616.3670003-2-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_131117_581661_24C8BA31 
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

On 10/29/25 12:36, Jim Quinlan wrote:
> In a future commit, a new handler will be introduced that in part does
> reads and writes to some of the PCIe registers.  When this handler is
> invoked, it is paramount that it does not do these register accesses when
> the PCIe bridge is inactive, as this will cause CPU abort errors.
> 
> To solve this we keep a spinlock that guards a variable which indicates
> whether the bridge is on or off.  When the bridge is on, access of the PCIe
> HW registers may proceed.
> 
> Since there are multiple ways to reset the bridge, we introduce a general
> function to obtain the spinlock, call the specific function that is used
> for the specific SoC, sets the bridge active indicator variable, and
> releases the spinlock.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

