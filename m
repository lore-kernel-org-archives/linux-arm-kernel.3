Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57DBC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 03:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+ZPbB+hMQV07aig0TFscO1xrcyUrCsxA+h8FeZmuZA=; b=gKQn9kOWnuv1N5AmyXITDAZN8o
	qbKeq0tDa/V65VHGoJJ3sExAOpkKvMz5hwigg7kfaDGlr0rds9Yg8pHVvDOaoj3XMfvXtbjcz91VR
	Bzr32/SurIXPmAwAZRl1Ggrrfsxpi9ijNyYTxz0Ott/fkibD6fe9KbMf9kPJKlJc1DtBctrrSqjrg
	Z+DlL3pYe6ppiqeSEkV2fAyjBjPi8hC6eCLC1z4z4mSTrMKA6gtKzzLKzvNJx1KviJ3ai7s0VD55b
	Jr9nxQankmI/khglgMBjDEtT4wZH9qcQpmpQDtPzTiV+fkNr3CL+0kjzkBWyr3vj2R+ekfQd4mPzF
	8ojg/1eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7nFk-0000000Cjeq-0RgW;
	Thu, 24 Apr 2025 03:27:56 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7nCK-0000000CjAI-48Ox
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 03:24:26 +0000
Received: from localhost (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C8D4D342FAE;
	Thu, 24 Apr 2025 03:24:21 +0000 (UTC)
Date: Thu, 24 Apr 2025 03:24:17 +0000
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
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E
 board
Message-ID: <20250424032417-GYA47799@gentoo>
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
 <20250423-01-sun55i-emac0-v1-4-46ee4c855e0a@gentoo.org>
 <20250424014341.7006ea65@minigeek.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424014341.7006ea65@minigeek.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_202425_051597_15C1EDFD 
X-CRM114-Status: GOOD (  18.47  )
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

Hi Andre,

On 01:43 Thu 24 Apr     , Andre Przywara wrote:
> On Wed, 23 Apr 2025 22:03:25 +0800
> Yixun Lan <dlan@gentoo.org> wrote:
> 
> Hi Yixun,
> 
> > On Radxa A5E board, the EMAC0 connect to an external YT8531C PHY,
> > which features a 25MHz crystal, and using PH8 pin as PHY reset.
> > 
> > Tested on A5E board with schematic V1.20.
> 
> Can you please add a name to the /aliases node, to make U-Boot add a
> MAC address?
> 	ethernet0 = &emac0;
> 
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
> > index 912e1bda974ce5f64c425e371357b1a78b7c13dd..b3399a28badb5172801e47b8a45d5b753fc56ef1 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
> > @@ -54,6 +54,23 @@ &ehci1 {
> >  	status = "okay";
> >  };
> >  
> > +&emac0 {
> > +	phy-mode = "rgmii";
> > +	phy-handle = <&ext_rgmii_phy>;
> 
> Can you please add the phy-supply here, which should be CLDO3? It's
> referenced by other nodes, so would be enabled already,but each node
> should be self-contained.
right, I was about to check and then forgot.. will add it back next version

-- 
Yixun Lan (dlan)

