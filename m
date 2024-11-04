Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346D1CFB422
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 15:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LaS+UAbD2NQi4/VFBkN1vyDe3/hcjlkPt6NiUe3eKd4=; b=YDrhrAisbwUIqRW1bqOrxtXnAa
	Mgl3+lXj1NTUFI5cAjIIncT4rvYILTBOfP24WLNkN9rMjOq6Kerb8jnItcHJjmdLqLK6D4Y2IuhRL
	IWXhTdfZtFQFIWK01plTDQ2l2iGXFF6rjB4DNptTBblTFCyQmDFPbxEbjfz/RwhBvbfSoor9jXRWy
	LuyIg97VCey4QjP3UJmsg3MIjIp4A7X/M9rSIPd3vNi3qIEw7XyDbt1gO/WDGuVAtq7Q06xNevuIm
	/Ofgs/JH2WY+2v12AEA/QcsVNFqIi/XfDl/f7ek+V70P0ctvtweN2ofv0OlGJjMadLAlwcUV13F0+
	hJqVk/9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zMS-0000000EGry-0sJn;
	Mon, 04 Nov 2024 15:51:24 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zHx-0000000EG6M-2GOJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 15:46:46 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1t7zHm-00081r-Qh; Mon, 04 Nov 2024 16:46:34 +0100
Message-ID: <97aacb17-675f-451d-9908-dfac409c015c@pengutronix.de>
Date: Mon, 4 Nov 2024 16:46:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] ARM: dts: imx6sl: Provide a more specific lcdif
 compatible
To: Fabio Estevam <festevam@gmail.com>, shawnguo@kernel.org
Cc: marex@denx.de, andreas@kemnade.info, kernel@pengutronix.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@denx.de>
References: <20241101135406.47836-1-festevam@gmail.com>
 <20241101135406.47836-3-festevam@gmail.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20241101135406.47836-3-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_074645_612865_65B78ABB 
X-CRM114-Status: GOOD (  18.22  )
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

On 01.11.24 14:54, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The LCDIF IP on i.MX6SL and i.MX6SLL is compatible with i.MX6SX.
> 
> Provide a more specific "fsl,imx6sx-lcdif" compatible and still keep
> "fsl,imx28-lcdif" for DT compatibility.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Thank you,
Ahmad

> ---
> Changes since v3:
> - None.
> 
>  arch/arm/boot/dts/nxp/imx/imx6sl.dtsi  | 3 ++-
>  arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
> index 6aa61235e39e..840e19b2ca0f 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
> @@ -773,7 +773,8 @@ epdc: epdc@20f4000 {
>  			};
>  
>  			lcdif: lcdif@20f8000 {
> -				compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
> +				compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif",
> +					     "fsl,imx28-lcdif";
>  				reg = <0x020f8000 0x4000>;
>  				interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clks IMX6SL_CLK_LCDIF_PIX>,
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
> index 85fe2a4ab97a..eff83f5e5535 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
> @@ -648,7 +648,8 @@ pxp: pxp@20f0000 {
>  			};
>  
>  			lcdif: lcd-controller@20f8000 {
> -				compatible = "fsl,imx6sll-lcdif", "fsl,imx28-lcdif";
> +				compatible = "fsl,imx6sll-lcdif", "fsl,imx6sx-lcdif",
> +					     "fsl,imx28-lcdif";
>  				reg = <0x020f8000 0x4000>;
>  				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clks IMX6SLL_CLK_LCDIF_PIX>,


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

