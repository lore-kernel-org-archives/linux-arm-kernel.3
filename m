Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012ECCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 07:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65Ke+bDzyxA3FZ+uJntN1eamxu+tv80h0iEtRxVAgzg=; b=zzIVMHleT4WeXK6WadgWTkYcNo
	WbWj2PtiHo4/D4ky5mOCbSmnDRp/590wnsXnvfQ6wMVz/jXgQETsR68pbH7AkujhhbpLJL09CQWIz
	zUCXv6WjEDEaNDV2fRgky0BN/1/82ilRVCChaHPyDoRBypHLhU7fgfcAotS5thVjmlWNAmkNXQBb5
	G9upjlEIvhoxblaRpNFmZ5HgGzjuqQhtwcTK/S8vzF8b5QzQ26mQdWsqXhMDspkL4oGTo9mdYaSK+
	KMCYJUpmbn3x0lNP3xlZpN75bID3L6FvTgiRqF0P5XuK65rKQiHaRDWDqdrivtAwrcoxvS9MTRA74
	SPaM2ETw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uti70-00000005C8J-0YuI;
	Wed, 03 Sep 2025 07:40:58 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthw7-000000055xh-2HMN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 07:29:44 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uthvA-0003pQ-KJ; Wed, 03 Sep 2025 09:28:44 +0200
Message-ID: <fa7e2cef-5242-4f3b-84ea-d77b959f6bdb@pengutronix.de>
Date: Wed, 3 Sep 2025 09:28:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: imx6ul-tx6ul: Switch away from deprecated
 `phy-reset-gpios`
To: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <csokas.bence@prolan.hu>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 Csaba Buday <buday.csaba@prolan.hu>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250815-b4-tx6ul-dt-phy-rst-v1-1-9b65e315d9d3@prolan.hu>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20250815-b4-tx6ul-dt-phy-rst-v1-1-9b65e315d9d3@prolan.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_002943_583958_5C011782 
X-CRM114-Status: GOOD (  23.03  )
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

Hello,

On 15.08.25 17:17, Bence Csókás wrote:
> The Ethernet PHY's reset GPIO should be specified in the node of the PHY
> itself, instead of the MAC (`fec`). The latter is deprecated, and was an
> i.MX-specific extension, incompatible with the new reset controller
> subsystem.

One reason to do it this way is that the PHY is in reset when the OS starts
and the external phy-reset-gpios allows MAC probe to get the PHY out of
reset, so it can be probed after reading its vendor/device IDs.

Does switching to this new binding address this scenario? If so, it should
be noted in the commit message.

> 
> Co-developed-by: Csaba Buday <buday.csaba@prolan.hu>
> Signed-off-by: Csaba Buday <buday.csaba@prolan.hu>
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
> ---
>  arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> index f053358bc9317f8447d65013a18670cb470106b2..0a5e90704ea481b0716d6ff6bc6d2110914d4f31 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> @@ -246,7 +246,6 @@ &fec1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_enet1 &pinctrl_enet1_mdio &pinctrl_etnphy0_rst>;
>  	phy-mode = "rmii";
> -	phy-reset-gpios = <&gpio5 6 GPIO_ACTIVE_LOW>;
>  	phy-supply = <&reg_3v3_etn>;
>  	phy-handle = <&etnphy0>;
>  	status = "okay";
> @@ -262,6 +261,13 @@ etnphy0: ethernet-phy@0 {
>  			pinctrl-0 = <&pinctrl_etnphy0_int>;
>  			interrupt-parent = <&gpio5>;
>  			interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
> +			/* Reset SHOULD be a PHY property */

Comment belongs into commit message.

> +			reset-names = "phy";
> +			reset-gpios = <&gpio5 6 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <100>;
> +			reset-deassert-us = <25000>;
> +			/* Energy detect sometimes causes link failures */
> +			smsc,disable-energy-detect;

Unrelated change not described in the commit message.

Cheers,
Ahmad

>  			status = "okay";
>  		};
>  
> 
> ---
> base-commit: 0cc53520e68bea7fb80fdc6bdf8d226d1b6a98d9
> change-id: 20250815-b4-tx6ul-dt-phy-rst-7afc190a6907
> 
> Best regards,


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

