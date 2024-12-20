Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9FEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 17:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9X0qkclU5mbquP6ylYtzaM4fEOUHkCHYMmtnsUqTWw=; b=wXT29jon2DDzNP4ypkvJlfAV7F
	tExK2YT5FQ0TMwOZPFP6TP+b1MaZEtT/NDd7S3x1SxwhlJyHZRkiJRrewJiHiqN+f5uKqjOVH0lRt
	iWMSz4NURy6Ku5QLSP/k/9AlSwKrPyIOF0sJjTkh3eWkDmMg2zyNj/ex18y7bZuSRATwZUdFaRlhC
	c9bo85JHxuI2ODX5McwUssg05vBUE4vEBbkw7U/fL0L2Y5wHMme+3AuCLz7cXC18xXQzuY/aOrXCa
	98jJTF28HQd4wdKS62G5/BYtto88kkcXN/0we2jUpgxHcahEFQK6IMsNodNT5ZoeAGQOjm1HV2IWZ
	YKO79U/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgmX-00000005dc1-2ZUB;
	Fri, 20 Dec 2024 17:27:22 +0000
Received: from smtp.forwardemail.net ([207.246.76.47])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgV3-00000005ZbM-2Wrh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 17:09:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1734714547;
 bh=j9X0qkclU5mbquP6ylYtzaM4fEOUHkCHYMmtnsUqTWw=;
 b=ERV/reus+X0XsltDz8CpJlVjJA4t0KqOdNI644uR6odjG6Z4GpqMc8OD/TPlt+7DhXslfUrOR
 jDWF1WXvYbGJYbtg1YzvfOkQU7xaG1n4nY0vifSGh9iPM1BvhCqkj6t+W/qWVIZUf1cJCprJOJo
 qAu2uhO0hG6elmJ/w4COShFRidj7awH7BbmrKALWTI1yqZT5ROLFXVAhBklUy++zuTbQ6/bIYE6
 1KIZgu+PFAHjBsRxBpFRBOEl/YYXJOkan9RHVI2tbSZlhLTjHqgsCxiCmV8j48xs2bz0SsskWFH
 eSYZefiFmU3S+YJ4MNYCCqFzv4QyE0PBYpNJU6IYFiBw==
Message-ID: <17251add-40b7-4d18-8626-2d74b29532fc@kwiboo.se>
Date: Fri, 20 Dec 2024 18:09:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: ROCK3B: Correct clock rates for
 Ethernet PHYs
To: Alicja Michalska <alicja.michalska@9elements.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241220163227.1501912-1-alicja.michalska@9elements.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20241220163227.1501912-1-alicja.michalska@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 207.246.76.47
X-ForwardEmail-ID: 6765a4b2b8c9120276e3dca1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_090917_790832_2B770F99 
X-CRM114-Status: GOOD (  19.72  )
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

Hi Alicja,

On 2024-12-20 17:32, Alicja Michalska wrote:
> Built-in ethernet PHYs did not work on mainline kernel:
> 
> fe010000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
> fe010000.ethernet eth0: __stmmac_open: Cannot attach to PHY

Have you used mainline or vendor u-boot when testing?

There is an existing issue with RTL8211F PHYs that they must be reset
before Linux can identify them, see [1] for more details on the issue.

Mainline U-Boot will reset the Ethernet PHYs on this board and that
should allow for Linux to identify and use the Ethernet PHYs.

[1] https://lore.kernel.org/r/47d55aca-bee6-810f-379f-9431649fefa6@kwiboo.se/

