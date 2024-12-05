Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7208DE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 13:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yL+tleFt2L+1SozlABSJgb4PFD+G/C/vaJcHDx0ytEs=; b=YuSlyfT4jD4imuwAP9dcAKptm2
	BZeiMOOsqdIDzbw2UZs27BJs3ZSpZgBrfpkQKBYBLc7UauMheQ209Jgqy8jWULI4L4JIexTtW3n+j
	K3Xj1xlNNXrH1MnzJmamP0qaxpxpXo1bbTh40U3vvgUC4n9aPHmv0qlgxUgWJNTCtShZk0u8rq7g9
	B+nY3T+DXPa/uCbzbaTAdJ8IP39E+kpKVtsBtdy6Ld7Ul1NkLyv5NqhGwhcS3O22cb1Ca1JQVn3qN
	1RauP+J1WWv0NyY7LWxULsa0VV4hfBj88EztsY+47RM+ccKnEflFoKeJ6ZgF2ahl1G4xm5tfMFTJn
	jJtNhz3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJC0R-0000000GBI3-2cLI;
	Thu, 05 Dec 2024 13:34:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBzP-0000000GB34-41uf;
	Thu, 05 Dec 2024 13:33:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 27307A4383F;
	Thu,  5 Dec 2024 13:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0318C4CEE0;
	Thu,  5 Dec 2024 13:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733405634;
	bh=HY9tTGeW5NW/9Fp7iwxPs9KMW7cXmJeJAVDmaY4R1VE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=UsrwpU1jhn2CrdcLXusDmzHQxeTYjTOseV6uFBr3sr6C/rFvFwziJqAOQpqxzQuGL
	 RzdajG9/dhis/gxXfRCPrPRImkDFnnxHPZzBxFsPEQ1SmERTmmQtC5TjwhfWWAZJnT
	 Sg6G/Gt8DDY5LH7aJclBgfC3kJBiM5LnL5zJpU6h/EupV2fUtc5gyTAJvnsiGx4UQI
	 xZjeedfI1zEC71nDNpXzq2bhhmthTMIW3SrRsLT7GeW3V148yRO3Rvgh1p13OHdTzb
	 4ssr0tkkLvPN/Zt4AEnXfqt8J18drl7cmPwUbQXf06AC13luQhAH/jkTVAXDwco17y
	 sgipnyP69ENTQ==
Date: Thu, 05 Dec 2024 07:33:52 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: simona@ffwll.ch, devicetree@vger.kernel.org, p.zabel@pengutronix.de, 
 junzhi.zhao@mediatek.com, mripard@kernel.org, matthias.bgg@gmail.com, 
 linux-kernel@vger.kernel.org, tzimmermann@suse.de, krzk+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 airlied@gmail.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, 
 kernel@collabora.com, jitao.shi@mediatek.com, 
 maarten.lankhorst@linux.intel.com, ck.hu@mediatek.com, 
 linux-mediatek@lists.infradead.org, jie.qiu@mediatek.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241205114518.53527-8-angelogioacchino.delregno@collabora.com>
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
 <20241205114518.53527-8-angelogioacchino.delregno@collabora.com>
Message-Id: <173340563286.3304541.16351309995499835638.robh@kernel.org>
Subject: Re: [PATCH v2 07/15] dt-bindings: display: mediatek: Add binding
 for MT8195 HDMI-TX v2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_053356_122559_BB8E0BF3 
X-CRM114-Status: GOOD (  13.60  )
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


On Thu, 05 Dec 2024 12:45:09 +0100, AngeloGioacchino Del Regno wrote:
> Add a binding for the HDMI TX v2 Encoder found in MediaTek MT8195
> and MT8188 SoCs.
> 
> This fully supports the HDMI Specification 2.0b, hence it provides
> support for 3D-HDMI, Polarity inversion, up to 16 bits Deep Color,
> color spaces including RGB444, YCBCR420/422/444 (ITU601/ITU709) and
> xvYCC, with output resolutions up to 3840x2160p@60Hz.
> 
> Moreover, it also supports HDCP 1.4 and 2.3, Variable Refresh Rate
> (VRR) and Consumer Electronics Control (CEC).
> 
> This IP also includes support for HDMI Audio, including IEC60958
> and IEC61937 SPDIF, 8-channel PCM, DSD, and other lossless audio
> according to HDMI 2.0.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek/mediatek,mt8195-hdmi.yaml        | 154 ++++++++++++++++++
>  1 file changed, 154 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml:
Error in referenced schema matching $id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.example.dtb: hdmi-tx@1c300000: i2c: False schema does not allow {'compatible': ['mediatek,mt8195-hdmi-ddc'], 'clocks': [[4294967295]]}
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.example.dtb: hdmi-tx@1c300000: i2c: Unevaluated properties are not allowed ('clocks', 'compatible' were unexpected)
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi.yaml#
Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.example.dtb: /example-0/soc/hdmi-tx@1c300000/i2c: failed to match any schema with compatible: ['mediatek,mt8195-hdmi-ddc']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241205114518.53527-8-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


