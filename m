Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65955CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 09:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5GqcCzFslWvwspg/f+Srh9ebuYfL4ZY09Ogmj+CHlmg=; b=xy0JuM1qHoHUFe85qNhlqDkQwv
	6IjPYRMuVj+7DsRWiLBaEp1qFQQDYlrhrC/FrAP5DMrTl4qmkdZ37RpqVsDmWtVJvAW3+wYqEGkVZ
	nIXzamwGJ/zzUzyeEWDTAvSszPyaicRo4tMMLXrrqNfhDnHFh7/fye2nBXk/ilkUYFkRFAMRq/K3j
	eeCl7511/mbgSlFapKRiiZ1ImJx2kaSQFippB7U/QsAr+aIQYtgywN9x24LqJs3vA4PMu/uVHtXqX
	sx2XEQL9h2rIhQJP3nWETeL68vpGB6E2QlMLCatReJDWikccMot+E6Tl+Gp5bXah+vTC4iGvlHgK0
	0zy8YiTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJab-0000000DXwl-2tYp;
	Mon, 27 Oct 2025 09:32:33 +0000
Received: from pandora.armlinux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJaY-0000000DXtp-2dWl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 09:32:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5GqcCzFslWvwspg/f+Srh9ebuYfL4ZY09Ogmj+CHlmg=; b=ZOyWRBO8eHuPLliV5wfH0oKhQK
	IKEMn3aguU+Yqku44v/jYUeNtf8sioy+jDr24vH9ZxWwT5Fu29lShStH0MEuD5SLtIIf5DV33fO8r
	j5IHxDKD5YD2ImYR074CJBWlQKzxRsFPSmx8jyEZMRHtcECssO9h5mNoW4f2W+ZnmHXBtLxka280E
	Ee01tYiO1EaGeVnvwW0ByKTFhN/UZXBMIrRC0rQ16XxVJo5UpsuWx53e8OzUvqGvrNR17JM9C4rEw
	o0QZX17jLNmrC/Jt/aE6hMwDrQLseTjFT9I7mR/CxqNBjLBC1tbT7vU/38VyO7YFLrgMbd4kvR+Os
	vPPqTQ2w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56852)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vDJaV-000000001a2-0LdX;
	Mon, 27 Oct 2025 09:32:27 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vDJaT-000000005TA-0D3p;
	Mon, 27 Oct 2025 09:32:25 +0000
Date: Mon, 27 Oct 2025 09:32:24 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
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
Message-ID: <aP88KO8uVrEQlmMm@shell.armlinux.org.uk>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
 <20251027072749.GA7811@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027072749.GA7811@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_023230_670135_FC8E0090 
X-CRM114-Status: GOOD (  16.49  )
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

On Mon, Oct 27, 2025 at 09:27:49AM +0200, Laurent Pinchart wrote:
> I've tried to diagnose the issue by adding interrupt counters to
> dwmac4_irq_status(), counting interrupts for each bit of GMAC_INT_STATUS
> (0x00b0). Bit RGSMIIIS (0) is the only one that seems linked to the
> interrupts storm, increasing at around 10k per second. However, the
> corresponding bit in GMAC_INT_EN (0x00b4) is *not* set.

This is a change in the PCS series rather than the EEE series. It would
be good to narrow down whehn this problem appeared for you.

The RGSMIIIS bit set without RGSMIIIM (0x00b4 bit 0) shouldn't result
in an interrupt storm since the status will be masked. That doens't
mean that RGSMIIIS won't be set. So, at this point I'm not worried
about that.

Can you print the intr_status and intr_values in dwmac4_irq_status(),
maybe something like this:

	static int ctr = 0;

	if (ctr++ >= 9996) {
		printk("stmmac: INTS=%08x INTE=%08x\n", intr_status,
			intr_enable);

		if (ctr >= 10000)
			ctr = 0;
	}

        /* Discard disabled bits */
        intr_status &= intr_enable;

which should avoid too much noise during "normal" operation. It'll
print six consecutive interrupts every 10000.

> I ould suspect that the LPI RX exit interrupt is the one that fires
> constantly given its name, but I'm not sure how to test that.

You can check this because the LPI interrupts have statistic counter
associated with them. ethtool -S should give these, look for
lpi_mode_n.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

