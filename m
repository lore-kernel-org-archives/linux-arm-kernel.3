Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F14D132AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 10:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2IRjvdHUlI4leV+2qgsEkivhyX3eTg7nzED/eiQ5BE=; b=P9kV8tHhLZO7dweAdPKnoXorDP
	tYteHItJTLo3+nxhBBaqQ8pFNI5c4ThXFYNu/s+kTwW0/oX8NZyRYms+5LdxRT5N6XDGOoFOEQjQ6
	cNwjw/LfJbBeK1Biy/2WLAA0VUjyM0OoFg/lTYCHsI0LZW5/eLobjbTzY+pwBdJf5H0/IbELsJeEj
	H7ScodYHNXu87bi+XYkEHcEsNpto3Xy4qFHKZ76WOk4kuEMdq7u4FUyCgjxNnMy3KOs/uu9CIBHIL
	gX/MM+dUgPGNeJhBsk/xzU2hzcJ0JAnzKfcKXsKOHl5fVJuEMWM6OFnYW9J5iINv8aSf6sKUmek5k
	kWGFO3lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7uaa-0000000DM2y-26Nf;
	Mon, 04 Nov 2024 10:45:40 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7uYt-0000000DLoQ-0XBH;
	Mon, 04 Nov 2024 10:43:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730717033;
	bh=jSAdqX1Ad8ImwxDLwbjTUxB6CFLUWZ3Ps8wu2h3Cl7s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SpaJntKC9FuJVx0pEuryCi2LC8GpnietV2/bSAJXucHXphnfb2OJZqdM0liwOWWFg
	 cncW2y312i2LFTQCZCLwFAt5gn9Y/SHw64xMYrtdg4IWs+Z3/B01/rf4kNHOY+QmsC
	 lO31XX9KjRGhQI9IoARW95qZ++THuNKj/BMQerbmLZm+wLr5PaPUFBTyB43yKHKOPt
	 Rhpjdg+/zmPvaXZVyk7RAf8JEByaeA2Txrc/xATxLoHKzYpYrO2CIA+P0te/6szCpM
	 dU8XPyqVJGBoc89OcICgJ7k6oFpY/JUk4NV6anlr5CgKEi8LNyvs1yjlPV3HTOOpr/
	 xq2ybN6LyVQsA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DEB3917E35D3;
	Mon,  4 Nov 2024 11:43:52 +0100 (CET)
Message-ID: <9351c903-8141-4721-a352-776215afbfa1@collabora.com>
Date: Mon, 4 Nov 2024 11:43:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] PCI: mediatek-gen3: Add support for restricting
 link width
To: =?UTF-8?B?Smlhbmp1biBXYW5nICjnjovlu7rlhpsp?= <Jianjun.Wang@mediatek.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "robh@kernel.org" <robh@kernel.org>, "kw@linux.com" <kw@linux.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 Ryder Lee <Ryder.Lee@mediatek.com>, "fshao@chromium.org" <fshao@chromium.org>
References: <20240918081307.51264-1-angelogioacchino.delregno@collabora.com>
 <20240918081307.51264-3-angelogioacchino.delregno@collabora.com>
 <9e56fbe0b1a388b4e0da20cca53e157f51288916.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <9e56fbe0b1a388b4e0da20cca53e157f51288916.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_024355_349750_1354FFAE 
X-CRM114-Status: GOOD (  24.70  )
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

