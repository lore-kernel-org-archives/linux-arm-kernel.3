Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3011CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 00:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6oqR0CmQIWa35GKXWfmkJIdRwbhr/OcoLxPW2XMgDFA=; b=Av3mKJj834FDfWBSw9hxwyTcsy
	tGi4ES0or8B01dd9LSpOpyZBddQFcoWHdGOPIzH5sGxbABdnLRcV7KtToux9YcERRn27PU4DIP13B
	q3842s5VsQEN/gke29LxJ75HSDUrR7uzHbhsWQiHsyit28JMhz6JFhXzMBKjx1d8E+Amipb2fgkwW
	y0meFwxABZ1eVp7cUcapumr2B6ZZb+9h5Y7MPj0HRfOyInOcaARzepoyjJiYQYcDkdVTQgtZz+AaT
	w/gsMiEtEO50eGKGjTk+fGOYq411iicykIn6B7UoiFGPGhYrfgxz2rwKW921AO0eVgLhur0QAiZfv
	M0oG3Jzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uosrF-0000000FH3b-1vmM;
	Thu, 21 Aug 2025 00:08:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uonzd-0000000Ej14-3rLv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 18:57:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 717EF5C6AE6;
	Wed, 20 Aug 2025 18:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5408C4CEE7;
	Wed, 20 Aug 2025 18:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755716224;
	bh=xmH9ICu1+8c4k7z7aUw6QdF70bVyfaZxpW8X5Hd9OUE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=fmbgBOMBWKy0U0kdm4mDpEMvbd+C/tGwAnJlGjtkDieL7UKWbPiedmQjJpuc8/Eab
	 0VzrsTdTJ/GY8KDcXXT1rybQJgjrb9Grg+wpI8WORFyMVpB9t98nKMz8WVcr16nrL3
	 VjjSTK+Wz8gxdcIC9fz9HHb6OsboihJk9HE4Gd36lDc1zRe9tHSZTW8UxaP1TFg/Xb
	 ORjkHSvsThBPlPX4/ql1dvNhUfXe3FR+XqNpcb2Nuh1OBIRQxA2enGdGN58Kcb0r4+
	 UyA2x8cG2Mzx7x8tPw4+vPDdlmhRQAmaQKRJIY7OsBIEIliTBDwKDBv0gXt1XaRR7l
	 BVPYAFSEb43Tg==
Date: Wed, 20 Aug 2025 13:57:03 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org
To: Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20250820-ls1021a_dts_warning-v2-0-2e39648a32b7@nxp.com>
References: <20250820-ls1021a_dts_warning-v2-0-2e39648a32b7@nxp.com>
Message-Id: <175571287545.265879.1160274338030207211.robh@kernel.org>
Subject: Re: [PATCH v2 0/7] ARM: dts: clean up most ls1021a CHECK_DTB
 warning
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_115706_043260_35E6FC84 
X-CRM114-Status: GOOD (  17.01  )
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


On Wed, 20 Aug 2025 12:36:50 -0400, Frank Li wrote:
> clean up most ls1021a CHECK_DTB warning.
> 
> Old uboot check esdhc@1560000. The new uboot already switch to check both
> esdhc@1560000 and mmc@1560000. So we can rename it now.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v2:
> - squash rename to flash patches
> - remove duplicate patches already post in
> https://lore.kernel.org/linux-devicetree/20250725061339.266125-1-alexander.stein@ew.tq-group.com/
> - Link to v1: https://lore.kernel.org/r/20250818-ls1021a_dts_warning-v1-0-7a79b6b4a0e2@nxp.com
> 
> ---
> Frank Li (7):
>       ARM: dts: ls1021a: Rename node name nor to flash
>       ARM: dts: ls1021a: Rename 'mdio-mux-emi1' to 'mdio-mux@54'
>       ARM: dts: ls1021a: Rename esdhc@1560000 to mmc@1560000
>       ARM: dts: ls1021a: Rename node name power-controler to wakeup-controller
>       ARM: dts: ls1021a: remove big-endian for mmc modes
>       ARM: dts: ls1021a-tsn: Remove redundant #address-cells for ethernet-switch@1
>       ARM: dts: ls1021a-tqmls1021a-mbls1021a-rgb-cdtech: Remove fallback compatible string edt,edt-ft5x06
> 
>  arch/arm/boot/dts/nxp/ls/ls1021a-qds.dts                          | 8 ++++----
>  .../dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso  | 2 +-
>  .../dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso  | 2 +-
>  arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dts                          | 2 --
>  arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts                          | 2 +-
>  arch/arm/boot/dts/nxp/ls/ls1021a.dtsi                             | 6 ++----
>  6 files changed, 9 insertions(+), 13 deletions(-)
> ---
> base-commit: 3ede6e44fad31f1c80dd01188683f0caa0f19247
> change-id: 20250818-ls1021a_dts_warning-fff933bd83da
> 
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
> 
> 
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
 Base: base-commit 3ede6e44fad31f1c80dd01188683f0caa0f19247 not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/next-20250820 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nxp/' for 20250820-ls1021a_dts_warning-v2-0-2e39648a32b7@nxp.com:

arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: memory-controller@1530000 (fsl,ifc): board-control@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bank-width', 'compatible', 'device-width', 'mdio-mux@54', 'ranges', 'reg' were unexpected)
	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: flash@0 (atmel,at45db021d): Unevaluated properties are not allowed ('spi-cpha', 'spi-cpol' were unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/atmel,dataflash.yaml#






