Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589DDCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 09:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJeVGnZIXWk3UX+AA0XWfWaX8AWjBuSzS5UzR107kNM=; b=hqt94/IOrddsWQ8/iEfk3nyeva
	bMoNOiv+6qEdLA2pfjGjaKS9Oomd0ljfAZrEA/FP5xm2+Dx5Yk6yB7y5jzasa/TftCecWRcGdsE90
	V8lpkbrDTudv9JuoaVvLVlioLI7CeleJeJwqOnym3u0MeI6r4+oaR8C1xRF9X2xSSOk47vUxe1YL7
	lIduBms+eN4rDpRGOwpdXVBtkfWy0adJdDifLsTstYJJDJkAik8IJyiE7QfOkAjOVdQRGm/AE9g2z
	MCGF5RplpVLIWADJBzyQxks+o5Fk7Ao9ATrVVCjW8B6YOJvIyKsRuZfPUfj9/sZagrJY+kbZXxovf
	iHrwL0Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJc4-0000000DYi0-3vVM;
	Mon, 27 Oct 2025 09:34:04 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJc2-0000000DYh8-0oZc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 09:34:03 +0000
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E04621661;
	Mon, 27 Oct 2025 10:32:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761557532;
	bh=JWOTEzsnqe2ZVX69WMnwkdkU+ZQ82vlW3C/Ncaoe77o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RfpAy3rGzg7hBJpFqUe7Fcpd2joSB2//BoH9daa4FQ+HnQfqX8G+sj8/R00TFllqI
	 cQMwAYuX5R2+RasSArIE2mwNRaD6Kf/eEFGu/laS4ld6sJh9OnTie2QTLPbOQUxlDQ
	 FTH363BCa5sL1N+W5wxr8+ivFHTA2jiaswQSmNyg=
Date: Mon, 27 Oct 2025 11:33:46 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
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
	Shawn Guo <shawnguo@kernel.org>,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <20251027093346.GB1544@pendragon.ideasonboard.com>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <aP82VEjNDgrNAZzy@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aP82VEjNDgrNAZzy@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_023402_392102_3375A421 
X-CRM114-Status: GOOD (  29.85  )
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

Hi Russell,

On Mon, Oct 27, 2025 at 09:07:32AM +0000, Russell King (Oracle) wrote:
> On Sun, Oct 26, 2025 at 02:29:04PM +0200, Laurent Pinchart wrote:
> > Energy Efficient Ethernet (EEE) is broken at least for 1000T on the EQOS
> > (DWMAC) interface. When connected to an EEE-enabled peer, the ethernet
> > devices produces an interrupts storm. Disable EEE support to fix it.
> 
> As this is the second problem that has been reported recently, please
> bisect the conversion of stmmac to phylink managed EEE support and see
> whether there is anything in that which is causing this.

Emanuele Ghidoli has bisected this to commit 2c81f3357136 ("net: stmmac:
convert to phylink PCS support"), as reported in [1]. I can test that
commit and the commit just before tonight.

[1] https://lore.kernel.org/all/341f56de-9dde-4c44-9542-b523e1917dcb@gmail.com/

> Please also confirm that EEE was enabled (as soon through ethtool)
> prior to stmmac's conversion (I believe it was due to this code that
> was present in stmmac_init_phy():
> 
> -               if (priv->dma_cap.eee)
> -                       phy_support_eee(phydev);
> -
>                 ret = phylink_connect_phy(priv->phylink, phydev);
> 
> > The exact reason for the interrupt storm is unknown, and my attempts to
> > diagnose it was hindered by my lack of expertise with DWMAC. As far as I
> > understand, the DWMAC implements EEE support, and so does the RTL8211E
> > PHY according to its datasheet. What each side does exactly is unknown
> > to me. One theory I've heard to explain the issue is that the two
> > implementations conflict. There is no register in the RTL8211E PHY to
> > disable EEE on the PHY side while still advertising its support to the
> > peer and relying on the implementation in the DWMAC (if this even makes
> > sense), so disabling EEE is the only viable option.
> > 
> > This patch is likely a workaround, but it fixes ethernet usage on the
> > board, so it's in my opinion worth being merged. If someone with better
> > knowledge of EEE and DWMAC, as well as an interest in getting it working
> > properly on the Debix board, wants to submit additional patches to drop
> > eee-broken-1000t, I will be happy to test them.
> 
> The changes to stmmac have been tested on nVidia Jetson Xavier NX,
> which uses RGMII with dwmac4 and a RTL8211F PHY, connected to a Netgear
> GS108 switch. It seems to be the same that your board is using similar.

Very similar indeed, with a RTL8211E instead of the RTL8211F.

> I will re-test today.

Thank you.

-- 
Regards,

Laurent Pinchart

