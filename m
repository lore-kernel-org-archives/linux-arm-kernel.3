Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1D3C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 07:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+IjG9Gi4aceFFMV3RZqOhRGdqwMxvb9UDjwAacm4wo=; b=c3DBzVFPcipq8019ZFc2xiB8jY
	Jg+lAnrTQvoiWgGw69zv+BsoFIVpLCH00LknBGg7h6nSIV9f77BaUoECNfohAPFGU7Jgb6XTVe/Sh
	yrYWtbgkrUQCq5YsCyxheEkHmRTc0TCK0IQzgUEgsgBQYEq8mpaTtyBANEYidAV+S8MaQ+4uFhBmJ
	Up9tCOl1SzUiLnpTK8Ak3B9VH1DH7HorEPrwPBZQ+LDZ/f+kdbW8C8AjOfUUlgkVyuLkVSPejBKB5
	PaCO0gvm1fplAO08vEdvim/OFW7UVoJEWH+zorxGXuBKmR9bI1n4JbygCVriRUlApHiA15YAugVqj
	IBGEOnBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXEhV-0000000AYqy-29pe;
	Thu, 03 Jul 2025 07:49:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXEf9-0000000AYWb-3LtX;
	Thu, 03 Jul 2025 07:47:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C84E46312;
	Thu,  3 Jul 2025 07:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58284C4CEEB;
	Thu,  3 Jul 2025 07:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751528838;
	bh=stYO2V0uO/CUicfgagttLRTcd8cErTfGnqGNs0OZwAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OHLB+HbbUl8LbzGylH6tLSSxxToxrOYIyLIUpy4fK2ZHH2RQtaoQ29DMjdhEbHcy6
	 /WU0H0WiyEzAsSfp5Q5igIxWeOGHlOJ+YSbXlke5ux3KP+0GqtX2CWgG5mZ/bHCIYw
	 /t0v1S32AvYErRFZLqX0b5LWT+e11OSQQQF4iaTu5leTXTADXmHUxPlZXEqpfs7OPd
	 9Sj1+YzuJ/QU5guzicL0d9t+z7YylwMDZChMiPllUS7xwuzQ/mu7jgthjIcNAFJJZd
	 yjXTb8cKNpo8vdkleAXj/4w5MT8HhJLnTGhKRdrpZ5nyTCqC8IvnzouzYI4D6YHT/T
	 Z+ssvl6fail0Q==
Date: Thu, 3 Jul 2025 09:47:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	zhiyong.tao@mediatek.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: add thermal sensor support
 on mt7981
Message-ID: <20250703-precious-busy-grouse-eb04b5@krzk-bin>
References: <20250702214830.255898-1-olek2@wp.pl>
 <20250702214830.255898-3-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250702214830.255898-3-olek2@wp.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_004719_855428_D5A201D3 
X-CRM114-Status: GOOD (  16.72  )
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

On Wed, Jul 02, 2025 at 11:48:30PM +0200, Aleksander Jan Bajkowski wrote:
> The temperature sensor in the MT7981 is same as in the MT7986.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 32 ++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> index 5cbea9cd411f..759b9e8059d9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> @@ -76,7 +76,7 @@ watchdog: watchdog@1001c000 {
>  			#reset-cells = <1>;
>  		};
>  
> -		clock-controller@1001e000 {
> +		apmixedsys: clock-controller@1001e000 {
>  			compatible = "mediatek,mt7981-apmixedsys";
>  			reg = <0 0x1001e000 0 0x1000>;
>  			#clock-cells = <1>;
> @@ -184,6 +184,32 @@ spi@1100b000 {
>  			status = "disabled";
>  		};
>  
> +		thermal@1100c800 {
> +			compatible = "mediatek,mt7981-thermal",
> +				     "mediatek,mt7986-thermal";
> +			reg = <0 0x1100c800 0 0x800>;
> +			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&infracfg CLK_INFRA_THERM_CK>,
> +				 <&infracfg CLK_INFRA_ADC_26M_CK>;
> +			clock-names = "therm", "auxadc";
> +			nvmem-cells = <&thermal_calibration>;
> +			nvmem-cell-names = "calibration-data";
> +			#thermal-sensor-cells = <1>;
> +			mediatek,auxadc = <&auxadc>;
> +			mediatek,apmixedsys = <&apmixedsys>;
> +		};
> +
> +		auxadc: adc@1100d000 {
> +			compatible = "mediatek,mt7981-auxadc",
> +				     "mediatek,mt7986-auxadc",
> +				     "mediatek,mt7622-auxadc";

That's not what your binding said.

It does not look like you tested the DTS against bindings. Please run
'make dtbs_check W=1' (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).
Maybe you need to update your dtschema and yamllint. Don't rely on
distro packages for dtschema and be sure you are using the latest
released dtschema.

Best regards,
Krzysztof


