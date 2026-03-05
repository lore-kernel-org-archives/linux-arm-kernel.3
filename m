Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC4DEEF304
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 13:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ueWqTVe04zFok5bXvG4gbrXr/anBMPLVEJL8cYGEQ0U=; b=ZRfHaIfkpie5vzcPlke7L3l9Fq
	VHsVmo/HFuNB7dfuEXLZ9vcbYtHpCg6ZrR8kOvdSevEdE6b0Wt57nhmCjnyMsl5+0O9b7P7wxtvNr
	GK0QKSShOwGxkyc3wrjMZ/zDyhkpCm/xlO0ZUCdimb8XNfrC7OniQX33sTqMADw1/JUOE1PPNKVEh
	acqqSd3cnh5KPJ3082Qppn1EIHlq8SQ2vHC4eek2ocrLdesBq0HpP9TLVwXgqaXSXXV6tcVXsxTx+
	rrM+xsJBaMuGT/8I5yeYN/w0Y+AjbrEl/pz5uwAyMqOP3Nc19ICOkIMZmtvIbrAVPYuPfvZAZ+pdo
	tGiYgDnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy914-00000001toe-1qwX;
	Thu, 05 Mar 2026 13:45:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy912-00000001tni-0wjs;
	Thu, 05 Mar 2026 13:45:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6DCC54166C;
	Thu,  5 Mar 2026 13:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F620C116C6;
	Thu,  5 Mar 2026 13:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772718323;
	bh=OItzwbM1kWf/k111FzhV0ryoidvsVkmrmFKOuyzTRBA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=LB//sRAqF22s63HNrBHamLSG8+BH0+Cws/VmCppeOuyzHovaM84NrUtkJsx+88eMG
	 Kvy7oUUO/Gg12APg9N8DkBlWImapQBu7dMHKgBJYtvB28KLJjr5jDtxmBqrUqHyQZ+
	 4U1ZcaYZk0WmqFuQJwX0RfhS4zcfd1vacfTFEO7I+/D5qd7qklmBBEqFUgJ49I4Wl/
	 ySo0JzoulrRF3VGczcDCsYTbOVvu9gMamxOM+loEdhxA0RGIIVJ9p+jT1Ho6e6Iyob
	 WalmR0IgSb/JqAvs0dVVhdifrH4lIOHrXvqlOj0tvB4vynmKdRhTC+emWryJQ+lgt1
	 xuNUqq5FPr66A==
Date: Thu, 05 Mar 2026 07:45:22 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Chuanhong Guo <gch981213@gmail.com>, 
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
 Bayi Cheng <bayi.cheng@mediatek.com>, sirius.wang@mediatek.com, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
 vince-wl.liu@mediatek.com, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-arm-kernel@lists.infradead.org, jh.hsu@mediatek.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Meiker Gao <ot_meiker.gao@mediatek.com>
In-Reply-To: <20260305071546.2603378-1-ot_meiker.gao@mediatek.com>
References: <20260305071546.2603378-1-ot_meiker.gao@mediatek.com>
Message-Id: <177271832061.3486624.7931849295651115643.robh@kernel.org>
Subject: Re: [PATCH] spi: dt-bindings: mediatek,spi-mtk-nor: Add clock
 bindings for mt8189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_054524_306525_32252E3B 
X-CRM114-Status: GOOD (  16.41  )
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


On Thu, 05 Mar 2026 15:15:42 +0800, Meiker Gao wrote:
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
>  .../bindings/spi/mediatek,spi-mtk-nor.yaml    | 69 ++++++++++++++++---
>  1 file changed, 58 insertions(+), 11 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml: allOf:1:then:properties:clock-names: 'oneOf' conditional failed, one must be fixed:
	False schema does not allow 5
	[{'const': 'spi'}, {'const': 'sf'}, {'const': 'axi_f'}, {'const': 'axi_h'}, {'const': 'axi_p'}] is too long
	[{'const': 'spi'}, {'const': 'sf'}, {'const': 'axi_f'}, {'const': 'axi_h'}, {'const': 'axi_p'}] is too short
	1 was expected
	5 is greater than the maximum of 2
	5 is greater than the maximum of 3
	5 is greater than the maximum of 4
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml
Lexical error: Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.example.dts:79.32-50 Unexpected 'CLK_PERAO_SFLASH_F'
Lexical error: Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.example.dts:79.64-82 Unexpected 'CLK_PERAO_SFLASH_H'
Lexical error: Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.example.dts:80.32-50 Unexpected 'CLK_PERAO_SFLASH_P'
FATAL ERROR: Syntax error parsing input tree
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1597: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260305071546.2603378-1-ot_meiker.gao@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


