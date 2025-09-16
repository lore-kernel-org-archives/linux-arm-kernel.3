Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17B2CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 22:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0NhlOmwwkbZxCW85MLAxOa0IFUPYAvjNPwpAMzd4f7U=; b=BW3UkiJEXsnCGAttAhuBrzJmDK
	kYjUYrAHpv/kl7O5zA4MHW9Mh9Nv1uP4oU0Qp/jPhmfOhPanr7Y6x5sq2A+uftctx9IxfHLGpyL2u
	+tbTbm18cFAu/kfWft/0CxUR6cjqoiXSZg2PMzBebN+dm6/tMg2TCxnO398uXezrkjEo0BmtTvYsd
	GKKDSdsoIRhPWZ/B/hbJdRHXsMCgo9d6/rfQfk0qvYAgJJ6c3Xw4zreVNroAEVABSWITGS3dhtych
	nYEmXz81ZmXKnG7kkUhQyq5GrrSAz4aR8TZkU7IC+XbE5gF9nfRE5GjPHl29H1Fr4k5uoJfl4mqd8
	YJT/ZXnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uydne-00000009KaU-3vmr;
	Tue, 16 Sep 2025 22:05:22 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uydnb-00000009Ka7-42GS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 22:05:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0NhlOmwwkbZxCW85MLAxOa0IFUPYAvjNPwpAMzd4f7U=; b=TmB0SquXq7T6jSiGvoN6t1GMKP
	WCDhj8wDFT/A5PtG/BREIkNIGFYYAxh0o98TF9TGgB45iejGzcgjHgrDRf8QbExubYbvnSsGTo7iM
	HkqW4BWHrciZDw7mdTmFDRUGMUNxD6s20rxchpp0SM9C518HluqC8mgPS09hTXWLXCuo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uydnP-008cU8-I7; Wed, 17 Sep 2025 00:05:07 +0200
Date: Wed, 17 Sep 2025 00:05:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Rebecca Cran <rebecca@bsdio.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: add device tree for ASRock Rack
 ALTRAD8 BMC
Message-ID: <cc00cc74-778f-45ae-b48f-be26c91f78c7@lunn.ch>
References: <20250911051009.4044609-1-rebecca@bsdio.com>
 <20250911051009.4044609-3-rebecca@bsdio.com>
 <58a092c5-5dd0-4718-831a-e25ecb184087@lunn.ch>
 <5ccc4945-87f6-4325-b034-ca3f2f90257a@bsdio.com>
 <74e68c53-2696-4f86-97d3-c0b0a74d4669@lunn.ch>
 <92bcdac9-44b1-4fc8-892a-01ef0ed0b7e0@bsdio.com>
 <3f5e82ec-d96e-4258-b117-9876313f5402@lunn.ch>
 <e9b0d9c8-9117-4c75-93a7-1c334d823d99@bsdio.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9b0d9c8-9117-4c75-93a7-1c334d823d99@bsdio.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_150521_376469_2FD9784D 
X-CRM114-Status: GOOD (  16.34  )
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

On Tue, Sep 16, 2025 at 03:22:04PM -0600, Rebecca Cran wrote:
> On 9/16/25 13:07, Andrew Lunn wrote:
> 
> > Now, it looks like all other aspeed-g5 boards also don't link to the
> > PHY. But the driver does seem to support adding an 'mdio' node within
> > the ethernet node, and listing the PHYs. Something like:
> > 
> >         mdio {
> >                  #address-cells = <1>;
> >                  #size-cells = <0>;
> > 
> >                  ethphy0: ethernet-phy@0 {
> >                          reg = <0>;
> >                  };
> >          };
> > 
> > And then you can add a phy-handle to point to it.
> > 
> > Then the question is, did Aspeed mess up the RGMII delays for g5? You
> > can try phy-mode = 'rgmii-id' and see if it works.
> 
> I can't get that to work, with either 'rgmii-id' or 'rgmii'.
> 
> It says "Failed to connect to phy".

That probably means i have the wrong reg value. Try 1, 2, ... 31.

Or put a printk() in phy_find_first() to print the value of addr.

	Andrew

