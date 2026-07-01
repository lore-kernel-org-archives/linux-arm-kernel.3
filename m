Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FB2C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 14:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vO42L4Nhds/UY8hBhbxFlSZhqARnmHdkd0khHdxgnL0=; b=d21upLx1aBoKFE3IsN8HQ5R9Sf
	B0NiOMmqrdyOXN510EfkiPbVewS+TOe74MfesML+qBZ4cReDUkTfA3aJ4mL9G8+LfnRBtNPGKIwfQ
	lJC4oby72aT3aJ3zTIcjKV5vpq3zvxfc4mdhL8xGhzGCZqwLCvVM1oS40n941qTZ7epgoYaSEsSES
	xDzJE1HSnmU5JXSLdV150IU1ehfuX+wGgu5lASsb7kaPeY029lYQM1MYSl2rfyKZOu9eOhSV7HGf3
	5V4nVycPtY8vC+pTgiEvTwsj08dR/85SLuHk3Iov6haD0dwkYi6zDoyVdxwPZMULYfluQvR6V79D8
	a1NB9zxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevqp-00000002GyT-2FC4;
	Wed, 01 Jul 2026 14:23:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevqn-00000002Gxd-3gX1;
	Wed, 01 Jul 2026 14:23:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 68D5042A47;
	Wed,  1 Jul 2026 14:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A6E1F00A3A;
	Wed,  1 Jul 2026 14:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782915821;
	bh=vO42L4Nhds/UY8hBhbxFlSZhqARnmHdkd0khHdxgnL0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=XXu1vrz/uoxgB8k+hjRFdEMGiRBbgvAfLsaS6LP4upp3R/hnCeY3vnun0hH4M2J3i
	 dnJorz84lT1WlwG30bJ+ymKpIBBPgX/THKqo1G/IGn+G0i9jD9mtPrCy5zuMBKufki
	 7Euj6/1WB1uKxhMaooav9Nwd7JeFw/b0c7dWGFFrjLVoGxj3Vr0ew492o/QC/xL6hu
	 4I1UVBHQYrXavbe+zUIgY1FNqn80aLAOicVje1RalWMjqINqGdYtNhCkZ3YnF1EmuY
	 XUPr+0MA2WRSX7kDTW1AUxs5sQ33qr5PLcZlv+eyVucyz77RCahVgDd8dxmO3IDYQP
	 xT8QJC5SUGYzQ==
Date: Wed, 01 Jul 2026 09:23:40 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel@collabora.com, airlied@gmail.com, 
 dri-devel@lists.freedesktop.org, mripard@kernel.org, conor+dt@kernel.org, 
 justin.yeh@mediatek.com, devicetree@vger.kernel.org, 
 jason-jh.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, 
 simona@ffwll.ch, chunkuang.hu@kernel.org, tzimmermann@suse.de, 
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, 
 maarten.lankhorst@linux.intel.com, p.zabel@pengutronix.de, 
 krzk+dt@kernel.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260701122057.19648-27-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
 <20260701122057.19648-27-angelogioacchino.delregno@collabora.com>
Message-Id: <178291581411.4115410.14754664533277420399.robh@kernel.org>
Subject: Re: [PATCH 26/42] dt-bindings: display: mediatek: Introduce MT8196
 Layer Blender
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


On Wed, 01 Jul 2026 14:20:41 +0200, AngeloGioacchino Del Regno wrote:
> Add documentation for the Overlay Layer Blender IP found in the
> newer generation SoCs like MT8196, MT8894, MT6991, and their
> variants.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek/mediatek,mt8196-blender.yaml     | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml: ignoring, error in schema: properties: compatible
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml: properties:compatible: [{'const': 'mediatek,mt8196-disp-blender'}] is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml: properties:compatible: [{'const': 'mediatek,mt8196-disp-blender'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml: properties:compatible: [{'const': 'mediatek,mt8196-disp-blender'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml: properties:compatible: [{'const': 'mediatek,mt8196-disp-blender'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml: properties:compatible: [{'const': 'mediatek,mt8196-disp-blender'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml: properties:compatible: [{'const': 'mediatek,mt8196-disp-blender'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml: properties:compatible: [{'const': 'mediatek,mt8196-disp-blender'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml: properties:compatible: [{'const': 'mediatek,mt8196-disp-blender'}] is not of type 'object', 'boolean'
Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.example.dtb: /example-0/blender@328e0000: failed to match any schema with compatible: ['mediatek,mt8196-disp-blender']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260701122057.19648-27-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


