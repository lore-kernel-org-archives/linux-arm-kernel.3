Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860EAC44502
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 14:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+MQqoMdTb10quuKjj21cquQc2SQagarqLqHoeQ9/rY=; b=M/y3OA6HHco0cSSDLTDYjjyosB
	ApjfskatDuk0cj9Ushol8A5MlQCf3M6R89CCWQOT+lmI4k+IotWr0sXxKcHxWXJcGJkzGxBB1fzvi
	y+e/2tLybJn410wjwmxxGGyTFmCjLsB3oxbnOC0Y+h/Sh2dxRo+xXYoy4QYoL3t+vnHvBHNce2poT
	IsEkeKS8W2YtcSojGwEBDchp8c6ssGewXcCLGPK2AT0gIz3rQCm1PMFkYXPRKRi4iL4DnAbiQnWil
	9qF5knQkAi4P9sBxMkqHbOE1bcI06uRQMkevNRcAXP9CGGNgtsRd6fxrTRB8VOqlcL7cQyCj51/fs
	JRs/GVzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevqs-00000002H2G-29XV;
	Wed, 01 Jul 2026 14:23:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevqq-00000002GzZ-2k5R;
	Wed, 01 Jul 2026 14:23:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 69FBB4172F;
	Wed,  1 Jul 2026 14:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288F71F00AC4;
	Wed,  1 Jul 2026 14:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782915824;
	bh=L+MQqoMdTb10quuKjj21cquQc2SQagarqLqHoeQ9/rY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=CW81gr08/6J3xgLYZqeMUjS5S8MAX27dufuEN6oZM/k/TED4PyD+vkkGZ5DmD5J1E
	 uZ49HNe3o4iDB9XKWBlELTolRsUaDMTt2jKlaHfXCFlZT/INQEHZXNozYwNlQsQZe4
	 JvKjXqzgOt0iq62BIusGQ+anmtq8f3FxDStbZNW5HbIHEIeOuqjUgZ4bgqauiZa3MD
	 9gWB9X1JR8kU37EUKr08+s4nmL363X43JW/sB2tjC3MQINmycor97RpJFo1oGicYB/
	 Zt0jNTBcVsnBh+bhF4RTtFBQTau7XUnFQlnezMZwBZDt7ryWbew0RO/wyYBoNrQkzH
	 bdtra1G8tBtPA==
Date: Wed, 01 Jul 2026 09:23:43 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, chunkuang.hu@kernel.org, 
 matthias.bgg@gmail.com, mripard@kernel.org, jason-jh.lin@mediatek.com, 
 kernel@collabora.com, devicetree@vger.kernel.org, justin.yeh@mediatek.com, 
 simona@ffwll.ch, p.zabel@pengutronix.de, tzimmermann@suse.de, 
 conor+dt@kernel.org, airlied@gmail.com, maarten.lankhorst@linux.intel.com, 
 dri-devel@lists.freedesktop.org, krzk+dt@kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260701122057.19648-39-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
 <20260701122057.19648-39-angelogioacchino.delregno@collabora.com>
Message-Id: <178291581802.4116105.6915436352274822148.robh@kernel.org>
Subject: Re: [PATCH 38/42] dt-bindings: display: mediatek: Introduce MT8196
 2D Sharpness Processor
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


On Wed, 01 Jul 2026 14:20:53 +0200, AngeloGioacchino Del Regno wrote:
> Add documentation for the Two-Dimension Sharpness Processor, or
> "TDSHP", found in many MediaTek SoCs including MT8196 and its
> variants.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek/mediatek,mt8196-tdshp.yaml       | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-tdshp.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-tdshp.yaml: ignoring, error in schema: properties: compatible
Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-tdshp.example.dtb: /example-0/tdshp@321e0000: failed to match any schema with compatible: ['mediatek,mt8196-disp-tdshp']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260701122057.19648-39-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


