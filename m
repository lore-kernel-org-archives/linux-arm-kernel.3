Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DD3C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 16:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwjoEW3/NIbfZMbHFvVtoTAaUMS0MY//IOVeA1psqbE=; b=x3Ytc566MoP1ekEzpsNk7S4Kkw
	290e1ZGoRNZPzeFWVq25qtDjjn0a981c6iwE/nR5IXxznCGCU2arvmpPZPEqas8g+q5vCioKBbllc
	2PpG7Tn/Dhfqr0kj0wSrUmmH+ecDebQrCuUfprlrqEhHPNmEam9kiza714cUCEqcNrcnl8pFgoA0z
	Ww7QrlpD1J+rUC0HTCaGG0ZKKJoMXxInL5QN4gI+w4Zcy3duR3UhSacUOYZESUrJmlrj9lAUhQixB
	KA7ZW/jjtxxrbt5TI7ufBdkJyXz061cEaMWJmAXGI+5xiaJwIcuipE58evp28AubMQAoL9c1KMhpe
	O559ED0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx7IW-00000006VWj-0y9T;
	Tue, 25 Mar 2025 16:38:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx60j-00000006JFp-1QOZ;
	Tue, 25 Mar 2025 15:16:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7ED11A493C1;
	Tue, 25 Mar 2025 15:10:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E88A6C4CEE4;
	Tue, 25 Mar 2025 15:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742915772;
	bh=5ByUJpks9hkZhuJoceNmjpMgpU8NiVFGUeBDfoAE150=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vLPVmvDcdWcHF5VNb//6QuBceDBAFsUxvouEhOfevFwX7zzpHqTD7Z2q4DJvRmlFB
	 GQv1gvCsygYRFHv/ja5UWu4+WwEr1my4iRzZQPi9S1P3dCtAutlpaKrsV8AW3L5Uto
	 GqaKna3ic6X4bfMn91rlM047BCW+Dz/DM00Ld9yAJISCgFtC73NjcItqk3jIbkk51P
	 fMr+TeBbaJy0F2tl7TqWhL7UwehxwVTrq3m5i9vgrRqtKk8I5jBlwlT7QIfHztKbxR
	 vqQr78kIqdwVTfurkMxTojgv1Wz7bZxQuiWMoNU5vCFuOJI+kdOpM8DYxnnec0XaQ3
	 G9cZsUGQP+61w==
Date: Tue, 25 Mar 2025 10:16:11 -0500
From: Rob Herring <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 02/10] dt-bindings: phy: samsung,usb3-drd-phy: add
 exynos2200 support
Message-ID: <20250325151611.GA2057949-robh@kernel.org>
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
 <20250321135854.1431375-3-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321135854.1431375-3-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_081613_510841_06C57138 
X-CRM114-Status: GOOD (  16.64  )
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

On Fri, Mar 21, 2025 at 03:58:46PM +0200, Ivaylo Ivanov wrote:
> Document support for Exynos2200. As the USBDRD 3.2 4nm controller
> consists of Synopsys eUSB2.0 phy and USBDP/SS combophy, which will
> be handled by external drivers, define only the bus clocked used
> by the link controller.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../bindings/phy/samsung,usb3-drd-phy.yaml    | 38 +++++++++++++++++--
>  1 file changed, 34 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> index 16321cdd4..819e4afe6 100644
> --- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> @@ -26,6 +26,7 @@ properties:
>    compatible:
>      enum:
>        - google,gs101-usb31drd-phy
> +      - samsung,exynos2200-usb32drd-phy
>        - samsung,exynos5250-usbdrd-phy
>        - samsung,exynos5420-usbdrd-phy
>        - samsung,exynos5433-usbdrd-phy
> @@ -33,24 +34,32 @@ properties:
>        - samsung,exynos850-usbdrd-phy
>  
>    clocks:
> -    minItems: 2
> +    minItems: 1
>      maxItems: 5
>  
>    clock-names:
> -    minItems: 2
> +    minItems: 1
>      maxItems: 5
>      description: |
> -      At least two clocks::
> +      Typically two clocks::

Don't need double colon.

>          - Main PHY clock (same as USB DRD controller i.e. DWC3 IP clock), used
>            for register access.
>          - PHY reference clock (usually crystal clock), used for PHY operations,
>            associated by phy name. It is used to determine bit values for clock
>            settings register.  For Exynos5420 this is given as 'sclk_usbphy30'
> -          in the CMU.
> +          in the CMU. It's not needed for Exynos2200.
>  
>    "#phy-cells":
>      const: 1
>  
> +  phys:
> +    maxItems: 1
> +    description:
> +      Phandle to USBDRD-underlying high-speed PHY

Drop 'phandle to'.

> +
> +  phy-names:
> +    const: hs
> +
>    port:
>      $ref: /schemas/graph.yaml#/properties/port
>      description:
> @@ -137,6 +146,27 @@ allOf:
>          - vdda-usbdp-supply
>          - vddh-usbdp-supply
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynos2200-usb32drd-phy
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names:
> +          items:
> +            - const: phy
> +        reg:
> +          maxItems: 1
> +        reg-names:
> +          maxItems: 1
> +      required:
> +        - phys
> +        - phy-names
> +
>    - if:
>        properties:
>          compatible:
> -- 
> 2.43.0
> 

