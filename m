Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFB4C71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 16:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oU6tZLseLd+EWASj1THVWKQuvQw3Yfymlw2KM9B4qV4=; b=KM7k+eWiRl/a1YtSiQ2+L2UcLj
	/6sHNUarKKi2cAEYl17zPQnSaBUfHJSugzHZ7wSOy6qxDI4sos1QcxwXNeSPeXXP0h6+CGxvTUpF4
	9YCKffDPxPImYGInd9J44g8UcdU9k6afGYDZjqTzTUec0yty/mUcPMHovbuzo3UK8OWOoVuJbmdyD
	AsRnGerrYXIxKFeNztvZRbdLPXjLKBnP4YQk81sJhlzCUFRhGTDttxIK2NZlLPLytGC8x2+r+btTm
	SGQ4NrXc0Ea74E0ZO+XYh9WU3Xxxkcjd2nOhfVzFMAMukaSLEZw/Hnpq1WTJ7MEQffKlaZu0f6Zfb
	2qDHqd0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoqh-000000032Ld-1uuV;
	Mon, 07 Jul 2025 16:37:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoLR-00000002y61-2Qlm;
	Mon, 07 Jul 2025 16:05:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E02CCA53D47;
	Mon,  7 Jul 2025 16:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7537EC4CEE3;
	Mon,  7 Jul 2025 16:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751904328;
	bh=6+DlCZShCCm2vWXqcGuG+JxpWy1yB9P/j6LWHUPaMJI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Ub1JBSskxGSTTBFzn6QuUrTt5XUwVwcbqQl/odQ0pDoRC+nOEme6Gt4Vy3HYAMWy5
	 gxBC6Y0y9R8HHLu2j/aeSFM1EpMSo4KOWmpJ5oRCCa+Rme98w5QXuzIeGJeoLRUwYp
	 fJ19LbbnhsiQ5KW5LQFZZwkzkCMaDm6neVXEZARyv7CPidUkYMVSWxkPrFrNcotXnZ
	 0tI9EsZEdn+xK0gVPd1uWCEAMn3BHDuFhW7A0fnS6VyiGGNL8wwD96F2pjziga0rBr
	 bv8rzqepRb3ICNb0cLv5Xp3bEcCnxrkwBB3GKyrvcsMtm1kQljFzYE3mx25oJ8Pwal
	 QpNGmLtaoBDOg==
Date: Mon, 07 Jul 2025 11:05:27 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, matthias.bgg@gmail.com, 
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org, lee@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 linux-mediatek@lists.infradead.org, broonie@kernel.org, lgirdwood@gmail.com, 
 devicetree@vger.kernel.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250707134451.154346-8-angelogioacchino.delregno@collabora.com>
References: <20250707134451.154346-1-angelogioacchino.delregno@collabora.com>
 <20250707134451.154346-8-angelogioacchino.delregno@collabora.com>
Message-Id: <175190432757.3224115.4908550014922842797.robh@kernel.org>
Subject: Re: [PATCH v2 7/8] dt-bindings: mfd: Add binding for MediaTek
 MT6363 series SPMI PMIC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_090529_746705_0B5E1A39 
X-CRM114-Status: GOOD (  12.14  )
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


On Mon, 07 Jul 2025 15:44:50 +0200, AngeloGioacchino Del Regno wrote:
> Add a binding for the MediaTek MT6363/6373 (and similar) multi
> function PMICs connected over SPMI.
> 
> These PMICs are found on board designs using newer MediaTek SoCs,
> such as the Dimensity 9400 Smartphone chip, or the Chromebook
> MT8196 chip.
> 
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Link: https://lore.kernel.org/r/20250623120038.108891-2-angelogioacchino.delregno@collabora.com
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/mfd/mediatek,mt6363.yaml         | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6363.example.dtb: pmic@4 (mediatek,mt6363): adc:compatible:0: 'mediatek,mt6363-auxadc' is not one of ['mediatek,mt6357-auxadc', 'mediatek,mt6358-auxadc', 'mediatek,mt6359-auxadc']
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6363.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6363.example.dtb: pmic@4 (mediatek,mt6363): adc: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6363.yaml#
Documentation/devicetree/bindings/mfd/mediatek,mt6363.example.dtb: /example-0/spmi/pmic@4/adc: failed to match any schema with compatible: ['mediatek,mt6363-auxadc']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250707134451.154346-8-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


