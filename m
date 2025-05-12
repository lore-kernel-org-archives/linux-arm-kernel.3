Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D80C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 17:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fkv+15KBtcnl2E13JZiWWqtK49x1De9sFTdRuCeQqnE=; b=Ipr17TuuZ9QLa3TnIxw8oZOlDo
	1TYclfSj+74bdC0lfePkPeSVWfAutx4W93kWWb4CGJj6oDgRYjaYlUIb2yDgHQLAZohHhuZ6Y/Imn
	jT3RW0aONRA91EFuGKU+76g1M0VQ3BqvqSyh4VZOPyM7BhEYYeJ6jCS0gCdD+ZqT8HyD+mAE6bFbF
	KWmj7wASdj4t4Nk+jRp3D1kDcK55/fs3IsptHFjBm9EI9BLvgq+tS8kpZ+2dIfzv+p31m/JgiRv0R
	/VthFQQjRTIvqtfEM12708BZFQoSGNTIYFvGa7nIVwe8VO8nF0v+GiuPPcEJjV9O9jEqDxBCQribA
	o3ALTuNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEWtd-0000000ACYW-0po9;
	Mon, 12 May 2025 17:24:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEWQL-0000000A7xQ-0iMc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 16:54:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5CD545C0774;
	Mon, 12 May 2025 16:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC02CC4CEE7;
	Mon, 12 May 2025 16:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747068880;
	bh=DOkieu2c/As5OFutbPhmnXPXloxqiulZTsFGw/r3wro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vJoJ5l++Z+dcFY6SizXnpd6EHzB6naYhpvlSsblZ51SAuS6wfPtcPLCkRGQR0s4h8
	 5v97FKgpO3NAs8jDNfdQWdsmDSYYLH/CF4l4rAOjzeQTZlcAAIm4LKRvCgKkwqZFtZ
	 NfTlv9g9LbWEypPlT9nxKjw4zIJ/6T+RZP+BNaxqpY7SpQQpb+W8jMZH7Su0TcCCmt
	 shXg7d08i3t/ttvGQEtWpA2bjIakKI0vlj47i8w6shFrdkl20vuTEmepWLuVI/YkRc
	 vBuw0jNMChoLvzO2yxPGltjbQHgmfi1EDH4iAJ4/QjRr4+KCOT4yauk2ecxXOIIdaq
	 1CEwRKbhN2i0w==
Date: Mon, 12 May 2025 18:54:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, vladimir.oltean@nxp.com
Subject: Re: [PATCH v2 1/6] dt-bindings: mfd: add bindings for QIXIS CPLD
Message-ID: <20250512-festive-aquamarine-junglefowl-572f90@kuoka>
References: <20250509152940.2004660-1-ioana.ciornei@nxp.com>
 <20250509152940.2004660-2-ioana.ciornei@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250509152940.2004660-2-ioana.ciornei@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_095441_253919_5B8377F7 
X-CRM114-Status: GOOD (  13.04  )
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

On Fri, May 09, 2025 at 06:29:35PM GMT, Ioana Ciornei wrote:
> This adds device tree bindings for the board management controller -

"Add devicetree bindings...."

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> QIXIS CPLD - found on some Layerscape based boards such as LX2162A-QDS,
> LX2160AQDS, LS1028AQDS etc.
> 

...

> +title: NXP's QIXIS CPLD board management controller
> +
> +maintainers:
> +  - Ioana Ciornei <ioana.ciornei@nxp.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The board management controller found on some Layerscape boards contains
> +  different IP blocks like GPIO controllers, interrupt controllers, reg-muxes
> +  etc. The QIXIS CPLD on these boards presents itself as an I2C device.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,ls1028a-qds-qixis-cpld
> +      - fsl,lx2160a-qds-qixis-cpld
> +      - fsl,lx2162a-qds-qixis-cpld

I think my question why existing compatibles cannot work is still valid.
If you responded to that and I missed reply, please point me, but I see
I replied on 7th May and you sent it later - on 9th May.

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  '^mux-controller(@[a-f0-9]+)?$':

Either children have bus addressing or not. This should not be flexible,
because rarely devices differ. If devices differ, then you need separate
schema most likely.

> +    $ref: /schemas/mux/reg-mux.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"

Best regards,
Krzysztof


