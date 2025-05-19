Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495A0C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 13:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AbZCyidQrg/086ycfVGMTcIiS/haIUaXuw8Ld2RuZBU=; b=quROJiJAMQRFElS9ZEa9dpuFSc
	q/xRnD8mtdP0Yd++zCJITt/eRFUu63jm+1AFIT99oR7fsdvVqGFpEFHc+q6//KiMxub+xXipAS8/C
	jglz/0ZnxvCZr8GVaR4LP+RmaOGM+M0CuF0VN7atgyza5SCGmqEfukotyIDFTedJxti/qsc7iUrY7
	83I/0yvEb0SYgF58i46c6X0m1mqhHw1C+b/GMyfjJ8OBcoaN6Jat1HUCt5aYdlqF8cjFha36GlyvM
	C2Im0803UpN/HJD3TnMdgTiVpmEgN6natX5wT/+NFDGVBxVrag73wzjS9BibEEk4XjK11pP9OJx7x
	9gn7o1nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH0E1-00000009FFG-3n0E;
	Mon, 19 May 2025 13:08:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH07i-00000009Ef3-34Qz;
	Mon, 19 May 2025 13:01:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 004425C53DC;
	Mon, 19 May 2025 12:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB79EC4CEE4;
	Mon, 19 May 2025 13:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747659701;
	bh=fe34uv+vZJuboUS2vJB9BIOWNbDbPeHkvFJbgEczgew=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=HFrkF/S2McppJVusyqJl0fmqDd+4Mxqls0tBibhYf9SEFnauRUsAUFI9Mqt2xx+NO
	 OKNgo8H2oVx4utcspymUAU/2vHPkRpQ3qqnqmbETJHqiW/mq1uYZJ9rp0r7s3GAA/t
	 xAG7Apdy1HF6nA8muZyToEWF8/Z74uCNNyd+KxwrcV/c2HXDgtwQ/pC6UeoHtJpiYa
	 6IdI063Dz+F9lzq7Ajui3b02tkQa5ndV1nrdXneCdEvJ1uhkZOhuLbwy45N8/i4QOJ
	 hNCOwf3tOXXl1sKcyHd85CyOaAsj2nw6Ocr0pkh7EYG5FuJf+vfus1dwx3QduJbfbp
	 oPwrCN5Hu7wwQ==
Date: Mon, 19 May 2025 08:01:39 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: nicolas.frattaroli@collabora.com, linux-arm-kernel@lists.infradead.org, 
 krzysztof.kozlowski@linaro.org, heiko@sntech.de, krzk+dt@kernel.org, 
 devicetree@vger.kernel.org, inindev@gmail.com, andrew@lunn.ch, 
 conor+dt@kernel.org, sfr@canb.auug.org.au, jonas@kwiboo.se, 
 quentin.schulz@cherry.de, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org
To: Hsun Lai <i@chainsx.cn>
In-Reply-To: <20250519075432.2239713-1-i@chainsx.cn>
References: <20250519075432.2239713-1-i@chainsx.cn>
Message-Id: <174765962904.2025653.12342723895898738243.robh@kernel.org>
Subject: Re: [PATCH v4 0/2] Add support for Firefly
 Station-M3/ROC-RK3588S-PC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_060142_812913_24B9D327 
X-CRM114-Status: GOOD (  18.93  )
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


On Mon, 19 May 2025 15:54:30 +0800, Hsun Lai wrote:
> This series add support for Firefly Station-M3/ROC-RK3588S-PC.
> 
> Info of device can be found at:
> https://wiki.t-firefly.com/en/Station-M3/index.html
> 
> Changes in v4:
> - Update the name of the regulator
> - Remove the i2s5_8ch node
> 
> Changes in v3:
> - Update the name of leds
> - Add more cpu nodes
> - Update mdio compatible
> - Fix the order in the node
> - Add the default serial port(uart2)
> 
> Changes in v2:
> - Fix rgmii delays
> 
> Changes in v1:
> - Add support for Firefly ROC-RK3588S-PC
> 
> Hsun Lai (2):
>   dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
>   arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../boot/dts/rockchip/rk3588s-roc-pc.dts      | 922 ++++++++++++++++++
>  3 files changed, 928 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
> 
> --
> 2.34.1
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
 Base: remotes/arm-soc/rockchip/dt64-31-ge463625af7f9 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250519075432.2239713-1-i@chainsx.cn:

arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: /edp@fdec0000: failed to match any schema with compatible: ['rockchip,rk3588-edp']






