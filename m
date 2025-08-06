Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C893CC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 23:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ylb/YfgYXmf3QsZtaUE46H1SEEkzHVmxP9ypfyCM47U=; b=mkcSdnqb3YsKDUOqccLn6Ke9Bn
	5G57f9FMcedToy+24IqIOp9X51jTvKx9VWZYe5Y5ikYdmOWrILBYJuetSrJqV9u8019khQ2TJG6lP
	TAVrtXRnIC3x96I1/AQsWspjhIo0L0FT3xTNxj+pK6+UtyO/Mj3Km6rgG4b2Whn1q281gKIzG8DZk
	3nPhs6oGemTr4BZGZnIVxscw05x2x2fsp33YeWq4/zzujwvvCxh/UJvg91J55/3ifAecc8UdQjb6J
	+P+cWcXm4TkncebKuklRnCbjSRQwNI4OTEFOncKQJLBBrE1Y7Wricoj9INKrFtrQm29bAhvSx5rUd
	nLu/5ROg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujnr6-0000000Gr1D-24La;
	Wed, 06 Aug 2025 23:47:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujnmq-0000000Gqby-0Jjl;
	Wed, 06 Aug 2025 23:43:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 36DAB60202;
	Wed,  6 Aug 2025 23:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCDFFC4CEE7;
	Wed,  6 Aug 2025 23:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754523790;
	bh=XvKaSBjQUK3Lb4uJy6GhrqjQJdMOVbIiQ9JzMOob2KQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AqgTzIerTzEYEvnC3+PF40eUaqMe6OKuvfEPihBe2N0abgzpfioGzdVfFXvFN2dvu
	 Q2iwTTnN5I6UiOYccj2rFT6D0aG7B95IA6n58G8fDp5YTn1a43yCPJ7AMt4gVTPEWz
	 Gw/zoIwOFb1RyzjoJkdUx9T1WMHQLsBH42XnP0ofm1dceoJ+XFBUfgCMxLUXtqEOm6
	 T0DQyN/pf+Qc4z46KItB9dSNv9bS+CGUrgA7g3w0/Smuv1/ruT49+ojdciQs9lpB2m
	 Ka7z2UYYgunxy/Nx9yDk/yIFz/7W1EI+PPiL6zNoT8kB3oQkfVAocqeeICLIqlN7b4
	 Xup7U5VzQN6Wg==
Date: Wed, 6 Aug 2025 18:43:09 -0500
From: Rob Herring <robh@kernel.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: vkoul@kernel.org, kishon@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org,
	kauschluss@disroot.org, ivo.ivanov.ivanov1@gmail.com,
	igor.belwon@mentallysanemainliners.org, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com,
	muhammed.ali@samsung.com, selvarasu.g@samsung.com
Subject: Re: [PATCH v5 5/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo ssphy
Message-ID: <20250806234309.GA2032999-robh@kernel.org>
References: <20250805115216.3798121-1-pritam.sutar@samsung.com>
 <CGME20250805114320epcas5p3968288f8d01944d3d730b3094a7befe4@epcas5p3.samsung.com>
 <20250805115216.3798121-6-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805115216.3798121-6-pritam.sutar@samsung.com>
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

On Tue, Aug 05, 2025 at 05:22:15PM +0530, Pritam Manohar Sutar wrote:
> This phy supports USB3.1 SSP+(10Gbps) protocol and is backwards
> compatible to the USB3.0 SS(5Gbps). It requires two clocks, named
> "phy" and "ref". The required supplies for USB3.1 are named as
> vdd075_usb30(0.75v), vdd18_usb30(1.8v).
> 
> Add schemas for combo ssphy found on this SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
>  .../bindings/phy/samsung,usb3-drd-phy.yaml    | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> index 4a84b5405cd2..7a71cff10fb5 100644
> --- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> @@ -34,6 +34,7 @@ properties:
>        - samsung,exynos7870-usbdrd-phy
>        - samsung,exynos850-usbdrd-phy
>        - samsung,exynos990-usbdrd-phy
> +      - samsung,exynosautov920-usb31drd-combo-ssphy
>        - samsung,exynosautov920-usbdrd-combo-hsphy
>        - samsung,exynosautov920-usbdrd-phy
>  
> @@ -118,6 +119,12 @@ properties:
>    vdd18-usb20-supply:
>      description: 1.8V power supply for the USB 2.0 phy.
>  
> +  dvdd075-usb30-supply:
> +    description: 0.75V power supply for the USB 3.0 phy.
> +
> +  vdd18-usb30-supply:
> +    description: 1.8V power supply for the USB 3.0 phy.
> +
>  required:
>    - compatible
>    - clocks
> @@ -227,6 +234,7 @@ allOf:
>                - samsung,exynos7870-usbdrd-phy
>                - samsung,exynos850-usbdrd-phy
>                - samsung,exynos990-usbdrd-phy
> +              - samsung,exynosautov920-usb31drd-combo-ssphy
>                - samsung,exynosautov920-usbdrd-combo-hsphy
>                - samsung,exynosautov920-usbdrd-phy
>      then:
> @@ -258,6 +266,17 @@ allOf:
>          - vdd18-usb20-supply
>          - vdd33-usb20-supply
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynosautov920-usb31drd-combo-ssphy
> +    then:
> +      required:
> +        - dvdd075-usb30-supply
> +        - vdd18-usb30-supply

Similar issue here.

