Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A85C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 16:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfYxhT92+8A6gWfGGKLpIf5nhSq7v4aUuvhWH2UbJM0=; b=ST4Dba5cTlizfL3vlE8JNefSO7
	4tPUJ38PdbT3OF6KS4xLt3XBVhqSDuBo7I20DkdFgdQMZx2cFmKS8DkkDfhOzJbBmTaL1Y21PnvO2
	unX/04VpLSba7pkM93UjpgCjT7Rp8cTevPXR2ro4292l+LX5ME7nby5RhOorUTREMHLBmEk7MPCaR
	w/goFfY/l8/6BwG0zN3KQEXYE+8qdPTnA7OcR+HbX0nFcJdFMwwSrmWx+deA3g6PS73Fc65gi+iI0
	3yEn57CIDRAXK4dWYAPV8h5QABp4+4Gu5VzSX+Hs5jcacxCTp/nlShrzchajRWcr2U/unNkXxk7Hv
	fRozc/TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEA1T-00000007Z3I-2LM9;
	Sun, 11 May 2025 16:59:31 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE9l2-00000007X9F-2goT;
	Sun, 11 May 2025 16:42:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QfYxhT92+8A6gWfGGKLpIf5nhSq7v4aUuvhWH2UbJM0=; b=eR7newBUNJ4wqxhc3b1d+3qx/c
	EOFDvTqf8qqEfYJ3R0yC22QrqFJkDAo9E2rWR3JFi6/u5WH2/sFe4owsAocJSN4RWaPCSw9lyau9J
	KZz2Du6+pdPtjQOcMq/y8NdG6pS80LfMlxgQl+jEMlQqtiXiHhIxDAtgmd4t/z9Crhi0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uE9km-00CGJu-GZ; Sun, 11 May 2025 18:42:16 +0200
Date: Sun, 11 May 2025 18:42:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 09/14] arm64: dts: mediatek: mt7988: add switch node
Message-ID: <bfa0c158-4205-4070-9b72-f6bde9cd9997@lunn.ch>
References: <20250511141942.10284-1-linux@fw-web.de>
 <20250511141942.10284-10-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511141942.10284-10-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_094232_681541_F0CFD2E7 
X-CRM114-Status: GOOD (  15.16  )
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

On Sun, May 11, 2025 at 04:19:25PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add mt7988 builtin mt753x switch nodes.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 166 ++++++++++++++++++++++
>  1 file changed, 166 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> index aa0947a555aa..ab7612916a13 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> @@ -5,6 +5,7 @@
>  #include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/pinctrl/mt65xx.h>
>  #include <dt-bindings/reset/mediatek,mt7988-resets.h>
> +#include <dt-bindings/leds/common.h>
>  
>  / {
>  	compatible = "mediatek,mt7988a";
> @@ -742,6 +743,171 @@ ethsys: clock-controller@15000000 {
>  			#reset-cells = <1>;
>  		};
>  
> +		switch: switch@15020000 {
> +			compatible = "mediatek,mt7988-switch";
> +			reg = <0 0x15020000 0 0x8000>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +			interrupt-parent = <&gic>;
> +			interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>;
> +			resets = <&ethwarp MT7988_ETHWARP_RST_SWITCH>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				gsw_port0: port@0 {
> +					reg = <0>;
> +					label = "wan";

I would expect the label to be in the board .dts file, since it is a
board property, not a SoC property.

	Andrew

