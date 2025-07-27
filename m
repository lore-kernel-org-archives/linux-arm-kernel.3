Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC68C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 16:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6+It4Ey213trphTymQomqoKQeVEgxSWb6/m2BAFCcKg=; b=VT09scwTOQvgzzfWZ9OL3G0z2C
	xSQV2ukOR7u+NJ1BSbj3tp9jL7sQU/1KTBChZfpuoFIJeINux/FAmlR36IfYtIlA/9wkTliZ2dx6g
	BZszcTxyA6XRg+4ob5ypMm6rzi9FWuomifis0+0lWQAdK59loBKbkucxFH2jEd2+YZML7mc2TaqFg
	4N8XYn6Uu+CcJ/lObw+a5z5mopaeh3i9RRX+aNXomLeNCg1tJ9SmzBYBiWoiJJBlA4E79Zt7v1q/G
	h6mekLca40JF7Z4n+ImP98cRG8oAAW88HffreXEXn4eSgA69TiLiGMt7NvyMOTBoDiUghMyBpbN0q
	G/hVGvXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug4hy-0000000CyRd-1IX6;
	Sun, 27 Jul 2025 16:58:46 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug4UD-0000000Cx78-3dQI;
	Sun, 27 Jul 2025 16:44:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6+It4Ey213trphTymQomqoKQeVEgxSWb6/m2BAFCcKg=; b=KU3etbvUGZOfVLsG2bePY/Gq8I
	/ux6K4u3FHk5NrKtoB+Kf26OX0CQtqGeN0k+ElXxvpvGanwmn92+vUR5xb/ssw7+Y6wjPg9cC5f+9
	GoLu7yTeihQgioaYsviC3k5D89hGxMF7ZPFp6OXZIYY5CIcZDQHjmakmxTm+K7V2071Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ug4U7-0030wF-R4; Sun, 27 Jul 2025 18:44:27 +0200
Date: Sun, 27 Jul 2025 18:44:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add Radxa E24C
Message-ID: <8cf19ce3-28e3-44ee-bf28-06f9c6c406a9@lunn.ch>
References: <20250727144409.327740-1-jonas@kwiboo.se>
 <20250727144409.327740-4-jonas@kwiboo.se>
 <72d979e8-005a-4d4d-b5d2-3f59e78574de@lunn.ch>
 <91ea1a4e-3b83-4857-a410-38425e4e5de0@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91ea1a4e-3b83-4857-a410-38425e4e5de0@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_094433_908304_440863F2 
X-CRM114-Status: GOOD (  17.65  )
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

On Sun, Jul 27, 2025 at 06:26:03PM +0200, Jonas Karlman wrote:
> Hi Andrew,
> 
> On 7/27/2025 6:15 PM, Andrew Lunn wrote:
> >> +&gmac1 {
> >> +	clock_in_out = "output";
> >> +	phy-mode = "rgmii-id";
> >> +	phy-supply = <&avdd_rtl8367rb>;
> >> +	pinctrl-names = "default";
> >> +	pinctrl-0 = <&rgmii_miim>, <&rgmii_tx_bus2>, <&rgmii_rx_bus2>,
> >> +		    <&rgmii_rgmii_clk>, <&rgmii_rgmii_bus>, <&gmac1_rstn_l>;
> >> +	status = "okay";
> >> +
> >> +	fixed-link {
> >> +		speed = <1000>;
> >> +		full-duplex;
> >> +	};
> > 
> > A fixed-link without an obvious reason gets me asking questions...
> > 
> > The schematic indicates there is a realtek 6387 switch on the other
> > end. rtl8365mb.c seems to support this. Is there a reason you did not
> > include this now?
> 
> Sorry, this was mentioned in the cover letter, and patches to enable use
> of the switch is incoming in a separate series very shortly.
> 
> """
> This also leaves out describing the RTL8367RB-VB switch as support for
> the switch requires dt-binding and/or driver changes to make it work,
> something that will be handled in a separate follow-up series.
> """

Ah, sorry, missed that.

Please Cc: me when you post these patches.

For the gmac1 node only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

It is nice to see the correct phy-mode being used.

    Andrew

