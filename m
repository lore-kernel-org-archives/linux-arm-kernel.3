Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79527CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 00:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=clpdrlOLu93rHtL/L9HiL9Is9OjufJxhxUPrU3Iy0XI=; b=4D4cLomPBzqekRmUFiGOqDsWSc
	KooMEjFqTm2rNVrS3977s9azaFgy92jOLDzQm4h18kJSod0QSJxt2o5Cw1BvziIJMtIlu/yYZy78S
	atyQYGSVSSUcaWYcJLUndcyZP8oz+EGDWxO7hsi+oatNLrxgJJpZq3lgmFiRZOWNM6eMDuTf7zVTq
	L4IN/kSdnH8Ozz9yuu4tr9C2UnkwduU/9LDpkyVtQN018n1Hcz2JNohwmWQ0IQWLVuPFx5535Fi4r
	00bjqpyw5IsWbuwDY0eSKzKWB0V+cjXUmIceXpseoIub0QaP0pXHwPMunuvPJMIWJZudfO+I5hS5z
	0XWu2USg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDY2H-0000000F26k-051q;
	Tue, 28 Oct 2025 00:58:05 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDY2D-0000000F26C-2qq1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 00:58:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=clpdrlOLu93rHtL/L9HiL9Is9OjufJxhxUPrU3Iy0XI=; b=DnK6ADmmspY4FAXcwDQ0Ysdv6z
	3S4CPo2pihH5GZTA/oVF2y5e34bRyMhblv53WeQELRwkUO2BT5BmjkopFJJqVTZxkBuTjDsmNoWXa
	6XPyCx0W3NSnUXXhnjbn+eZ7nLzC3iB7gQw9RFsMisCbk+om0sEEwp8A4bUacT7hTANRJoFNDfAAW
	+KjQqHc52E4TUodg2IqcIY1/cQ543DC8JYYgGT5fuySvCJFGxqVK3+VzqhYDJpjXGF5SYw8X8jlHp
	mp7PK+QbVNpLyXwif4OOcB3rHRfO7xpcd+7J7mOURBAHa3GZOsiCoIzMvOgzoSBslDz16MMQSadND
	JXrThypQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49596)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vDY29-000000002YH-25XH;
	Tue, 28 Oct 2025 00:57:57 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vDY27-0000000064p-3UG9;
	Tue, 28 Oct 2025 00:57:55 +0000
Date: Tue, 28 Oct 2025 00:57:55 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <aQAVE96NAD4Z4lgt@shell.armlinux.org.uk>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <aP-ML-A_h13pXY2d@shell.armlinux.org.uk>
 <20251027234648.GC24987@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027234648.GC24987@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_175801_742717_77B9370F 
X-CRM114-Status: GOOD (  20.26  )
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

On Tue, Oct 28, 2025 at 01:46:48AM +0200, Laurent Pinchart wrote:
> On Mon, Oct 27, 2025 at 03:13:51PM +0000, Russell King (Oracle) wrote:
> > On Sun, Oct 26, 2025 at 02:29:04PM +0200, Laurent Pinchart wrote:
> > > Energy Efficient Ethernet (EEE) is broken at least for 1000T on the EQOS
> > > (DWMAC) interface. When connected to an EEE-enabled peer, the ethernet
> > > devices produces an interrupts storm. Disable EEE support to fix it.
> > 
> > We've finally got to the bottom of what's going on here. Please try
> > this patch (it's building locally, but will take some time because
> > I'd wound the tree back to 6.13 and 6.14, so it's going to be a full
> > rebuild.) Thus, there may be compile bugs remaining.
> 
> I've applied it on top of 
> 
> I've started with a branch based on v6.18-rc3 plus "[PATCH net-next 0/5]
> net: stmmac: more cleanups" ([1]) and "[PATCH net-next v2 0/6] net: add
> phylink managed WoL and convert stmmac" ([2]) to make the patch apply
> cleanly.
> 
> [1] https://lore.kernel.org/all/aO_HIwT_YvxkDS8D@shell.armlinux.org.uk/
> [2] https://lore.kernel.org/all/aPnyW54J80h9DmhB@shell.armlinux.org.uk/
> 
> The base branch exhibits the interrupt storm issue. The patch
> unfortunately doesn't fix it.

So it's highly unlikely that your problem is the same as Emanuele's.

Do you know when the interrupt storm behaviour started? If not, I'd
suggest testing 6.13 and 6.14 as a starting point to see whether
the phylink-managed EEE conversion is involved.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

