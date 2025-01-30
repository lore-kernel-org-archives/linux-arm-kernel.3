Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F654C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 23:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxLIs3YqM7E3q6wIngx9JrkjvQnejbBYunb+Yu3nFAw=; b=OJFRBLikj+omHYKI1XgeTXP3cd
	tBohRU4zKOdo8HsZju8M48YZMDcAhCH0/j0Uy4QJFz6qsNfNbSXhM3RbCfFvxUcIwNQ1db9Z1Fq6U
	7w/Yv/bo4AyS7kZLbUq8kKTgEchbsSqr3e2rKCJyBSwfvKf3Huw2io5yAtTF4zKcH2HsxtytsQeKX
	Z7jFG7M9iUG/SGfs2YowTj7OKSJUpYVhEMTwNZZI/XIAIK4DfFGkWewJg17u12jR+g2wrvGx1xS0s
	0Q61DZoLALg+zjlvg/YzM9nkY9LhvqFFc76eY5evalSPaq2MU8XC1wRC0Kb5diT+eCn8qy+MdGhFi
	HAi4/GRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdeBz-00000009oOm-2Io9;
	Thu, 30 Jan 2025 23:43:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tde6r-00000009nj5-0UfU;
	Thu, 30 Jan 2025 23:38:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C2E7AA42530;
	Thu, 30 Jan 2025 23:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16BFFC4CEE1;
	Thu, 30 Jan 2025 23:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738280288;
	bh=8yZNBiKUbE5MlUbaWMZLLsW0PfS5yFHCz4qlV3sF6NE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=i4n146eY/eGPBqUTKrH5iQlVsQKVXhOUoINbo2AN1GSD04bIg06Y0FZ38ZgBmfla3
	 Fpfobxkvkoc9aDBb5YYIDL2HXZSDE999v4CasK7XT0p17Z5nP3RsK5AqiiyH8Ai33c
	 LHj21TkIRLBM+NVjWaMcV9QAQQ5bzLkmdzG9gp4iNOE4/yIjag46vmuX2o7Ei7+Q1H
	 BqTA3qZkGZjKV3gyaZodzhSZR/oX2/59IMvuVgp0niqRJDJWeIYUzBaZHs2Cc8iwTT
	 Y65z09AOZJ7WNZhFWIvebgxDCKXVH2gZ8S+62lRTmkpSVklZmqX1fiTfhPjA6THk05
	 R+bHXX8yaJPxQ==
Date: Thu, 30 Jan 2025 17:38:07 -0600
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-rockchip@lists.infradead.org, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>
To: Patrick Wildt <patrick@blueri.se>
In-Reply-To: <Z5toOecuMiBXM6aF@windev.fritz.box>
References: <Z5toOecuMiBXM6aF@windev.fritz.box>
Message-Id: <173828013372.1872573.10900756653547163550.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add MNT Reform 2
 (RCORE)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_153809_285003_1E946A23 
X-CRM114-Status: GOOD (  10.43  )
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


On Thu, 30 Jan 2025 12:53:29 +0100, Patrick Wildt wrote:
> Document board compatible bindings.
> 
> Signed-off-by: Patrick Wildt <patrick@blueri.se>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for Z5toOecuMiBXM6aF@windev.fritz.box:

arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:355.39-358.4: Warning (clocks_property): /display-subsystem: Missing property '#clock-cells' in node /phy@fed60000 or bad phandle (referred from clocks[0])
  also defined at arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts:200.20-203.3
arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: display-subsystem: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-drm.yaml#
arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: rk8602@42: Unevaluated properties are not allowed ('regulator-compatible', 'rockchip,suspend-voltage-selector' were unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: rk8603@43: compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk8602', 'rockchip,rk8603'] is too long
	'rockchip,rk8601' was expected
	'rockchip,rk8603' was expected
	'rockchip,rk8600' was expected
	'rockchip,rk8602' was expected
	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: rk8603@43: Unevaluated properties are not allowed ('compatible', 'regulator-compatible', 'rockchip,suspend-voltage-selector' were unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: hdmi@fde80000: Unevaluated properties are not allowed ('enable-gpios' was unexpected)
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: pmic@0: regulators:dcdc-reg4: Unevaluated properties are not allowed ('regulator-init-microvolt' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk806.yaml#
arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: pmic@0: Unevaluated properties are not allowed ('pmic-reset-func', 'regulators', 'rk806_dvs1_pwrdn', 'rk806_dvs1_rst', 'rk806_dvs1_slp', 'rk806_dvs2_dvs', 'rk806_dvs2_gpio', 'rk806_dvs2_null', 'rk806_dvs2_pwrdn', 'rk806_dvs2_rst', 'rk806_dvs2_slp', 'rk806_dvs3_dvs', 'rk806_dvs3_gpio', 'rk806_dvs3_null', 'rk806_dvs3_pwrdn', 'rk806_dvs3_rst', 'rk806_dvs3_slp' were unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk806.yaml#
arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: codec@1a: Unevaluated properties are not allowed ('port' was unexpected)
	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8960.yaml#






