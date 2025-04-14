Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F098BC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 07:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ypmBeyCXMnJyll5Qo+zN4zIn2g2EkkvvWzrwOIBr7Fc=; b=CNZMxY1iVjKaUMSHSKMtaBEauH
	dcIhzyP3LECAzyjCFxUcw7gRSbgb/sL6lzbVRcDUVbi0FGfxXlcMI6c5CrNEnsRKMRcrWSpzS8+lY
	ICKIW8gubt2YUmurGEHWdRNJIx8PL/FMOwQVrVMG2tILfNsVnqxm+U4PvT/fHCCJSZ6RHCU23/VZ7
	Wa3XoNdtzKLd1SGExylEmfl9CLfHlwNDumA0KXQQ2ARUVpc7SJDvD3T3Zbqqhq4eMGH9eYMB3J4ZW
	ljWK//FDbWIATlju2BZ+vMnu6PXAHjZ3c+5YLqbTs2JIDxdSJqESXEkMol+UB8B1nCXBDVvL9wjqK
	zd/WQWXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4E6q-00000000uYH-2jbc;
	Mon, 14 Apr 2025 07:20:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4E4j-00000000uJF-3moY;
	Mon, 14 Apr 2025 07:17:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5C430A4847D;
	Mon, 14 Apr 2025 07:12:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D953C4CEE2;
	Mon, 14 Apr 2025 07:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744615068;
	bh=boozTliB7bYs9rUJdY0DioZxAqN1tNd+gw4KQY9xVJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ByBVFfBIBlXtzPv5hLien3pIvMPuF4iKRCHwVIRLjxecR5XfVrU940qgXIh8zLq+V
	 TUtRXXgTkhU0tK0wIKISb+0JFOtBmjE5QR5nW7nc63S4kwj7/Ytj1EHtLkh+mZYf6D
	 tydV73OxZmf3+x+b2LrF0QUIgWwmqhPLBS4e8bHzElGdM31A+g1VnCcUxaoxKXoIQB
	 qStlv3nYNvhRp13U9sqZmDPjToTw2L8950wd3pBRz9KFc4361H5r+iGC8iWN/5E/z6
	 PBXbWOq4pJBsEy0EE9cN0MQGzm0d3M5ldcB0AUusaURgxUv3PUwFtatejS8dIZjnvi
	 Bkb26kpVKoxlg==
Date: Mon, 14 Apr 2025 09:17:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Rob Herring <robh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 01/10] dt-bindings: phy: add exynos2200 eusb2 phy
 support
Message-ID: <20250414-glaring-swallow-of-serenity-78edcb@shite>
References: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
 <20250412202620.738150-2-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250412202620.738150-2-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_001750_073566_9EC1B47A 
X-CRM114-Status: GOOD (  15.47  )
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

On Sat, Apr 12, 2025 at 11:26:11PM GMT, Ivaylo Ivanov wrote:
> Document the exynos2200 eUSB2 compatible. Unlike the currently documented
> Qualcomm SoCs, the driver doesn't make use of reset lines for reset
> control and uses more clocks.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../bindings/phy/samsung,snps-eusb2-phy.yaml  | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/samsung,snps-eusb2-phy.yaml

Please name it after compatible, so
samsung,exynos2200-eusb2-phy.yaml


> 
> diff --git a/Documentation/devicetree/bindings/phy/samsung,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,snps-eusb2-phy.yaml
> new file mode 100644
> index 000000000..09d3fdd4a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/samsung,snps-eusb2-phy.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/samsung,snps-eusb2-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung SNPS eUSB2 phy controller
> +
> +maintainers:
> +  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> +
> +description:
> +  eUSB2 controller supports LS/FS/HS usb connectivity on Exynos2200.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,exynos2200-snps-eusb2-phy

I did not mention this earlier, but I think we should skip the snps in
the compatible. Using vendor name in device name is just confusing, so:

samsung,exynos2200-eusb2-phy

However the description should include it, e.g.

Samsung Exynos2200 eUSB2 phy, based on Synopsys eUSB2 IP block, ....


...

> +additionalProperties: false
> +
> +examples:
> +  - |
> +    usb_hsphy: phy@10ab0000 {
> +        compatible = "samsung,exynos2200-snps-eusb2-phy";
> +        reg = <0x10ab0000 0x10000>;
> +        #phy-cells = <0>;
> +
> +        clocks = <&cmu_hsi0 7>,
> +            <&cmu_hsi0 5>,
> +            <&cmu_hsi0 8>;

These should be aligned with opening <

With above:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


