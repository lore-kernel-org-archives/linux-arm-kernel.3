Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0439E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 15:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GAfCkm3F2tBrB4IqBq5ZDr493pvoY3m22Zv2MoWoQdE=; b=LVuA82jeqbIgNDCkil+w8Q99Ld
	sYRqwSIxAgaanG1tM/tiDUzhBUVHeLlpTuqwyfQgvWwSkI59ji/hdj1kJ+0VDTxqdlkKv1OtNF/JU
	h+oLGcrtiBpjYd8E2uPhU0mIsBx5B6eIb1XyBqgQzcl3lbQKceChoiJq3bYpTxrFVb+KXJwPacMZM
	FzNdw3Py/DlEWVCmlcM2ZMmQQz8Kbf60qSRHVpMBKDFaiM5S2+CgTzy+2AScaE9uohavrhT1cM91x
	UgL5vJLLFZaE+TNCh5ZyMdjzfJNtKigvWes4o1goWjhNm35/m1nYtDERN25/Sm9PXmL7OSjAQDyjb
	vC9fq6zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjX9-0000000DGYC-0I99;
	Fri, 03 Jan 2025 15:24:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjTY-0000000DFaG-2M2v;
	Fri, 03 Jan 2025 15:20:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C250B5C6461;
	Fri,  3 Jan 2025 15:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B95E0C4CEE3;
	Fri,  3 Jan 2025 15:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735917635;
	bh=el3W4jiKTFvgMk17ql8zwcLjJZEPe9R2tL1/ytsFm0A=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=gW3bTJJXXhJqwHA/o8w67zkkWOyYDtJgE3u9AQJb9QcOknB98NQMpjSw0d30yNGgv
	 kHg4Lc+5EJU00jjz81uNQVk9lktSt4QUGbFdAsT5uC4cWzkT9FpjXi8y1D6dWCvrSz
	 xmlthFSQd2Em7MlP84AfRzwsO1xRQtb2Oa8DI3CQ5e1swhp/gHqkuUiSnQCeBSVYYL
	 XNpQd8VdyesfMv60dz3vyAjTkfIHA+JIcNwN65A4bGJpl7N80mEt+1VPQwu/0Jpp/J
	 o6f78GWUx6+dN8akEnPZcIAFwBthcV0uckH/Jb5uaapIO7p8hqHAmaVgWjw+DBuLlA
	 kd26iR8YDPLrw==
Date: Fri, 03 Jan 2025 09:20:34 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Ondrej Jirman <megi@xff.cz>, linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 linux-rockchip@lists.infradead.org
To: Jimmy Hon <honyuenkwun@gmail.com>
In-Reply-To: <20250103004114.1902-1-honyuenkwun@gmail.com>
References: <20250103004114.1902-1-honyuenkwun@gmail.com>
Message-Id: <173591746023.2305391.8447160640005890243.robh@kernel.org>
Subject: Re: [PATCH v5 0/4] Orange Pi 5 Max
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_072036_684784_67785F55 
X-CRM114-Status: GOOD (  16.20  )
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


On Thu, 02 Jan 2025 18:41:09 -0600, Jimmy Hon wrote:
> Changes in v5:
> - Include Orange Pi 5 Plus USB 3.0 change in baseline before refactor
> - Defer Orange Pi 5 Ultra to a later series
> - Defer Orange Pi 5 Plus HDMI1 to a later series
> Link to v4: https://lore.kernel.org/linux-rockchip/20241229184256.1870-2-honyuenkwun@gmail.com/
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
>  .../boot/dts/rockchip/rk3588-orangepi-5.dtsi  | 806 +++++++++++++++++
>  6 files changed, 1128 insertions(+), 792 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
> 
> 
> base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> prerequisite-patch-id: 6346d482f91509dec24bfe5d4f0ca0d345b90deb
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


New warnings running 'make CHECK_DTBS=y rockchip/rk3588-orangepi-5-max.dtb rockchip/rk3588-orangepi-5-plus.dtb' for 20250103004114.1902-1-honyuenkwun@gmail.com:

arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: audio-codec@11: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: audio-codec@11: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#






