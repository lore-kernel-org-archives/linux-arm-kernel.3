Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629EBC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 14:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2V+HjW9ElpL7ECEz75a1IxwaSKDSfgglgGt1uUHIBkA=; b=vEWkiWeJ92rzHdXgjbNrrGhKmv
	wrdmq7h/PRi66yBrHnC0p36VaroZ+fAy8+Ni2SAywQ/Tle81fduaZLGm+pUwyRfrGDF1G2G3dkmiD
	25TQ3LcimIxXftLb8VZts5OqA76w+GmlU3GxLZYv9v5L0DVluUSuvE+OnnHvHfLg6Zq1GSYqmRlgM
	cKNr4KpR1DAZtbEeE9QzqhKVDM+K6SRieDCkqZTegXnHXBo5rAaYXCAP2eGZngnezF8V68bFRJWqa
	9uhyU5nzdKFfa6FKmv6YMBLZp5OddJFCzGRjbYgeoMpEqnMsv0gjTkVRD5mKm2v4/e9UxH900nXb8
	82TZBrWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevqs-00000002H1C-0eGa;
	Wed, 01 Jul 2026 14:23:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevqq-00000002Gyw-0fD4;
	Wed, 01 Jul 2026 14:23:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 970C76001D;
	Wed,  1 Jul 2026 14:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ABAE1F00A3A;
	Wed,  1 Jul 2026 14:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782915823;
	bh=2V+HjW9ElpL7ECEz75a1IxwaSKDSfgglgGt1uUHIBkA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=FxVipIBSl0INiw/d1Xggb98V51/4xC143q4iV9rZ0QG7aioYir5bE962k9UeD6hpA
	 RlAlKvZP2g3SjdoK0wfba3WhzkxuI468VoorxjoCcTWyXVS2QAESISITshdbGvw9lw
	 ls9Tgdnea98jtyn8BVJOpiSNXQqIiWHfJGAZg3O8tTsuqcEhhUhjs7LvESd8hZPIP7
	 rQf13gt9oO0D1lzYT10zH8eyow4pPJjoeDP2HAc7Dpuvasp4O0RwCDSGrrfaxSCJ0Q
	 mcWhuNMev9EPn1rye/U8i54imcK8BuzG6Kjcoa0/FCqDKWRB7KIZxd6CPZnHHXK4M9
	 fHMNoNsRYcLcA==
Date: Wed, 01 Jul 2026 09:23:42 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, matthias.bgg@gmail.com, 
 jason-jh.lin@mediatek.com, airlied@gmail.com, 
 maarten.lankhorst@linux.intel.com, conor+dt@kernel.org, mripard@kernel.org, 
 kernel@collabora.com, tzimmermann@suse.de, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, chunkuang.hu@kernel.org, simona@ffwll.ch, 
 linux-arm-kernel@lists.infradead.org, p.zabel@pengutronix.de, 
 justin.yeh@mediatek.com, linux-mediatek@lists.infradead.org, 
 krzk+dt@kernel.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260701122057.19648-31-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
 <20260701122057.19648-31-angelogioacchino.delregno@collabora.com>
Message-Id: <178291581667.4115901.7713251613629751021.robh@kernel.org>
Subject: Re: [PATCH 30/42] dt-bindings: display: mediatek: Introduce MT8196
 Output Processor
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


On Wed, 01 Jul 2026 14:20:45 +0200, AngeloGioacchino Del Regno wrote:
> Add documentation for the Overlay Output Processor IP found in
> the newer Generation SoCs like MT8196, MT8894, MT6991, and their
> variants.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek/mediatek,mt8196-outproc.yaml     | 107 ++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-outproc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-outproc.yaml: ignoring, error in schema: properties: compatible
Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-outproc.example.dtb: /example-0/outproc@32970000: failed to match any schema with compatible: ['mediatek,mt8196-disp-outproc']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260701122057.19648-31-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


