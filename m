Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7FCC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 16:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+6lr/pPi93ViD1mtcLJe9HUcVOwI1vvVV9tkgbbErQ=; b=aK/XkgvBjmk42xRzs2X4z1tiqM
	+hsxqAX6acMK33JABu6LN/jTw2JtE+cFrsB/YxFXcykAwwLn00z454RFq/JgPGoVmP2e7G4S/WMn5
	S3Dm8NkR95fFT3GdMEsgN7uAtDzP06iy1PvyT71tCiaUcri5WFj4uJuxFbnvUIyo7AFSkOW6nEUng
	DtU65jCin+QUnwO/UApRUgaoF9JgIMac1vays/w0fO3IKRHfjixNnT6aIqHp/DXnrVrdNB4yFtvZn
	oM5jG7Z5QjFMf0+kAMpIzn6YUs/eRocP4rvO46B8N9YKhIPnMWLsD8+X7thm/0LR86yAY17KIMAvj
	l8J3fGpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thWbF-00000000VUI-2cZD;
	Mon, 10 Feb 2025 16:25:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thWYU-00000000Uop-0j8L;
	Mon, 10 Feb 2025 16:22:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E1B11A41971;
	Mon, 10 Feb 2025 16:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A98C4CED1;
	Mon, 10 Feb 2025 16:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739204561;
	bh=kXnRrtpV39SwJ3fcBvjLSZwpqpYLRosn3Kr11L23x3o=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=hWAtW1hLKsWoLontOWKvHpdOmEO2IITitGT0NfFAEuB4r47VAG76FSqoR2ZWk8vN3
	 P9SyUYgzsYXdvUBdZzbZMFyTTDYvyVnoQzWhAyFfu8Qn+jtCLqgnrfxP2A2xdbyb7u
	 nP6mhR18xxVbTAItzJtEWFVAsRcmqDBejL8nVr+KfFfNgCShUAzPTPbJEYE00yJsWk
	 JW76XLb0f0jt+vhg+Fk7owtwAOZ/YQ+ZM3mN6H4/66bm5/1bJfn5zjr/TKMoHeV0mW
	 /vndejKtUWHaAb4H9QL+O9LcV6VjnAAYCp4xjLALP6CG9ZtmDclPjaXwdzoANNPiOK
	 xBDMskEjK8Xng==
Date: Mon, 10 Feb 2025 10:22:40 -0600
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, huangtao@rock-chips.com, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, kever.yang@rock-chips.com, 
 devicetree@vger.kernel.org, jonas@kwiboo.se, heiko@sntech.de, 
 conor+dt@kernel.org
To: Elaine Zhang <zhangqing@rock-chips.com>
In-Reply-To: <20250208015757.27594-1-zhangqing@rock-chips.com>
References: <20250208015757.27594-1-zhangqing@rock-chips.com>
Message-Id: <173920411678.476525.17114471153567549022.robh@kernel.org>
Subject: Re: [PATCH v3 0/2] clk: rockchip: Fixed some incorrect commits
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_082242_343189_58BA1ACF 
X-CRM114-Status: GOOD (  11.56  )
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


On Sat, 08 Feb 2025 09:57:55 +0800, Elaine Zhang wrote:
> Change in V3:
> [PATCH v3 0/2]: As discussed in the email, assigned-clock-parents in DT.
> [PATCH v3 1/2]: Merge patches into one.
> 
> Change in V2:
> [PATCH v2 0/3]: NO change
> [PATCH v2 1/3]: Update commit message
> [PATCH v2 2/3]: Update commit message
> 
> Elaine Zhang (2):
>   ARM: dts: rockchip: assigned-clock-parents to SCLK_HDMI_PHY for
>     DCLK_VOP
>   arm64: dts: rockchip: Increase VOP clk rate on RK3328
> 
>  arch/arm/boot/dts/rockchip/rk322x.dtsi   |  2 ++
>  arch/arm64/boot/dts/rockchip/rk3328.dtsi | 10 ++++++----
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> --
> 2.17.1
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/rockchip/' for 20250208015757.27594-1-zhangqing@rock-chips.com:

arch/arm/boot/dts/rockchip/rk3228-evb.dtb: vop@20050000: assigned-clocks: [[2, 190]] is too short
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop.yaml#
arch/arm/boot/dts/rockchip/rk3228-evb.dtb: vop@20050000: 'assigned-clock-parents' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop.yaml#
arch/arm/boot/dts/rockchip/rk3229-xms6.dtb: vop@20050000: assigned-clocks: [[2, 190]] is too short
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop.yaml#
arch/arm/boot/dts/rockchip/rk3229-xms6.dtb: vop@20050000: 'assigned-clock-parents' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop.yaml#
arch/arm/boot/dts/rockchip/rk3229-evb.dtb: vop@20050000: assigned-clocks: [[2, 190]] is too short
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop.yaml#
arch/arm/boot/dts/rockchip/rk3229-evb.dtb: vop@20050000: 'assigned-clock-parents' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop.yaml#






