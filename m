Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297B3C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 15:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHgW608OeSqVydNghj5dcp4WR3HJYBdWQoOvC9POCrw=; b=ldU/lHN/RsM/xMcgjPso7KtiFh
	bD9jjwnhvPn25NBGKm6Ztx3nObc0LEsVPxDPIm5lt/Z5rhojmcQtHyP9BzR76JACvhW7SptvWWiWX
	TiWucwAplNHsadxn7P7fiXeVEML9q9xLnx4LJzgwLWGwJoSpjAflQR5QiT/fpxWWCs+oYhGrOIgGB
	4au0Q9Eruu1cUZUhBqPoxzZ1gOrvF5lIJrIYkT0ycNx2r9UdF1mlQshMiHYdsIxTn2CvuLdSpGR/P
	rP3hLyQkLFFCNNws1yZK8gP/6ifKDZtaRSTUWCeKwI+cQAC2AiToxqI+AYSPnrAqWN/pOBlCEeV4r
	GTl8shfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMmg-00000005kE4-1mPJ;
	Mon, 13 Jan 2025 15:55:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMKL-00000005chp-19ZY;
	Mon, 13 Jan 2025 15:26:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F408DA4101F;
	Mon, 13 Jan 2025 15:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8BACC4CED6;
	Mon, 13 Jan 2025 15:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736781963;
	bh=yPKcwvMEc1LS0HKT9AuScKrjPr7zkhgV+Fd5sl68nR8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=F6TTET+Sb0BKahiFIUm0XJTQiKk18f6lKSazk1qg0bT3j3iUwp6Ro7Se9JdvIn/tD
	 hiXTSTGuH6OYu+TEtVqB5kR+xdVbyJwnuvafSxBCyS3Sik66s1vafXL4dS3SfDpIcV
	 vWUimkSnEHOOsEXKCqzKEfOvbzDlEmburaxaVp7AEB/8BYltEWKXgqRd6L5CSd2A9t
	 wLgK0z1U2PkV/A3XfCilaEk4D0RL9GTTYvnP3egiaZVdYDmRiBHdsdsHZTFXNRYp9u
	 LYXGJdvPjhQWHEwS3XhZ384B5gtWd3dkVUAN7AqzEt1LQ0kp/OUgCZLNKJH2iu7OoZ
	 bYD/qBIgI57Wg==
Date: Mon, 13 Jan 2025 09:26:02 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, FUKAUMI Naoki <naoki@radxa.com>, 
 Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 Chukun Pan <amadeus@jmu.edu.cn>, Dragan Simic <dsimic@manjaro.org>
To: Junhao Xie <bigfoot@classfun.cn>
In-Reply-To: <20250112073344.1976411-1-bigfoot@classfun.cn>
References: <20250112073344.1976411-1-bigfoot@classfun.cn>
Message-Id: <173678159607.2153021.5826282359797453753.robh@kernel.org>
Subject: Re: [PATCH v6 0/3] Add support for Ariaboard Photonicat RK3568
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_072605_441011_75A6772C 
X-CRM114-Status: GOOD (  17.91  )
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


On Sun, 12 Jan 2025 15:33:41 +0800, Junhao Xie wrote:
> Add dts for Ariaboard Photonicat RK3568.
> 
> This series bring support for:
> * Debug UART
> * SDIO QCA9377 WiFi and Bluetooth
> * M.2 E-Key PCIe WiFi and Bluetooth
> * M.2 B-Key USB Modem WWAN
> * Ethernet WAN Port
> * MicroSD Card slot
> * eMMC
> * HDMI Output
> * Mali GPU
> * USB Type-A
> 
> Changed from v1:
> - move some general nodes (firmware, ramoops, reboot-mode) to rk356x.dtsi
> - gmac1 change to phy-mode rgmii-id
> - corrected some regulator to be closer to schematics
> - rename rk3568-ariaboard-photonicat.dts to rk3568-photonicat.dts
> https://lore.kernel.org/lkml/20240904111456.87089-1-bigfoot@classfun.cn/
> 
> Changed from v2:
> - remove unused headers
> - corrected some regulator to be closer to schematics
> - remove usb_host1_ohci, usb_host1_ehci, usb2phy1_host that have no connection
> https://lore.kernel.org/lkml/20240906045706.1004813-1-bigfoot@classfun.cn/
> 
> Changed from v3:
> - corrected some regulator to be closer to schematics
> - changed to using clk32k_out1 in xin32k
> https://lore.kernel.org/lkml/20240911122809.1789778-2-bigfoot@classfun.cn/
> 
> Changed from v4:
> - corrected some regulator to be closer to schematics
> - corrected some label to match node name
> - use resets props in phy node instead deprecated snps,reset-gpio
> https://lore.kernel.org/lkml/20240914145549.879936-1-bigfoot@classfun.cn/
> 
> Changed from v5:
> - resort regulator nodes
> - remove dr_mode from usb_host1_xhci
> https://lore.kernel.org/lkml/20241108031847.700606-1-bigfoot@classfun.cn/
> 
> Junhao Xie (3):
>   dt-bindings: vendor-prefixes: Add prefix for Ariaboard
>   dt-bindings: arm: rockchip: Add Ariaboard Photonicat RK3568
>   arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../boot/dts/rockchip/rk3568-photonicat.dts   | 599 ++++++++++++++++++
>  4 files changed, 607 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
> 
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250112073344.1976411-1-bigfoot@classfun.cn:

arch/arm64/boot/dts/rockchip/rk3568-photonicat.dtb: bluetooth: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/rockchip/rk3568-photonicat.dtb: phy@fe8c0000: 'phy-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
arch/arm64/boot/dts/rockchip/rk3568-photonicat.dtb: rfkill-modem: 'reset-gpios' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/net/rfkill-gpio.yaml#






