Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E4BFD88F4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 04:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eM3W9UZ+0Y+ajWjS+3yCAqqPwap2l4TycbEYV+xRLV4=; b=iBKOJCavFpVplh9y5MDujxd1v9
	Bv9iJmpgPjH6jOz312YWiNGIOLTKNFkufo0+fWmEJ185X+P0CMfOnQxwMuvAE+eWsfQxJ+z6p6hBC
	ySpF1I/EI3S2rgsob0yBZEYj9s7fWTVbnHE2CI917hsDDrN9m+Y6CNr78zXV7r5gCP418cY5t/mjj
	gSvjpKev0Urow/TJ7kBR+vQiT6cVjYOGGt7ZeWIZcq0uaU22YXaJMdTT8YNhpNdTozz3W3B5r+jA4
	fMp6hdLEEhrAB5pPnayT1QsYpNb+X2hg1QToHEo5ESsy0Ro9Hjwrdcpa89IaPIqS/YfPtK3r5616K
	oGfiZvPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0B6w-0000000AiHr-1Bbt;
	Wed, 11 Mar 2026 04:23:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0B6u-0000000AiHV-3X38;
	Wed, 11 Mar 2026 04:23:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F2513600B0;
	Wed, 11 Mar 2026 04:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB66C4CEF7;
	Wed, 11 Mar 2026 04:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773203031;
	bh=UsrotKtwTPcsPEv1FN54h8Xs4K6jwjLX+66h7on1sRY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=kV+Z4wJKA8Ip0GTxo7dHaCritcT2LWejYaC6Ggmw+G81Rk+mlG4CEgd+9X00Xw3bt
	 Xdb1I1dXBj/RQfvsP7RIfCj70ToWDSeZotcJ8xL2p3YxFxucStaTwz4xQBf3RQNzA9
	 MJ3TMhU3PZ2XB9QyRamjwTsrBtw2I1bQsTSWmijZy3JCHGMRgVMF+eScumkTuleQAl
	 ihrLzf0Z5yyiIxaaykYD5bYs/10Rjg5OnVQwUv/RFJJuRIsMN4pNSlvyQIr7o0vpyx
	 u1cxVNUPO2H3ckXNpRiuW2g2aQBX36LrRSbbqZ03fVG9T5acon3hyJlKSWTtMtZ0ud
	 YubliWOcX8e9w==
Date: Tue, 10 Mar 2026 23:23:50 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, jh.hsu@mediatek.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Bayi Cheng <bayi.cheng@mediatek.com>, vince-wl.liu@mediatek.com, 
 Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>, 
 sirius.wang@mediatek.com, linux-mediatek@lists.infradead.org
To: Meiker Gao <ot_meiker.gao@mediatek.com>
In-Reply-To: <20260311034342.721583-1-ot_meiker.gao@mediatek.com>
References: <20260311034342.721583-1-ot_meiker.gao@mediatek.com>
Message-Id: <177320303066.1741798.2429672153678774846.robh@kernel.org>
Subject: Re: [PATCH] spi: dt-bindings: mediatek,spi-mtk-nor: Add clock
 bindings for mt8189
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


On Wed, 11 Mar 2026 11:43:40 +0800, Meiker Gao wrote:
> Update mediatek,spi-mtk-nor.yaml to add conditional clock and
> clock-names bindings for the mt8189-nor platform. The mt8189-nor
> controller requires five specific clocks and corresponding clock-names
> ("spi", "sf", "axi_f", "axi_h", "axi_p"). This change enforces these
> requirements in the device tree binding schema.
> 
> For other platforms, the minimum number of clocks and clock-names
> remains unchanged. The patch also adds an example for mt8189-nor,
> illustrating the new clock configuration.
> 
> This update ensures correct hardware description and validation for
> mt8189-nor, improving compatibility and reducing configuration errors.
> 
> Signed-off-by: Meiker Gao <ot_meiker.gao@mediatek.com>
> (cherry picked from commit c3180d35e52b5213764a89403e71f9a34d7bb842)
> ---
>  .../bindings/spi/mediatek,spi-mtk-nor.yaml    | 46 ++++++++++++++-----
>  1 file changed, 34 insertions(+), 12 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml: allOf:1:then:properties:clock-names: {'maxItems': 5, 'items': [{'const': 'spi'}, {'const': 'sf'}, {'const': 'axi_f'}, {'const': 'axi_h'}, {'const': 'axi_p'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260311034342.721583-1-ot_meiker.gao@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


