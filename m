Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBDBE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZaPcJ9YnE+yQY3VPWtEd1cIwsl0rUjT3qST+O9vnW7Y=; b=dJQDo0rssKAZNepuuiZnnH8JVr
	DpgXBSnTHdISuhU+KJbdeh/PRFpntk4k77gdvU3o7dCtEIlAFQHgPMf9KKy+JscnYi4qEuii4MqZ5
	bV6Q4cd3n+ByZQl4im1yuMpnUS/R/VuakzAxpRPkH4OUpDCYqHfvHgMxAJz/ykQT8p0NPkaByiUfj
	M9B0bqr1Rh8j8nrjNk7Xkw1dxk9ANVTITslBCTNqeFP2tTtwceCkZ22+h9/rZHElwOGiSLh1lq8Ok
	HKxTaDIMogAoyL3GNOxX+jB0wvqqbx+IxT06AbJxwFLwig2L8Npwims5AYWYjxVcYsmG3riIPpFyw
	2RSCWeZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV74o-00000004Q7n-2CDI;
	Tue, 07 Jan 2025 10:44:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV73b-00000004Po7-2SzN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 10:43:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90A2C143D;
	Tue,  7 Jan 2025 02:43:55 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 715F43F673;
	Tue,  7 Jan 2025 02:43:25 -0800 (PST)
Date: Tue, 7 Jan 2025 10:43:20 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] ARM: dts: sunxi: add uart1_pe pinctrl for
 sun8i-v3s
Message-ID: <20250107104320.4e74a87c@donnerap.manchester.arm.com>
In-Reply-To: <20250106190703.4015-4-lukas.schmid@netcube.li>
References: <20250106190703.4015-1-lukas.schmid@netcube.li>
	<20250106190703.4015-4-lukas.schmid@netcube.li>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_024332_072994_C45D5823 
X-CRM114-Status: GOOD (  14.20  )
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

On Mon,  6 Jan 2025 19:07:01 +0000
Lukas Schmid <lukas.schmid@netcube.li> wrote:

> Added the uart1_pe_pins pinctrl for use by the NetCube
> Systems Kumquat board
> 
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> index 9e13c2aa8911..f909b1d4dbca 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> @@ -416,6 +416,12 @@ uart0_pb_pins: uart0-pb-pins {
>  				function = "uart0";
>  			};
>  
> +			/omit-if-no-ref/
> +			uart1_pe_pins: uart1-pe-pins {
> +				pins = "PE21", "PE22";
> +				function = "uart1";
> +			};
> +
>  			uart2_pins: uart2-pins {
>  				pins = "PB0", "PB1";
>  				function = "uart2";


