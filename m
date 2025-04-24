Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850A7C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 03:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lVLHZZfT6St7FoNWLmtUj+Y+ldCCIK0PNKx+FqyaHs=; b=uYFt17NzwYxHtQZDmwc8rd71TM
	HvZ9731vqbZj2g5uW+G6YutvvmG1VampW2uohP28gnyu67FSN7o1tSAh/gFNIclYtaF/XAd0xC+SD
	WSIbNbQc2nRYgcoSM3rR9foxKofHXG48/eLyxt5Gorba3lrwYKEj9SNfVmmvliF/M+U7Ua+r/JSUx
	Q+JhjzaZ4MW8J5B7NM0xA37UesNNhAqUqKF/PtfvrMxv+unS515BbMzruziaRUT/2JByJSjajRRzK
	hqLIGxE3t+bki/GE+1pNRwta1sCTD51mxYULpDVyYC3sy9M8pkTPkZpz6eKistp4pULpC6jR0CDzU
	Pf9i400g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7nHg-0000000CjwK-3crb;
	Thu, 24 Apr 2025 03:29:56 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7nD4-0000000CjGz-2icJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 03:25:14 +0000
Received: from localhost (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 4ED3333BE00;
	Thu, 24 Apr 2025 03:25:09 +0000 (UTC)
Date: Thu, 24 Apr 2025 03:25:05 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: allwinner: t527: add EMAC0 to Avaoto-A1
 board
Message-ID: <20250424032505-GYB47799@gentoo>
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
 <20250423-01-sun55i-emac0-v1-5-46ee4c855e0a@gentoo.org>
 <20250424021706.22eaab66@minigeek.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424021706.22eaab66@minigeek.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_202510_713798_75FA36AD 
X-CRM114-Status: GOOD (  21.46  )
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

hi Andre,

On 02:17 Thu 24 Apr     , Andre Przywara wrote:
> On Wed, 23 Apr 2025 22:03:26 +0800
> Yixun Lan <dlan@gentoo.org> wrote:
> 
> Hi,
> 
> > On Avaoto A1 board, the EMAC0 connect to an external RTL8211F-CG PHY,
> 
> The name would be "Avaota" A1 board.
> 
> > which features a 25MHz crystal, and using PH8 pin as PHY reset.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> > I don't own this board, only compose this patch according to the
> > schematics. Let me know if it works.
> > ---
> >  arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> > index 85a546aecdbe149d6bad10327fca1fb7dafff6ad..23ab89c742c679fb274babbb0205f119eb2c9baa 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> > @@ -64,6 +64,23 @@ &ehci1 {
> >  	status = "okay";
> >  };
> 
> As for the Radxa board, we need an alias for ethernet0.
> 
> >  
> > +&emac0 {
> > +	phy-mode = "rgmii";
> 
> As Andrew mentioned, this should probably be "rgmii-id".
> 
> > +	phy-handle = <&ext_rgmii_phy>;
> 
> Can you please add the phy-supply here, it's reg_dcdc4.
> 
> Cheers,
> Andre
> 
> > +
> > +	allwinner,tx-delay-ps = <100>;
> > +	allwinner,rx-delay-ps = <300>;
> > +
> > +	status = "okay";
> > +};
> > +
> > +&mdio0 {
> > +	ext_rgmii_phy: ethernet-phy@1 {
> > +		compatible = "ethernet-phy-ieee802.3-c22";
> > +		reg = <1>;
> > +	};
> > +};
> > +
> >  &mmc0 {
> >  	vmmc-supply = <&reg_cldo3>;
> >  	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_DOWN)>; /* PF6 */
> > 
> 

all above comments make sense, will address in next version
-- 
Yixun Lan (dlan)

