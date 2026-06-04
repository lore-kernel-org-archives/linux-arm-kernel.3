Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE68CD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 12:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vxPA9SqaHtcFSqcBbRNXxNBkzhPWrG1gxF1dvHfcmk=; b=jWwA+S6pLJIjCS3Jsd3peOUy6R
	odlEYznA5z+fGW4RdXEOC+XnhwQsWddELxk0QbjaXkTcS5DF7JjvqEqsR5UEBC4ehE1gE2QCoYgnr
	ISD9nNXIonPgCEGt05+vBJxTiOtcRgwRNx2JuA5W8XnXWbNljQyxd91yhxkVpQpmIwww4O4JYinuw
	zKXCI5BabB3CfSMolNl5l2iajHi6yhUNkS6Wv+FnqCvR+MpOEWVQeTXgDdQ13A9fg3yFeV96I85FV
	EshgkpkhEAxQKB7kqSg+NDyTEH2HhE//9Yggt9o0KquqXOrsb0Fe2u2FmByolFYkj52I/H0OVDtJ/
	YNOLnmig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV7Vn-0000000Gjz0-3eXm;
	Thu, 04 Jun 2026 12:49:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV7Vn-0000000Gjyo-0z24;
	Thu, 04 Jun 2026 12:49:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DEC8B44425;
	Thu,  4 Jun 2026 12:49:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B060A1F00893;
	Thu,  4 Jun 2026 12:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780577366;
	bh=2vxPA9SqaHtcFSqcBbRNXxNBkzhPWrG1gxF1dvHfcmk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=j/lTYKRwHS25jSfSuY7xbDcaizsINxuqRxJgk7br4Gm1wb5zUxJbpQmLDRrg7nj26
	 1sk1uXxnZsHdB1E603/XDJD8TYtzkDW7L4m5S9mwu6cw1iWzanoD2SdCpa6FQtqxcr
	 SnpfJJTrEnJatsX8/a7UQo1kjCWRxwG3q2KHZQHw3KsRzYjW+1Ps9BPPOOIEr+Iq+7
	 vLIEMJIuBbe3YQYZmKKlD5pkNnX42M4riCXSXILidnHzVhs4C0AMNczS1eVWzhYHkA
	 iSiZDzwXRiNPzXY8OqOQCv6wDLAdMND95Tqnn/X0lrQ5LpnTGMUjdAq8Bp4WOXsSlJ
	 TTATKP1kwYTxA==
Message-ID: <4d96835a-a273-4c46-85a2-03c059934650@kernel.org>
Date: Thu, 4 Jun 2026 14:49:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: soc: realtek: Add Realtek DHC I/O level
 detector
To: Yu-Chun Lin <eleanor.lin@realtek.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, tychang@realtek.com
Cc: cy.huang@realtek.com, stanley_chang@realtek.com, james.tai@realtek.com,
 afaerber@suse.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org
References: <20260604111821.975624-1-eleanor.lin@realtek.com>
 <20260604111821.975624-2-eleanor.lin@realtek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260604111821.975624-2-eleanor.lin@realtek.com>
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

On 04/06/2026 13:18, Yu-Chun Lin wrote:
> From: Tzuyi Chang <tychang@realtek.com>
> 
> Add device tree binding documentation for the Realtek DHC I/O level
> detector.
> 
> This hardware block is responsible for detecting the I/O signaling
> levels (e.g., 1.8V or 3.3V) of various interfaces (RGMII, SDIO, eMMC,
> etc.) and applying the corresponding pad configurations via pinctrl
> states.
> 
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
>  .../realtek/realtek,rtd1625-io-detect.yaml    | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/realtek/realtek,rtd1625-io-detect.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/realtek/realtek,rtd1625-io-detect.yaml b/Documentation/devicetree/bindings/soc/realtek/realtek,rtd1625-io-detect.yaml
> new file mode 100644
> index 000000000000..badf27212dfd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/realtek/realtek,rtd1625-io-detect.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2026 Realtek Semiconductor Corporation
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/realtek/realtek,rtd1625-io-detect.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek DHC I/O Level Detector
> +
> +maintainers:
> +  - Tzuyi Chang <tychang@realtek.com>
> +
> +description: |

Drop |

> +  The Realtek DHC I/O Level Detector is a hardware block that detects I/O
> +  signaling levels (such as 1.8V or 3.3V) to determine the correct pad
> +  configurations for specific IP blocks.
> +
> +properties:
> +  compatible:
> +    const: realtek,rtd1625-io-detect
> +

No resources here, so does not look like a real device, but driver
instantiation.


> +  pinctrl-names:
> +    items:
> +      - const: rgmii_1v8
> +      - const: rgmii_3v3
> +      - const: sdio_1v8
> +      - const: sdio_3v3
> +      - const: csi_1v8
> +      - const: csi_3v3
> +      - const: sd_1v8
> +      - const: sd_3v3
> +      - const: uart1_1v8
> +      - const: uart1_3v3
> +      - const: aio_1v8
> +      - const: aio_3v3
> +      - const: emmc_1v8
> +      - const: emmc_3v3
> +
> +  realtek,iso-pinctrl:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Pinctrl phandle containing I/O detection registers.

MMIO registers are in 'reg' property.


> +
> +required:
> +  - compatible
> +  - pinctrl-names
> +  - realtek,iso-pinctrl
Best regards,
Krzysztof

