Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10317CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 06:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOG837kSU4lXzCyb56vWV7m8MnNo3C8LbJWwoGdMDMM=; b=wQ+MeYbJKRjq+FnJGtQKBCfxEe
	JwMPoEQbGvo9fI1YqSJPsChCeQo37VrF1qPt/fVxPQB11caHQVKOGLfZZXiUQt3KH/sTU7L5Seub0
	afty3A0sCVld1TjenzwSNMTBCnzLryTB5QqMaVd758R6Z3T3+k3LPKOsIqjTgxeZK/6WbD+uDdiqh
	wryuYaJ4yog41DsrmSJLRldIAe+jCXY6xj+YCnV1YsWe6DATReWyGVXlMOzwRx2/OVRcOyWyTzGND
	Ypj7++bCembFrcN9jrzP4gEDUg/tUddvQtvjHrjPFmZpj0Q7ihT1MidYDHgylpFJeYIJFtVT5tam+
	OSj82uEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v61D2-00000001MdK-3sG7;
	Tue, 07 Oct 2025 06:30:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v61D1-00000001Md8-0Ahl;
	Tue, 07 Oct 2025 06:30:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3250D601DF;
	Tue,  7 Oct 2025 06:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A778C4CEF1;
	Tue,  7 Oct 2025 06:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759818601;
	bh=wZYlzoA9J8+rJqVeCe4Q2o14fIltYpD6LEF2ajXIVss=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b4njtDHJljGx4jj97mh0JBufnl4Z4jFHUt7eUxuxflsca4JW9bg/IVnFROaCE70vM
	 Zertw3lUvmV1uMR7GUh6v8U49oQIYKPxsoXka2pV5PoiYSvAFVDKN6pYkLCeNR2e7c
	 W/4hkXl+FApC6ZHisUoQiPQZEiYRrE1ZxkCj9N3GzNaq0LO5F5bBXurrA/jgBbPkQF
	 6aFY3l5vR7UZyIz90r/+XLiCoOXSrc3p0JgjU2XFPVoe/R68FIk0Y/P0dscyx8CN3V
	 P8pbTJk0csk0bzuhmVwuBxsqLse5H6O8UG4XBnBpaAqhFDa8IQNMQEZd0DcPQJYKzz
	 vU2hhXKqnUk4Q==
Message-ID: <649f8e90-d99b-401a-bb0f-ef0cf9c4fe7f@kernel.org>
Date: Tue, 7 Oct 2025 15:29:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: phy: Add PCIe PHY support for
 ExynosAutov920 SoC
To: Sanghoon Bae <sh86.bae@samsung.com>, robh@kernel.org,
 conor+dt@kernel.org, vkoul@kernel.org, alim.akhtar@samsung.com,
 kishon@kernel.org, m.szyprowski@samsung.com, jh80.chung@samsung.com,
 shradha.t@samsung.com
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250926073921.1000866-1-sh86.bae@samsung.com>
 <CGME20250926074017epcas2p18fb2fc616b92dc04ad9e018151c2ba29@epcas2p1.samsung.com>
 <20250926073921.1000866-3-sh86.bae@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250926073921.1000866-3-sh86.bae@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 26/09/2025 16:39, Sanghoon Bae wrote:
> Since the Exynosautov920 SoC uses the Samsung PCIe PHY, add support
> for it in the Exynosautov920 PCIe PHY bindings.
> 
> The Exynosautov920 SoC includes two PHY instances: one for a 4-lane PHY
> and another for a 2-lane PHY. Each PHY can be used by separate
> controllers through the bifurcation option. Therefore, from 2 up to 4
> PCIe controllers can be supported and connected with this PHY driver.


Describe hardware, not driver.

> 
> PCIe lane number is used to distinguish each PHY instance.
> This is required since two PHY instances on ExynosAutov920 is not
> identical.
> On PHY driver code, need to check each instance and different settings.


Describe hardware, not driver.

> 
> Signed-off-by: Sanghoon Bae <sh86.bae@samsung.com>
> ---
>  .../bindings/phy/samsung,exynos-pcie-phy.yaml      | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml
> index 6295472696db..1e8b88d2cd56 100644
> --- a/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml
> @@ -19,6 +19,7 @@ properties:
>        - samsung,exynos5433-pcie-phy
>        - tesla,fsd-pcie-phy0
>        - tesla,fsd-pcie-phy1
> +      - samsung,exynosautov920-pcie-phy

Messed order.

>  
>    reg:
>      minItems: 1
> @@ -34,6 +35,10 @@ properties:
>      description: phandle for FSYS sysreg interface, used to control
>                   sysreg registers bits for PCIe PHY
>  
> +  num-lanes:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [2, 4]
> +
>  allOf:
>    - if:
>        properties:
> @@ -42,6 +47,7 @@ allOf:
>              enum:
>                - tesla,fsd-pcie-phy0
>                - tesla,fsd-pcie-phy1
> +              - samsung,exynosautov920-pcie-phy

Messed order.

Best regards,
Krzysztof

