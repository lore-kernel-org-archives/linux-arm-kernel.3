Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E96C55822
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 18:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48pATyxGPcKiHdKzUijPovZ+zH3w+9sc05TXmUj+Rdw=; b=Z37IwOoFS4KPC1Gte52QhlsCJ0
	Qt9dbj7Rez//mwd2MFEZUtfxdZfpLJV1P3BpFA+YqfM3qGpETc7xy7SrmCpEIcGlCr/A2SQuWf2k3
	oL7LQQa8Nadiwi5MRKPTOtqrjq5STDVQy/zfY+UYYJLLjTX4RBaSNCdUz6kHqp04c+mj1dpngWzZT
	XNN1COmRC9AUfp+9lowzoVeCuKv4DptQr84rbuHw0TgAJkZuNkMl4Xx0AuhwKW9hSfh85TKuIJ4PT
	HhFBybjXRmr64nuERtUvj+vypPuGcNbsBwZeRZASYT6U/crbH50wVvX83P50UyC9HdqHDeVuL6qah
	vJxZqu3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqxD5-00000000MKW-0eou;
	Mon, 03 Aug 2026 18:16:23 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqxD2-00000000MJj-2Sv7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 18:16:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1785780978;
 bh=48pATyxGPcKiHdKzUijPovZ+zH3w+9sc05TXmUj+Rdw=;
 b=zx5wiBTYpLAx6gOGXGq+4rLbOFe7MOr6VYHA6xYI5s0Q8ul2Lf936aRiq+AQeTuKKIrHDsih/
 lP1uv3aZLAICidhtUDkvaxfShcIeJMqA4PezuMi+bALh6VsgkcFlesawrf4uMwTMTMaiFriw6YX
 S4KTlhrHSHbS7WW5FP2O35pscWL+m2wdXOXEjUTKXqSdiFD2NYA4P7UOuTPqQqfM7Hmx1+RiXqq
 5LoYPqsCtunqjMCAg6rn//t6+LsILxoZbSCrmJTgTWesW7qTevbqWLPsHdmIdfJyK35CUsI2kLI
 DTEntGVsbHMoV1O6TLQety/TFy2OOVd1FJPOQXRdvC1Q==
X-Forward-Email-ID: 6a70daef13b6196e87497e5f
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.13.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <1e8da54f-ef87-4d31-9a0a-17c0ff66bee0@kwiboo.se>
Date: Mon, 3 Aug 2026 20:16:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] arm64: dts: rockchip: H28K: release RTL8211F reset
 before MDIO probing
To: Zhyi <zyheihei_123@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Chukun Pan <amadeus@jmu.edu.cn>
References: <20260803104646.26836-1-zyheihei_123@163.com>
 <178577533421.26919.15449256732994709630.h28k-rfc-v2@163.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <178577533421.26919.15449256732994709630.h28k-rfc-v2@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_111620_680699_B6990867 
X-CRM114-Status: GOOD (  26.85  )
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

Hi Zhyi,

On 8/3/2026 6:42 PM, Zhyi wrote:
> arm64: dts: rockchip: H28K: release RTL8211F reset before MDIO probing
> 
> On the HINLINK H28K (RK3528), the RTL8211F reset line (gpio4 RK_PC2,
> pin 146) is left unconfigured at power-on and reads low, holding the
> PHY in reset. The PHY node's reset-gpios are only acted upon after the
> PHY has been found on MDIO (fwnode_mdiobus_register_phy() reads the
> PHY ID before it requests and toggles the reset GPIO), so the first
> probe deadlocks and eth0 never gets a link:
> 
>     mdio_bus stmmac-0: MDIO device at address 1 is missing.
>     rk_gmac-dwmac ffbe0000.ethernet eth0: cannot attach to PHY
>     (error: -ENODEV)
> 
> Move the reset to the MDIO bus level: mdiobus_register() asserts and
> releases the bus reset-gpios before scanning the bus, so the PHY is
> out of reset when its ID is read. The PHY node no longer declares
> reset-gpios for the same GPIO (a second consumer would be rejected
> with -EBUSY).
> 
> Fixes: 145d4af4b204 ("arm64: dts: rockchip: Add HINLINK H28K")
> Signed-off-by: Zhyi <zyheihei_123@163.com>
> Assisted-by: Codex:gpt-5
> ---
> Changes in v2:
> - The root-cause analysis and this fix were developed with the
>   assistance of an AI coding assistant (Codex, GPT-5). The resulting
>   DTS change is minimal and the hardware validation was done by a
>   human on a stock HINLINK H28K board.
> - This v2 supersedes the accidental duplicate of my v1 RFC sent from
>   my Outlook address (Message-ID:
>   SJ2PR04MB851017E50140354C2F5B3FF3B5D52@SJ2PR04MB8510.namprd04.prod.outlook.com);
>   apologies for the duplicate.
> - Use the standard MDIO bus reset properties (mdio.yaml reset-gpios,
>   reset-delay-us, reset-post-delay-us) instead of the deprecated
>   snps,reset-gpios on the MAC node, as suggested by Andrew Lunn.
> - The PHY ID is not hardcoded, so boards populated with either the
>   RTL8211F or the YT8531 work unchanged (as noted by Chukun Pan).
> - Thanks to Andrew Lunn and Chukun Pan for the review feedback.
> - Validated on the stock HINLINK H28K board with Linux 7.1.5:
>   eth0 shows "PHY [stmmac-0:01] driver [RTL8211F Gigabit Ethernet]"
>   and phy_id 0x001cc916; both eth0 (GMAC) and eth1 (PCIe RTL8111H)
>   work.
> - The U-Boot side (generic RK3528 DT does not configure the reset
>   line) is out of scope for this DTS fix and may be addressed
>   separately.
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts b/arch/arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts
> index 0ec50e9..7ba3fa4 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts
> @@ -200,14 +200,14 @@
>  };
>  
>  &mdio1 {
> +	reset-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
> +	reset-delay-us = <20000>;
> +	reset-post-delay-us = <100000>;

This is not really a correct description of the hardware. The GPIO4_C2
pin is used for PHY reset, not to reset the MDIO bus. The device tree
should describe hardware, not be used to workaround issues in software.
Please see [1] for my prior analysis of this software issue.

Please add the rk3528-hinlink-h28k board as a target in mainline U-Boot
using the board specific device tree. That should help reset the
Ethernet PHY before Linux is started and solve your issue, as Chukun Pan
already suggested.

[1] https://lore.kernel.org/linux-rockchip/47d55aca-bee6-810f-379f-9431649fefa6@kwiboo.se/

Regards,
Jonas

>  	rgmii_phy: ethernet-phy@1 {
>  		compatible = "ethernet-phy-ieee802.3-c22";
>  		reg = <0x1>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&gmac1_rstn_l>;
> -		reset-assert-us = <20000>;
> -		reset-deassert-us = <100000>;
> -		reset-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
>  	};
>  };
>  
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


