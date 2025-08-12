Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8405BC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5UXIOW0R6vom6KF+k5dEvYXrxeYVLk7H32sopGV0Gyk=; b=00uabURFaePbd14ZsD8gk8m4nz
	F0tw+D7HS2Tszd07UdTYrnEXkvuJxkEppQgT4w4sRFQzFmG1Vec3C4EYHqe+bkql+ov9dl23YIayR
	CZAmccUdlN+r6K43N/sQ6ICTA/p65yMBo05QVa9hNBVbSdINt3DuAV3SzaVEFNIicYHlbQp3CWc/0
	I/2MPZaj9nHmcJvP1gK1rPSrFK8MmOtHBx3sK1ylyYfmy0Ymm58vbbk9baVGASrQjNG6b5s7fGuEW
	grONVr4++E0ELx7Dcoy82tVwdmwwHlwaa9vVgC2aRydkkCXD9uXa7orsPcpDgfrAUJgRruPqHZLKp
	FkciKzHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrl0-0000000BLuP-0XXj;
	Tue, 12 Aug 2025 16:21:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulnrS-0000000AesN-3oMx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 12:12:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E66E449D5;
	Tue, 12 Aug 2025 12:12:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E86C4CEF0;
	Tue, 12 Aug 2025 12:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755000734;
	bh=F0jl31lJlrxf9bEufJTtyVHDr4swwK0MIuhlvBZ02rI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=NxiTIAI1ZsZXXFMENyUYwQ71XKs/s3vuE6fp+I1hYPgB6PXVv15ewjRQUqM4Umlx+
	 0jQWgC15JhMbNemnEMb0QmnEDXlqCRm1uzFY6hV+WXAqAlcm/SPhnj9UiDqLv3cxQ8
	 GmxH1xpVpqnr5oD83WeZPoPnJCpK1v4IQUZCc3lvwQkNxDz16Ozeis9EcG5/6YrBZH
	 mPUtqQMPvVubq6awHo4z7K4fzHL6D3G9LRrwowAnxf/hiM/eNl3zbRFjb7lHLElLae
	 EJfHX08hmRv7ohiz7GPtf/CQF4ctBHvjt57rDpFYdU96BVJBArwwAch0XQgHviEjq6
	 idPVAE4mb51yg==
Date: Tue, 12 Aug 2025 07:12:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: iivanov@suse.de, florian.fainelli@broadcom.com, 
 Catalin Marinas <catalin.marinas@arm.com>, linux-mmc@vger.kernel.org, 
 Ulf Hansson <ulf.hansson@linaro.org>, linus.walleij@linaro.org, 
 Jonathan Bell <jonathan@raspberrypi.com>, linux-serial@vger.kernel.org, 
 conor+dt@kernel.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 devicetree@vger.kernel.org, krzk+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, svarbanov@suse.de, 
 Phil Elwell <phil@raspberrypi.com>, Jiri Slaby <jirislaby@kernel.org>, 
 Will Deacon <will@kernel.org>, linux-gpio@vger.kernel.org, 
 mbrugger@suse.com, wahrenst@gmx.net, Al Cooper <alcooperx@gmail.com>
To: Andrea della Porta <andrea.porta@suse.com>
In-Reply-To: <cover.1754924348.git.andrea.porta@suse.com>
References: <cover.1754924348.git.andrea.porta@suse.com>
Message-Id: <175500063439.2957253.9707220864929081392.robh@kernel.org>
Subject: Re: [PATCH 0/6] Add peripheral nodes to RaspberryPi 5 DT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_051214_989015_EE1D586F 
X-CRM114-Status: GOOD (  26.55  )
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


