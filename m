Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27760CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 16:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/D+PVB9+rPAmB6Yp29iHJDbXlcNgoL7yvzeK2B1ygAo=; b=p6IVWYe4NCP378Dnr2kY1t0eIr
	4klqzv2GWle3mMMh5J0fk6mNrkSh14OsDGnN6EdWSs3XMWff29odTv0fJ4Fcsa6/hhT1borirf7r7
	tPp1MMY99RyhkTi00geDipbouTskYghHVfXJWcqizD3NFOQ+4xSgdJ/rq0hp7f3gr/VWtv6gLEWSQ
	7DXrGkKJN+/+E6C4VrVec0lEtXwa7aNN0D26ws7fCXOwY9VZ8W94p1Hm0IJC7nyVrNevUDA3A+vdK
	qKTeMMllUcGf+N/CrpSGlBFNskKX1nLlVmx2l2qZqQUNasQYsbiOL4ZJbW9/EpThxeYclc6aNQVvl
	+BbX9qSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5o0m-00000000OFf-2oHC;
	Mon, 06 Oct 2025 16:24:32 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5o0k-00000000OEu-2AmL;
	Mon, 06 Oct 2025 16:24:31 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2FB52B0B;
	Mon,  6 Oct 2025 18:22:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759767775;
	bh=q4y+WjKg8QKovIhfsz5mhoBisvqugua5xV6TPvamwY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fh057Ycs0+XNzsIJ6pHqE414nAvgR66G3qCWmS7EA7zhO40hZJEuFaLo5c0Rr4BfH
	 U9RKela09E/rAZQHcrHEkaVsA61YVFYOw+BvAiB1vd78vCxJGt83ZO+ASRLhJy8/dT
	 n0tQUMjOVNc0lBsvNC2sB51BKvrxEBXhBaVpNEBY=
Date: Mon, 6 Oct 2025 19:24:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andrew Lunn <andrew@lunn.ch>
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
Message-ID: <20251006162420.GI5944@pendragon.ideasonboard.com>
References: <20251002034708.19248-1-laurent.pinchart@ideasonboard.com>
 <20251002034708.19248-4-laurent.pinchart@ideasonboard.com>
 <4d337915-e3a9-46b7-a30b-ccb47ad33556@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4d337915-e3a9-46b7-a30b-ccb47ad33556@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_092430_696393_A84C3AA5 
X-CRM114-Status: GOOD (  13.20  )
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

On Mon, Oct 06, 2025 at 06:06:21PM +0200, Andrew Lunn wrote:
> > +&gmac1 {
> > +	clock_in_out = "output";
> > +	phy-handle = <&rgmii_phy>;
> > +	phy-mode = "rgmii-id";
> > +	phy-supply = <&vcc_3v3>;
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&gmac1_miim
> > +		     &gmac1_rx_bus2
> > +		     &gmac1_tx_bus2
> > +		     &gmac1_rgmii_clk
> > +		     &gmac1_rgmii_bus>;
> > +	tx_delay = <0x42>;
> 
> Nice to see phy-mode 'rgmii-id', but 0x42 is pretty high in comparison
> to other boards correctly using 'rgmii-id', and is asymmetric with no
> rx_delay value.
> 
> I cannot say this is wrong, it is just odd, not what i would expect.

I copied it blindly from the BSP. Dropping the property, I can still
ping the board, so I removed it in v2. There's more that will need to be
investigated there, as clock_in_out should likely be "input", but I
couldn't get that to work. I'd like to leave this to someone else as I'm
lacking time to fix it (and ethernet is also not my strongest
expertise). I could drop the gmac1 completely, but I think the starting
point is valuable.

-- 
Regards,

Laurent Pinchart

