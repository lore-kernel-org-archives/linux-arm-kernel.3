Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43401CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 12:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hKaaHV2NST1VuzXBfc6VQU/jhNrAzykCq1FQtjK/evA=; b=JTiG+LOiUYguLVG80IpBWVOcTk
	ubRSd0XYC6bM3JRJwls14Jk0vw+TJcO89VVk+hWvJqolgv8NQCj6aQG1zoYNYmOZtPsxzBZPlt2xV
	5FLfWPuo5MU2QYh/q1FzNhhFJuUE+KshCyJa/7mGeOUPwPX+I3jdD+3crkYfvNPWCOvERfMFvwU0D
	IJs2YUrecMLHowqID0lrveXgmc4UkT4kZ+fy/CN5eRVhUPTOLUiijvYU+UWMszXIp9K3WH8YNH+fK
	945xp10dUl9s5k9oC6ENfJrf4FEWh9/73JtoCeKxo92KJlf508ZOfoKzLNTz5FmLbuXFTmjHcqCra
	w6HLoIXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMgC-0000000DvoW-1O8x;
	Mon, 27 Oct 2025 12:50:32 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMg9-0000000DvoA-3fAS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:50:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hKaaHV2NST1VuzXBfc6VQU/jhNrAzykCq1FQtjK/evA=; b=YMVoSKxVmOBII8dLdRmBG6fWwB
	AsarXFDeYQj4nAHcnPas0cq9acQUKIhXjC+Ln4PI8dOFWtDhahRYh9SJMrPaY0nypYfD1IQCuvz0U
	/ZZmbN26xi0kZWSbFyRrS3YepU4hTKr4HhwNSOA3qbkSz6QWVDiclQnAxK3fJdS8vGyk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vDMg1-00CBuN-58; Mon, 27 Oct 2025 13:50:21 +0100
Date: Mon, 27 Oct 2025 13:50:21 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	imx@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <f66d181d-7dd9-4955-bad5-478db2876e47@lunn.ch>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
 <aP83bMDWCre7-Sjw@pengutronix.de>
 <20251027100227.GE1544@pendragon.ideasonboard.com>
 <aP9IB4y5_gyfJGMW@pengutronix.de>
 <20251027103107.GF1544@pendragon.ideasonboard.com>
 <aP9Kuyndws_dYFna@shell.armlinux.org.uk>
 <aP9NJHtbAEmsd89r@pengutronix.de>
 <aP9N9tCdlAbBgovC@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP9N9tCdlAbBgovC@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_055029_911221_D199252B 
X-CRM114-Status: GOOD (  13.54  )
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

> > Ack. With comment in the code, why we prefer this way, in case some one
> > wont to spend time on making it work. Probably SmartEEE or some other
> > word should be used.
> 
> So we have options.
> 
> However, we need to get to the bottom of what caused the change of
> behaviour before we start throwing solutions at this.

It also seems like the PHY is FUBAR. If the standard 802.3 EEE
registers are being used, a management plane is using them to
negotiate EEE with the link partner, the PHY firmware should disable
SmartEEE and only provide 802.3 EEE.

It sounds like this PHY is not 802.3 compatible.

	Andrew

