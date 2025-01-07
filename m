Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1FAE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zkl+kOv8ByuZs/we/Zb5NNLc2fCz89sKm3EfDHeceZk=; b=UWoLrKY0nyOQsptQMmJ1DpxCrW
	LMa8LOssjEFpMk3BGGWoBpKDG3mTdppU1jXVzrFtfbmqACoWCHve6CE0XuheRBrIu2mncTnxn8yAv
	6cmJp77suvVNUQ2MFX8PZvhnnyVlRc7VRKjONctipC71LF5OzogkGf4mx2hgo0OVaNY7gI5FwfHhG
	Y62hJHbtEfWdGuWVhyAOZQh0EhsA1pWe4Px+6wZQx35Au/+wPbqDiI1DmAiJjkqzS/oWA2xRgxa+p
	yVm1eudPwG9AuH5n7/NBuDyhINRt7x0NBZ7T93o17HlkizMLMCBDf1ENjsLqC6OOaHFqTS00KLwfM
	HGhJ4Wzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6oB-00000004LJC-2Ycd;
	Tue, 07 Jan 2025 10:27:35 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6U5-00000004GRa-30Vm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 10:06:57 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA182675;
	Tue,  7 Jan 2025 11:05:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736244350;
	bh=QqSkUATka6qZ3THnYQjNaS1tgXdFm8leweOVniajL38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=alvwVcp6Sbwkq7axwKYZthiZVcon5np0R/z5lZcgVhz9slp/SfgJmBP5GfkU3iT6e
	 QrPFeMVqqBASNCvH+xBDdtM2WyFfeyidvwhDnqpoLAVHN8g6n4jqWRIN6GWic/HVMV
	 IAnfg3vsUy5mS3npiaaclMLnlTym/1D0Yf/Fyzf8=
Date: Tue, 7 Jan 2025 12:06:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Inki Dae <inki.dae@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] ARM: dts: imx7s: Move csi-mux to below root
Message-ID: <20250107100639.GC23309@pendragon.ideasonboard.com>
References: <20250107094943.518474-1-alexander.stein@ew.tq-group.com>
 <20250107094943.518474-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250107094943.518474-2-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_020649_886562_8ED3581F 
X-CRM114-Status: GOOD (  17.60  )
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

Hi Alexander,

Thank you for the patch.

On Tue, Jan 07, 2025 at 10:49:41AM +0100, Alexander Stein wrote:
> fsl,imx-iomuxc-gpr.yaml only contains the mux-controller but the actual
> video-mux is not part of it. So move it below root node.
> Fixes the dtbs_check warning:
> arch/arm/boot/dts/nxp/imx/imx7s-mba7.dtb: iomuxc-gpr@30340000: 'csi-mux' does not match any of the regexes: 'pinctrl-[0-9]+'
>   from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm/boot/dts/nxp/imx/imx7s.dtsi | 56 ++++++++++++++--------------
>  1 file changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/imx7s.dtsi b/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
> index 22dd72499ef27..2629968001a74 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
> @@ -176,6 +176,34 @@ timer {
>  			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
>  	};
>  
> +	video_mux: csi-mux {
> +		compatible = "video-mux";
> +		mux-controls = <&mux 0>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		status = "disabled";
> +
> +		port@0 {
> +			reg = <0>;
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			csi_mux_from_mipi_vc0: endpoint {
> +				remote-endpoint = <&mipi_vc0_to_csi_mux>;
> +			};
> +		};
> +
> +		port@2 {
> +			reg = <2>;
> +
> +			csi_mux_to_csi: endpoint {
> +				remote-endpoint = <&csi_from_csi_mux>;
> +			};
> +		};
> +	};
> +
>  	soc: soc {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> @@ -529,34 +557,6 @@ mux: mux-controller {
>  					#mux-control-cells = <1>;
>  					mux-reg-masks = <0x14 0x00000010>;
>  				};
> -
> -				video_mux: csi-mux {
> -					compatible = "video-mux";
> -					mux-controls = <&mux 0>;
> -					#address-cells = <1>;
> -					#size-cells = <0>;
> -					status = "disabled";
> -
> -					port@0 {
> -						reg = <0>;
> -					};
> -
> -					port@1 {
> -						reg = <1>;
> -
> -						csi_mux_from_mipi_vc0: endpoint {
> -							remote-endpoint = <&mipi_vc0_to_csi_mux>;
> -						};
> -					};
> -
> -					port@2 {
> -						reg = <2>;
> -
> -						csi_mux_to_csi: endpoint {
> -							remote-endpoint = <&csi_from_csi_mux>;
> -						};
> -					};
> -				};
>  			};
>  
>  			ocotp: efuse@30350000 {

-- 
Regards,

Laurent Pinchart

