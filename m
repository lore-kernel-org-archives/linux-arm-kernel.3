Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F6BCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 05:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOVCFF2nCbE19SZPw/VA1kNcNgANYwNnmTRqOX5doRM=; b=FsUnAka6mFTz57bYvJBsWmxTF9
	yqFTY6MTZKekhDrmFatFt9ZM7n9oXOBLXEJDxrA06Bfk9ESNe3rmojFXjZ7roaUMs08+AqCN9Ye6C
	RYUGFD/E8uJYGKyJowU7TApwwPtkJf6Y/tDVM2cmE2QyiLSwD2BntyPcDiQetUqVHVa4lafncvqOa
	cSyMLtuskQtjOf6Gyp4rPoLM+3dKvSidtq99+grX1WKsiC6P8Uwr96bKszLLCZc3/ig2fjII7k618
	fW2BukTHNUQHbI50MSs+rh5cC5xG+LS7jHi0yrITo5Kuvzu6UnqZP2bqjcnAqoeq+qUUARvCoBwm2
	+lMtgA6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzTN3-00000001q5j-3G4j;
	Fri, 19 Sep 2025 05:09:21 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzTN1-00000001q4D-0pz4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 05:09:20 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1uzTMW-0001ef-2U; Fri, 19 Sep 2025 07:08:48 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uzTMT-0023Em-1q;
	Fri, 19 Sep 2025 07:08:45 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uzTMT-000Jiu-1I;
	Fri, 19 Sep 2025 07:08:45 +0200
Date: Fri, 19 Sep 2025 07:08:45 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: David Jander <david@protonic.nl>
Cc: Andrew Lunn <andrew@lunn.ch>, Jonas Rebmann <jre@pengutronix.de>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 3/3] arm64: dts: add Protonic PRT8ML board
Message-ID: <aMzlXerFpsfdHnwB@pengutronix.de>
References: <20250918-imx8mp-prt8ml-v2-0-3d84b4fe53de@pengutronix.de>
 <20250918-imx8mp-prt8ml-v2-3-3d84b4fe53de@pengutronix.de>
 <af554442-aeec-40d2-a35a-c7ee5bfcb99a@lunn.ch>
 <20250918165156.10e55b85@erd003.prtnl>
 <7f1d9289-4102-4db9-a2bb-ff270e8871b7@lunn.ch>
 <20250918173347.28db5569@erd003.prtnl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250918173347.28db5569@erd003.prtnl>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_220919_244114_6CF83AE7 
X-CRM114-Status: GOOD (  28.37  )
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

On Thu, Sep 18, 2025 at 05:33:47PM +0200, David Jander wrote:
> On Thu, 18 Sep 2025 17:04:55 +0200
> Andrew Lunn <andrew@lunn.ch> wrote:
> 
> > > Yes, unfortunately the SJA1105Q does not support PAUSE frames, and the i.MX8MP
> > > FEC isn't able to sustain 1000Mbps (only about 400ish) due to insufficient
> > > internal bus bandwidth. It will generate PAUSE frames, but the SJA1105Q
> > > ignores these, leading to packet loss, which is obviously worse than
> > > restricting this link to 100Mbps. Ironically both chips are from the same
> > > manufacturer, yet are incompatible in this regard.  
> > 
> > Thanks for the explanation. Maybe add a comment that the bandwidth is
> > limited due to the lack of flow control resulting in packet loss in
> > the FEC.
> >
> > Anything which looks odd deserves a comment, otherwise somebody will
> > question it....
> 
> Yes! This is a golden tip. Ironically what I said above is incorrect. Sorry
> for the noise.
> 
> Ftr: I wrote this DT about 4 years ago, so my memory failed me, and a comment
> in the code would have saved me this embarrassment ;-)
> 
> The comment above applies to the i.MX6 SoC's which had this limitation. On the
> i.MX8MP we had a different problem that also caused the SJA1105Q not to work
> reliably at 1000Mbps either. We haven't been able to find the issue, but so far
> this switch hasn't been able to work at 1000Mbps reliable on any platform,
> possibly for different reasons in each case.

May be it is doe to RGMII clock switching issue and the requirement to
have specific silence time for proper clock frequency detection on the
switch side?

Or it is just artifact from iMX6 platform and it should be retested?

Best Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

