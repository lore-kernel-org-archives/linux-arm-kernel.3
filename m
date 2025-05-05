Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A227AC3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 14:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ZMcQOTPYoY/XJg7a6fu3p2pg9ybeKv//hymv08vTd8=; b=ECATMp75HMFVcR4psDA+g4RLe/
	/1MYp+MEz9d5lsllZp/2Tcmgo0/5fotHw8WPfI6LnXQU6O9vknEtOth8ez5gA3nmOU6U6cOk4bMk4
	VY0Xv1cELkopVxWt+iGFOkCUAF7Mqrsm0RJuFSwfH6RIrVJdfcSih8rTP+eJWzgYhu5OuvNB+Ea/p
	BjSBl6iRhX3+EoGjhty/OvPx0V8EL+XNTdZTxIm9kuTO12CX+f3luHHe+kNo/OyE2LH7Gzrh/eL/9
	lf8IUC+iCkK9kImjzWGgfe0Q1/GQCZo0IdnKGECujpqiiL5kGnLaENTeP91HZCEOrCUwtEtjhfnO1
	RggT3IHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBx71-00000007gHH-280i;
	Mon, 05 May 2025 14:48:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBx38-00000007fOM-3WQF;
	Mon, 05 May 2025 14:44:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 193804A664;
	Mon,  5 May 2025 14:44:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640C8C4CEE4;
	Mon,  5 May 2025 14:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456245;
	bh=XsyivJj8/un8VajWm2cVmFTi84AikoNwIsIU5NgM5So=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=YXF5Q6SzRH9qrIY5ncAnSzsiL62jyn0YxgTdye0LjCXXI1mmJgMJwdUL8OlWxBPWu
	 3/rPuQkd0Q4IqficksX/VSMcaxxcq9Q+i7nerRKCFSD7ciQ0EE8mrX84ZokGjkCB1O
	 4Bn2SFkAVD4TkxRTZNGJuqzu+xsh+68RvtUc0MwF3gwXYlhL64EGGqOTZSAN+6jGIu
	 x5KrhQuYdT5YXjY6y3fmNIwuLZr2gKA7KdT+hkkBtGID+VYAChgu8yULSx1dxbsnIE
	 UawoMF82T+c6uEEHxKhUgd15sI1DRAfycMiYPh0BDi2OnMlTrcO3Onwn0pHeT0TKnq
	 anlTXuBKiHM0g==
Date: Mon, 05 May 2025 09:44:04 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Fabien Parent <fparent@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-arm-kernel@lists.infradead.org
To: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
In-Reply-To: <20250502-mt6357-regulator-fixed-compatibles-removal-v1-1-a582c16743fe@collabora.com>
References: <20250502-mt6357-regulator-fixed-compatibles-removal-v1-1-a582c16743fe@collabora.com>
Message-Id: <174645593877.1245991.13955388800540703785.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt6357: Drop regulator-fixed
 compatibles
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_074406_928143_4B35E7BB 
X-CRM114-Status: GOOD (  15.60  )
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


On Fri, 02 May 2025 11:32:10 -0400, Nícolas F. R. A. Prado wrote:
> Some of the regulators in the MT6357 PMIC dtsi have compatible set to
> regulator-fixed, even though they don't serve any purpose: all those
> regulators are handled as a whole by the mt6357-regulator driver. In
> fact this is the only dtsi in this family of chips where this is the
> case: mt6359 and mt6358 don't have any such compatibles.
> 
> A side-effect caused by this is that the DT kselftest, which is supposed
> to identify nodes with compatibles that can be probed, but haven't,
> shows these nodes as failures.
> 
> Remove the useless compatibles to move the dtsi in line with the others
> in its family and fix the DT kselftest failures.
> 
> Fixes: 55749bb478f8 ("arm64: dts: mediatek: add mt6357 device-tree")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt6357.dtsi | 10 ----------
>  1 file changed, 10 deletions(-)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: using specified base-commit 37ff6e9a2ce321b7932d3987701757fb4d87b0e6

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20250502-mt6357-regulator-fixed-compatibles-removal-v1-1-a582c16743fe@collabora.com:

arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vfe28: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vfe28: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vfe28: 'required-opps' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vfe28: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vrf18: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vrf18: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vrf18: 'required-opps' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vrf18: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vrf12: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vrf12: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vrf12: 'required-opps' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vrf12: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcn28: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcn28: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcn28: 'required-opps' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcn28: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcn18: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcn18: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcn18: 'required-opps' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcn18: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcamio18: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcamio18: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcamio18: 'required-opps' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcamio18: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vaux18: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vaux18: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vaux18: 'required-opps' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vaux18: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vaud28: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vaud28: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vaud28: 'required-opps' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vaud28: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vio28: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vio28: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vio28: 'required-opps' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vio28: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vio18: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vio18: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vio18: 'required-opps' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vio18: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#






