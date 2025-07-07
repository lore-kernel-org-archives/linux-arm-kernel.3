Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510BEC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 23:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGj45XPJg4XjZns3NQqY7ajwu/YHAOYchceSHq3VWig=; b=Wqa/I6QaIMBcsfazWkvYzL/LpI
	wD2PQ4HKpzhI8GtzusWCmzmB47mXwUkIwR5P05xI7gM9r8XbaxULYdhWRrWZ2rFFWzwzZ72vIgmLe
	BjrBYaHaZXWt7h7HZBuprAeifWNjIbYHFxbh6KhG6T3HN/bxmt/5mNvyFNJlv8LsH5eIGQCcKFpT2
	ad+nzJ7xkRzgwEhTqRid3FKJzUp352SUH3de8JVI/By4+nTbcew1+0HF/v5SjwiZtMSrgLxLAaw4c
	GiakQs2P5Q80ZKmfX9ErrEiy84Eni1bOjftaG26FDgaSxBqtnWJzCpK2fsjAOHJXHUUkS9I+uD7QJ
	U6t8ey3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYvCz-00000003lvl-0d3E;
	Mon, 07 Jul 2025 23:25:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYvAd-00000003lgl-2Q9R;
	Mon, 07 Jul 2025 23:22:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67E621595;
	Mon,  7 Jul 2025 16:22:34 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E56F3F66E;
	Mon,  7 Jul 2025 16:22:44 -0700 (PDT)
Date: Tue, 8 Jul 2025 00:20:58 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/5] riscv: dts: allwinner: d1s-t113: Add pinctrl's
 required by NetCube Systems Nagami SoM
Message-ID: <20250708002032.71167d46@minigeek.lan>
In-Reply-To: <20250706183601.157523-3-lukas.schmid@netcube.li>
References: <20250706183601.157523-1-lukas.schmid@netcube.li>
	<20250706183601.157523-3-lukas.schmid@netcube.li>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_162247_663118_8F991C7D 
X-CRM114-Status: GOOD (  14.47  )
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

On Sun,  6 Jul 2025 20:35:55 +0200
Lukas Schmid <lukas.schmid@netcube.li> wrote:

Hi,

> Added the following pinctrl's used by the NetCube Systems Nagami SoM
>   * i2c2_pins
>   * i2c3_pins
>   * i2s1_pins, i2s1_din_pins, i2s1_dout_pins
>   * spi1_pins
> 
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index e4175adb0..8dc3deccb 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -78,6 +78,36 @@ dsi_4lane_pins: dsi-4lane-pins {
>  				function = "dsi";
>  			};
>  
> +			/omit-if-no-ref/
> +			i2c2_pins: i2c2-pins {
> +				pins = "PD20", "PD21";
> +				function = "i2c2";
> +			};
> +
> +			/omit-if-no-ref/
> +			i2c3_pins: i2c3-pins {
> +				pins = "PG10", "PG11";
> +				function = "i2c3";
> +			};
> +
> +			/omit-if-no-ref/
> +			i2s1_pins: i2s1-pins {
> +				pins = "PG12", "PG13";
> +				function = "i2s1";
> +			};
> +
> +			/omit-if-no-ref/
> +			i2s1_din_pins: i2s1-din-pins {
> +				pins = "PG14";
> +				function = "i2s1_din";
> +			};
> +
> +			/omit-if-no-ref/
> +			i2s1_dout_pins: i2s1-dout-pins {
> +				pins = "PG15";
> +				function = "i2s1_dout";
> +			};
> +
>  			/omit-if-no-ref/
>  			lcd_rgb666_pins: lcd-rgb666-pins {
>  				pins = "PD0", "PD1", "PD2", "PD3", "PD4", "PD5",
> @@ -126,6 +156,12 @@ spi0_pins: spi0-pins {
>  				function = "spi0";
>  			};
>  
> +			/omit-if-no-ref/
> +			spi1_pins: spi1-pins {
> +				pins = "PD10", "PD11", "PD12", "PD13", "PD14", "PD15";

Can you please split this up, to have the MISO/MOSI/CLK signals under a
separate label, so that basic users can reuse this group?
CS should be a separate group, and I guess HOLD and WP can be in
another.

The rest looks alright, compared against the manual.

Cheers,
Andre

> +				function = "spi1";
> +			};
> +
>  			/omit-if-no-ref/
>  			uart1_pg6_pins: uart1-pg6-pins {
>  				pins = "PG6", "PG7";


