Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC96E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 20:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xIM/8hERNpczoCmk1n+NhcYjkD7biuN+6QFxrziIRV0=; b=bwyW0dueDiqPQgSNdihwYkcgEG
	AMj4JXj9Q8jIjC+nUtcgxsEce0oNMNBu0l3FQq7ebv6PxVfsDSEz9rfZOqVSqK0k0m6hiwrGwNl6L
	64fkUuCMKI8JHkVTGXlSE4MLGmX2fi/uCyPOHzDnaCJHFda+7q6hkbP/sb8TGOg390ofa6bm96A7w
	WPm025YNKQCWq9i1vk4xcYslN3Ol7Jdskp/UulgZkcjSlNuhEfDG5qiHYplvXWSPbHZPzFR08lt/e
	9C9QV5dTlfTVxCmAq96AgIbP8PbbvI3QCY1rnOdjyi8SkeYOnJYld9w3JIiZ9wR5FwSOrV2ntUr5H
	AXYTZk6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNeJZ-0000000ElUp-0ZQJ;
	Tue, 17 Dec 2024 20:37:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNeIS-0000000ElLZ-0epW;
	Tue, 17 Dec 2024 20:36:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 81E7FA40B0B;
	Tue, 17 Dec 2024 20:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 871DEC4CED3;
	Tue, 17 Dec 2024 20:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734467758;
	bh=SZGp4CTjOcCd0WqvLX/C50ngjabrzlSD0TRHgdbC4BE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=kirq7Q2LQQV5FEB/0mqwL3QNWxPg7bH1f2k3Ek3ba/2d/H3SX/cfJH2oAP2ou8IhT
	 xO1LjRCc8CNQvlQMLtV/Vad2wYLQ4mskd+a8z+YrJ+SG7tJfs3vtyvnMJJ+RbhJQqU
	 aI3JOiN7Y7as2Izf1VzA1xn/noqhxMTAQ1SK6A7dZzHKRDg8foTzsPv7meNZlEEXY4
	 Hla0/QiSB+/dWJWBEW9eL2NYgcJvgypIQrrWJepWaME9j1v+VEw3Uc9Cfoyr72GIm1
	 YHzs9lRzlfiqkk4/wZo0lhlJ5j+Nh1JDjctClGWKbiEk5bgZfy7x9LSvBor3fac9qL
	 cdWJb/0fXU0fw==
Date: Tue, 17 Dec 2024 14:35:57 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
 tzimmermann@suse.de, mripard@kernel.org, junzhi.zhao@mediatek.com, 
 simona@ffwll.ch, p.zabel@pengutronix.de, airlied@gmail.com, 
 linux-mediatek@lists.infradead.org, maarten.lankhorst@linux.intel.com, 
 matthias.bgg@gmail.com, kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org, 
 jie.qiu@mediatek.com, ck.hu@mediatek.com, krzk+dt@kernel.org, 
 chunkuang.hu@kernel.org, dri-devel@lists.freedesktop.org, 
 jitao.shi@mediatek.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241217154345.276919-8-angelogioacchino.delregno@collabora.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
 <20241217154345.276919-8-angelogioacchino.delregno@collabora.com>
Message-Id: <173446775715.3082463.16696683643191966577.robh@kernel.org>
Subject: Re: [PATCH v3 07/33] dt-bindings: display: mediatek: Add binding
 for MT8195 HDMI-TX v2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_123600_326211_812F942F 
X-CRM114-Status: GOOD (  13.85  )
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


On Tue, 17 Dec 2024 16:43:19 +0100, AngeloGioacchino Del Regno wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241217154345.276919-8-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


