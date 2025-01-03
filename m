Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0BBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 09:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZBnUmnMMAMfNBHLGsg9fMapjUleNoQ++cZwxgWCfWQ=; b=12EEXgEN0ZlV8c+ErOKqVKb6fR
	X6nIFzI94WL9oUSuEJsxu2cpnaxvG8pZXJYRsJErSoP5CKjXA8Y2XTRLMmBNY/D0vbYPln4+EeLi7
	ySyBTfn8WtB5ieCwg60Ei93qqIZNWqzdlP13hzKnR67ASUDOx3tAVHSKzmIe1tOqJuEpfPYeURApM
	8O/gOgDgLDV9OsAN1vDirq+u8NuIU9Bw1HEK77cZSC9XARCS5xCaAsGl+blrBHd6+WwQCFfrNoExA
	uvjtez+y763kmaJ6MevEa7eyH6VDHGXijSYjgBD8s1qMFqHXmhvHF+qnz1RxUMBk2+Sw2H77p8Se0
	LGM7+/lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTe1v-0000000CcVx-1B9A;
	Fri, 03 Jan 2025 09:31:43 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdzV-0000000Cc5N-2A7x;
	Fri, 03 Jan 2025 09:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1735896551;
	bh=1EkZCsAiRqfDtZ/Tc5fh3hJ4LLDdivzPZL9UBgudwok=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E+7p/7rMe4PAa4LM0kSw8xzFdN+zGRyjxWOn0lMCpc6E2VjQmqMlsSsOc7ZPoq9p7
	 QUcSdel8jDfuhfVtd44c9joi+Wq+hISPPU9BC3DaukPhTW74UzwDaLgfAUfBhgxkfn
	 Vv+Vi3todqQ+24cPdz8kCtZyMH5zJHqkxycW3vD/lTRzAV+QL398IA3lGEUW/ABchI
	 XWuakUiYXp8JUy58jU2HjH+gCDtRrTlfGAtdL7o88vJ0ed86/sbpeLsuNsbY4mguOr
	 XbsLLfU04ChKG2u56OUE7A09nqHbPuqhs0zn0dZeM0xinU1kdbiamAT7d6HY9qcnQq
	 FDX9X3i/53UEg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A6ED217E153E;
	Fri,  3 Jan 2025 10:29:10 +0100 (CET)
Message-ID: <9a874a5b-c698-4185-bb7f-f17245381af1@collabora.com>
Date: Fri, 3 Jan 2025 10:29:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] PCI: mediatek-gen3: Don't reply AXI slave error
To: Jianjun Wang <jianjun.wang@mediatek.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Xavier Chang <Xavier.Chang@mediatek.com>
References: <20250103060035.30688-1-jianjun.wang@mediatek.com>
 <20250103060035.30688-5-jianjun.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250103060035.30688-5-jianjun.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_012913_729770_3D288935 
X-CRM114-Status: GOOD (  20.13  )
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

Il 03/01/25 07:00, Jianjun Wang ha scritto:
> There are some circumstances where the EP device will not respond to
> non-posted access from the root port (e.g., MMIO read). In such cases,
> the root port will reply with an AXI slave error, which will be treated
> as a System Error (SError), causing a kernel panic and preventing us
> from obtaining any useful information for further debugging.
> 
> We have added a new bit in the PCIE_AXI_IF_CTRL_REG register to prevent
> PCIe AXI0 from replying with a slave error. Setting this bit on an older
> platform that does not support this feature will have no effect.
> 
> By preventing AXI0 from replying with a slave error, we can keep the
> kernel alive and debug using the information from AER.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>   drivers/pci/controller/pcie-mediatek-gen3.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 4bd3b39eebe2..48f83c2d91f7 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -87,6 +87,9 @@
>   #define PCIE_LOW_POWER_CTRL_REG		0x194
>   #define PCIE_FORCE_DIS_L0S		BIT(8)
>   
> +#define PCIE_AXI_IF_CTRL_REG		0x1a8
> +#define PCIE_AXI0_SLV_RESP_MASK		BIT(12)
> +
>   #define PCIE_PIPE4_PIE8_REG		0x338
>   #define PCIE_K_FINETUNE_MAX		GENMASK(5, 0)
>   #define PCIE_K_FINETUNE_ERR		GENMASK(7, 6)
> @@ -469,6 +472,15 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
>   	val |= PCIE_FORCE_DIS_L0S;
>   	writel_relaxed(val, pcie->base + PCIE_LOW_POWER_CTRL_REG);
>   
> +	/*
> +	 * Prevent PCIe AXI0 from replying a slave error, as it will cause kernel panic
> +	 * and prevent us from getting useful information.
> +	 * Keep the kernel alive and debug using the information from AER.
> +	 */

Isn't it safer if we set this bit at the beginning of mtk_pcie_startup_port()
instead?

Cheers,
Angelo

> +	val = readl_relaxed(pcie->base + PCIE_AXI_IF_CTRL_REG);
> +	val |= PCIE_AXI0_SLV_RESP_MASK;
> +	writel_relaxed(val, pcie->base + PCIE_AXI_IF_CTRL_REG);
> +
>   	/* Disable DVFSRC voltage request */
>   	val = readl_relaxed(pcie->base + PCIE_MISC_CTRL_REG);
>   	val |= PCIE_DISABLE_DVFSRC_VLT_REQ;




