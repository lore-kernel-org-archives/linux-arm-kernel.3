Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B2ACCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 10:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JqypE7UtaBkPJfmxSehLinN3EFuQs6Bw1umXmkFIcG0=; b=V5VOLKNUS6dKbzOhFEYxkfD4Yr
	veLY7jFO0uv2q3OekWozbK6kLtGYJQKotOLSuLpZnSyktugw7uR2Y0V2OA8dgTMxPVt8sgRNeNfQ7
	Yjxxny3DzjuQU52caHGWouLLJiGlxueqMZ30oBlqCbJku2IvV/EOefsoh5hHsADpY53OOyzb6WyQN
	MooiSWHYVjxMpcw8vPvF/62lC02uHWYXhT2muZIiZMC6Fr6Dsqqg4jYh6CvFMIuWwsZ0Iv2sLKutt
	N6G4EHjXvpMD+jflzlSyQM0gUcFcta86G/2aBEKjzr8LX/vAUpmRpB5eTjZ1VLfwkqIpmiSVndnZ/
	mquQ+i+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDKVY-0000000DfDC-3mbA;
	Mon, 27 Oct 2025 10:31:24 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDKVW-0000000DfCm-24ob
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 10:31:23 +0000
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 05415E1F;
	Mon, 27 Oct 2025 11:29:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761560973;
	bh=woR0YkWOLoOVnkusOQvb+uOUj+GPQRpu6GLsFacG4SU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sbnFY7w1nY83x7Yfrg65qDDjoOFXFj29h8KBE/qIKqEQ2DR3hTiOM4IIhnH8GQB8f
	 LXqClKaF1LarrQ6Mpd7Ekda+u/bgkFr7pkBrFVM1rxJTD1wL7Z8IYxLG9LcIBlMnsM
	 FaNVPYUv0Mj0/7F9HRMlQYSQnRaetAbKQpjllrnQ=
Date: Mon, 27 Oct 2025 12:31:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Russell King <rmk+kernel@armlinux.org.uk>,
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
Message-ID: <20251027103107.GF1544@pendragon.ideasonboard.com>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
 <aP83bMDWCre7-Sjw@pengutronix.de>
 <20251027100227.GE1544@pendragon.ideasonboard.com>
 <aP9IB4y5_gyfJGMW@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aP9IB4y5_gyfJGMW@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_033122_697957_63B690E5 
X-CRM114-Status: GOOD (  15.06  )
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

On Mon, Oct 27, 2025 at 11:23:03AM +0100, Oleksij Rempel wrote:
> On Mon, Oct 27, 2025 at 12:02:27PM +0200, Laurent Pinchart wrote:
> > Hi Oleksij,
> > > Please note, RTL8211E PHY do use undocumented SmartEEE mode by default.
> > > It ignores RGMII LPI opcodes and doing own thing. It can be confirmed by
> > > monitoring RGMII TX and MDI lines with oscilloscope and changing
> > > tx-timer configurations. I also confirmed this information from other
> > > source. To disable SmartEEE and use plain MAC based mode, NDA documentation
> > > is needed.
> > 
> > That's useful information, thank you. Would you by any chance to know if
> > such NDA would allow contributing the feature upstream ?
> 
> Good question, but the NDA process was actually aborted. We didn't move
> forward due to a lack of time and ultimately, a lack of commercial
> interest from any projects or customers for this PHY.

Fair enough. I've tried :-)

If we can't disable SmartEEE in the PHY, does it mean we need to somehow
disable EEE in the MAC, but still program the PHY to advertise EEE to
the link partner ?

-- 
Regards,

Laurent Pinchart

