Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD56C98338
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 14:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GrtPLSHuGFunnRTeKC4/1IN66fdE0NzWWL3U7Y3AHv4=; b=EFCeFZft4KK6BOh1JoClCCBwfy
	46iKgKIv/rhBQgxUFk0I8gQxR53dWMdew8EOOGjwu6pl5CzzQHoF4uTW/sLdRzoGN473QDz3VszJZ
	Om0c3L0NocyE03Q9gQ2zu+mjfn0pHnnq80T1Dk3jCqKSj5+nR6xdjyocbQH6BKMcB6SnawB2hHStR
	jHx0zAvDcjKfbtgSjAjawuEqMT2CvEsvqKBh6CQB/cUhFWAUMp/WNywOxcW5JW3eyjGXPa+U4gIbW
	XrdZxG3/g00lp45o42HO6+aFav9i4NTe+UTzQ4eQiL0WpDVFnNY/YYW8Vf5NAV29kdU2M5fK1WHvI
	8val+qeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xATOG-0000000FWKe-1lhI;
	Sat, 26 Sep 2026 14:28:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xATOF-0000000FWKO-0gJq;
	Sat, 26 Sep 2026 14:28:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 92FF740BFA;
	Sat, 26 Sep 2026 14:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD98A1F000FF;
	Sat, 26 Sep 2026 14:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790432914;
	bh=GrtPLSHuGFunnRTeKC4/1IN66fdE0NzWWL3U7Y3AHv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aBtdPr31z/4GcOnJrdt3AhE2XxsFsQyD7QXH+VW6d6xyIfsz+DlsLlMqtxRYXUtCW
	 YF6nXiDf2SY5uUdHmLvtbMoi99zYMBCuuJlS7Sq6kOzTVWiYejOtPIW5QAbTepVnnY
	 bSV1wy+HkDjJpUMwjiHqAnGDfpRbKzNqhMAZ3+3IiegN32oXLJh5EZw3uIluodP5cE
	 9mPYUYKe+7WYsir25v17JCGAQ10geajRqfdmzqhX7m2Y8oCUonD4lSWm8q72HTHIji
	 t/mv2DLMA9ZlgVjRQ6qfe0hhgGYvf9qwkbEy5p5QW06W0y/CGQ9q+rKcVaWvDSckgd
	 TUV2YCHZ7Yhmg==
Date: Sat, 26 Sep 2026 16:28:15 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v11 1/3] dt-bindings: phy: Add documentation for Airoha
 AN7581 USB PHY
Message-ID: <n73mmftx3ur7uw7yybztl2z2z2u6qgoec6mpplp55vbb6mt2fk@ps2grf5tsvpr>
References: <20260724184523.193661-1-ansuelsmth@gmail.com>
 <20260724184523.193661-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260724184523.193661-2-ansuelsmth@gmail.com>
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

On Fri, Jul 24, 2026 at 08:45:20PM +0200, Christian Marangi wrote:
> Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
> for the USB controller.
> 
> Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> always supported. The USB 3.0 mode is optional and depends on the Serdes
> mode currently configured on the system for the relevant USB port.
> 
> To correctly calibrate, the USB 2.0 port require correct value in
> "airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
> selecting one of the 4 monitor clock for calibration (internal clock not
> exposed to the system) but each port have only one of the 4 actually
> connected in HW hence the correct value needs to be specified in DT
> based on board and the physical port. Normally it's monitor clock 1 for
> USB1 and monitor clock 2 for USB2.
> 
> To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
> property is required with the phandle pointing to the correct Serdes port
> provided by the SCU node. Providing the phys property is optional if USB
> 3.0 is not used.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/phy/airoha,an7581-usb-phy.yaml   | 62 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
> new file mode 100644
> index 000000000000..f42e3d49a61f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/airoha,an7581-usb-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AN7581 SoC USB PHY
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +description: >
> +  The Airoha AN7581 SoC USB PHY describes the USB PHY for the USB controller.
> +
> +  Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> +  always supported. The USB 3.0 mode is optional and depends on the Serdes
> +  mode currently configured on the system for the relevant USB port.
> +
> +properties:
> +  compatible:
> +    const: airoha,an7581-usb-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  airoha,usb2-monitor-clk-sel:
> +    description: Describe what oscillator across the available 4
> +      should be selected for USB 2.0 Slew Rate calibration.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3]
> +
> +  phys:
> +    items:
> +      - description: phandle to Serdes PHY. Optional if USB 3.0 is not used.
> +
> +  '#phy-cells':
> +    description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
> +      as defined in dt-bindings/phy/phy.h.
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - airoha,usb2-monitor-clk-sel
> +  - '#phy-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/soc/airoha,scu-ssr.h>

Rob's bot triggered compilation error due to this missing header.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

