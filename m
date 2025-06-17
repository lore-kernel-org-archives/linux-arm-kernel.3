Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B88C73C66
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 17:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pBzzZbuJx8UJAQXI7NjK97wdQ09KSpZvJQqwljKQYGk=; b=TcTvNL/EVRNtrZHzcjqFGyp3m9
	kZNZWQqfjVS24nSNw9TBpSvFGHNFIew5m+nslBf7ThMZClTDm1YzmwCk19h9RPls9WSZoLmcstlEC
	5tzPsknoSO46lSY7xEn2RAjaT4eoU5gEJupNZXnPzbGI7kpGdk97N43fmzAahZ9ZUVm13l21Wezkl
	kN2fyiZ/8GbVgQgmE/Z9Yqvgx/kyEl7f8SZZXEQjBVYUK7NRk9QkE7oyCNhZMGZrEo6X4lutjF3uX
	m56kZ9Q06zINt0CKDtJeI+oRw8trCzDkIBz6j+x4bo10Ine4A2AsylZSCSL+blJa+GYStn4z+W2kS
	TZij0HCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZpU-00000007xaQ-1pr3;
	Tue, 17 Jun 2025 17:10:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXBF-00000007Wja-48sq;
	Tue, 17 Jun 2025 14:20:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BDF005C4AC6;
	Tue, 17 Jun 2025 14:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A976CC4CEE3;
	Tue, 17 Jun 2025 14:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750170053;
	bh=2InmuhCdbeF4xAg1utUzErMQdY9Y+3NdD/RkSD3RA6Y=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Vx6BIclc/l3eryk97vgg5S/7dJzXIMmEm4Nt8OItskFEe+xsyWspT+K+fTJUZtZUg
	 1/esRdpzKV7Tgh2ZbAM/vkn02AP5aeHlTC/+YyNrCvgtA8pt13PhMLa4CoCQixklNb
	 FeNIYZQNbEEckySCKgKVLLsKgGK7XR9d44QBQazgIZyG422tQUn3zQ+9pgCyYD0TH0
	 JjIeag5ygGr/ZFjI9ELdKsH1IqWoWsc/qcJSgMJ96pGtozAGP6Wu7ffhSApL8r/jtR
	 A+uzQQlbSCIZrdrJBDlgy+Iv3uW04xy2NLN3G+Z1PFGT5eXC7k/KjwJhuucGPw11ab
	 TsfP4fqo76Jpg==
Date: Tue, 17 Jun 2025 09:20:47 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-rockchip@lists.infradead.org, heiko@sntech.de, 
 conor+dt@kernel.org, krzk+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
To: John Clark <inindev@gmail.com>
In-Reply-To: <20250616212214.139585-1-inindev@gmail.com>
References: <20250616212214.139585-1-inindev@gmail.com>
Message-Id: <175016979599.2093448.14784445392861076419.robh@kernel.org>
Subject: Re: [PATCH v1 0/2] Add FriendlyElec NanoPi M5 support for Rockchip
 RK3576
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_072054_105910_2738CAF4 
X-CRM114-Status: GOOD (  17.53  )
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


On Mon, 16 Jun 2025 17:22:12 -0400, John Clark wrote:
> This series adds device tree support for the FriendlyElec NanoPi M5 board,
> powered by the Rockchip RK3576 SoC (4x Cortex-A72, 4x Cortex-A53, Mali-G52
> MC3 GPU, 6 TOPS NPU). The patches enable basic booting and connectivity,
> including dual 1Gbps Ethernet, USB 3.2, microSD, M.2 PCIe NVMe, and HDMI.
> 
> Patch 1 updates the DT bindings in rockchip.yaml.
> Patch 2 adds the NanoPi M5 device tree and Makefile entry.
> 
> No MAINTAINERS update is needed, as the new file is covered by the existing
> ARM/Rockchip SoC entry.
> 
> Tested on NanoPi M5 with successful boot and feature validation.
> 
> Signed-off-by: John Clark <inindev@gmail.com>
> ---
> John Clark (2):
>   dt-bindings: arm: rockchip: add FriendlyElec NanoPi M5 board
>   arm64: dts: rockchip: Add FriendlyElec NanoPi M5 support
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |   6 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../boot/dts/rockchip/rk3576-nanopi-m5.dts    | 969 ++++++++++++++++++
>  3 files changed, 976 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
> 
> --
> 2.39.5
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
 Base: attempting to guess base-commit...
 Base: tags/v6.16-rc1-19-gd7ad90d22abe (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250616212214.139585-1-inindev@gmail.com:

arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: spi-nor@0 (jedec,spi-nor): $nodename:0: 'spi-nor@0' does not match '^(flash|.*sram|nand)(@.*)?$'
	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: pmic@23 (rockchip,rk806): Unevaluated properties are not allowed ('rk806_dvs1_null', 'rk806_dvs1_pwrdn', 'rk806_dvs1_rst', 'rk806_dvs1_slp', 'rk806_dvs2_dvs', 'rk806_dvs2_gpio', 'rk806_dvs2_null', 'rk806_dvs2_pwrdn', 'rk806_dvs2_rst', 'rk806_dvs2_slp', 'rk806_dvs3_dvs', 'rk806_dvs3_gpio', 'rk806_dvs3_null', 'rk806_dvs3_pwrdn', 'rk806_dvs3_rst', 'rk806_dvs3_slp' were unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk806.yaml#
arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: hym8563@51 (haoyu,hym8563): $nodename:0: 'hym8563@51' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/rtc/haoyu,hym8563.yaml#
arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: hym8563@51 (haoyu,hym8563): Unevaluated properties are not allowed ('clock-frequency' was unexpected)
	from schema $id: http://devicetree.org/schemas/rtc/haoyu,hym8563.yaml#
arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: gpio-keys (gpio-keys): 'button@1' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#






