Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCC6D0EE0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 18:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3/S4Hf1y59pjCnEL7qw1EexDcmqot8Q1p1anizWLA8=; b=ag5+xpGElzC44Qb26sVOI4zUNg
	rxgU1fTn/LLvisUEqx0wRvS4W8BHFC5rUzsNlQzj6C8cnGOwD7maaYTffNEikdyAeDmXPHbhVvfsL
	pZjQ5qanze7QlgkfE1TGAvuDoaZ87yX9wBC7QFIRB9uqXyU9GZpe6GRBQoT14BoDSYKS6nJHjVJjA
	qangsuXD0wxslA+z8Y1FdbwqAAaTzTjYQwWaj7sUvGrWH5vpi50w9vTfo/HrLyzEQCcpHH0kvxDI7
	SA+/dWK8nnRBtK3b4/tXSHaVhik1BIutDvxrGimlhdA86jn86bj3H0+1CRKwPeYdxN/UcrzqexY/O
	hnEA/z7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNxTv-0000000Djxu-26sq;
	Tue, 25 Nov 2025 18:09:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNxTu-0000000Djxn-10EB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 18:09:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A3D1A6023C;
	Tue, 25 Nov 2025 18:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5372CC4CEF1;
	Tue, 25 Nov 2025 18:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764094177;
	bh=/mvfUzi1Qw/4Y5kr212cUVhQ1RqPh58sZxHLxmDAY+M=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=T5xXmqeS+/oH53FIpbyhDSoWH/3vPI/1rNwHCdWGhlaVbQI8Sh8EvfLvn4fgZCN+J
	 0UhbZVikkjQqQM3F+qdS0qmkYrakKQukVb+NsriVuDgkqs+l/7W1762mlVTl4p/Beo
	 qaCYC7fvlYxeRYgOcM4gflVSwBtNHLnCgoQoTJC8O05IrFkLUYlV9/3zYTYOX9GbIw
	 XAuQHRoWoQA9P0McfnRMmBvC2klCkjI2oL3KEVzqO2jDU/1HrwXrJZVnfI5GOCvtqz
	 x1DeUdbNhxnowfC78YZePpKtK1f4dyOdyD3k4W/h19xwQhXIYk7rs5VnPLTBxHBkaf
	 GDv0f44YyThOA==
From: Rob Herring <robh@kernel.org>
Date: Tue, 25 Nov 2025 12:09:35 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
To: Marc Olberding <molberding@nvidia.com>
In-Reply-To: <20251124-msx1_devicetree-v4-0-a3ebe3110a67@nvidia.com>
References: <20251124-msx1_devicetree-v4-0-a3ebe3110a67@nvidia.com>
Message-Id: <176409395426.3843808.13226161866300781148.robh@kernel.org>
Subject: Re: [PATCH v4 0/2] Add device tree for Nvidia BMC msx4 cx8
 switchboard
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


On Mon, 24 Nov 2025 15:14:16 -0800, Marc Olberding wrote:
> Patch 1 Adds the binding for the msx4 cx8 switchboard
> Patch 2 Adds the device tree for the msx4 cx8 switchboard reference implementation.
> 
> This is an Aspeed AST2600 based reference implementation for a BMC
> managing the nvidia mgx cx8 switchboard.
> 
> Reference to Ast2600 Soc [1].
> 
> Link: https://www.aspeedtech.com/server_ast2600/ [1]
> 
> Signed-off-by: Marc Olberding <molberding@nvidia.com>
> ---
> Changes in v4:
> - Changed model name to be accurate per Andrew Jeffery
> - Added comments about why there are no i2c devices described here per Andrew Jeffery
> - Added support for probing the backup spi device through fmc
> - Link to v3: https://lore.kernel.org/r/20251108-msx1_devicetree-v3-0-c7cb477ade27@nvidia.com
> 
> Changes in v3:
> - Removed mac and mdio node completely per Andrew Lunn's request. Will add back
>     once the mac driver is fixed
> - Link to v2: https://lore.kernel.org/r/20251107-msx1_devicetree-v2-0-6e36eb878db2@nvidia.com
> 
> Changes in v2:
> - Added ack by Conor Dooley on patch 1
> - Changed phy-mode attribute after discussion with Andrew Jeffery and feedback from Andrew Lunn
>     and added a comment with a better explanation
> - Link to v1: https://lore.kernel.org/r/20250918-msx1_devicetree-v1-1-18dc07e02118@nvidia.com
> 
> ---
> Marc Olberding (2):
>       dt-bindings: arm: aspeed: Add Nvidia msx4 board
>       dts: aspeed: Add a dts for the nvidia msx4 hpm
> 
>  .../devicetree/bindings/arm/aspeed/aspeed.yaml     |   1 +
>  arch/arm/boot/dts/aspeed/Makefile                  |   1 +
>  .../boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts | 248 +++++++++++++++++++++
>  3 files changed, 250 insertions(+)
> ---
> base-commit: ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
> change-id: 20250908-msx1_devicetree-7af2c1fc15d0
> 
> Best regards,
> --
> Marc Olberding <molberding@nvidia.com>
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
 Base: ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/aspeed/' for 20251124-msx1_devicetree-v4-0-a3ebe3110a67@nvidia.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: timer (arm,armv7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: sdram@1e6e0000 (aspeed,ast2600-sdram-edac): compatible: ['aspeed,ast2600-sdram-edac', 'syscon'] is too long
	from schema $id: http://devicetree.org/schemas/edac/aspeed,ast2400-sdram-edac.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: bus@1e600000 (aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: syscon@1e6e2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: crypto@1e6fa000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: /ahb/apb/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']