Il 04/11/24 09:56, Jianjun Wang (王建军) ha scritto:
> Hi Angelo,
> 
> Thanks for your patch.
> 
> On Wed, 2024-09-18 at 10:13 +0200, AngeloGioacchino Del Regno wrote:
>> Add support for restricting the port's link width by specifying
>> the num-lanes devicetree property in the PCIe node.
>>
>> The setting is done in the GEN_SETTINGS register (in the driver
>> named as PCIE_SETTING_REG), where each set bit in [11:8] activates
>> a set of lanes (from bits 11 to 8 respectively, x16/x8/x4/x2).
>>
>> Signed-off-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/pci/controller/pcie-mediatek-gen3.c | 20
>> ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c
>> b/drivers/pci/controller/pcie-mediatek-gen3.c
>> index 8d4b045633da..8dd2e5135b01 100644
>> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
>> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
>> @@ -32,6 +32,7 @@
>>   #define PCIE_BASE_CFG_SPEED		GENMASK(15, 8)
>>   
>>   #define PCIE_SETTING_REG		0x80
>> +#define PCIE_SETTING_LINK_WIDTH		GENMASK(11, 8)
>>   #define PCIE_SETTING_GEN_SUPPORT	GENMASK(14, 12)
>>   #define PCIE_PCI_IDS_1			0x9c
>>   #define PCI_CLASS(class)		(class << 8)
>> @@ -168,6 +169,7 @@ struct mtk_msi_set {
>>    * @clks: PCIe clocks
>>    * @num_clks: PCIe clocks count for this port
>>    * @max_link_speed: Maximum link speed (PCIe Gen) for this port
>> + * @num_lanes: Number of PCIe lanes for this port
>>    * @irq: PCIe controller interrupt number
>>    * @saved_irq_state: IRQ enable state saved at suspend time
>>    * @irq_lock: lock protecting IRQ register access
>> @@ -189,6 +191,7 @@ struct mtk_gen3_pcie {
>>   	struct clk_bulk_data *clks;
>>   	int num_clks;
>>   	u8 max_link_speed;
>> +	u8 num_lanes;
>>   
>>   	int irq;
>>   	u32 saved_irq_state;
>> @@ -401,6 +404,14 @@ static int mtk_pcie_startup_port(struct
>> mtk_gen3_pcie *pcie)
>>   			val |= FIELD_PREP(PCIE_SETTING_GEN_SUPPORT,
>>   					  GENMASK(pcie->max_link_speed
>> - 2, 0));
>>   	}
>> +	if (pcie->num_lanes) {
>> +		val &= ~PCIE_SETTING_LINK_WIDTH;
>> +
>> +		/* Zero means one lane, each bit activates x2/x4/x8/x16
>> */
>> +		if (pcie->num_lanes > 1)
>> +			val |= FIELD_PREP(PCIE_SETTING_LINK_WIDTH,
>> +					  GENMASK(pcie->num_lanes >> 1,
>> 0));
> 
> It should be GENMASK(fls(pcie->num_lanes) - 2, 0).
> 

You're right in that there's a mistake in that one, and I see it now,
but I don't get why this should be "fls(...) - 2".

The datasheet says that "LinkWidths" is

Bit 8 = x2 supported
Bit 9 = x4 supported
Bit 10 = x8 supported
Bit 11 = x16 supported

pcie->num_lanes can be set to either 2, 4, 8 or 16.

2>>2 = 0   -> fls(0) == 0 (after field_prep/genmask: bit 8)
4>>2 = 1   -> fls(1) == 1 (after field_prep/genmask: bit 9 to 8)
8>>2 = 2   -> fls(2) == 2 (after field_prep/genmask: bit 10 to 8)
16>>2 = 4  -> fls(4) == 3 (after field_prep/genmask: bit 11 to 8)

So, this should be
	GENMASK(fls(pcie->num_lanes >> 2), 0)

Right? :-)

In which case, should I send a new version, or can you fix that while
applying? I'd really appreciate the latter due to lack of time.

Cheers,
Angelo

> Thanks.
> 
>> +	};
>>   	writel_relaxed(val, pcie->base + PCIE_SETTING_REG);
>>   
>>   	/* Set Link Control 2 (LNKCTL2) speed restriction, if any */
>> @@ -838,6 +849,7 @@ static int mtk_pcie_parse_port(struct
>> mtk_gen3_pcie *pcie)
>>   	struct device *dev = pcie->dev;
>>   	struct platform_device *pdev = to_platform_device(dev);
>>   	struct resource *regs;
>> +	u32 num_lanes;
>>   
>>   	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>> "pcie-mac");
>>   	if (!regs)
>> @@ -883,6 +895,14 @@ static int mtk_pcie_parse_port(struct
>> mtk_gen3_pcie *pcie)
>>   		return pcie->num_clks;
>>   	}
>>   
>> +	ret = of_property_read_u32(dev->of_node, "num-lanes",
>> &num_lanes);
>> +	if (ret == 0) {
>> +		if (num_lanes == 0 || num_lanes > 16 || (num_lanes != 1
>> && num_lanes % 2))
>> +			dev_warn(dev, "Invalid num-lanes, using
>> controller defaults\n");
>> +		else
>> +			pcie->num_lanes = num_lanes;
>> +	}
>> +
>>   	return 0;
>>   }
>>   




