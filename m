Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF224C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 02:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/VCzwTsflXecE/LA8NyIZCc4wUo9vJUkRVnEi64uVk=; b=Pxum8RhozChbw6lAiBovmKLy74
	3t/smoYDvuPvO5xp9q64LHLHAHBp2ATCyBwlxSwSgGHltE9ncp1ryCeSkaC3dCLCMM8fd6wEWV75I
	jQkvR5/jtpoYqrcNz4wPbjfyICpCTKQBchcrV9EKV8zeP1cXQrenlXwBqlIMdYjex60USkM7DdCgG
	kPc6sfbouH35uIfj8D3Fg17147YiigEuYkXsgvVsOiYNowTmbzbHBkoXZN0wwm+Tu7F+Ep4tMArUJ
	FNSHjZWGAOKCTELPrv3ZtSP/6R5yO/0lJidOqPE0FpqF2j1gNTv4nBGxG8KqDMoEurn+CqEYh9FkR
	B7kba/mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr4gE-00000000p3k-26o1;
	Tue, 04 Aug 2026 02:14:58 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr4gC-00000000p3G-2wUP;
	Tue, 04 Aug 2026 02:14:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=T/VCzwTsflXecE/LA8NyIZCc4wUo9vJUkRVnEi64uVk=; b=1B
	zwMrQXY2R+8GeQDMzsLBwl6+lx+XH0qy31zRwG5Txtcd53Z/UlGiB6G+y5UhWYsL9szKklFS2hqpJ
	E36k88HZ7acZi6srmdwxRvrAT02FdtDrUWOIB+f7FBXIept5AilXRMX/CG37Nz9GwNDvmWkBfub4S
	UeDNHgYSFUZp1r4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wr4fn-00FtNy-Ck; Tue, 04 Aug 2026 04:14:31 +0200
Date: Tue, 4 Aug 2026 04:14:31 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, mfd@lists.linux.dev,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 08/21] dt-bindings: mfd: x-powers: add AC200
Message-ID: <fa80d6f8-8ddf-48e1-a879-a70f228c79f9@lunn.ch>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-8-0a53cd9e21cc@gmail.com>
 <2c0210b3-2c68-41f1-aa33-3f1693454849@lunn.ch>
 <CADvTj4pfNFVGrQV86T7X+nZQYUamxEYLLWuxVXk=av0da_XocQ@mail.gmail.com>
 <CAGb2v67Wo+WG47jF_vBUOwv0Vw1SDygXMdBgpsy3R1AQ_LLfHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v67Wo+WG47jF_vBUOwv0Vw1SDygXMdBgpsy3R1AQ_LLfHw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_191456_736388_4E24921D 
X-CRM114-Status: GOOD (  18.09  )
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

On Tue, Aug 04, 2026 at 12:51:57AM +0800, Chen-Yu Tsai wrote:
> On Tue, Aug 4, 2026 at 12:45 AM James Hilliard
> <james.hilliard1@gmail.com> wrote:
> >
> > On Mon, Aug 3, 2026 at 7:18 AM Andrew Lunn <andrew@lunn.ch> wrote:
> > >
> > > > +            ethernet-phy-control {
> > > > +                compatible = "x-powers,ac200-ephy-ctl";
> > > > +                nvmem-cells = <&ephy_calibration>;
> > > > +                nvmem-cell-names = "calibration";
> > > > +                phy-mode = "rmii";
> > > > +            };
> > >
> > > What do you mean by an ethernet PHY control?
> > >
> > > I assume this is not an actual Ethernet PHY, but some control logic
> > > around it? Where is the ethernet PHY itself?
> >
> > Correct, this is not the Ethernet PHY itself. It is the package-specific
> > sideband control block that must be configured before the normal Clause 22
> > PHY registers become usable. For AC200, this control block is accessed
> > through the parent AC200 I2C regmap. For AC300, the equivalent control block
> > is accessed through a separate non-PHY Clause 22 address.
> 
> Basically, all the PHY behavior that is normally configured using strapping
> pins on a discrete PHY is done over this I2C channel.

To me this should still be part of the PHY driver, not a separate
driver. The driver drives the hardware, it should drive all of it, all
in one place.

	Andrew

