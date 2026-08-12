Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0EDC5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 10:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=km+FWImsIUFl8aBPViX6Zfp+UQcG2kTKxjWPuJ893Cc=; b=GT49k8bZQYu/g8G7kVnJrwFqjy
	l+6vTae6+Rs54cXw+f+J8T9Cs8dgDoqF2dkuaAVJhtWpxVV8zKztlPyQxDmP7SP1AN9XOPHPgtW/M
	GmXzAXgM3ERAiuV6ZoqX7pk3ouzf2des8OKQooRTXn0SN9l2vZEqWRRERdnGRjM0wi4vtkJL4oBel
	md5QOo2Y8t3asFo/gMhR5OqZfcNf2DT+rM8DQb5sHXy9HXPQn6RdGeqtJZ4i2R+Tsdmk4C4fRTC5u
	VoeKS4kY88g++y8O3AC2qRGSgU9cKW/i9ICPRjXsjWUATOlFNhkYrScOsUSIdzla3jDoe+LoxOwE7
	LAmrIjWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5zr-0000000FrVF-1fMk;
	Wed, 12 Aug 2026 10:15:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5zm-0000000FrTA-0o2H;
	Wed, 12 Aug 2026 10:15:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AE03F406FC;
	Wed, 12 Aug 2026 10:15:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B95B31F000E9;
	Wed, 12 Aug 2026 10:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786529737;
	bh=km+FWImsIUFl8aBPViX6Zfp+UQcG2kTKxjWPuJ893Cc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jBANmAl+tkrKwU6nUQz+XEl8WMrZu06odcl5Ygsah2atea2o3pSK5M0u2+Cb5dtxf
	 CszY8HrUw5NMtAls7C3C22W0YPyC1CA0nJKdZUcpz7FAA5jPVo/Q0m+DtWULMhObmk
	 l+U3I5N2ktZz5sC97a6ZDW5tkJ4nC1cvwezLr8g8hsFUxrhmlZiDmiD/TuiPL6gETq
	 29lyz01++9kQ8c8J0lKgi5dg3FD9nUdJp1fGXHTswa5W49MzHFx1LoMu8dAjoNQeyU
	 rf7AgbttoHEku/UruTDEAVbWBJDu1EDPe2V7WWiqzqV5orD6YUJnnC/hIm0+i5Dhnb
	 OSUpU2Op6AKIw==
Date: Wed, 12 Aug 2026 12:15:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-usb@vger.kernel.org, Pankaj Dev <pankaj.dev@st.com>, 
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Rahul Kumar <rahul.kumar05@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christian Bruel <christian.bruel@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/8] dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO
 PHY
Message-ID: <20260812-silky-omniscient-dalmatian-b268cb@quoll>
References: <20260812010157.1772849-1-marex@nabladev.com>
 <20260812010157.1772849-2-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260812010157.1772849-2-marex@nabladev.com>
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

On Wed, Aug 12, 2026 at 02:55:41AM +0200, Marek Vasut wrote:
> From: Pankaj Dev <pankaj.dev@st.com>
>=20
> Document USB2 PHY for STM32MP25 USB2 controllers, which includes the
> USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
> Two such PHYs in total are present in STM32MP25 SoC, they both are
> slightly different, therefore they use different compatible string

What is slightly different? This should be either here, or better, in
"description" part.

> to discern them.
>=20
> Signed-off-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
> Signed-off-by: Rahul Kumar <rahul.kumar05@st.com>

Incomplete/incorrect DCO chain. Who sends it? Rahul?


> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christian Bruel <christian.bruel@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pankaj Dev <pankaj.dev@st.com>
> Cc: Rahul Kumar <rahul.kumar05@st.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Rosen Penev <rosenp@gmail.com>
> Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-usb@vger.kernel.org
> ---
>  .../bindings/phy/st,stm32-usb2phy.yaml        | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/st,stm32-usb2ph=
y.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml =
b/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml
> new file mode 100644
> index 0000000000000..ca9fc3b87383c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/st,stm32-usb2phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 MPU High-Speed USB PHY
> +
> +description:
> +  USB2 PHY block in STM32 is attached to USB 2.0 Host controller and
> +  USB 2.0 side of DWC3 DRD controller, and provides the USB LS/FS/HS
> +  connectivity.
> +
> +maintainers:
> +  - Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> +  - Marek Vasut <marex@nabladev.com>
> +  - Pankaj Dev <pankaj.dev@st.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32mp25-usb2phy1
> +      - st,stm32mp25-usb2phy2
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  vdd33-supply:
> +    description: Phandle to regulator providing 3V3 power supply to the =
USB2 HS PHY
> +
> +  st,syscfg:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: Phandle to system configuration controller.
> +    items:
> +      - items:
> +          - description: phandle to syscfg
> +          - description: USB2PHY control offset within syscfg
> +
> +  "#clock-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - "#phy-cells"
> +  - clocks
> +  - resets
> +  - st,syscfg
> +  - vdd33-supply
> +
> +unevaluatedProperties: false

additionalProperties.

Best regards,
Krzysztof


