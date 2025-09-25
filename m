Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69E4CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 16:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dO7rc3cmOaRYh8vW051GrFKq6chUM5fRR/SwUUFClf4=; b=i+gymtIM5cibWL/MeifwiTeBt2
	NILJ/zq6ihovRaAkgkbNBzj0BmNNgfZCyPoEUNEL/aMlCiM83Z9mT4frBGBdOi8P6R7YetQxXEeq9
	C/YPuBIU8LaZqJiomOcj9E8Q/nzJ/o8wTTYLwk+hT5cPYwxPkZIIaCyiTOWyQx7IeTthwKemztGYf
	/9w4lhMYX2/OxWgzYq0fq5Eis3iN01z4TRN9O/2fJrbI+gfNEvajzf0FgSMJGnQTi1FNQ7DdsRjuu
	taHaioQnpK+ZYn2E1gajUcX9rNSA4YlzgKIW7aW0p2GMS+D2hS0S6oUU65huOglQf8FTvpg+E5t9b
	nStEZlGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1pIZ-0000000BKaP-32Ye;
	Thu, 25 Sep 2025 16:58:27 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1pIW-0000000BKWp-21Lk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 16:58:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1758819500;
 bh=dO7rc3cmOaRYh8vW051GrFKq6chUM5fRR/SwUUFClf4=;
 b=U7aAdhsn/xeYG8Yk5Lj3BYUgR7p1Sx/688hAhRU6WXr9GzbW4vzYZIxM9GWQAbhGwSq4gaw/d
 ChNfJrQ2F8wmXovqY+9zYcdWpEzdKWsPqEPsOSWDXiuexIZyK6xiKPv9Yg52P3YStLZ6o+WGYSH
 9c5LocqPfPaZ830Ah6QlawpQFFLVnGshsrm5gZ+XKPoxylHDtH6dwh5z3u174cPwbAyUJUa/xAw
 CG/xCAvAZlsFeVUltoxAd30t+YupF0Hl1ces8VKbnAxASywUWtMr2Sxyn94LX1bgE28sbFZ1sPB
 Mjk6HjkQANSfqk3jUwmwbRF/dO2fRZIW60YFWAfAQA/w==
X-Forward-Email-ID: 68d574a2af9b5343f17d00e7
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.2.14
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <da752790-da17-4d26-b9b2-8240b38b3276@kwiboo.se>
Date: Thu, 25 Sep 2025 18:58:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] arm64: dts: rockchip: Fix the 1Ghz ethernet on Qnap
 TS433
To: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew@lunn.ch>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "ukleinek@debian.org" <ukleinek@debian.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>
References: <20250925092923.2184187-1-heiko@sntech.de>
 <20250925092923.2184187-3-heiko@sntech.de>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250925092923.2184187-3-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_095824_872309_4B5B5A1D 
X-CRM114-Status: GOOD (  28.42  )
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

Hi Heiko,

On 9/25/2025 11:29 AM, Heiko Stuebner wrote:
> While I want to remember that the dwmac on the TS433 was working at some
> point, it seems I had my network always connected to the 2.5G nic after
> that "point". And testing now revealed that the gmac does not actually
> manages to transfer data.
> 
> Currently the gmac is set to rgmii-id with no rx-/tx-delay values set
> which makes the driver use default values. Setting the delays to 0
> also does not provide a working interface.
> 
> The vendor kernel is running with phy-mode set to rgmii and delays of
>     tx_delay = 0x3c, rx_delay = 0x2f
> 
> As Andrew points out often, those delay values "are magic" and rgmii-id
> should definitly be used "with small values" for delays, if really needed.
> 
> The Rockchip vendor-kernel actually contains additional code in the dwmac
> driver to use the loopback function of a phy to find a window of usable
> delay values. Code can be found for example on [0] and the process is
> described in a document called "Rockchip GMAC RGMII Delayline Guide"
> which has made its way onto the internet in a lot of places [1].
> 
> So I used this process, with the interface set to rgmii-id to get values
> for this mode, which are in face lower than the ones for rgmii with
>     tx_delay = 0x21, rx_delay = 0x15
> and results in a working interface on the dwmac.
> 
> [0] https://github.com/armbian/linux-rockchip/blob/rk-6.1-rkr6.1/drivers/net/ethernet/stmicro/stmmac/dwmac-rk-tool.c
> [1] https://gitlab.com/firefly-linux/docs/-/blob/rk356x/firefly/Common/GMAC/Rockchip_Developer_Guide_Linux_GMAC_RGMII_Delayline_EN.pdf
> 
> Cc: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
> index 5656554ca284..e8af92a011d6 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
> @@ -257,6 +257,8 @@ &gmac0_tx_bus2
>  		     &gmac0_rx_bus2
>  		     &gmac0_rgmii_clk
>  		     &gmac0_rgmii_bus>;
> +	rx_delay = <0x15>;
> +	tx_delay = <0x21>;

I do not understand why defining rx/tx_delay would change anything.

Setting these should currently not have any effect on the driver code
when phy-mode=rgmii-id is used, see below (next-20250924, dwmac-rk.c):


	switch (bsp_priv->phy_iface) {
	case PHY_INTERFACE_MODE_RGMII:
		dev_info(dev, "init for RGMII\n");
		bsp_priv->ops->set_to_rgmii(bsp_priv, bsp_priv->tx_delay,
					    bsp_priv->rx_delay);
		break;
	case PHY_INTERFACE_MODE_RGMII_ID:
		dev_info(dev, "init for RGMII_ID\n");
		bsp_priv->ops->set_to_rgmii(bsp_priv, 0, 0);
		break;


I have played around with a few patches that changes this and apply the
rx/tx_delay for rgmii-id modes (both Linux and U-Boot), see top of [2]
for Linux patches. Will try to get them on ML in a few days.

Currently, rk3588-firefly-itx-3588j.dts is the only RK board that define
rx/tx_delay and use rgmii-id mode, would be good to not define any more
rgmii-id + rx/tx_delay combo to reduce impact of a possible future
driver change.

[2] https://github.com/Kwiboo/linux-rockchip/commits/next-20250924-rk3528/

Regards,
Jonas

>  	status = "okay";
>  };
>  