> 
> According to the board design, they need to be configured as output with
> static TX/RX delay. This patch sets it accordingly.
> 
> Signed-off-by: Alicja Michalska <alicja.michalska@9elements.com>
> ---
>  .../boot/dts/rockchip/rk3568-rock-3b.dts      | 68 +++++++++++--------
>  1 file changed, 38 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> index 3d0c1ccfaa79..5350158302e4 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> @@ -183,37 +183,65 @@ &cpu3 {
>  &gmac0 {
>  	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
>  	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>, <&cru CLK_MAC0_2TOP>;
> -	clock_in_out = "input";
> -	phy-handle = <&rgmii_phy0>;
> -	phy-mode = "rgmii-id";
> +	assigned-clock-rates = <0>, <125000000>;
> +	clock_in_out = "output";
>  	phy-supply = <&vcc_3v3>;
> +	phy-mode = "rgmii";
> +	phy-handle = <&rgmii_phy0>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&gmac0_miim
>  		     &gmac0_tx_bus2
>  		     &gmac0_rx_bus2
>  		     &gmac0_rgmii_clk
> -		     &gmac0_rgmii_bus
> -		     &gmac0_clkinout>;
> +		     &gmac0_rgmii_bus>;
> +	snps,reset-gpio = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
> +	snps,reset-active-low;
> +	snps,reset-delays-us = <0 20000 100000>;

The snps,reset props is deprecated and reset- props should be used in
the PHY node.

This also changes to use 20/100 ms delay instead of current 20/50ms
delay. If anything it could be changed to 20/80ms, I have only seen
datasheets for rtl8211f mention minimum 10 ms and minimum 30-76 ms.

> +
> +	tx_delay = <0x36>;
> +	rx_delay = <0x2d>;

Are you having issue with use of rgmii-id on your board?

> +
>  	status = "okay";
>  };
>  
>  &gmac1 {
>  	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
>  	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru CLK_MAC1_2TOP>;
> -	clock_in_out = "input";
> -	phy-handle = <&rgmii_phy1>;
> -	phy-mode = "rgmii-id";
> +	assigned-clock-rates = <0>, <125000000>;
> +	clock_in_out = "output";
>  	phy-supply = <&vcc_3v3>;
> +	phy-mode = "rgmii";
> +	phy-handle = <&rgmii_phy1>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&gmac1m1_miim
>  		     &gmac1m1_tx_bus2
>  		     &gmac1m1_rx_bus2
>  		     &gmac1m1_rgmii_clk
> -		     &gmac1m1_rgmii_bus
> -		     &gmac1m1_clkinout>;
> +		     &gmac1m1_rgmii_bus>;
> +	snps,reset-gpio = <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
> +	snps,reset-active-low;
> +	snps,reset-delays-us = <0 50000 150000>;

Same here, but now this is 50/150 ms?

> +
> +	tx_delay = <0x47>;
> +	rx_delay = <0x28>;

Same here, is use of rgmii-id causing issues on your boards?

> +
>  	status = "okay";
>  };
>  
> +&mdio0 {
> +	rgmii_phy0: ethernet-phy@0 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0>;

The phy addr used for these boards is 0x1.

> +	};
> +};
> +
> +&mdio1 {
> +	rgmii_phy1: ethernet-phy@0 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0>;

Same here.

> +	};
> +};

There should be no need to move these nodes, they should already be in
alphabetical order?

> +
>  &gpu {
>  	mali-supply = <&vdd_gpu>;
>  	status = "okay";
> @@ -512,26 +540,6 @@ &i2s1m0_sdi0
>  	status = "okay";
>  };
>  
> -&mdio0 {
> -	rgmii_phy0: ethernet-phy@1 {
> -		compatible = "ethernet-phy-ieee802.3-c22";

If you want to use vendor u-boot you can probably change this to
"ethernet-phy-id001c.c916".

> -		reg = <1>;
> -		reset-assert-us = <20000>;
> -		reset-deassert-us = <50000>;
> -		reset-gpios = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
> -	};
> -};
> -
> -&mdio1 {
> -	rgmii_phy1: ethernet-phy@1 {
> -		compatible = "ethernet-phy-ieee802.3-c22";

Same here.

Regards,
Jonas

> -		reg = <1>;
> -		reset-assert-us = <20000>;
> -		reset-deassert-us = <50000>;
> -		reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
> -	};
> -};
> -
>  &pcie2x1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pcie20m1_pins>;


