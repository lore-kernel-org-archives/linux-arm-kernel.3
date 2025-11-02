Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304D7CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 23:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Dh4MjnM/X0zvsg+NP3sIOu5TtQj7JZoGJeg+OmIShg=; b=ziPaq8CM70PuePfEOZvzqw+nox
	/w11H5TY5so+7OuxpcFgX8ZETSzaZNrmOjJ+SditTw+xnAc5H38NITeAbe9xLN/bRVkdGt3lBdBTV
	Vsxsu2In4mnOR+BGuLXVH5JsOWDhjV/G6w2W2jCSKMJLTSam4K/8wcbwGVG+96r88LkG/tKYfHWmQ
	U67XTN6menqfHTdsAm+IjkRNSTMoi9sHLFfkJ/C/BAPcfCSylWLf92ZPx1UB5zR5jiu0Ul6BTno6o
	S6kr6tOP5C0R4nCMswD7+GlQhbcDWq3OBvQy2OZocCEs3rEOyHQCbdn3Xz+5/MVdr3D1fXR2iQjKT
	v8Z2unpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFh5V-00000008ucH-0d8y;
	Sun, 02 Nov 2025 23:02:17 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFh5S-00000008ubk-1jJ5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Nov 2025 23:02:15 +0000
Received: from pendragon.ideasonboard.com (82-203-160-149.bb.dnainternet.fi [82.203.160.149])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D35E71E2E;
	Mon,  3 Nov 2025 00:00:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762124419;
	bh=nZm+KO4+ZVuNc4gxK7tkO1KbJMk9/Tr67Ic5LCJjzF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K2eDJo9pQwFOmxXLCxfKT48xZOvC6SoDhjDn6pR+J5Ofi8Zlpv7dkpPpm1DxhyQy3
	 QVuvKTvyw2cfUBB9HVhNnDLP72N2bI0JEjHiXSOoFdvvffhOBUF5O1m7dVdmE67+jV
	 vltwYGu2sFTnnysEuPqwwyBJIublm9T9GboUkhk4=
Date: Mon, 3 Nov 2025 01:01:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: linux-media@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 13/13] arm64: dts: imx8mp: Specify the number of
 channels for CSI-2 receivers
Message-ID: <20251102230157.GA31427@pendragon.ideasonboard.com>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
 <20250822002734.23516-14-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250822002734.23516-14-laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_150214_593109_8D0A41C2 
X-CRM114-Status: GOOD (  14.55  )
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

Hi Shawn,

The DT bindings have been merged in v6.18, could you please pick this
patch for v6.19 ?

On Fri, Aug 22, 2025 at 03:27:33AM +0300, Laurent Pinchart wrote:
> The CSI-2 receivers in the i.MX8MP have 3 output channels. Specify this
> in the device tree, to enable support for more than one channel.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index bb24dba7338e..1e52840078df 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1764,6 +1764,7 @@ mipi_csi_0: csi@32e40000 {
>  				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_250M>,
>  							 <&clk IMX8MP_CLK_24M>;
>  				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_1>;
> +				fsl,num-channels = <3>;
>  				status = "disabled";
>  
>  				ports {
> @@ -1799,6 +1800,7 @@ mipi_csi_1: csi@32e50000 {
>  				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_250M>,
>  							 <&clk IMX8MP_CLK_24M>;
>  				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_2>;
> +				fsl,num-channels = <3>;
>  				status = "disabled";
>  
>  				ports {

-- 
Regards,

Laurent Pinchart

