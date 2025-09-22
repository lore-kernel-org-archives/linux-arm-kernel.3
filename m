Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7FCCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 11:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysQo03jN4/tn9x18PLK43TCHpH+x5/kw1G6H70M+RXE=; b=u2uy8soOanRHUIEoWTC/wwJe01
	8euTWAK2aarAm8+P2c0gciXPinv/IhVu806pOnPztMVG/d1iJPHl8CqYuvvOtevfbIiO5qgfXyJ62
	1CQr7B0JffH75pGIEq1ZGEVwmDJAZeQ3c6LkXNcTNrEm/oCGEJ4eiB+eNPTLpBjch4QAJ/fxdI28G
	CMZxBQltaxz69TlmqPUfAIitEOU0WxuhnnBAOBpRx9zpiM3/IajdcvW5R2DToQagvneC+F8j3bK9X
	MlWlmV82QLBFl+pGxF7bphU13Sa853iJKU7AfGSOtmEdgfAJ5D0pkit3yQ8MSFHso6UIe2W6rUt6K
	Zag1qGwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0eoo-0000000ADuH-0MJ1;
	Mon, 22 Sep 2025 11:34:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0eom-0000000ADtB-0EZw;
	Mon, 22 Sep 2025 11:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758540889;
	bh=lb1C8SMfCr+8kDNObsSpByOAWegC7XEjXpe8JDLgUhs=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=AZ9DzssrYUTmn1Uo9lHUGzCIBjiYYVpAGQv0pDxxV6Bb+SQyxj/0UCdSUKl4ikOMF
	 jkPPDkKryJ3P3qLygqe/mNdBDL8Iu6b25uBcaFMmcq/31f70aU+ab3DZfwiFAxN3Zl
	 8+xOhOl38wFxtcaghMOiWQM2tzISz3BE55XdV3Tr0J9Lka3OR2jRTTcx/8ndZwYmca
	 IQ5Fo32hj1wIZI3G/tU5e1IS024gdaMo9f7866CCkCfg9h+aP0skzRGfM9ASA3H9h/
	 shX9j+bhsHCFQEtdCGihs0Yc0qmkjz1Wa+fgyDQa6Tpx0bPVEF3avKIiet7ccrCbQM
	 30ZZUCFCfxYlA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0E87717E01CC;
	Mon, 22 Sep 2025 13:34:49 +0200 (CEST)
Message-ID: <1a4b2fbe-3584-48ad-9fce-e1c729862cb5@collabora.com>
Date: Mon, 22 Sep 2025 13:34:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] PCI: mediatek-gen3: add support for Airoha AN7583 SoC
To: Christian Marangi <ansuelsmth@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, upstream@airoha.com
References: <20250920092612.21464-1-ansuelsmth@gmail.com>
 <20250920092612.21464-2-ansuelsmth@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250920092612.21464-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_043452_273594_91E6F08B 
X-CRM114-Status: GOOD (  15.82  )
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

Il 20/09/25 11:25, Christian Marangi ha scritto:
> Add support for Airoha AN7583 SoC that implement the same logic of
> Airoha EN7581 with the only difference that only 1 PCIe line is
> supported (for GEN3).
> 
> A dedicated compatible is defined with the pdata struct with the 1 reset
> line.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>   drivers/pci/controller/pcie-mediatek-gen3.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 75ddb8bee168..db9985375be9 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -1360,8 +1360,18 @@ static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_en7581 = {
>   	.flags = SKIP_PCIE_RSTB,
>   };
>   
> +static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_an7583 = {
> +	.power_up = mtk_pcie_en7581_power_up,
> +	.phy_resets = {
> +		.id[0] = "phy-lane0",
> +		.num_resets = 1,
> +	},
> +	.flags = SKIP_PCIE_RSTB,
> +};
> +
>   static const struct of_device_id mtk_pcie_of_match[] = {
>   	{ .compatible = "airoha,en7581-pcie", .data = &mtk_pcie_soc_en7581 },
> +	{ .compatible = "airoha,an7583-pcie-gen3", .data = &mtk_pcie_soc_an7583 },

Same comments as the dt-bindings review, "an" comes before "en", also rename to
airoha,an7583-pcie.

Cheers,
Angelo

>   	{ .compatible = "mediatek,mt8192-pcie", .data = &mtk_pcie_soc_mt8192 },
>   	{ .compatible = "mediatek,mt8196-pcie", .data = &mtk_pcie_soc_mt8196 },
>   	{},



