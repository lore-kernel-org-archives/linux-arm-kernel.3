Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524A4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 09:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEhFZZ7vBSEV/1OyEuZXUEdwsSC1Ni8uIaBbnyVN7f0=; b=m7NCg9t7635Ij1VJH11bgnJsKT
	rh9RXhZXDV87KirSuruHToHjt0NDax5Lp+ElhrjW8Z5ZC9BLO2pbQOBqXDUt5wtPlmIVh3uFE+OiP
	kB6j8VDNl8T9uC7cAy3JKAnTHbWMNre6ZXRVo3xE920VN9dHi6MPkEOq8/AbmGUinxMAwtJsxBzIU
	n5RPIwUP1qbJ3RzxxqEULuXCFYdUhqAWJVGYPO1Bn/lOuHn28M4VbFapN9Mq0OuIo+V5QEe5Kqi4v
	IeyD940GQT2gkNFyvNwIgWia0hg/FHYIlA1p7w1oUASq97jvhMQJsZIGMR+whacKrYtOx1QBzTihB
	lk+XAgAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdor-0000000Ca3U-2QTk;
	Fri, 03 Jan 2025 09:18:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdng-0000000CZvw-1mxD;
	Fri, 03 Jan 2025 09:17:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1735895818;
	bh=1CnyMTeJ8ysgXUP5VxJNbzr0U48clwMyqfioLg6cdpA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Rq/Nee+jtD2JzgIstOTpzkS/hKkhH/BELuLz/reyl2Bas2hdhWhNTn2+WVSkJ2lLh
	 ryty4opmx5b5fWCZaw5P/lzmb7MqAgzR4sXg3OzArCAN84oJ4vMPUpB3UI3VUC3RBa
	 2bI6LEglW+hrdrHG3ShD+fF/yHNFc79hSPcd5lnqUp/xkOUipI4GMQcoPgjzh5Mmzh
	 zEzV7kYa0we8dyup5CItvJhgouOxTD1tj3XXJddRgwJ9sUWjg6KD7nksY24eqRi4Vz
	 7IEdDdjzn1dY9Idtawa+WIFMGiVgsCGzfkM7KU75Zdpcrqo5QeQhVGpHkwEOosnH/C
	 sUlJfoSNgdL0w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1554817E1542;
	Fri,  3 Jan 2025 10:16:58 +0100 (CET)
Message-ID: <b5ef9501-e07d-4150-9518-dd982518919e@collabora.com>
Date: Fri, 3 Jan 2025 10:16:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] PCI: mediatek-gen3: Disable ASPM L0s
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
 <20250103060035.30688-4-jianjun.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250103060035.30688-4-jianjun.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_011700_613275_C7A548DC 
X-CRM114-Status: GOOD (  14.55  )
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
> Disable ASPM L0s support because it does not significantly save power
> but impacts performance.
> 

That may be a good idea but, without numbers to support your statement, it's a bit
difficult to say.

How much power does ASPM L0s save on MediaTek SoCs, in microwatts?
How is the performance impacted, and on which specific device(s) on the PCIe bus?

Cheers,
Angelo

> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>   drivers/pci/controller/pcie-mediatek-gen3.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index ed3c0614486c..4bd3b39eebe2 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -84,6 +84,9 @@
>   #define PCIE_MSI_SET_ENABLE_REG		0x190
>   #define PCIE_MSI_SET_ENABLE		GENMASK(PCIE_MSI_SET_NUM - 1, 0)
>   
> +#define PCIE_LOW_POWER_CTRL_REG		0x194
> +#define PCIE_FORCE_DIS_L0S		BIT(8)
> +
>   #define PCIE_PIPE4_PIE8_REG		0x338
>   #define PCIE_K_FINETUNE_MAX		GENMASK(5, 0)
>   #define PCIE_K_FINETUNE_ERR		GENMASK(7, 6)
> @@ -458,6 +461,14 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
>   	val &= ~PCIE_INTX_ENABLE;
>   	writel_relaxed(val, pcie->base + PCIE_INT_ENABLE_REG);
>   
> +	/*
> +	 * Disable L0s support because it does not significantly save power
> +	 * but impacts performance.
> +	 */
> +	val = readl_relaxed(pcie->base + PCIE_LOW_POWER_CTRL_REG);
> +	val |= PCIE_FORCE_DIS_L0S;
> +	writel_relaxed(val, pcie->base + PCIE_LOW_POWER_CTRL_REG);
> +
>   	/* Disable DVFSRC voltage request */
>   	val = readl_relaxed(pcie->base + PCIE_MISC_CTRL_REG);
>   	val |= PCIE_DISABLE_DVFSRC_VLT_REQ;



