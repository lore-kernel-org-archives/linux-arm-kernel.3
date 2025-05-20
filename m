Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9135C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 21:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+gmcNg4+3NysczvQCuX5W/uNr3zgZjovBgp5XfpRGg=; b=MzLjZZst4zHfLlqeBoZOJFzAVV
	9nTVbdVj43DZcXc8yRqdsGkrP2zIeEju2+1HocnTWE6jyOngwod5t03r/ee4f1K0a6+JrGA/GyiAw
	Va6e7DwXx73B8zDd3OE9YmAshQsUczU3ktJgfENK8gFi0t8hG3bKYWZRWtegDpixC2f16fygCaZJq
	89ps/EoztrxBupwxNFUuLSbwQ+8BYVEAudSTNSem/og5DTKsJvHdWiWvko9juMSY/nLAC+9I8QTJm
	kl/VuKgYeKvu4bvJKTXkDrpjvk8sNmcx/bbNUlENOfSlU5A7yHT7bk+HJK1OyH95tBr7L3CpEZ1W8
	I3Y5i0og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHUFq-0000000E9rx-2E8E;
	Tue, 20 May 2025 21:12:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHUDh-0000000E9fZ-3n4d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 21:09:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 142B662A30;
	Tue, 20 May 2025 21:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 987ABC4CEE9;
	Tue, 20 May 2025 21:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747775362;
	bh=8MZhlSQAe5gVmxQtnmmdZj0u/4gjdgG9U3iIB+4i5AY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=sU6jClWspgkpv2dehzi1TrbuWk3Z9mDZtkT1GNFzifWrFSUMf775w5kIeQdWv3O26
	 0j5mkuNjXj6Br5yBZljjQ/3P+cLTxJXwdhvyGfJBiJi4B7QH/oufhOp666kFFdvnsc
	 KDzBkhySlkCzuCR6c5bW0yIA4gdy8+GvT3NYhREQcEn+LUcyq5M1PbNon+XjbDmKuf
	 vH6zLcvz29455odjaMmXY4QsjRkd6UNUyzW+RaGTHhxlP4GfHEoZswQrXrWqzTunE9
	 p0dsr2b/xKeJtjzrGBTwcY+my4rMDuCPGQxsocarwR5WA2sGML3RwohLCB3B4NBJdb
	 TKA7SCG5dOFpw==
Date: Tue, 20 May 2025 16:09:20 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
In-Reply-To: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com>
References: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com>
Message-Id: <174777533581.1435243.228426835513916964.robh@kernel.org>
Subject: Re: [PATCH v2 0/8] Introduce HDP support for STM32MP platforms
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


On Tue, 20 May 2025 17:02:27 +0200, Clément Le Goffic wrote:
> This patch series introduces the Hardware Debug Port (HDP) support for
> STM32MP platforms.
> 
> It includes the addition of device tree bindings, the HDP driver,
> and updates to the device tree files for STM32MP13, STM32MP15,
> and STM32MP25 SoCs.
> The series also updates the MAINTAINERS file to include myself as the
> maintainer for the STM32 HDP driver and adds the necessary
> pinmux configurations for HDP pins on STM32MP157C-DK2 as example.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
> Changes in v2:
> - Remove bindings header files with function name as #define
> - Add match_data with function name for three compatible:
>   "st,stm32mp131-hdp", "st,stm32mp151-hdp" and "st,stm32mp251-hdp".
> - Rework a bit the driver to use match_data.
> - Remove the use of `dev_err_probe(` in the resume ops.
> - Remove `MODULE_ALIAS(`.
> - Remove the vertical bar in bindings description paragraph.
> - Fix an error in the `pinctrl-0` parameter of the binding example, it
>   was refering a node that wasn't existing.
> - Use uppercase pin names.
> - Link to v1: https://lore.kernel.org/r/20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com
> 
> ---
> Clément Le Goffic (8):
>       dt-bindings: pinctrl: stm32: Introduce HDP
>       pinctrl: stm32: Introduce HDP driver
>       MAINTAINERS: Add Clément Le Goffic as STM32 HDP maintainer
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp13
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp15
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp25
>       ARM: dts: stm32: add alternate pinmux for HDP pin and add HDP pinctrl node
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp157c-dk2 board
> 
>  .../bindings/pinctrl/st,stm32-pinctrl-hdp.yaml     | 188 ++++++
>  MAINTAINERS                                        |   6 +
>  arch/arm/boot/dts/st/stm32mp131.dtsi               |   6 +
>  arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi        |  25 +
>  arch/arm/boot/dts/st/stm32mp151.dtsi               |   7 +
>  arch/arm/boot/dts/st/stm32mp157c-dk2.dts           |   6 +
>  arch/arm64/boot/dts/st/stm32mp251.dtsi             |   7 +
>  drivers/pinctrl/stm32/Kconfig                      |  14 +
>  drivers/pinctrl/stm32/Makefile                     |   1 +
>  drivers/pinctrl/stm32/pinctrl-stm32-hdp.c          | 736 +++++++++++++++++++++
>  10 files changed, 996 insertions(+)
> ---
> base-commit: 09fac5c576bbff764dddf2baca0038b359376fd8
> change-id: 20250224-hdp-upstream-622e5da14a9f
> 
> Best regards,
> --
> Clément Le Goffic <clement.legoffic@foss.st.com>
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
 Base: using specified base-commit 09fac5c576bbff764dddf2baca0038b359376fd8

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/st/' for 20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com:

arch/arm/boot/dts/st/ste-snowball.dtb: / (calaosystems,snowball-a9500): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 536870912]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: /soc/gpio@8000e100: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']






