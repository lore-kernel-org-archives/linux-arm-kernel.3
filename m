Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA47CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqjdATjfjZTk7QANAggTs1mW/P13EV6a+Izt0r+agQ0=; b=Oy2RNINBcFJ8UCTNWAPbuSOzCP
	x2W9mSwqwgMvX2eR2dBu9KaMzTSwm2nudUzJPJixfXBskaOpBgY51qIkvZxoaWJZMhqxvYfHB7/+7
	90i3RhZFOHWGQXPoaaF/XuMXCMk9ls7PbMNnxQJcDWn6NsZI/cksy7zWNs8UuNUi7mSBItCuEEa4U
	Dxp83jFG9aWNPqsd2DFW11EBiWu0SH116TtE4gGcUqBbBGdu6bJd+uVsy8PFg09b0Bt2uIMdmpf0T
	36CcXXz3cyjMICdAHI0cwwN2uQzxHv3tVXyW848bLhR/X0zetDU7CZiMAWFgrB6ONlDsHerr5dTEy
	pzs3q3lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGdw-00000000Pqr-3M1Y;
	Thu, 18 Sep 2025 15:33:56 +0000
Received: from smtp16.bhosted.nl ([2a02:9e0:8000::27])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGdt-00000000PoO-417F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:33:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=protonic.nl; s=202111;
	h=content-transfer-encoding:content-type:mime-version:references:in-reply-to:
	 message-id:subject:cc:to:from:date:from;
	bh=SqjdATjfjZTk7QANAggTs1mW/P13EV6a+Izt0r+agQ0=;
	b=QQemO7m4x6zCxk4M9laZ90eCIBZvlHRq/VuixCptBB7zzwo7W14mF7GpiYLDE2KravDs5mWr5Fe32
	 YI5vbPnjY8XchNI9DA2VxwqrhGOoXIMDArJfiLqW1D+YRL2YnyHQ4WHp2jj+Z3dwdLVow44GMCxb0b
	 S6ozX0oObc8Pf1HBbvovaxNrs8/iL/hnZAJYohUXXEqDuxD0E+wq2MS2PgcGQeAqkHwHgbtE3szPdO
	 LY51aW6TvUu1QOAIlIzGxXruryI8IjrqSj/QbUYXHmCSZMbUySBHPD6UI6terkJcLsOTJupcY0AuoB
	 JpIpBWXwmgF0fXl9CqpcwJtEM9ZcoKQ==
X-MSG-ID: df093cf2-94a4-11f0-858c-005056817704
Date: Thu, 18 Sep 2025 17:33:47 +0200
From: David Jander <david@protonic.nl>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jonas Rebmann <jre@pengutronix.de>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>,
 Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v2 3/3] arm64: dts: add Protonic PRT8ML board
Message-ID: <20250918173347.28db5569@erd003.prtnl>
In-Reply-To: <7f1d9289-4102-4db9-a2bb-ff270e8871b7@lunn.ch>
References: <20250918-imx8mp-prt8ml-v2-0-3d84b4fe53de@pengutronix.de>
	<20250918-imx8mp-prt8ml-v2-3-3d84b4fe53de@pengutronix.de>
	<af554442-aeec-40d2-a35a-c7ee5bfcb99a@lunn.ch>
	<20250918165156.10e55b85@erd003.prtnl>
	<7f1d9289-4102-4db9-a2bb-ff270e8871b7@lunn.ch>
Organization: Protonic Holland
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_083354_145681_7ABDEC56 
X-CRM114-Status: GOOD (  16.11  )
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

On Thu, 18 Sep 2025 17:04:55 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > Yes, unfortunately the SJA1105Q does not support PAUSE frames, and the i.MX8MP
> > FEC isn't able to sustain 1000Mbps (only about 400ish) due to insufficient
> > internal bus bandwidth. It will generate PAUSE frames, but the SJA1105Q
> > ignores these, leading to packet loss, which is obviously worse than
> > restricting this link to 100Mbps. Ironically both chips are from the same
> > manufacturer, yet are incompatible in this regard.  
> 
> Thanks for the explanation. Maybe add a comment that the bandwidth is
> limited due to the lack of flow control resulting in packet loss in
> the FEC.
>
> Anything which looks odd deserves a comment, otherwise somebody will
> question it....

Yes! This is a golden tip. Ironically what I said above is incorrect. Sorry
for the noise.

Ftr: I wrote this DT about 4 years ago, so my memory failed me, and a comment
in the code would have saved me this embarrassment ;-)

The comment above applies to the i.MX6 SoC's which had this limitation. On the
i.MX8MP we had a different problem that also caused the SJA1105Q not to work
reliably at 1000Mbps either. We haven't been able to find the issue, but so far
this switch hasn't been able to work at 1000Mbps reliable on any platform,
possibly for different reasons in each case.

Best regards,

-- 
David Jander

