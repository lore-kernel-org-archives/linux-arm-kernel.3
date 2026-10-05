Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82105CA5FF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 21:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TxAZ85y4jPD5s6/gsYfi/z3sFIrC/VFwdMDoYbCyWJc=; b=dcY41DKvlat62mfzD5g2PHIn6+
	O2kH2vo663Jxm8B+h/snRvuSbe2Gam1ef64+Aw64NGslZw1q7Sx5tkQXBX0gAeyTIjA9aLmB3z8cE
	zMFmaXTP5R9sLK5mDRVASqtdurkkrPoEF/QLmCGN1STGY6IlUaOpYBKuZgK7qdRya8bPYG8GZ8O6S
	qqpxmSKYOBnonuKBr1MygJN8BCZO4ejYRZfWg5m2Yaxi1H3xsgU3jiqX8x19gowYXmzmmaKajMPWS
	gV1dMuJLgcPG1+A4bpiPRdwmcJL8y4g7HXnpCbyNn7BEgundVpKzXI42YLxilPlac4g48T0eoVohM
	+tKtr3tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDqT0-0000000HCmy-1v1E;
	Mon, 05 Oct 2026 21:43:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDqSy-0000000HCml-3kux;
	Mon, 05 Oct 2026 21:43:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F2F9B600D1;
	Mon,  5 Oct 2026 21:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9567B1F00893;
	Mon,  5 Oct 2026 21:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791236603;
	bh=TxAZ85y4jPD5s6/gsYfi/z3sFIrC/VFwdMDoYbCyWJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iNXt2f1D5yr4eLJJkViQNyvzNJcHgpioVSb3IhMAnCtXQ2GkFWptccYPOSqGMdEyh
	 f4CGWgQuthldVyHWoxchFv4aaWL8K+Y8wEJkuoPQDGYI9saAxK73d6BVmcFfG3FazF
	 s5ERiUy3ivGiCf2UKzbTearhuPI8+aT3KAlXirdRTeJP17Qaj/6luDZTMEN1EkJHcJ
	 Gk1i4A2p9I+njIzrKC8BOrjAdi3qHK1CAdZvGHqTaCbeE4Wzqu5BzNMo/iBVFiab7c
	 gaboAHRTlQ+koKcYUyZDgBwjvavGT7IhYw2m2j9pFKMz890QpF0JBYaRt6T57BQwOC
	 LC6jF5s/A/1CQ==
Date: Mon, 5 Oct 2026 23:43:19 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v10 03/11] phy: rockchip: naneng-combphy: add
 SGMII MAC selection for RK3568
Message-ID: <asQZ99CMsQF10-RZ@parshuram>
References: <20260922200336.2201212-1-coiaprant@gmail.com>
 <20260922200336.2201212-4-coiaprant@gmail.com>
 <20261005135939.01ccde50@kernel.org>
 <CALj3r0h7j-4ZAiX67LmbgpmYCvK-Xmzd_qnYYgoBmniAW+eiWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALj3r0h7j-4ZAiX67LmbgpmYCvK-Xmzd_qnYYgoBmniAW+eiWw@mail.gmail.com>
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

On 06-10-26, 05:15, Coia Prant wrote:
> Jakub Kicinski <kuba@kernel.org> 于2026年10月6日周二 04:59写道：
> >
> > On Wed, 23 Sep 2026 04:03:27 +0800 Coia Prant wrote:
> > > On RK3568, the SGMII interface can be routed to either GMAC0 or
> > > GMAC1 via the GRF register pipe_sgmii_mac_sel.
> > >
> > > Add support for this selection by introducing
> > > the "rockchip,sgmii-mac-sel" DT property.
> > >
> > > From the RK3568 TRM (Part1, Page 229), the PIPE_GRF_XPCS_CON0
> > > bit 1 (pipe_sgmii_mac_sel) is defined as:
> > >
> > >     0: SGMII routed to GMAC0
> > >     1: SGMII routed to GMAC1
> > >
> > > The hardware reset value is 1 (GMAC1). If the property is set to 0,
> > > the driver routes SGMII to GMAC0; if set to 1 (or omitted), it
> > > remains at GMAC1.
> > >
> > > This is necessary for boards such as the Ariaboard Photonicat, which
> > > uses the SGMII interface connected to GMAC0.
> > >
> > > Out-of-range values are rejected by dtschema, so the driver does not
> > > duplicate the range check.
> >
> > While looking thru the patches again I noticed this is changing generic
> > PHY. Maybe you can send it separately to Vinod? I don't see a hard
> > dependency? The code can "converge" during the merge window for the
> > whole thing to work.
> 
> Hi Jakub,
> 
> Thanks for the suggestion. I looked at this again, and I think the
> dependency is a bit more involved than it might seem.
> 
> The PHY patch (03/11) adds the driver support for
> "rockchip,sgmii-mac-sel", which is documented by the PHY binding (02/11).
> The DTS patch (10/11) then uses this property. If I send 03/11 separately
> to Vinod and keep 10/11 in net-next, dtbs_check will flag the DTS property
> as undocumented until the PHY binding lands in mainline. That would break
> DTS validation for the net-next series.

Typical order is that binding and driver goes thru subsystem (in this
case phy tree) and dts thru the soc tree.

I can review and pick these if you would like
> 
> Also, splitting into separate series means each has to queue and get
> reviewed independently, which I'm worried might not all make the merge
> window in time.
> 
> So unless you strongly prefer splitting, I'd rather keep the whole series
> together in net-next. If that works, would it be possible to coordinate an
> Ack from Vinod for the PHY part? Or if you still think it should go
> separately, I can do that too, but I wanted to flag the dependency and
> timing first.
> 
> Thanks,
> Coia

-- 
~Vinod

