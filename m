Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35F2C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 06:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDZYvC9XeIag8lTUBEjZZTxKQxiAmDzTNazF7dhxIRs=; b=Opv5AUm4qBGLeVfomDRSL5GrfZ
	i9RX+xNddqPK8FNYlheIz4Xp72TRr4aVJfScUy5L4uwGHKZrdGJMezx0mAIxG7PDFTnZo8OKhb+Ny
	zisyxESjW3haV9bjLkDTqD6T6J91b0Wchv/3CqBeEmCER+PAdwv+Om8QCzPEQ1zLt2O5MkqRrMv5b
	KpMm2ySk7PBaZDTncTAXEOxuwCB1Li70IAxHyKwx8xZv7WLLeqfhHtmqecm87g536nAS5Jdtc09NT
	+zRp39O9FPUp1Y+F5CGd9nA8D8RS9KfKuKH3lUOGLJ5SD9tApGijO66RDNbR5AYOZNbLQfVcPmRxt
	ffjJwTuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLyDi-00000006nKw-1kNO;
	Mon, 02 Jun 2025 06:00:26 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLyBV-00000006nC4-3UE8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 05:58:11 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uLyBT-0004cf-Q8; Mon, 02 Jun 2025 07:58:07 +0200
Message-ID: <1214db7b-dc79-4a3a-a1cc-0b09b3216d30@pengutronix.de>
Date: Mon, 2 Jun 2025 07:58:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: imx8mp-nominal: Explicitly configure
 nominal VPU clocks
To: Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 aford@beaconembedded.com, m.felsch@pengutronix.de, imx@lists.linux.dev,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org
References: <20250530221713.54804-1-aford173@gmail.com>
 <20250530221713.54804-4-aford173@gmail.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20250530221713.54804-4-aford173@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_225809_877640_42C7AD35 
X-CRM114-Status: GOOD (  17.05  )
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

Hello Adam,

On 31.05.25 00:17, Adam Ford wrote:
> In preparation for increasing the default VPU clocks to overdrive,
> configure the nominal values first to avoid running the nominal
> devices out of spec when imx8mp.dtsi is changed.

Thanks for keeping imx8mp-nominal.dtsi users in mind.

> 
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Cheers,
Ahmad

> ---
>  .../boot/dts/freescale/imx8mp-nominal.dtsi     | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
> index 2ce1860b244d..f269f7a004fc 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
> @@ -89,4 +89,22 @@ &media_blk_ctrl {
>  			       <1039500000>;
>  };
>  
> +&vpu_g1 {
> +	assigned-clocks = <&clk IMX8MP_CLK_VPU_G1>;
> +	assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
> +	assigned-clock-rates = <600000000>;
> +};
> +
> +&vpu_g2 {
> +	assigned-clocks = <&clk IMX8MP_CLK_VPU_G2>;
> +	assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
> +	assigned-clock-rates = <500000000>;
> +};
> +
> +&vpumix_blk_ctrl {
> +	assigned-clocks = <&clk IMX8MP_VPU_PLL>, <&clk IMX8MP_CLK_VPU_BUS>;
> +	assigned-clock-parents = <0>, <&clk IMX8MP_VPU_PLL_OUT>;
> +	assigned-clock-rates = <600000000>, <600000000>;
> +};
> +
>  /delete-node/ &{noc_opp_table/opp-1000000000};


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

