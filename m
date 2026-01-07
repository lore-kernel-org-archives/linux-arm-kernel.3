Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65874CD5859
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 11:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WDDIS7/jopYjSzBHg9vIsUWy3M2h103FOZRdVLDX6a0=; b=gmFf3gFKbcWPPfEPMGR2E7Q+SO
	Z3yHOoRQ/akRU2W8hdYVkxW1dpcB5bL83m1OTQ5C7mcgldwh7/9pCrc2TDOj8Kooud6SXbYZnJ9Hr
	j1GuDCWYiUQkzACV3WSl+JPAPtE1e22JqNHisLcOyI3w4TLDuXq5U5LMDav7YJcCbfspsx3s8r1ml
	PGsR7rCzYRkHBuZOI4GbYfgXav/dnzMIPASkv6gCK5G4PSgM3Yqdi+GCOro8VKxvFowzR5f+oGAN9
	zkJhsFWK8DfM8mGlpRj3CBiXLhwBw6Ivl7bmkdIZOVzzKr1fWAlhyyzZUjAqFlQF4FrF7CSjcmztX
	6B0sTHXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRTa-0000000EnNO-27ST;
	Wed, 07 Jan 2026 11:13:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRTK-0000000En67-24FA;
	Wed, 07 Jan 2026 11:13:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767784376;
	bh=8FREetWQYfqgzhDiO9WBTIlqJFhiC73BzMP7I3w1vQc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GRFfT5q7chGTiJfUlB0pDh1C0QfcIXq0VIpGD486V4WCNjYPtUCBK2n4z8cK/+gJg
	 AXu+aPT0e1AI8x39N3DehXiiPKzEBTHGe8vF+QYTuWmi/eMgxLTijgE4Ij1SV61oXJ
	 JQILbpQWZSmIevaa7U71+9xVJzb9AtYMaqdbH5oPE0pI9E4pOyRVYyD5JQhpYU6T5T
	 7CIXHUXlqmBwQZU1FleXw/R/QABRaWCo1gArUqm8NUaGYKOcuLHuZ8UmfdAOLA4/dR
	 jLX6m91ad4A6+MChEJXsrg5CrFM5wi3qyoqO6xOpg/GCeZJT1eAsBi5jKj6qCzd1+0
	 O0N3TRJDRYhZw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3E06217E152C;
	Wed,  7 Jan 2026 12:12:55 +0100 (CET)
Message-ID: <98320300-04dc-4575-9e8b-22b85374b663@collabora.com>
Date: Wed, 7 Jan 2026 12:12:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/8] dt-bindings: PCI: mediatek-gen3: Add MT7981 PCIe
 compatible
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Lee Jones <lee@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 linux-pci@vger.kernel.org
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>,
 Bryan Hinton <bryan@bryanhinton.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Sjoerd Simons <sjoerd@collabora.com>
References: <20251223-openwrt-one-network-v5-0-7d1864ea3ad5@collabora.com>
 <20251223-openwrt-one-network-v5-1-7d1864ea3ad5@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251223-openwrt-one-network-v5-1-7d1864ea3ad5@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_031302_713871_2DF17E09 
X-CRM114-Status: GOOD (  12.59  )
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

Il 23/12/25 13:37, Sjoerd Simons ha scritto:
> Add compatible string for MediaTek MT7981 PCIe Gen3 controller.
> The MT7981 PCIe controller is compatible with the MT8192 PCIe
> controller.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>

I picked all of the DTS patches in this series, because this is ready to merge.

PCI maintainers, please, can you pick this one?

Thanks,
Angelo

> ---
> V1 -> V2: Improve commit subject
> ---
>   Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index 0278845701ce..4db700fc36ba 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -48,6 +48,7 @@ properties:
>       oneOf:
>         - items:
>             - enum:
> +              - mediatek,mt7981-pcie
>                 - mediatek,mt7986-pcie
>                 - mediatek,mt8188-pcie
>                 - mediatek,mt8195-pcie
> 




