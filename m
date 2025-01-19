Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C427FC02183
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jan 2025 09:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Nn8k0teNFTxka8BR1o7+iPaNbCVsXSlBEh/pZkZiuo=; b=O7g4NdZQycWdZPRIN9aa0qBDJE
	sRvSHH4YWlYhC/0bHTlNUP0hyFLMW+dKpPx/+5q3FbgdEK0LbXEgULC7Wt2tQLQEzO9lyOAH/dYHl
	xQ7hQzia+RnyVfPBV0AYjDxGQtBTXkNLA92YlSx1r3Zm3d+5H9MmUYj5H/POyp50vSpzyUR/AT57b
	1R99lf23VMeyW1gR37w66eW6Q6je+yMTTW3OmbgnemqG8k0hrMYIWlyaz4WTbhuW1IFv3asSZSRKT
	xDo43VfN6GPlyw+1Meupb+9ZPsJzb7SPNVaeFOWa6igzwsZWUI33ZXbfuSflar86UcFhcF/ql2uAQ
	r+OEcyVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZS24-00000003fSP-1IHn;
	Sun, 19 Jan 2025 09:55:52 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZS0l-00000003fMf-3maj;
	Sun, 19 Jan 2025 09:54:33 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1737280467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Nn8k0teNFTxka8BR1o7+iPaNbCVsXSlBEh/pZkZiuo=;
	b=drMt13D0mBESnIRSdJoKIs2O0Yvux4WeblsUGg/ncC6gnX7mJagQ9HKA9F4IhaoVe66RXa
	PPOyACc95t9F6FoFzbK5Rpp4+zK3q6zQKS7wZq8LQJ5Ao5ccS4s9n0vQG50Lbsa0DQ1vu6
	ptx2GlRV5jP+nIvuh6OiomR24kYjgG5/Qa2FHVuUjMKpS+bwJCceBbJuAuJPAZ29icgwH2
	JUuNdrJkFYya+hMGTZdI4FS91KqZpioJbsaINii8x3fjL/l9OlIofuSgjyc5lxb0yVqecv
	1koxFbDt0CQgueackgTuG1GJh7rVDDoX5OykF5hHI2PQTWTmwXBsprzNcvNv6A==
Date: Sun, 19 Jan 2025 10:54:26 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Tianling Shen <cnsztl@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jonas
 Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, Peter Geis
 <pgwipeout@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: change eth phy mode to rgmii-id for
 orangepi r1 plus lts
In-Reply-To: <20250119091154.1110762-1-cnsztl@gmail.com>
References: <20250119091154.1110762-1-cnsztl@gmail.com>
Message-ID: <ce15f141688c4c537ac3307b6fbed283@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_015432_246925_5D2F3F36 
X-CRM114-Status: GOOD (  16.05  )
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

Hello Tianling,

Thanks for the patch.  Please, see a comment below.

On 2025-01-19 10:11, Tianling Shen wrote:
> In general the delay should be added by the PHY instead of the MAC,
> and this improves network stability on some boards which seem to
> need different delay.
> 
> Fixes: 387b3bbac5ea ("arm64: dts: rockchip: Add Xunlong OrangePi R1 
> Plus LTS")
> Cc: stable@vger.kernel.org # 6.6+
> Signed-off-by: Tianling Shen <cnsztl@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts | 3 +--
>  arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts     | 1 +
>  arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi    | 1 -
>  3 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git
> a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
> b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
> index 67c246ad8b8c..ec2ce894da1f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
> @@ -17,8 +17,7 @@ / {
> 
>  &gmac2io {
>  	phy-handle = <&yt8531c>;
> -	tx_delay = <0x19>;
> -	rx_delay = <0x05>;
> +	phy-mode = "rgmii-id";

Shouldn't the "tx_delay" and "rx_delay" DT parameters be converted
into the "tx-internal-delay-ps" and "rx-internal-delay-ps" parameters,
respectively, so the Motorcomm PHY driver can pick them up and
actually configure the internal PHY delays?

>  	status = "okay";
> 
>  	mdio {
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts
> b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts
> index 324a8e951f7e..846b931e16d2 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts
> @@ -15,6 +15,7 @@ / {
> 
>  &gmac2io {
>  	phy-handle = <&rtl8211e>;
> +	phy-mode = "rgmii";
>  	tx_delay = <0x24>;
>  	rx_delay = <0x18>;
>  	status = "okay";
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
> index 4f193704e5dc..09508e324a28 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
> @@ -109,7 +109,6 @@ &gmac2io {
>  	assigned-clocks = <&cru SCLK_MAC2IO>, <&cru SCLK_MAC2IO_EXT>;
>  	assigned-clock-parents = <&gmac_clk>, <&gmac_clk>;
>  	clock_in_out = "input";
> -	phy-mode = "rgmii";
>  	phy-supply = <&vcc_io>;
>  	pinctrl-0 = <&rgmiim1_pins>;
>  	pinctrl-names = "default";

