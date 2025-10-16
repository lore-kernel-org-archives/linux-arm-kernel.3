Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E27ECCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 10:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MYH1oKA04L/d13HmviNXI/Efg3/cjl8yndCY9EqtPgY=; b=jZ9aQwULrBX/3EJV4he63vE0d2
	UFDau6eS8G98718sqL6IZ0PVRIHdyU0RGUJMq+mE6rNzJ1DC/jyxFBX/K0YpmStQlDo7yShNIF04I
	WJnhJQo4JbYfFSlZ2I4k5Rze9lEKjnmBJurKzuJN7BrBk/421KaSyZINPCgJXoOGuFSaLfGRq0iP6
	01I1PzzNXM286yv6QdstKSOt9ZLyTvlxJ2i6gIF93IYQol1T2jmBwPGegRTKQd4F+h5w1H7QA7ZrZ
	ZWbDgxAJwtFhjAglF/rgCaOfs6eWPwYtCVBOmrTN5Y1VvAbIWGW3d+yX5LowDG56pXFK2V2esr9Kk
	iuXOxwXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Lga-00000004Vcx-2fZU;
	Thu, 16 Oct 2025 10:58:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9LgZ-00000004Vco-38Ax;
	Thu, 16 Oct 2025 10:58:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0EF89603D4;
	Thu, 16 Oct 2025 10:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77777C4CEF1;
	Thu, 16 Oct 2025 10:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760612298;
	bh=cIG0LBA0EBE4pS7e8v8i1abU52KH42lFqM/1hKG+T6g=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=BYBd3f0ebCSEqSY4LkrtI2chwVdG0GQV1G2g4B5u+2iH3pLG9kYf0TC/ID6fo0Gi4
	 ryaH3/5tOCaI5/Mp49yRY/Ef2LCzCJkvw5tS9ZT7pzsL64mhp33fgCd0rYxpLoGRko
	 zlHNDp3AbhMG4GbNwZVFKugrNXZTWRw2LwTkaCfr3bF6YPfP6NlybRL/uWA8GvADmb
	 Js+ukJRejbcbpugBEi8Umjeo2kVPp7TwPVkSfYC1IRuB2iyyGWWND5IJi1wOnlHJPh
	 7Hs4S6Oz9OU0/ucPCyr7nwvfIobj1d3OPd2s4rfOvWT1Y4LFvVWywSs1lyVq1dwvlP
	 PSY6HLf/Sl+mg==
Date: Thu, 16 Oct 2025 05:58:16 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: broonie@kernel.org, igor.belwon@mentallysanemainliners.org, 
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, kernel@collabora.com, 
 matthias.bgg@gmail.com, wenst@chromium.org, devicetree@vger.kernel.org, 
 krzk+dt@kernel.org, lee@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, conor+dt@kernel.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20251016093054.126293-2-angelogioacchino.delregno@collabora.com>
References: <20251016093054.126293-1-angelogioacchino.delregno@collabora.com>
 <20251016093054.126293-2-angelogioacchino.delregno@collabora.com>
Message-Id: <176061229682.2195705.7053755296248416631.robh@kernel.org>
Subject: Re: [PATCH v9 1/9] dt-bindings: regulator: Document MediaTek
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


On Thu, 16 Oct 2025 11:30:46 +0200, AngeloGioacchino Del Regno wrote:
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
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6316c-regulator.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.example.dtb: pmic@8 (mediatek,mt6316b-regulator): '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vbuck(12|34)$'
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6316b-regulator.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.example.dtb: pmic@7 (mediatek,mt6316d-regulator): '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6316d-regulator.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251016093054.126293-2-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


