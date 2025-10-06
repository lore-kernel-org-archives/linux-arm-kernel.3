Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7AACCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 16:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BAgyMAPnS0Hb98FmqDxYvuYrFMU1TlWK4dPYQ9fT3xA=; b=qFlY4DsuJokePTgAGDTjjxub30
	bTPMRN3zuzfXlz+k1XmRD0mPq44/VCkcZoHg2k52QMOeXaVuYxGD7qwtmL9SltEoHh3/DpimY5OvI
	pixPAoXNRth81iWNlK/xaoR7cidQw2mtyyQb4V63jircUcMcO/K8tfS76C2Uxe6HKIRevbtD51U0R
	rIn7f5ErFND82HiZ//dX2JH+NDAv4mz6Bc6KtDTs3q3oU8y8bdMVbLRsNJZEbRPxTihGrHGO3ueB5
	XPxiGApdlmH2sT2GDLTnRTZq3PsulL0Ped5Ow3g3AAFqx4Mum8a6W8Lpsy6/wCej5eUywPiK3eUW0
	uGVM9+rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5njK-00000000LgC-1bJS;
	Mon, 06 Oct 2025 16:06:30 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5njH-00000000LfU-3BnG;
	Mon, 06 Oct 2025 16:06:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=BAgyMAPnS0Hb98FmqDxYvuYrFMU1TlWK4dPYQ9fT3xA=; b=HA4YuuoOqpokJk8bCto6LWkS/V
	WleA3AulFkSF3p82isDuCbu0Dh+q3ItRjOittlQj70j1jlclODyAkx+nmI55npIjVnSnzIWHd5rTS
	0Hb12jTUzyH/qw4Le25IpcIBwjkU0Eg5UmFSw6U4U3GFVIb2PsCLPHhFMqIsS6fsioho=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v5njB-00AJ3z-A6; Mon, 06 Oct 2025 18:06:21 +0200
Date: Mon, 6 Oct 2025 18:06:21 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Algea Cao <algea.cao@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cenk Uluisik <cenk.uluisik@googlemail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>, Jimmy Hon <honyuenkwun@gmail.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Muhammed Efe Cetin <efectn@6tel.net>, Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>, Sandy Huang <hjc@rock-chips.com>
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add rk3588s-orangepi-cm5-base
 device tree
Message-ID: <4d337915-e3a9-46b7-a30b-ccb47ad33556@lunn.ch>
References: <20251002034708.19248-1-laurent.pinchart@ideasonboard.com>
 <20251002034708.19248-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002034708.19248-4-laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_090627_796788_52B3E722 
X-CRM114-Status: UNSURE (   7.78  )
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

> +&gmac1 {
> +	clock_in_out = "output";
> +	phy-handle = <&rgmii_phy>;
> +	phy-mode = "rgmii-id";
> +	phy-supply = <&vcc_3v3>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac1_miim
> +		     &gmac1_rx_bus2
> +		     &gmac1_tx_bus2
> +		     &gmac1_rgmii_clk
> +		     &gmac1_rgmii_bus>;
> +	tx_delay = <0x42>;

Nice to see phy-mode 'rgmii-id', but 0x42 is pretty high in comparison
to other boards correctly using 'rgmii-id', and is asymmetric with no
rx_delay value.

I cannot say this is wrong, it is just odd, not what i would expect.

  Andrew

