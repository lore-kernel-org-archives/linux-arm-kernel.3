Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B5CC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 12:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+sTAz6dqyxPYftC9u0HB4/K7kVqtaa/p/1ZD4PoAEU=; b=yiMVp3im8iyA8R1maQET8Cngae
	nGlQq4VwiX9cCyqwk4UAsvrPkF8pnhBeX4QRrvqmQ8zTr46E+/AJ2zEEEm7bWYCoX6xNP5GUutrS2
	VeBoDSoI9dsN+dGsb+Y8JAmlvgP1CTyJpGPn2rYJ3Q//fxcWxHW/5XO92uEHUMK/bImooNE7HR+Wi
	hfTJB8aQSpOVhhi75GO7p6biMVDobAC15Qp3518PjF8Jm5cywElsU2bRmoG3iIsZTCYdlz3sm8b+P
	nqM4iPawS0KrH4KTnB4bFZm/23gt67gFfAaQXjt4nSbSdQiDi3xKGvOM6Hjy4zvo1yxxw5LjcUBaR
	az2QnQbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFPf-0000000C9T5-0IsT;
	Thu, 20 Mar 2025 12:54:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFNx-0000000C9NV-2Xz0;
	Thu, 20 Mar 2025 12:52:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=H+sTAz6dqyxPYftC9u0HB4/K7kVqtaa/p/1ZD4PoAEU=; b=p3
	bf7TTSFQTd36LRDyhoubAWAFz+dcsRa8w0/WSfTJAl5bMm0PQVksnXDxhTlHIIqG9HqEOxhcT+ShU
	wNTb4JHyVQB+x8L2AHsvwXAq/dxvGqJytoYognUFgIBTpZwiGrJzPv52A6vC3SHAkifgP+MgAvpGT
	xSJpVyyvqGFGlOg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tvFNo-006TXo-1G; Thu, 20 Mar 2025 13:52:24 +0100
Date: Thu, 20 Mar 2025 13:52:24 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add gmac phy reset GPIO
Message-ID: <4eaa58b6-72e2-4b83-ab82-500022c90461@lunn.ch>
References: <cover.1742331667.git.ukleinek@kernel.org>
 <49f66206fccc714a8745b9ac35247615ad5cc369.1742331667.git.ukleinek@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49f66206fccc714a8745b9ac35247615ad5cc369.1742331667.git.ukleinek@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_055233_641880_C1E30F68 
X-CRM114-Status: GOOD (  14.75  )
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

On Tue, Mar 18, 2025 at 10:08:46PM +0100, Uwe Kleine-König wrote:
> While looking through the vendor U-Boot code Heiko spotted that a SoC
> GPIO is connected to the ethernet phy's reset pin. Add the respective
> reset-gpios property with pinmuxing for the GPIO to the phy node.
> 
> Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
> ---
>  arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
> index 70e88769e21c..411f8ac7994b 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
> @@ -485,6 +485,10 @@ rgmii_phy0: ethernet-phy@3 {
>  		/* Motorcomm YT8521 phy */
>  		compatible = "ethernet-phy-ieee802.3-c22";
>  		reg = <0x3>;
> +		pinctrl-0 = <&eth_phy0_reset_pin>;
> +		pinctrl-names = "default";
> +		reset-assert-us = <10000>;
> +		reset-gpios = <&gpio0 RK_PC6 GPIO_ACTIVE_LOW>;

Sometimes a reset-deassert-us property is needed, in order to give the
PHY time to get ready. But i assume you have tested this with lots of
reboot.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

