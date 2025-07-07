Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE88C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 02:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDCot9PU6iJOj66kRNCpKxoXN03fEcc5IKkfLxk0R/A=; b=FZ40gk7Ab59Rs46yej5jKhddip
	B1QycTf+0nUe1qIy3Z5grExJi5ya/X6c2PbN//Kxnsa8HXkBSomAOz6xpY5CWVPmQxGV/Ix3bCSaD
	q0iH0PicRwDU5WuudxJtCR6ZpsfDbn6Pk7qDGdciallV5ZCuSv78adTANAe/mvStzgcwwAE09X/UM
	PRikF6FBk50IF8kuomIpyRuXHwn01QGgj+MwmFkitNiN9lL7hoLwYkVyoDHzy+iQ7dibqZOpSHQQZ
	MopKYE+QM0ZZMNhe8oDL/exD3jxr5W7V9p8AgcWm1NLK2uzZdhhNS82UAP3iTO6EklrRutPvk0397
	8t5NMrEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYc1A-00000001F9S-1JvH;
	Mon, 07 Jul 2025 02:55:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYbrz-00000001Dw1-0MsW;
	Mon, 07 Jul 2025 02:46:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3DC5A5C4A69;
	Mon,  7 Jul 2025 02:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E48BFC4CEF2;
	Mon,  7 Jul 2025 02:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751856374;
	bh=Z7aWQ9So+xlnwsCVx6yoE8yP6pTBwpth7HMkM+BK+Ww=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=duwN0/KF3JGook/rqYvpM9WAyxMITcPajCXLEbnDnS/H4ai9ZNyB3CL6MBprotE/A
	 mGdxbUmAJ5AdCb2WjxyhoaXgftyZgmKgaKf5gb1ChzigNCjt0OGcW5kL4F2GnN/2ci
	 iMTbFft5sb2UWSpE+iP0Shu+LIpZDA+c1oVb3HyhKbE1IiJR8AxCSAfgVsTcNDWtPW
	 Wj0wV4vvxpR/TOTBQbuKoulRVx/EKSkKH9aDgHPhcRZC10TV2BX02QXSXcm2A1scEu
	 fLZ0ecOQ2OgLP5pnCl82BUsfDyd1GV6fWCUZYW8yXJOTVCdbtBWhxXHLnUbn8sBY3R
	 ub+My+dtipybg==
Date: Sun, 06 Jul 2025 21:46:13 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, linaro-mm-sig@lists.linaro.org, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: shangyao lin <shangyao.lin@mediatek.com>
In-Reply-To: <20250707013154.4055874-5-shangyao.lin@mediatek.com>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
 <20250707013154.4055874-5-shangyao.lin@mediatek.com>
Message-Id: <175185636950.997517.4974488495469369107.robh@kernel.org>
Subject: Re: [PATCH v2 04/13] dt-bindings: media: mediatek: add cam-yuv
 binding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_194615_215612_6725DAF5 
X-CRM114-Status: GOOD (  13.25  )
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


On Mon, 07 Jul 2025 09:31:45 +0800, shangyao lin wrote:
> From: "shangyao.lin" <shangyao.lin@mediatek.com>
> 
> Add camera isp7x module device document.
> 
> ---
> 
> Changes in v2:
>   - Rename binding file to mediatek,mt8188-cam-yuv.yaml
>   - Various fixes per review comments
>   - Update maintainers list
> 
> Signed-off-by: shangyao.lin <shangyao.lin@mediatek.com>
> ---
>  .../mediatek/mediatek,mt8188-cam-yuv.yaml     | 134 ++++++++++++++++++
>  1 file changed, 134 insertions(+)
>  create mode 100755 Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.yaml: properties:reg-names: {'items': [{'const': 'base'}, {'const': 'inner_base'}], 'minItems': 1, 'maxItems': 2, 'description': 'Names for each register region. Must be "base" and optionally "inner_base".'} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.yaml: properties:clock-names: {'items': [{'const': 'camsys_cam2mm0_cgpdn'}, {'const': 'camsys_cam2mm1_cgpdn'}, {'const': 'camsys_cam2sys_cgpdn'}, {'const': 'camsys_yuva_larbx'}, {'const': 'camsys_yuva_cam_cgpdn'}, {'const': 'camsys_yuva_camtg_cgpdn'}, {'const': 'camsys_yuvb_larbx_cgpdn'}, {'const': 'camsys_yuvb_cam_cgpdn'}, {'const': 'camsys_yuvb_camtg_cgpdn'}], 'minItems': 4, 'maxItems': 16, 'description': 'Names of the clocks, must match the order of the clocks property.'} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/media/mediatek/mediatek,cam-yuv.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.yaml
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.example.dts:33.13-43: Warning (reg_format): /example-0/soc/yuv@16050000:reg: property has invalid length (16 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.example.dts:37.13-59: Warning (dma_ranges_format): /example-0/soc/yuv@16050000:dma-ranges: "dma-ranges" property has invalid length (24 bytes) (parent #address-cells == 2, child #address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.example.dts:31.24-58.13: Warning (avoid_default_addr_size): /example-0/soc/yuv@16050000: Relying on default #address-cells value
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.example.dts:31.24-58.13: Warning (avoid_default_addr_size): /example-0/soc/yuv@16050000: Relying on default #size-cells value
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.example.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.example.dtb: yuv@16050000 (mediatek,mt8188-cam-yuv): clock-names:3: 'camsys_yuva_larbx' was expected
	from schema $id: http://devicetree.org/schemas/media/mediatek/mediatek,cam-yuv.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.example.dtb: yuv@16050000 (mediatek,mt8188-cam-yuv): dma-ranges: [[2], [0], [0], [1073741824], [1], [0]] is too long
	from schema $id: http://devicetree.org/schemas/media/mediatek/mediatek,cam-yuv.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250707013154.4055874-5-shangyao.lin@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


