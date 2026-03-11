Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06891062889
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 12:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iUYM2B+qv2inDj3WitR8Iuse9o1Siv8UF7Rqo5SG/P4=; b=nUu3pl/h6ajgsk7H//6h+5+Eh/
	RpDd0shSyWGaZrSbts1Olx0NPzPbu34tVjtSOnr7R7X2iQ7xUEwS8/+TqAITrXbS08y058I6z0T/F
	T5qm5Xq7OhIaPWuxF+KBAWE5EKKFFsI32XVa5MBaUk4DwerHWGQeiypeiYE4eZ/TIB7KrSFMuDWGt
	EAp35y7dyF8tr4txZmZhYsEnjGGhj+nmYgMw3dk6doBnvU4yycfhN+U+ZCT61kTweBtqkdOTa0I1A
	I2Jkb4v+PGv+SEpgTxAiLywqZEpez1MpxVZLsZpC5BYURjcwKnDKjik0MpWPLo2KDiOBOrFxo5+x+
	1JBbD2SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0IeR-0000000BYhS-03GE;
	Wed, 11 Mar 2026 12:26:59 +0000
Received: from mail-m3279.qiye.163.com ([220.197.32.79])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0IeN-0000000BYgn-14Z9;
	Wed, 11 Mar 2026 12:26:58 +0000
Received: from [172.16.12.17] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3690f1e4f;
	Wed, 11 Mar 2026 20:26:39 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com
Subject: Re: [PATCH v1] arm64: dts: rockchip: Enable PCIe CLKREQ# for RK3588
 on Rock 5b-5bp-5t series
To: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 FUKAUMI Naoki <naoki@radxa.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260311115502.7353-1-linux.amoon@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <cc922ebf-9221-00f8-e951-903c97d24f20@rock-chips.com>
Date: Wed, 11 Mar 2026 20:26:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20260311115502.7353-1-linux.amoon@gmail.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cdcdd0ba109cckunm09c8cc8ab954
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxgZSlYdSxpISh1LTB1PT01WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=IQUVnrCsWYuho2lAfthZKL7Tx1mLOdYa2UM6uQxSpFDizuhj5MMFCWy7hk+dGUUxUUWaqnKPshtkP+u/hNQdQV6byz/osrnoW38z6uqZsakvA7mHOwR3dPnFkNBvPO+wwZbzHh7Z/y8o7uhuPrmKRId2rLj+N3ADyvqKuOGnJJ8=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=iUYM2B+qv2inDj3WitR8Iuse9o1Siv8UF7Rqo5SG/P4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_052656_664158_7CBC07F5 
X-CRM114-Status: GOOD (  20.16  )
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

在 2026/03/11 星期三 19:54, Anand Moon 写道:
> Add supports-clkreq and the corresponding pinmux configurations for PCIe
> ASPM L1 substates on the Rock 5B, 5B+, and 5T.
> The supports-clkreq flag informs the PCIe controller that the hardware
> routing for the CLKREQ# sideband signal is present. This enables support
> for PCIe ASPM (Active State Power Management) L1 substates, allowing for
> better power efficiency.
> 
> Cc: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---

It would be better if you could put the link to the schematic here(under
"---") for folks easy to review. I paste it here for reference：

https://dl.radxa.com/rock5/5b+/docs/hw/radxa_rock5bp_v1.2_schematic.pdf

>   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> index b3e76ad2d869..668b19c05f7e 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> @@ -468,7 +468,8 @@ map1 {
>   
>   &pcie2x1l0 {
>   	pinctrl-names = "default";
> -	pinctrl-0 = <&pcie2_0_rst>;
> +	pinctrl-0 = <&pcie2_0_rst>, <&pcie30x1m1_0_clkreqn>;
> +	supports-clkreq;
>   	reset-gpios = <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
>   	vpcie3v3-supply = <&vcc3v3_pcie2x1l0>;
>   	status = "okay";
> @@ -476,7 +477,8 @@ &pcie2x1l0 {
>   
>   &pcie2x1l2 {
>   	pinctrl-names = "default";
> -	pinctrl-0 = <&pcie2_2_rst>;
> +	pinctrl-0 = <&pcie2_2_rst>, <&pcie20x1m0_clkreqn>;

Isn't it m1(PCIE20_1_2_CLKREQn_M1_L in the schematic)?

> +	supports-clkreq;
>   	reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
>   	vpcie3v3-supply = <&vcc3v3_pcie2x1l2>;
>   	status = "okay";
> @@ -488,7 +490,8 @@ &pcie30phy {
>   
>   &pcie3x4 {
>   	pinctrl-names = "default";
> -	pinctrl-0 = <&pcie3_rst>;
> +	pinctrl-0 = <&pcie3_rst>, <&pcie30x4m1_clkreqn>;

The pin is correct but I don't think it would support
L1 substates because the refclk is out of control. For
any refclk coming from external clock generator, clkreq#
should connect to the enable pin of the clock generator.

> +	supports-clkreq;
>   	reset-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
>   	vpcie3v3-supply = <&vcc3v3_pcie30>;
>   	status = "okay";
> 
> base-commit: b29fb8829bff243512bb8c8908fd39406f9fd4c3
> 

