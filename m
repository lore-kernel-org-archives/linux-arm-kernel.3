Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2606BCA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHAoQIZFTgS8rsJlU80z1j4gq01F3RHravH7EVfXeog=; b=qLT19OxyfmUY1XohEW34gLI5jP
	vNtnw6yWhO4ChQ8ky6In7yOtlvKp7Jf8e+vTuqom7HeH5sHiPYzvNnDqeRVVSbmP8uBRKyBsgEF51
	0fAnfTP3jAjxZiNlLhOkt+eqv/Id6IYLedu3hL9aA4nl0iSDoDvfChgDxJe18+ksVZMon5U40jb/M
	/zsytBxHqmlY8olFvS+jjsGZn8k2UjluzqcySfM/OBkmz/hYAU8QWToA7XQZZBLgWyQ5Z0xMAXqzD
	TtSad8I0+yNrw+4JtfoI9hRZTDsDiYlbsIrU6CslNNqH9/sXosIDWVnhSPlP5qsNaa3F+QC6/7exu
	PPX8LtIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWOI-00000001aR4-48H8;
	Tue, 02 Sep 2025 19:10:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQtv-0000000HaDj-00Ne;
	Tue, 02 Sep 2025 13:18:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6EA8360206;
	Tue,  2 Sep 2025 13:18:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92BAFC4CEED;
	Tue,  2 Sep 2025 13:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756819098;
	bh=K0GSdivUZWDBfPpkGbzM+dh5X2lVniJv3YjK1fZ5fEM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=UFqXKUeicCIzvOluYdJkonrNBf/8NoPzAq1tQwdG8JSYZMnvVmrABd/iL+IF7QyHS
	 ft3YG30ij+cp5MBdJwKPNfJ15Ih3ZgTXTDD9wr9lB14ZlRrjJXvVVcTx5Te0rhKNso
	 4XdqqPIRU/OzfqghFsZ8tNSLOUi2kngMCdOvll0PwYGssKqoouM/oKpROgjayRMLvV
	 YPpdQkzGdmlQ+BZ+Fah1AeE8uLrW4N8Bn6LmfDUpDcB/0mB4tGhG65rfvjmKZFDq+w
	 hxQfjpHBa4uhvOyZpV3c3L0wKz4zHrk6rV4t2e16E4I/pTy/yI4ziyPCWU1xGXzs5f
	 uuZ4+yvT/+Y4A==
Date: Tue, 02 Sep 2025 08:18:00 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Fred Bloggs <f.blogs@napier.co.nz>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Heiko Stuebner <heiko@sntech.de>, Stephen Rothwell <sfr@canb.auug.org.au>, 
 linux-kernel@vger.kernel.org
To: Hsun Lai <i@chainsx.cn>
In-Reply-To: <20250901025037.81548-1-i@chainsx.cn>
References: <20250901025037.81548-1-i@chainsx.cn>
Message-Id: <175678731228.878036.16153642695383320999.robh@kernel.org>
Subject: Re: [PATCH v3 0/2] Add support for 100ASK DShanPi A1
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


On Mon, 01 Sep 2025 10:50:35 +0800, Hsun Lai wrote:
> This series add support for 100ASK DShanPi A1.
> 
> Info of device can be found at:
> https://wiki.dshanpi.org/en/docs/DshanPi-A1/intro/
> 
> Changes in v3:
> - Update the name of vcc_in regulator (Chukun Pan, v2)
> - Fix PCIE (Chukun Pan, v2)
> - Update the name of typec5v_pwren_h pinctrl (Chukun Pan, v2)
> - Fix USB3 (Chukun Pan, v2)
> - Remove i2c2 node, unsupported RTC model rs4c1338 (Chukun Pan, v2)
> 
> Changes in v2:
> - Delete the pwm include file (Chukun Pan, v1)
> - Fix vcc3v3_pcie gpios (Chukun Pan, v1)
> - Adjust the order of some nodes (Chukun Pan, v1)
> - Fix sdmmc (Chukun Pan, v1)
> - Add phy-supply for u2phy0_otg (Chukun Pan, v1)
> 
> Changes in v1:
> - Add support for 100ASK DShanPi A1
> 
> Hsun Lai (2):
>   dt-bindings: arm: rockchip: Add 100ASK DShanPi A1
>   arm64: dts: rockchip: add DTs for 100ASK DShanPi A1
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../dts/rockchip/rk3576-100ask-dshanpi-a1.dts | 795 ++++++++++++++++++
>  3 files changed, 801 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
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
 Base: tags/v6.17-rc1-22-g7d11b8c260ea (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250901025037.81548-1-i@chainsx.cn:

arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: syscon@26034000 (rockchip,rk3576-dcphy-grf): clocks: False schema does not allow [[21, 492]]
	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/dsi@27d80000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-dsi2']






