Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2E7D149F9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 00:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OBqr5/lEqbmI/hDIH3VI4HQy1crlFq/+2LAAjMEPiXM=; b=MEs9v8GH3iokp5T9nmeK6sOnYv
	MaJrQAPO33XIC/Wq0NSCQ5UoyGcG2c2/3dwWGgGACsDI68HOVIaptV729bFhdjOOMFvJnlngq96NT
	qqFu3QL5kUpLP9wlHXV7zGIe1kf1qr6ubJAU7hjKyZkbnLCt840qQSD7/Xb1kecWfDgxpUdTRe2yX
	a2Yrxi7tJDAqCjQD2CoiRAEto7Ktj0/vT4qPDwZCof/CQzWUux700zpWRDlHJqOP/tu8Bl4U2fEcJ
	vmRMMEHWZRgC6HXrse3gUs3/aDNUNbPq1w+6FXNBP7zJqJwZccNOJ6fB+fPsEjDny7xHmX1QCf0jI
	lX/TaEFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4UiI-00000005eW6-1qBE;
	Sat, 26 Oct 2024 00:31:30 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4STY-00000005Os0-3aK9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 22:08:11 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-71ec997ad06so1808271b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 15:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1729894087; x=1730498887; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OBqr5/lEqbmI/hDIH3VI4HQy1crlFq/+2LAAjMEPiXM=;
        b=Ipzaekv8qAKrvwwT7bhKke76QKWSbBTKItdRoyPznnZhBYI7YEVCsXsQIPA/PaaCgY
         OhGVbSymd6iSmHZkNcdes+RstfLxDN+UR8YBnkpF40YPdBMVofTQaoHlhc8tam6OZZ8/
         mQamZGRhL8K5qdILAQJ6MRj2dGCK4urXaBy+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729894087; x=1730498887;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBqr5/lEqbmI/hDIH3VI4HQy1crlFq/+2LAAjMEPiXM=;
        b=n/6YRC2IUi3CA1h3V0YAiKyUTUx3teqXp6FmS0XTn/Rj838/rIMDYQt9JMcuTVPsNN
         KiENzV+YayhOWgmoJLf+Tu4h/aCN6P+uQZU0ESSlCAYUI2Fw2k7dpcrvdRvSD+HpLoXY
         tj1yd8WRvOG+3xZI1JT99vEt9sOGPOYsJ5+j/1p/vH5fG36sN3DSROQrMKarXdS4gox0
         pWPCE2ZfaAxS/r5Nx+bSD/w9YqnUciOURyHISljl9Z9uGC5Q7cahTa4xA+erRhVK3rKc
         H/SLHJWyGRPHJmWMLHRBEGFnsq2pDnv5wClkOjgKO6/X2BhjhZ9VQ37+2NgFtRQuAzNZ
         RO4A==
X-Forwarded-Encrypted: i=1; AJvYcCXA57ZGa9shHLqPP1pqoN55p+8bel7TRNnLg6JcjJH1SNAV9vSI65qzyaKa+ZDo2g1j4po4jBX6Vl/bR+/tUQUn@lists.infradead.org
X-Gm-Message-State: AOJu0YxuSvfqCUEXB/iX0JuVHh3oNps8QCFqFLQmg2j/Aant7PnK33TR
	uvmUYE/EOk2ZEAnd9/LGdy7MbhMbtLVVMzhPVvX9c1AAJdP7Wk6P4by2iUWwcw==
X-Google-Smtp-Source: AGHT+IEsAN/vuGOObXJbV29oiWth+FFeEcn13MWc0LfoAFSeMovkdy0dgMlpJxVC05ShdRU2btO0ZQ==
X-Received: by 2002:a05:6a00:3d49:b0:71d:f510:b791 with SMTP id d2e1a72fcca58-72062f83b0dmr1416532b3a.12.1729894087565;
        Fri, 25 Oct 2024 15:08:07 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a219d9sm1625474b3a.171.2024.10.25.15.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 15:08:06 -0700 (PDT)
Message-ID: <8bf2ff23-9cb3-40f5-84dc-4aaab466961d@broadcom.com>
Date: Fri, 25 Oct 2024 15:08:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/10] PCI: brcmstb: Adjust PHY PLL setup to use a
 54MHz input refclk
To: Stanimir Varbanov <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell <jonathan@raspberrypi.com>
References: <20241025124515.14066-1-svarbanov@suse.de>
 <20241025124515.14066-9-svarbanov@suse.de>
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
In-Reply-To: <20241025124515.14066-9-svarbanov@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_150808_903215_1368D175 
X-CRM114-Status: GOOD (  10.54  )
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

On 10/25/24 05:45, Stanimir Varbanov wrote:
> The default input reference clock for the PHY PLL is 100Mhz, except for
> some devices where it is 54Mhz like bcm2712C1 and bcm2712D0.
> 
> To implement this adjustments introduce a new .post_setup op in
> pcie_cfg_data and call it at the end of brcm_pcie_setup function.
> 
> The bcm2712 .post_setup callback implements the required MDIO writes that
> switch the PLL refclk and also change PHY PM clock period.
> 
> Without this RPi5 PCIex1 is unable to enumerate endpoint devices on
> the expansion connector.
> 
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

