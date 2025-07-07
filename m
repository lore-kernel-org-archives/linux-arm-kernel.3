Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2866FC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 02:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9j+J7AHSiZgACh7//RXahq/Xt3QDC7m5SjmwI+iUyo=; b=pU3w72K+23aNtAEnDydMvETzes
	m+9IUEzoo/OXk46JjYy3fHh4cWzlRMYa+98kYQjjcFAeTfQO4N2f4fmLp7xaWtmle+UX1Uu7aNeq+
	SDHn6Qzi9Na/98G4p2npyJuP4aR5dejeKPbcTUaNZKTo5Ma/JYbZmwM8lX2WRv4O2Td3Lt0kMvuLs
	hl4pgQsu9oX+MwL1KZnpGYSyra1mTNKu1BBLtletZc9iOCnUhk9x0ASkBMYyY8+clcwDXS/5IoMme
	a/umR5haWS3WU9SDX/N4XVgCsFRSVazsjY8y1Y7+gEIwr591OOwJnnI52Hi27/SV+ih8KTy49s90D
	tc8cdHcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYbys-00000001EzY-17rt;
	Mon, 07 Jul 2025 02:53:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYbrx-00000001Dv3-2e6C;
	Mon, 07 Jul 2025 02:46:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1599261454;
	Mon,  7 Jul 2025 02:46:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFAA5C4CEEE;
	Mon,  7 Jul 2025 02:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751856372;
	bh=7PYgJSXdMi4aGcKW4ofsObuc+McUS8R+eLPSagoqZzk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=A32APTP8IrKq/W/k2xX2mx39uvN7T1T8ErjSBQljGCCkUyM+yQeQAeGPG4F7q/7lP
	 ULdDtIeznXFM0cnCHP69UQSjgJmKquOsiAssj9AI+hCrZ985poM3T+uNZeG+/9auvG
	 c1US5grvRUS7brbkfcQkD9o1Wzr7/bF/AAf9amUe6V1+HPbujYnbzXmaeedKnj1+Dl
	 7aDCr7YlV2Ho5H7rMKXxFOywiEFgbDbJYeIV+4tH2bUCaPbEp/RMqWwJ+m+bSpPQhx
	 mGMRNU4bhT0xLiwGNq2NlMoLC4bYh4at6bRmVb+H9Plc3ssIHRpK24ilBmmMuKhhF7
	 AfgAbYaEOb/wQ==
Date: Sun, 06 Jul 2025 21:46:12 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-arm-kernel@lists.infradead.org
To: shangyao lin <shangyao.lin@mediatek.com>
In-Reply-To: <20250707013154.4055874-4-shangyao.lin@mediatek.com>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
 <20250707013154.4055874-4-shangyao.lin@mediatek.com>
Message-Id: <175185636753.997469.8719246747333010338.robh@kernel.org>
Subject: Re: [PATCH v2 03/13] dt-bindings: media: mediatek: add cam-raw
 binding
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


On Mon, 07 Jul 2025 09:31:44 +0800, shangyao lin wrote:
> From: "shangyao.lin" <shangyao.lin@mediatek.com>
> 
> Add camera isp7x module device document.
> 
> ---
> 
> Changes in v2:
>   - Rename binding file to mediatek,mt8188-cam-raw.yaml
>   - Various fixes per review comments
>   - Update maintainers list
> 
> Signed-off-by: shangyao.lin <shangyao.lin@mediatek.com>
> ---
>  .../mediatek/mediatek,mt8188-cam-raw.yaml     | 156 ++++++++++++++++++
>  1 file changed, 156 insertions(+)
>  create mode 100755 Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.yaml:156:4: [error] no new line character at the end of file (new-line-at-end-of-file)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.yaml: properties:clock-names: {'items': [{'const': 'camsys_cam2mm0_cgpdn'}, {'const': 'camsys_cam2mm1_cgpdn'}, {'const': 'camsys_cam2sys_cgpdn'}, {'const': 'camsys_cam_cgpdn'}, {'const': 'camsys_camtg_cgpdn'}, {'const': 'camsys_rawa_larbx_cgpdn'}, {'const': 'camsys_rawa_cam_cgpdn'}, {'const': 'camsys_rawa_camtg_cgpdn'}, {'const': 'topckgen_top_cam'}, {'const': 'topckgen_top_camtg'}, {'const': 'topckgen_top_camtm'}], 'minItems': 4, 'maxItems': 16, 'description': 'Names of the clocks, must match the order of the clocks property.'} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.yaml: properties:reg-names: {'items': [{'const': 'base'}, {'const': 'inner_base'}], 'minItems': 1, 'maxItems': 2, 'description': 'Names for each register region. Must be "base" and optionally "inner_base".'} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/media/mediatek/mediatek,cam-raw.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.yaml
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.example.dts:33.13-34.43: Warning (reg_format): /example-0/soc/raw@16030000:reg: property has invalid length (32 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.example.dts:37.13-59: Warning (dma_ranges_format): /example-0/soc/raw@16030000:dma-ranges: "dma-ranges" property has invalid length (24 bytes) (parent #address-cells == 2, child #address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.example.dts:31.24-78.13: Warning (avoid_default_addr_size): /example-0/soc/raw@16030000: Relying on default #address-cells value
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.example.dts:31.24-78.13: Warning (avoid_default_addr_size): /example-0/soc/raw@16030000: Relying on default #size-cells value
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.example.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.example.dtb: raw@16030000 (mediatek,mt8188-cam-raw): dma-ranges: [[2], [0], [0], [1073741824], [1], [0]] is too long
	from schema $id: http://devicetree.org/schemas/media/mediatek/mediatek,cam-raw.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.example.dtb: raw@16030000 (mediatek,mt8188-cam-raw): reg: [[0, 369295360], [0, 32768], [0, 369328128], [0, 32768]] is too long
	from schema $id: http://devicetree.org/schemas/media/mediatek/mediatek,cam-raw.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250707013154.4055874-4-shangyao.lin@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


