Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B2CCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 10:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PXSPsL3y5mQE8DWh3Ua7AeS6eeo762IGO2BXqlpQ4Og=; b=L4Wq6RhspbgpsVMSYaF790QeGj
	oY2qaeiwrVYIktIvsM3vqJE7EaWJj+vC5AEEzqYJ3AWo4CHQzHmhcEbDL/KWmjMjkqIm0Kvar5SDa
	oCsxCw87Jr5xcDTHegtuZt0LxXajjb9QOAn+AZweDBYbfcMkXJPZ0XULSrYgzBQdMr/9OmGDkZw9Y
	Bm4Z5avrbZwDXU8xOw3MyjR/Nl2ZSkzLBxzoHPclKR3nCr7V3/iUwu3w9czi3IKFAhN0UM96975XM
	JhYgKowDFjmoWw3RLzeUvfexPyvSDe0MNXnJgb6331vzpGbiDxshA5RbnbD3bZ3N46l7+2ZjapSAS
	VexVd0PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCEkI-00000008zCZ-1ILS;
	Fri, 24 Oct 2025 10:10:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCEkG-00000008zBG-25Ux;
	Fri, 24 Oct 2025 10:10:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DC36A60051;
	Fri, 24 Oct 2025 10:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52798C4CEF1;
	Fri, 24 Oct 2025 10:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761300603;
	bh=h8OjTFqpeqF+Jo/iQAP6DDq4pBZz0197mn1PnYimu44=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=vC52BhPZm7KGfPtJnth+IMAIqNx18X//zP6XDw3jR+vj8StfXD51PtSRO9Ag2oto3
	 3DjaM01UZxrN5JTMumBsqRayoHYaA9+bDLMuXS6gKc/WEiZka+ClgMOXl6E51F8Ajo
	 xWOQPvexiX+4CnmycAYxO1EyrhWd/i9+saW6OfkBzF8JVkqNVxq3HmIUeZztT46LvR
	 lDvEhEGaxz1Gy0bFgiTq/FORHhbSQDAHVCYIBvzIzR63ePHxNBTnKd9paanSajUzdv
	 RhKuhmr2DF4fL9ZgzUIwNgYX/wn1BeAsxeVAec64KGvsP20agdpLF7eIvketO8UtZ1
	 hyRprz8hW+Qnw==
Date: Fri, 24 Oct 2025 05:10:01 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: lgirdwood@gmail.com, conor+dt@kernel.org, matthias.bgg@gmail.com, 
 kernel@collabora.com, krzk+dt@kernel.org, devicetree@vger.kernel.org, 
 igor.belwon@mentallysanemainliners.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 broonie@kernel.org, linux-mediatek@lists.infradead.org, wenst@chromium.org, 
 lee@kernel.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20251024083221.25758-2-angelogioacchino.delregno@collabora.com>
References: <20251024083221.25758-1-angelogioacchino.delregno@collabora.com>
 <20251024083221.25758-2-angelogioacchino.delregno@collabora.com>
Message-Id: <176130060160.1071538.6669975917646919183.robh@kernel.org>
Subject: Re: [PATCH v10 1/9] dt-bindings: regulator: Document MediaTek
 MT6316 PMIC Regulators
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


On Fri, 24 Oct 2025 10:32:13 +0200, AngeloGioacchino Del Regno wrote:
> Add bindings for the regulators found in the MediaTek MT6316 PMIC,
> usually found in board designs using the MT6991 Dimensity 9400 and
> on MT8196 Kompanio SoC for Chromebooks.
> 
> This chip is fully controlled by SPMI and has multiple variants
> providing different phase configurations.
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../regulator/mediatek,mt6316b-regulator.yaml | 78 +++++++++++++++++++
>  .../regulator/mediatek,mt6316c-regulator.yaml | 78 +++++++++++++++++++
>  .../regulator/mediatek,mt6316d-regulator.yaml | 77 ++++++++++++++++++
>  3 files changed, 233 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.example.dtb: pmic@6 (mediatek,mt6316c-regulator): '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vbuck(124|3)$'
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6316c-regulator.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.example.dtb: pmic@8 (mediatek,mt6316b-regulator): '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vbuck(12|34)$'
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6316b-regulator.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.example.dtb: pmic@7 (mediatek,mt6316d-regulator): '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6316d-regulator.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251024083221.25758-2-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


