Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0D5CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 21:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1b6HQppxLWXEYQG/mzzRjuSGf9TO9N0vqMhm+H8UvY=; b=aBZ4sK81RscS3Llz26Ccwfkcbp
	mQMHkv/tBpkkQITHVv9EmLVx8WvGahL4HByGseLIlyIe2/qo/1jIQ5AdJk9f1ep2xE7iSWFZSwnGa
	knh0ToZjfTM2CVU/67Q8I2ehX/+flAixzasFPDVyPMT27HmT8JaP1KmclU8G18vyqBI5HUBp0K7Kj
	keoz3qjkQ/TOfE/QuRZAMB/8th8iOTzsYbNtGkdhNXlm8ukSyhWEfpNgDzzc3MRYv2I1KtHQveED+
	SKfv/HcXX8vrKWUUP9WVsGLGd6okCbbGiRiVsU6oreFky1uguXPLRzcCEFtqihjZZXzQKFdxqq3BN
	D3Pyd6IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTVc-0000000FKYv-2JGY;
	Sun, 04 Oct 2026 21:12:36 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTVY-0000000FKYJ-415S;
	Sun, 04 Oct 2026 21:12:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=y1b6HQppxLWXEYQG/mzzRjuSGf9TO9N0vqMhm+H8UvY=; b=zoy5ZLLh9BmbE/V3lUHsRF7Zte
	t6bYy8nc/Kc226QFCVZJp6qh1/NcSo+XglbSoVkY6QhwB4kjti3L7omn//jlu5WU1V6BsalIMt9Pt
	YiYflDyaBt+VCLuI+0X7CiJaAQFztNYIPv5YGRZXWJrPB13/mTl2iKa4dmBvL/0z94Dk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xDTVO-008wUB-T0; Sun, 04 Oct 2026 23:12:22 +0200
Date: Sun, 4 Oct 2026 23:12:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: BG9OXA <bg9oxa@163.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2
Message-ID: <596745ab-8f98-4e5b-9105-3215a46780a4@lunn.ch>
References: <20261001-b4-quarkpi-ca2-v5-0-e19296802978@163.com>
 <20261001-b4-quarkpi-ca2-v5-2-e19296802978@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-b4-quarkpi-ca2-v5-2-e19296802978@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_141233_009913_757C0F1F 
X-CRM114-Status: GOOD (  13.00  )
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

On Thu, Oct 01, 2026 at 11:19:47PM +0800, BG9OXA wrote:
> The QuarkPi-CA2 is an RK3588S based single board computer with LPDDR4X
> RAM, eMMC, microSD, one Gigabit Ethernet port (YT8531 PHY), HDMI 2.1,
> DisplayPort over USB-C, M.2 PCIe 2.0 x1, USB 2.0 and 3.0 host ports,
> an ES8388 audio codec with headphone amplifier, a MIPI CSI camera
> connector, an IR receiver, a PWM controlled fan, ADC keys and a 40-pin
> GPIO header.
> 
> The GbE MAC receives its reference clock from the PHY, and the PHY keeps
> its clock output enabled while the link is down so that the MAC can be
> initialised.
> 
> The MDIO bus is described with separate mdio and mdio-child nodes, and
> the RK3588S RGMII delays are applied on the MAC side (tx_delay).
> 
> Signed-off-by: BG9OXA <bg9oxa@163.com>

I assume BG9OXA is a radio call sign. So it is unique, and nationally
assigned.

https://www.kernel.org/doc/html/latest/process/submitting-patches.html

says it needs to be "a known identity". I've no idea if a call sign
qualifies. Signed-off-by: is considered a legal statement....

> +&gmac1 {
> +	phy-mode = "rgmii-id";
> +	clock_in_out = "input";
> +
> +	snps,reset-gpio = <&gpio0 RK_PD5 GPIO_ACTIVE_LOW>;
> +	snps,reset-active-low;
> +	snps,reset-delays-us = <0 20000 100000>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac1_miim
> +		     &gmac1_tx_bus2
> +		     &gmac1_rx_bus2
> +		     &gmac1_rgmii_clk
> +		     &gmac1_rgmii_bus
> +		     &gmac1_clkinout>;
> +
> +	phy-handle = <&rgmii_phy1>;
> +	status = "okay";
> +};
> +
> +&mdio1 {
> +	rgmii_phy1: ethernet-phy@1 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0x1>;
> +
> +		motorcomm,clk-out-frequency-hz = <125000000>;
> +		motorcomm,keep-pll-enabled;
> +	};
> +};

For these two nodes only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

