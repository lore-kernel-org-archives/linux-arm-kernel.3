Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B7FE9E303
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 12:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/Neu0hfsRUexXQo24Z6HShCyIt/OEPA5N5gMOQo0YA=; b=h6YUm7r1l3MpgGrDqpsS/U/iFL
	TZKZaK0GIl8KqxjCHBduc05HijQK8zbR1VvGpXtsoaate3T7hH38Fd9cLq/Ez33frUrXzvoQbvhLO
	8KUwxYRTMK6T5SDvmhlLz8wEUYuaiwobEL+SEZoLSqfbkJcyXMtxtyu/3Me+3BO7G13RB7zu6AS01
	pbXT8wLbyHCi270PY/pyln5eFMXe5vHtMumqYCSyvuYOKjjyDNuU73YKXMfap2f0naNKZ3RFBRZAG
	OHxOH4+LhtPMGvbLtmb+VTEXHN25xtlhtivCBU0k/oMolw6xz172n7TJZZsMQSPp0cKI7BWaW0inu
	nKwHyp3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq9jn-00000000eVT-44W5;
	Wed, 11 Feb 2026 12:54:35 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq9jl-00000000eUV-0QBB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 12:54:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=U/Neu0hfsRUexXQo24Z6HShCyIt/OEPA5N5gMOQo0YA=; b=ORW8IgiayHO4HEXJA0qBnHnOZC
	H1uTsTLK2U03+XH/wmxxTPF7soTPcmBREWW3gcYx8XO6gzS0l+GE/cSYHMchXPFytVtouF07Ht8A0
	EoAup+kG8IPNoAAPjkWejjVqD5O9fSVau2kmDHCGiBfcI4HI6H7Yaeky+6GGC0x5Hz06XQpcUq3UQ
	ydRQFPSzfx8TCBopbDrB/L+ysEJD/9X9ZqH2V/2vFcMvgv/iNBHKCRHxRPd8a8mDIXLw5gJZZW9iT
	qg0lM1yLAny43dx3WCBrwzvuXA3FwccwSrRPCqbjM0rxTceQ2afmHfNf17T8RT8/yXAQF08bqhIOA
	hVNuKRbw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52936)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vq9jA-000000003QW-2HU1;
	Wed, 11 Feb 2026 12:53:56 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vq9j6-000000003ma-0e94;
	Wed, 11 Feb 2026 12:53:52 +0000
Date: Wed, 11 Feb 2026 12:53:51 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: netdev@vger.kernel.org, imx@lists.linux.dev,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>, Heiko Schocher <hs@denx.de>,
	Jakub Kicinski <kuba@kernel.org>, Joy Zou <joy.zou@nxp.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Martyn Welch <martyn.welch@collabora.com>,
	Mathieu Othacehe <othacehe@gnu.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Richard Hu <richard.hu@technexion.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Wei Fang <wei.fang@nxp.com>,
	Xiaoliang Yang <xiaoliang.yang_1@nxp.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] net: stmmac: imx: Disable EEE
Message-ID: <aYx73z0VTAGFAjlp@shell.armlinux.org.uk>
References: <20260209202155.2388099-1-laurent.pinchart@ideasonboard.com>
 <aYsj5IayQd3NRflL@shell.armlinux.org.uk>
 <20260210143157.GM2405149@killaraus.ideasonboard.com>
 <20260210163310.GO2405149@killaraus.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210163310.GO2405149@killaraus.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_045433_406436_437492E2 
X-CRM114-Status: GOOD (  15.73  )
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

On Tue, Feb 10, 2026 at 06:33:10PM +0200, Laurent Pinchart wrote:
> > I'm happy to submit a series with both, rebased on top of net-next to
> > handle the conflict you pointed out. Is that fine with you ?
> 
> If you would like me to submit a series with both patches, should I
> resolve the conflict with "net: stmmac: dwmac-imx: keep preamble before
> sfd on i.MX8MP" by inserting the STMMAC_FLAG_EEE_DISABLE flag as BIT(10)
> and change the value of subsequent flags as you did, or add it at the
> end (BIT(15)) ?

I would prefer to keep similar flags together rather than just appending
to the end of the list.

> I'm also happy if you take my patch and submit a series with both.

I think it would make sense if you submit it once net-next reopens after
the merge window.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

