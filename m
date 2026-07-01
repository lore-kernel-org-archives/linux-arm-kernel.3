Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B17C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 14:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DoAPIKHlQF01BQdUW983/8p5nb/vO5Fh5kJQWUG/dxQ=; b=u7JCnJ8rpkTo5Nrp5v8bxNBO/w
	SZzZIqABzHeDlDYdk/Iz+qUi7y5NjaI29KQlZNDCzGoC34Kv03S29lQbMGmLRf6TAAoF3EEDS+3mm
	WQGLYSCFssknfnqe8IVuq+KqI7Ux2eLSRex3gNwoQT3xF+uoOIjOb1CE/0xcxCkE8xymSEf9O1LRJ
	ORg9NPIMfTzjovsVSyRqWCKH7OicNYaFMVfzcO77ZfRez6xWa3FaM4tcOPDsfleNpyN/SFAd+0FKQ
	omMoQLmFnGpsl4LkR93/sktBZpxfrx5NVuBv6Uvmc33bCMeQrD+m1N/2hVO2rBVTY6WJ2uzfo5FPj
	4j5DtEMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wew5U-00000002JHw-3LTr;
	Wed, 01 Jul 2026 14:38:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wew5U-00000002JHh-0D6r;
	Wed, 01 Jul 2026 14:38:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A65742E2A;
	Wed,  1 Jul 2026 14:38:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34EC81F000E9;
	Wed,  1 Jul 2026 14:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782916731;
	bh=DoAPIKHlQF01BQdUW983/8p5nb/vO5Fh5kJQWUG/dxQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=ePjixhTP3XZgrzhZdeHkU+VCPkYuzgpl2DzTg6EuV5D7zoGrCxE0H4loNSi3lbqPB
	 MNpNB+p5gzVEaG47iCyZ4SXEN3tuV4PQXnjqaJqWIoWDU+CZVLWoKOQAqOeyVREenz
	 0znKSxkVXVcTPQm9s0hgMVON/QEjwg6v+AEr+0fusTrOfe/Uxlg61jXskQP/77qw5R
	 4MD7BSMdgHs0ENBjVjyKjrkouPznJtTI3qYypogcwNTr1a+0ZAzLGizfVYHGO5NT/G
	 mKHNPd3iTm80lkGSARlqEXZSJoWXuynP0L5f9lodG2UxDokboZhdPa57EWFTKPbzU3
	 0jk3Ld++wS1Ww==
Date: Wed, 01 Jul 2026 09:38:50 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, linux-mediatek@lists.infradead.org, 
 vkoul@kernel.org, chunfeng.yun@mediatek.com, linux-phy@lists.infradead.org, 
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, linux-kernel@vger.kernel.org, 
 neil.armstrong@linaro.org, justin.yeh@mediatek.com, krzk+dt@kernel.org, 
 devicetree@vger.kernel.org, chunkuang.hu@kernel.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260701122008.19509-2-angelogioacchino.delregno@collabora.com>
References: <20260701122008.19509-1-angelogioacchino.delregno@collabora.com>
 <20260701122008.19509-2-angelogioacchino.delregno@collabora.com>
Message-Id: <178291673047.19807.6106947084460440701.robh@kernel.org>
Subject: Re: [PATCH 01/12] dt-bindings: phy: Document MT8195 and MT8196
 DisplayPort PHYs
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


On Wed, 01 Jul 2026 14:19:57 +0200, AngeloGioacchino Del Regno wrote:
> This adds bindings for the DisplayPort and Embedded DisplayPort
> PHYs found in the MediaTek MT8195 SoC (and variants of) and for
> the Embedded DisplayPort found in the MT8196 SoC (and variants).
> 
> This PHY supports varying impedance calibrations for the various
> signals to reach an optimal EYE signal pattern for any specific
> board(s), especially useful for very high bitrates such as HBR3
> and higher, depending on board design.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/phy/mediatek,mt8195-dp-phy.yaml  | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8195-dp-phy.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/mediatek,mt8195-dp-phy.example.dtb: phy@1c500000 (mediatek,mt8195-dp-phy): reg: [[0, 475004928], [0, 8192]] is too long
	from schema $id: http://devicetree.org/schemas/phy/mediatek,mt8195-dp-phy.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260701122008.19509-2-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


