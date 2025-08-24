Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C78CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 09:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVChOouO+gszYUQyZS0wR/lNAiyRlePGkr8DrNV+iec=; b=xgKnPYwMI+FhDtB2XMG5XCJsSy
	CpQxTY9pEtDnsUbJOvxUAa0no6XYkwkfFoj8rONZsKX71rg1w+knQt66eyQQZHAsZWTYsgRByWi/h
	+BnaeP5MtsGFOqbNMmw71HjD4bjqiy4Qr4lY+u0SHxQls/itIXRDxQEP/vDLrGqbYhtkzV3NmXhyA
	ZDrSVVsWE/sJhC1/SIsOPxxl/7UGQcPepSf8P4NAvwCm+ZEjzUTkI++ewiBClp4AeY32zPu6FnSYM
	lMJu24w/Xzjj0O/0E07HLiAK+0fZaZiVcsh9fzzMP6gIwRMqLDJVt5aHxctiy1Kq3QvTM3q0Q56mW
	VOIzMDTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq6b5-00000005vC0-46Br;
	Sun, 24 Aug 2025 09:01:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq6W4-00000005unB-0RIA;
	Sun, 24 Aug 2025 08:55:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 37D1C5C555E;
	Sun, 24 Aug 2025 08:55:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F923C4CEEB;
	Sun, 24 Aug 2025 08:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756025754;
	bh=0t8NYsclUsLqSKfihTaUGdY6Q22Pg+5nw0i9SnPs+rg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qjm4/0x15o2yx/NzpWGvaWSnCm5A5mLB+XgnjSNcNzRkvXQ7rHlUh4sLGBGirZSy5
	 kehj4OxXvckzYWAQgfBSVWXMOtGXRc5dop0Fej8WH4THM9JhZJSDIKedteEKYibA5Y
	 c6CzeeGIqywzIuNo4iXlsRDeLHIOBH320aB8q2x1AVtbC37rPFLQwgYgg6OcwMjprl
	 z+DYoZhQGkMOUPJr8TAeNNGVIsFvqlc12H4puIe8YWWTSUYG//LtTA98GDv6+KzrFj
	 g/oCCklsVlV4QMk0Jc86I2mgjLJ2VaTEXsBpvoTIsW6Xvv5xaoXpm9gyjk3Xwc1Id8
	 hQzlJadGQohDQ==
Date: Sun, 24 Aug 2025 10:55:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org, 
	ivo.ivanov.ivanov1@gmail.com, igor.belwon@mentallysanemainliners.org, johan@kernel.org, 
	m.szyprowski@samsung.com, s.nawrocki@samsung.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com, 
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com, 
	selvarasu.g@samsung.com
Subject: Re: [PATCH v7 5/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo ssphy
Message-ID: <20250824-rough-fresh-orangutan-eecb2f@kuoka>
References: <20250822093845.1179395-1-pritam.sutar@samsung.com>
 <CGME20250822093022epcas5p42d8c16c851769dab0e1da9d45743ab1f@epcas5p4.samsung.com>
 <20250822093845.1179395-6-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250822093845.1179395-6-pritam.sutar@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_015556_229977_81CC3408 
X-CRM114-Status: GOOD (  15.03  )
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

On Fri, Aug 22, 2025 at 03:08:44PM +0530, Pritam Manohar Sutar wrote:
> This phy supports USB3.1 SSP+(10Gbps) protocol and is backwards
> compatible to the USB3.0 SS(5Gbps). It requires two clocks, named
> "phy" and "ref". The required supplies for USB3.1 are named as
> vdd075_usb30(0.75v), vdd18_usb30(1.8v).

Please do not describe the schema, but hardware. This sentence does not
help me in my question further.

> 
> Add schemas for combo ssphy found on this SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
>  .../bindings/phy/samsung,usb3-drd-phy.yaml    | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> index f0cfca5736b8..96e5bbb2e42c 100644
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
> @@ -262,6 +270,21 @@ allOf:
>        properties:
>          dvdd075-usb20-supply: false
>          vdd18-usb20-supply: false
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

Why are you adding usb20 and usb30 suffixes to the supplies? These are
separate devices, so they do not have both variants at the same time.

From this device point of view, the supply is called dvdd075 or vdd18.
If you open device datasheet (not SoC datasheet), that's how it will be
called, most likely.

Best regards,
Krzysztof


