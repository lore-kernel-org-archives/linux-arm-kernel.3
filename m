Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34AAE77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 14:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xwlrm8/Oq0Y5Vowi5QrhvrQAuLvRDXBpPOMl/Z9fyHw=; b=hfRnl8Pki42y6NR3AK1ov7/AgQ
	xNEt7jBdEQJxJj5c5NvMRN53pnfPZLUWwhc9hHaZMKMXpK1w0wp8mk6IrBqAZ97TuIFWlXkQEB0p4
	K9Yzdbejr9zK7CeXFid51syo85+4Bdy37l40syBj9jlt1klnY+Z1PGEsLjHmLws9DM8j/mxpIHA0f
	0YG4sLVNrvSJcNaOgIPtZokFOG3T286nDpNZBpu6pCPTaBpgk1MXGwBYzvxpEqm1+Est31O+c979Q
	VX1RU+vVd4ZMffIWlZjlkihP3GTV1nw47NrV/b2OmjwuUfPPOgmVnWA/iHi91aX35ENxZdZ0kT3i6
	e/O+NFMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVtkU-0000000CHkl-2JCo;
	Thu, 09 Jan 2025 14:43:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVti7-0000000CGzx-0pdS;
	Thu, 09 Jan 2025 14:40:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D380EA41D95;
	Thu,  9 Jan 2025 14:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB671C4CEE5;
	Thu,  9 Jan 2025 14:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736433634;
	bh=WEPy2Kk6ELjxMxCeSWF+5rEwWmbuF3T8scXw8OvdrcY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=NbcN3wu0tMOv2DnTxIm69tdAuSF61YG63xEjOzUKI+E6ZiJI6pMsftlEeEoG78ECE
	 en8SPdJBI4KtWubzbcIHyFSp4prApnbB26wNL3Geq/2FzvL8hyLtPsiBbwWI7ECjDy
	 lUYyN2LveduW9A3hsmtHWGfAY4Xzz8lfwJGEUhvGGK4RU3lcfe8KdLvifHARGbwB0y
	 jwMrXKr1Am5cqJMExVyEXlph+Sd4H+Scm85OgwYDK77FCfcfBoEF7clkoRAwpoxrd/
	 xyB+h94mrgEmwqbIt67QDnGxPs/oTYwSlAJz3ta9nc/QgH+Ox0OR+IgaPe7wrKNCNo
	 JnYTamJIHXaBw==
Date: Thu, 09 Jan 2025 08:40:33 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Ondrej Jirman <megi@xff.cz>, linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Jimmy Hon <honyuenkwun@gmail.com>
In-Reply-To: <20250109051619.1825-1-honyuenkwun@gmail.com>
References: <20250109051619.1825-1-honyuenkwun@gmail.com>
Message-Id: <173643343615.3320269.13009413932712361979.robh@kernel.org>
Subject: Re: [PATCH v8 0/4] Orange Pi 5 Max
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_064035_368114_DAD030E0 
X-CRM114-Status: GOOD (  20.99  )
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


On Wed, 08 Jan 2025 23:16:14 -0600, Jimmy Hon wrote:
> Add device-tree for Orange Pi 5 Max
> 
> Orange Pi now has 3 SBCs using the RK3588 SOC. Refactor the common parts
> of the 5 Plus DTS so it can be shared with the 5 Max and the 5 Ultra.
> The 5 Max and 5 Ultra have a similar credit-card sized board layout and
> will also share a DTSI between them.
> 
> 5 Plus: HDMI0, HDMI1, HDMI RX, M.2 E-key, USB-C
> 5 Max: HDMI0, HDMI1, WiFi/BT using SDIO/UART
> 5 Ultra: HDMI1, HDMI RX, WiFi/BT using SDIO/UART
> 
> Changes in v8:
> - Rebase with updated 5 Plus USB 3 patch
> 
> Changes in v7:
> - Add signed-off to first commit
> - Expand first commit description
> 
> Changes in v6:
> - Remove clock-names from incorrect merge conflict
> 
> Changes in v5:
> - Include Orange Pi 5 Plus USB 3.0 change in baseline before refactor
> - Defer Orange Pi 5 Ultra to a later series
> - Defer Orange Pi 5 Plus HDMI1 to a later series
> 
> Changes in v4:
> - Orange Pi 5 Ultra was released and does not use VP0 to HDMI0
> - Move HDMI0 from common to the board level
> - Make DTSI to be shared by the credit card sized 5 Max and 5 Ultra
> - Updates for the newly submitted HDMI1 support
> - Add Ack for dt-binding
> 
> Changes in v3:
> - Refactor to share common include with Orange Pi 5 Plus
> 
> Changes in v2:
> - squashed commits together for initial board file
> 
> Link to v1: https://lore.kernel.org/linux-rockchip/20241026100310.52679-1-honyuenkwun@gmail.com/
> 
> Jimmy Hon (4):
>   arm64: dts: rockchip: refactor common rk3588-orangepi-5.dtsi
>   dt-bindings: arm: rockchip: Add Xunlong Orange Pi 5 Max
>   arm64: dts: rockchip: Add Orange Pi 5 Max board
>   arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Max
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |   6 +-
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../rockchip/rk3588-orangepi-5-compact.dtsi   | 151 ++++
>  .../dts/rockchip/rk3588-orangepi-5-max.dts    | 101 +++
>  .../dts/rockchip/rk3588-orangepi-5-plus.dts   | 855 ++----------------
>  .../boot/dts/rockchip/rk3588-orangepi-5.dtsi  | 805 +++++++++++++++++
>  6 files changed, 1127 insertions(+), 792 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
> 
> 
> base-commit: 2859e1ac3110f2d428a794bda26ea0d90b2254c6
> prerequisite-patch-id: 4672b745f4308a7be527749279edb71625d120e6
> prerequisite-patch-id: 2743fb64eba2a29eaf993ebc8a5d6ee445b69dfa
> --
> 2.47.1
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250109051619.1825-1-honyuenkwun@gmail.com:

arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: /i2c@fe5c0000/touchscreen@48: failed to match any schema with compatible: ['ti,tsc2007']
arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dtb: /serial@fdd50000/mcu: failed to match any schema with compatible: ['qnap,ts433-mcu']
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/phy@2b050000: failed to match any schema with compatible: ['rockchip,rk3576-naneng-combphy']
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/phy@2b060000: failed to match any schema with compatible: ['rockchip,rk3576-naneng-combphy']
arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dtb: /spi@fe610000/fram@0: failed to match any schema with compatible: ['fujitsu,mb85rs128ty']
arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/phy@2b050000: failed to match any schema with compatible: ['rockchip,rk3576-naneng-combphy']
arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/phy@2b060000: failed to match any schema with compatible: ['rockchip,rk3576-naneng-combphy']
arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: /i2c@fe5c0000/touchscreen@48: failed to match any schema with compatible: ['ti,tsc2007']






