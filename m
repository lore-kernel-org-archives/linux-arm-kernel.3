Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F853D6CFA1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 18:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSGOQEp+t+D+PlUnbB7XkpwpDVfhgHwpAunmqIaa5po=; b=dGNqRJc/jqvVaCCu++CjNcnxrp
	3UeTU8ODVFRJ6nuFNVzm8iEQ2iwJ6GyOhTfatOtRrC56byukai7cM9l1K/75hna/uoWgxLAK9vve9
	X8TSsBbXSENh7fReVCvnXlFy+omzv6F479hE8rXoizscb8Up3SyWJRQst4SwC6TCLyZCsfxjievFm
	kyyzqFE3MLRW05RcHJSUzyLFzI9dRl5j2XgKiz+C3t3MvtyiLB6c/VH1cc8W1XzUv78J47MIxD8tJ
	y4O5PZqwOqtguU3j/oEKyVhjtcKT7aCl32SCF84Yg0cN+m7G6YA25oXDaPGQWEYDv0C2iJLKecAS6
	zSnyAI8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viz5S-00000007bo7-384w;
	Thu, 22 Jan 2026 18:07:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viz5S-00000007bo0-0MjK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 18:07:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 85A4C600C4;
	Thu, 22 Jan 2026 18:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E6DC19423;
	Thu, 22 Jan 2026 18:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769105237;
	bh=huOUDGNR22rYNTgKq1UUfvgid25q6rQUmnSOjutN8wY=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=oSG3eEDhsgonLIidtZiOzqd6bDEeLuDq9THJ06VHFI9IqnwEFc7irQi+Y2NTzxM6c
	 xqWKftnfvwzOJZ6C2sViHYals1yJwQl6RXSuKL5clUCbfJpkNLjn7+vKz0Zw+K4LFI
	 E3WXD/YTIw1Ffc/4jQKDHHMlHqNxkVtbgGxNB74masI/pM/NAq4a1nK1IAmoZN5cNs
	 sagKKc5icmzUooY4TXIYFAUauAQlxz+zvuhcasHaaccU+c+OnMtGPtFH3Ezr4yV/2S
	 dgVodtZGU1zGNSzrbF8TzWgIfmNDG7ykgKDMQL40NPiBIMRe5jFFhU0DtZ4a4oNfC2
	 /RPRnbQNWRf+A==
From: Rob Herring <robh@kernel.org>
Date: Thu, 22 Jan 2026 12:07:16 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: conor+dt@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, 
 chris.packham@alliedtelesis.co.nz, pali@kernel.org, andrew@lunn.ch, 
 devicetree@vger.kernel.org, mrkiko.rs@gmail.com, 
 sebastian.hesselbarth@gmail.com, linux-arm-kernel@lists.infradead.org, 
 gregory.clement@bootlin.com, krzysztof.kozlowski+dt@linaro.org
To: Elad Nachman <enachman@marvell.com>
In-Reply-To: <20260122165923.2316510-1-enachman@marvell.com>
References: <20260122165923.2316510-1-enachman@marvell.com>
Message-Id: <176910484185.3007016.14688980539020105749.robh@kernel.org>
Subject: Re: [PATCH 0/2] arm64: dts: a7k: add COM Express boards
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


On Thu, 22 Jan 2026 18:59:20 +0200, Elad Nachman wrote:
> From: Elad Nachman <enachman@marvell.com>
> 
> Add support for Armada 7020 Express Type 7 CPU module board by Marvell.
> Add device tree bindings for this board.
> Define this COM Express CPU module as dtsi and provide a dtsi file for
> the carrier board (Marvell DB-98CX85x0 COM Express type 7 carrier board).
> Add the Falcon DB to the MAINTAINERS list
> 
> Since memory is soldered on CPU module, memory node is on CPU module
> dtsi file.
> 
> This Carrier board only utilizes the PCIe link, hence no special device
> or driver support is provided by this dtsi file.
> Devise a dts file for the combined com express carrier and CPU module.
> 
> The Aramda 7020 CPU COM Express board offers the following features:
> 
> 1.  Armada 7020 CPU, with dual ARM A72 cores
> 2.  DDR4 memory, 8GB, on board soldered
> 3.  1Gbit Out of Band Ethernet via RGMII to PHY and RJ45 connector,
>     all are present on A7K CPU module (none on the carrier)
> 4.  Optional 10G KR Ethernet going via the COM Express type 7 connector
> 5.  On-board 8 Gbit, 8-bit bus width NAND flash
> 6.  On-board 512 Mbit SPI flash
> 7.  PCIe Root Complex, 4 lanes PCIe gen3 connectivity, going via the
>     COM Express type 7 connector
> 8.  m.2 SATA connector
> 9.  Micro-SD card connector
> 10. USB 2.0 via COM Express type 7 connector
> 11. Two i2c interfaces - one to the CPU module, and one to the
>     carrier board via the COM Express type 7 connector
> 12. UART (mini USB connector by virtue of FT2232D UART to USB
>     converter, connected to the Armada 7020 UART0)
> 
> Elad Nachman (3):
>   dt-bindings: arm64: add Marvell 7k COMe boards
>   arm64: dts: a7k: add COM Express boards
>   MAINTAINERS: Add Falcon DB
> 
>  .../bindings/arm/marvell/armada-7k-8k.yaml    |  11 ++
>  MAINTAINERS                                   |   1 +
>  arch/arm64/boot/dts/marvell/Makefile          |   1 +
>  .../dts/marvell/armada-7020-comexpress.dtsi   | 161 ++++++++++++++++++
>  arch/arm64/boot/dts/marvell/armada-70x0.dtsi  |   7 +
>  .../boot/dts/marvell/armada-ap806-dual.dtsi   |   4 +-
>  .../dts/marvell/db-falcon-carrier-a7k.dts     |  27 +++
>  .../boot/dts/marvell/db-falcon-carrier.dtsi   |  22 +++
>  8 files changed, 232 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/marvell/armada-7020-comexpress.dtsi
>  create mode 100644 arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dts
>  create mode 100644 arch/arm64/boot/dts/marvell/db-falcon-carrier.dtsi
> 
> --
> 2.25.1
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
 Base: tags/next-20260121 (exact match)
 Base: tags/next-20260121 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/marvell/' for 20260122165923.2316510-1-enachman@marvell.com:

arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: ethernet@0 (marvell,armada-7k-pp22): ethernet-port@0:phy-mode:0: '10gbase-kr' is not one of ['gmii', 'sgmii', 'rgmii-id', '1000base-x', '2500base-x', '5gbase-r', 'rxaui', '10gbase-r']
	from schema $id: http://devicetree.org/schemas/net/marvell,pp2.yaml


