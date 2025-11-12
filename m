Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C88CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 12:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovOaO7o5EVy31SCddS4vIZxUwqi/JxafOZ5Xize7kHY=; b=iMuslXyT47CamHIpI2C9ocRcZI
	JO9uwl1SYjBl2i3xGCFKuNuPB4Pqv/tIpt2sPGuUt4kLNGNSCVbI3pq26d5tLlWpyNyfaVzsNQKG5
	M2EOCQBk+DXIZsVQFJ2+mIn2pE5HrSykphGsV0W+i+xpEvbEjk5y4g4YU1HYg9r97zw85Jy/NPKAd
	BthL4QbUM+gCHe5btr5Ntx/LBYDnb8y5pj05J+fZlInnGs+8TKokeUPnyTAZl91DF1hljHrdyuVoT
	2helUwshtAeDvIif6EOhz1nu1F7zukr17GffqgCICGzp6ROYCdtxxByJLh6YWGOhWKbVDcmVaaEyx
	qra7KpfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAOl-00000008oAN-0ruk;
	Wed, 12 Nov 2025 12:56:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAOi-00000008o9j-3fLF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 12:56:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ovOaO7o5EVy31SCddS4vIZxUwqi/JxafOZ5Xize7kHY=; b=TIiOslFfi3mXLkrInndtcQ3PTG
	e7R9cAW4DEmjWFydFzK+Z5XsyNBvuoAF7Ifu16xV8MgUwZerp7Zvpr3iQE5Ikm4Jpigrh8PcP2/8R
	YaNVfbJDPyPCu/J6pAqK4O9qJk/+4oNyIWri3FIXrcGzYbf1flhbyfxChW4POjc03dX0jJSlkGiKp
	yEbuScVgfoVReSWjTtoMa88gutdmKCoEvOjHB8NLc3Xd0gWqPz+WexiKxziYtX8zpRaR5hf6tH9nq
	jzUVzlcnLlAknBhe70ApwVbBJ9lCdM5C5xL+RZqqOVVJG8J/wGNytjd6ejm2csW2OSG/8fl5VrqiH
	zvCTS/8g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35520)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vJAOe-000000003vM-1L2V;
	Wed, 12 Nov 2025 12:56:24 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vJAOc-000000003th-1Abs;
	Wed, 12 Nov 2025 12:56:22 +0000
Date: Wed, 12 Nov 2025 12:56:22 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <aRSD9n_F4aRXAdf3@shell.armlinux.org.uk>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
 <aP83bMDWCre7-Sjw@pengutronix.de>
 <aRR-6Nl3ELB2v8gV@shell.armlinux.org.uk>
 <176295131007.567526.3395425614344577792@ping.linuxembedded.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176295131007.567526.3395425614344577792@ping.linuxembedded.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_045628_935366_4F074EA2 
X-CRM114-Status: GOOD (  17.26  )
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

On Wed, Nov 12, 2025 at 12:41:50PM +0000, Kieran Bingham wrote:
> Perhaps further complicating matters.
> 
> I have a Debix Model A as well ... I'm in a different office to Laurent
> - and I believe EEE is enabled on my board/network switch.
> 
> I do not get an interrupt storm.
> 
> I'm not sure how this helps yet, - I don't know what to debug as I can't
> reproduce the issue!
> 
> I can provide remote access to the board with ssh if that helps anyone
> who wants to look at something specific about my setup or run anything
> if anyone has ideas of what to check my side.
> 
> Perhaps we can find some subtle difference between a working case and a
> non-working case...

Thanks, that's interesting. I guess the next steps would be to try and
work out what's different between your two setups.

- same board revision?
- same firmware/ATF?
- same kernel/modules?
- same type of link partner? (I suspect, given the cpu-pd-wait
   interaction, isn't the problem.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

