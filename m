Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27A7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 14:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yM8HcAoywZQROnbGbiMNPlQQuS/3De3vvYBkNdJ6Ssw=; b=4l6M7cRbBb13y+goNST9uOci00
	iC0C5J7SK1zuf9NKBFcBab4oZj8JhQfDJyxkptrNzXzOXJpBCYscgSTgIKPfLC9/NA22PTlr/LIG6
	w74RFOxfa7HAkm0gORUNwFmJsEy9Z500eFdW5OuaYZLp3U/2vJj0iF/bCRHrTRmW9IN63V+7tGA6P
	iwZjx9nmwZgIUlkAaH26PYrMbDQ1HHkB5BzlkVWar/sE7rH9krIRfScUFApqHSnwB3YuzLC8sYMq1
	8Xt1/bIoauyommyBo2neyp6wnbOrVaQyl/dZZFN+foR3hnOyad267IV3CPgwnana6lxgXPmITZLa5
	Oj0J5D5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevqu-00000002H6Y-3BRr;
	Wed, 01 Jul 2026 14:23:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevqr-00000002H0G-2ZGv;
	Wed, 01 Jul 2026 14:23:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5ED8C42A47;
	Wed,  1 Jul 2026 14:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF011F00ACF;
	Wed,  1 Jul 2026 14:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782915825;
	bh=yM8HcAoywZQROnbGbiMNPlQQuS/3De3vvYBkNdJ6Ssw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=dm+ezxjK6+6YX6PEsusjTDfb3QpL0aI6bc4m2j4IIuhZcA5kuFU5OmJecyRnYSudt
	 RWt8/QEs82rbWzGasUdJzfrtb0tGuMGTH7qlNqzeeVDtRdIVgPeB8s6Vf2id9P0x5c
	 YK2+LemCD/pK5dDwILNNRHzfaaL4ySljWEmvNGzLtN+xC2XqhUuAWJLCW/OMvk8ZG5
	 Ucq8jv5gUx1IeNk6dkBdwaWSx2jPISueSh/HQ3jUMsLjKaCMsuNSZkTNdkRdeoxRQ3
	 ouvVvXC9pRjlAbKM3+Wq2JohCdCuNVni31Y0PjWBiMZbOtnSpKIuO2HH3A4TIgfqhf
	 pbKgkUNtjcL8A==
Date: Wed, 01 Jul 2026 09:23:44 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, p.zabel@pengutronix.de, 
 tzimmermann@suse.de, justin.yeh@mediatek.com, krzk+dt@kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, mripard@kernel.org, chunkuang.hu@kernel.org, 
 maarten.lankhorst@linux.intel.com, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, 
 jason-jh.lin@mediatek.com, devicetree@vger.kernel.org, airlied@gmail.com, 
 simona@ffwll.ch
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260701122057.19648-41-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
 <20260701122057.19648-41-angelogioacchino.delregno@collabora.com>
Message-Id: <178291581931.4116323.2079243136968676585.robh@kernel.org>
Subject: Re: [PATCH 40/42] dt-bindings: display: mediatek: Introduce MT8196
 Image Resizer
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


On Wed, 01 Jul 2026 14:20:55 +0200, AngeloGioacchino Del Regno wrote:
> Add documentation for the Image Resizer "RSZ" Scaler block found
> in the MT8196 SoC and its variants.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,mt8196-rsz.yaml | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-rsz.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-rsz.yaml: ignoring, error in schema: properties: compatible
Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-rsz.example.dtb: /example-0/scaler@329d0000: failed to match any schema with compatible: ['mediatek,mt8196-disp-rsz']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260701122057.19648-41-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


