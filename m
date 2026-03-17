Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4FDFB5E96
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 00:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uFg8XXcHtxFALcYZA+0V2jzBhaeA7BFfLpChxVZJYMw=; b=KmNxNujO65z38PgSWJVfW2LhXB
	5S76xDabpqNP4UjxnchdYO11geyE/qEjmh1LYs13XqMeY6dxZBezE2UQVxqpuVw+JQLfx85gwda7N
	lrvN/+s+VI+yNMR3BKMzHez0PqQsNYm/6KtqKU04P62zAKIC8DwNRdhg9afKRgya4PiHXaZsEUOAH
	0DJQpFTo1BdCfbY404DMXay3gf6K7U7+r/geQdIihnGwbV68q+BfCrMhIkMsqNw5vhOOGF78+7UpZ
	+0j4+k6sMVh7Y3sJIMJAKOCxuxLXOzH72cSAJuplup5m6b4w8uWTCbaqlMLHoflWTyXVQ3xXed55m
	FRhzkEHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2IPq-000000058rs-0TfB;
	Tue, 17 Mar 2026 00:36:10 +0000
Received: from mail-m1031.netease.com ([154.81.10.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2IPm-000000058qs-2AWC;
	Tue, 17 Mar 2026 00:36:08 +0000
Received: from [172.16.12.17] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 372d36eb6;
	Tue, 17 Mar 2026 08:35:52 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com
Subject: Re: [PATCH v2] arm64: dts: rockchip: Enable PCIe CLKREQ# for RK3588
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
References: <20260316073621.39027-1-linux.amoon@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <96d6664a-5d6d-64b3-1999-b15579ff1aa4@rock-chips.com>
Date: Tue, 17 Mar 2026 08:35:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20260316073621.39027-1-linux.amoon@gmail.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cf938725f09cckunma9077e0e407f16
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUweGlYZGBpOTRhNSBlKTU5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=cUT7gP9v69WpsBFTtIuAAaSFK2LHAQxbA+b2qLMh5V3b08DXBWksI99YAkTl4qAKFBFgbF3BMx24jBTLDkK4x7kJuBAzLSuzOJaLT4auWIChio3RSuJQwLnGfhpRvmREAh7bdr4wWNjm8e3D1rKTonbw4iTmRWLDThf3hVqLJdk=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=uFg8XXcHtxFALcYZA+0V2jzBhaeA7BFfLpChxVZJYMw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_173607_092466_F1BB3E7A 
X-CRM114-Status: GOOD (  16.34  )
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

在 2026/03/16 星期一 15:33, Anand Moon 写道:
> Add supports-clkreq and the corresponding pinmux configurations for PCIe
> ASPM L1 substates on the Rock 5B, 5B+ and 5T.
> The supports-clkreq flag informs the PCIe controller that the hardware
> routing for the CLKREQ# sideband signal is present. This enables support
> for PCIe ASPM (Active State Power Management) L1 substates, allowing for
> better power efficiency.
> 
> Cc: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> Rock5b schematics.
> [1]  https://dl.radxa.com/rock5/5b+/docs/hw/radxa_rock5bp_v1.2_schematic.pdf
> v2: drop the clkreq pinctrl for pcie3x4 as suggeested by Shwan Lin.
> [2] https://lore.kernel.org/all/20260311115502.7353-1-linux.amoon@gmail.com/
> ---
>   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> index b3e76ad2d8694..bf4a1d2e55ca3 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

Thanks.

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
> +	supports-clkreq;
>   	reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
>   	vpcie3v3-supply = <&vcc3v3_pcie2x1l2>;
>   	status = "okay";
> 
> base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
> 

