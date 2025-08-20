Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477F4CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 13:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23JiI9Gumsb/rLx4cuVULAx/qkeZ5t8+893/fbaahsA=; b=NH2X3t+GxS27qle29KzajTimwo
	DyPjOBx/YCXaoZ1lY6lTAE4GWuWaXXXD+oR+j152vOu3RWE7w2IR8tLldjlbzLN7UYFbUZNOVJ/tW
	2Wm4FrDzB/MHCGL9mJr2TcyfrIcT4WVKZP0mFR3E2DhplGlr3Y55Y4joxeADgptFTF3ZlrYOW7IQZ
	cITfXF7/0SAdRsVaq3FLwa23UGDM7fDNJSnAxeADbq0N8iWS2x/Xtbh2pK0mtU0/T6Evqo2kE3lmo
	0DmLOPK76Jo7J5EcOauVme+tYI/BzdllZW+Or/LRi1ejR8OERtUIahPuf0frSDYwNu195GuYoZ68r
	LvJRN+BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoiwo-0000000DoCl-3Dwu;
	Wed, 20 Aug 2025 13:33:50 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uohiX-0000000DWtF-1fSm;
	Wed, 20 Aug 2025 12:15:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=23JiI9Gumsb/rLx4cuVULAx/qkeZ5t8+893/fbaahsA=; b=X185EkT0rWuh6auczvYqCm1Sk6
	aOK4BsPPzEBb5mULL84/PKIqjOCJSRGE1PNIEC+cT3a3IecUMSQQLriOQboXNUzVi9V2JhJwbY7xt
	0j0WJmZWBjUB2xYlu176+q623lX+ow5OFIsQI/vpH4funOwGxcrdzvaOy+Yj8w8xjUXs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uohiR-005JoT-1m; Wed, 20 Aug 2025 14:14:55 +0200
Date: Wed, 20 Aug 2025 14:14:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Mateusz Koza <mateusz.koza@grinn-global.com>
Cc: angelogioacchino.delregno@collabora.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	marcin.czarnecki@grinn-global.com, b.bilas@grinn-global.com
Subject: Re: [PATCH v3 1/4] arm64: dts: mediatek: mt8390-genio-700-evk: Add
 Grinn GenioSBC-700
Message-ID: <d72ae17f-f634-4148-9c89-d5a7ed4f6b21@lunn.ch>
References: <20250820120905.993189-1-mateusz.koza@grinn-global.com>
 <20250820120905.993189-2-mateusz.koza@grinn-global.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820120905.993189-2-mateusz.koza@grinn-global.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_051501_439584_1564DA54 
X-CRM114-Status: UNSURE (   6.32  )
X-CRM114-Notice: Please train this message.
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

> +&eth {
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethernet_phy0>;
> +	snps,reset-active-low;
> +	snps,reset-delays-us = <0 11000 200000>;
> +	mediatek,tx-delay-ps = <30>;
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&eth_default_pins>;
> +	pinctrl-1 = <&eth_sleep_pins>;
> +	mediatek,mac-wol;
> +	snps,reset-gpio = <&pio 147 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +};
> +
> +&eth_mdio {
> +	ethernet_phy0: ethernet-phy@3 {
> +		reg = <3>;
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		eee-broken-1000t;
> +		interrupts-extended = <&pio 148 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};

Thanks for fixing the phy-mode.

For these two nodes only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

