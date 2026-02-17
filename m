Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750C4E9A037
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 18:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+VxzOjhbLsYYL+mX2QcCnQ5Ia3ry4vUbtIAtS9YChfk=; b=lMVk8Vr3Upw5GBE81Gxh5Whvl0
	fByQVVm2DnK1SuY9b2ADyqLk/WbMOr8v4y+ISfu19EpcHQzeLfQd/U4nOrBE12AMNSJARSLhf/1Zt
	ENyEAkpji71zsr7Se1uHGCegwAJ5wcEKeRRPO3zSa56XW6/LQzH88aio07yTQeSMnmjt6+WLY6+OE
	YSKBYjzy1FiiWlmwRCDV469KX74Ro9uNOKd4Tu57AnBf7EPBdBSunjaVJ9hQn1QU4T4gnbg8ROUym
	rAH8Lpdumm+bbqHY35uwK+aNOfDBe0JdGa6ICIES8eQGWI5pNdbp1TQ1QENEpItEkTFhHgRihXLv8
	HAPrP5lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQD9-00000008lpZ-0pLx;
	Tue, 17 Feb 2026 18:54:15 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQD7-00000008lpF-0rtU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 18:54:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+VxzOjhbLsYYL+mX2QcCnQ5Ia3ry4vUbtIAtS9YChfk=; b=An7RiBtNMniRbnZjW1ozMaROrb
	Yk7/rgoAprwkj2GjLFeggqnLgIeaQrGYGcIfuysxJ5GmDgZ5MGz5i4RYnQ+kJC23cPK06GnaSb1UR
	BtN3ItcPEDweMfzifGbNlxrm1BDPX9B/PjPlcCRLrzdTKS/WRt743rmohN+4YN9+eYCQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vsQD2-007gDd-Vg; Tue, 17 Feb 2026 19:54:08 +0100
Date: Tue, 17 Feb 2026 19:54:08 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 03/11] arm64: dts: freescale: imx8mm-var-som: Update
 FEC support with MaxLinear PHY
Message-ID: <31f30651-7c99-42cb-9e27-e4806529d137@lunn.ch>
References: <cover.1771353301.git.stefano.r@variscite.com>
 <3b984b93a43a07bc9c4f6414a08a3a0f45daaaa8.1771353301.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b984b93a43a07bc9c4f6414a08a3a0f45daaaa8.1771353301.git.stefano.r@variscite.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_105413_260963_01A9213D 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

On Tue, Feb 17, 2026 at 07:42:37PM +0100, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
> 
> Update the FEC Ethernet controller on the i.MX8MM VAR-SOM to match the
> latest SOM hardware revision using the integrated MaxLinear MXL86110 PHY.

I don't think you say this explicitly anywhere, so i will ask. The PHY
is on the SOM? The carrier just has magnetics and the RJ45?

>   Two LEDs are defined to match the VAR-SOM carrier design:
>     * LED@0: Yellow, netdev trigger.
>     * LED@1: Green, netdev trigger.

Where are the LEDs? You say "carrier design", so are they on the
carrier? The DT properties should then be in the .dts file for the
carrier.

	Andrew