On Mon, 11 Aug 2025 17:19:44 +0200, Andrea della Porta wrote:
> Hi,
> 
> The following patches add a few peripheral DT nodes and related pin/gpio
> nodes for Raspberry Pi 5.
> 
> This brand new patchset (hence it's a V1) is the second part of the split-up
> of the patchset [1]. It tooks patches 3 to 6 from there and adds a couple
> of new patches that amend the DT bindings.
> As a result, patchset [2] is a prerequisite for this patchset.
> 
> - Patch 1 and 2: Amend the bindings to avoid DT compiler warnings.
> 
> - Patch 3: Adds core pinctrl nodes and defines SD pins as a first appliance
>   for the pinctrl.
> 
> - Patch 4: Wires the gpio-key for power button and related gpio controller.
> 
> - Patch 5: Adds DT node for WiFi.
> 
> - Patch 6: Adds Bluetooth DT node.
> 
> All comments and suggestions are welcome!
> 
> Happy hacking!
> Ivan and Andrea
> 
> Links:
> [1] - https://lore.kernel.org/all/cover.1752584387.git.andrea.porta@suse.com/
> [2] - https://lore.kernel.org/all/cover.1754922935.git.andrea.porta@suse.com/
> 
> 
> CHANGES since [1]:
> 
> --- PATCHES ---
> 
> - Add two new patches (1 and 2) that amend the DT bindings.
> 
> 
> --- DTS ---
> 
> - bcm2712.dtsi: Added 'interrupt-names' and dropped 'reg-shift' and
>   'reg-io-width' properties in uarta DT node. The latter two are
>   just overridden by driver code so setting them in DT is useless.
> 
> - bcm2712-rpi-5-b-ovl-rp1.dts: dropped 'auto-flow-control' property
>   since it's not parsed in driver code.
> 
> 
> --- DT BINDINGS ---
> 
> - brcm,sdhci-brcmstb.yaml: added SDHCI capabilities by including
>   sdhci-common.yaml.
> 
> - serial/brcm,bcm7271-uart.yaml: let clock-frequency be an alternative way
>   to specify the clock speed instead of clocks/clock-names.
> 
> 
> Andrea della Porta (2):
>   dt-bindings: mmc: Add support for capabilities to Broadcom SDHCI
>     controller
>   dt-bindings: serial: Add clock-frequency property as an alternative to
>     clocks
> 
> Ivan T. Ivanov (4):
>   arm64: dts: broadcom: bcm2712: Add pin controller nodes
>   arm64: dts: broadcom: bcm2712: Add one more GPIO node
>   arm64: dts: broadcom: bcm2712: Add second SDHCI controller node
>   arm64: dts: broadcom: bcm2712: Add UARTA controller node
> 
>  .../bindings/mmc/brcm,sdhci-brcmstb.yaml      |   2 +-
>  .../bindings/serial/brcm,bcm7271-uart.yaml    |  19 ++-
>  .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 133 ++++++++++++++++++
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi     |  47 +++++++
>  4 files changed, 198 insertions(+), 3 deletions(-)
> 
> --
> 2.35.3
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
 Base: tags/next-20250808 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/broadcom/' for cover.1754924348.git.andrea.porta@suse.com:

arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: /soc@107c000000/pinctrl@7d504100: failed to match any schema with compatible: ['brcm,bcm2712c0-pinctrl']
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/pinctrl@7d504100: failed to match any schema with compatible: ['brcm,bcm2712c0-pinctrl']
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/pinctrl@7d504100: failed to match any schema with compatible: ['brcm,bcm2712c0-pinctrl']
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: /soc@107c000000/pinctrl@7d510700: failed to match any schema with compatible: ['brcm,bcm2712c0-aon-pinctrl']
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/pinctrl@7d510700: failed to match any schema with compatible: ['brcm,bcm2712c0-aon-pinctrl']
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/pinctrl@7d510700: failed to match any schema with compatible: ['brcm,bcm2712c0-aon-pinctrl']
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: hvs@107c580000 (brcm,bcm2712-hvs): clocks: [[27, 4], [27, 16]] is too long
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hvs@107c580000 (brcm,bcm2712-hvs): clocks: [[27, 4], [27, 16]] is too long
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hvs@107c580000 (brcm,bcm2712-hvs): clocks: [[27, 4], [27, 16]] is too long
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#






