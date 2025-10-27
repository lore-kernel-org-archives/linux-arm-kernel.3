Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C49CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 09:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQKAFumxB6z8ZgppllACAzOPSvDS5er1n2d0F4pV3cI=; b=dgFrgNdFKAUQKRRbESGUHAeqb1
	r5wahffbjzTai7IwAeYSapHKORuYHFqOk5ZtyisF0pVNSCuyY2s57HzHA2tTMUZlKj9Vi6zL0rbHH
	uFzAk7MtE8gWQOgqHSdG/BFEi+IIGSA6Qd2ezM3hj3MGeeikdj6UaOIgFaUh4gptMaXzHsQbpGBHl
	0Xog0ES3OOOmsWYg6AEMRmXePC+46XsFNMF5gN9IMv6h1XYMwWNxCkku2jijeZvKLHZcRBrkW/T3j
	ACAbMDhe7SiLyrwAm53Q+NVyY51MMVaffWVeFxEMzZGZRRHnM2coqaW3BwebdUiRGrqU54QQP43aK
	6DRxVHSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJCV-0000000DUSq-3U3T;
	Mon, 27 Oct 2025 09:07:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJCT-0000000DUSK-1lPt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 09:07:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dQKAFumxB6z8ZgppllACAzOPSvDS5er1n2d0F4pV3cI=; b=XJ6LgvaAoGvEQFO+fz2IgNqtVA
	sUt0PMRw6xIHPbE62n1KXQQwZqJa47/yiLoDMa+ykAnV1CuoECCEmM0jVsOzQAvYva9jCDU3l2nI/
	erP7cY26QjO/q9lUZPGk3yKnMHvYVrctTJKy1OOgX2s5J0FSiUUVYovwWo0EXObwRg6+gI5n7yEyn
	TxmWvADoHuSgCTqD+AAOk+YYMqEys92M0xXVnQJTkVfNWDgk4mkveP+QRuTKfJ2EfpiYG9++tAX6g
	P+dbZJI+bgYxkTu7bYvUGPlX6Uuw5buzuonoA2iXoNDpHYYPVybPJQLWuqViwb+ef4/yLET4iZS08
	S2ehhSKQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49470)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vDJCQ-000000001Xm-15CY;
	Mon, 27 Oct 2025 09:07:34 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vDJCO-000000005Rv-3QXY;
	Mon, 27 Oct 2025 09:07:32 +0000
Date: Mon, 27 Oct 2025 09:07:32 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <aP82VEjNDgrNAZzy@shell.armlinux.org.uk>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_020737_460125_723AFB95 
X-CRM114-Status: GOOD (  22.26  )
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

On Sun, Oct 26, 2025 at 02:29:04PM +0200, Laurent Pinchart wrote:
> Energy Efficient Ethernet (EEE) is broken at least for 1000T on the EQOS
> (DWMAC) interface. When connected to an EEE-enabled peer, the ethernet
> devices produces an interrupts storm. Disable EEE support to fix it.

As this is the second problem that has been reported recently, please
bisect the conversion of stmmac to phylink managed EEE support and see
whether there is anything in that which is causing this.

Please also confirm that EEE was enabled (as soon through ethtool)
prior to stmmac's conversion (I believe it was due to this code that
was present in stmmac_init_phy():

-               if (priv->dma_cap.eee)
-                       phy_support_eee(phydev);
-
                ret = phylink_connect_phy(priv->phylink, phydev);

> The exact reason for the interrupt storm is unknown, and my attempts to
> diagnose it was hindered by my lack of expertise with DWMAC. As far as I
> understand, the DWMAC implements EEE support, and so does the RTL8211E
> PHY according to its datasheet. What each side does exactly is unknown
> to me. One theory I've heard to explain the issue is that the two
> implementations conflict. There is no register in the RTL8211E PHY to
> disable EEE on the PHY side while still advertising its support to the
> peer and relying on the implementation in the DWMAC (if this even makes
> sense), so disabling EEE is the only viable option.
> 
> This patch is likely a workaround, but it fixes ethernet usage on the
> board, so it's in my opinion worth being merged. If someone with better
> knowledge of EEE and DWMAC, as well as an interest in getting it working
> properly on the Debix board, wants to submit additional patches to drop
> eee-broken-1000t, I will be happy to test them.

The changes to stmmac have been tested on nVidia Jetson Xavier NX,
which uses RGMII with dwmac4 and a RTL8211F PHY, connected to a Netgear
GS108 switch. It seems to be the same that your board is using similar.

I will re-test today.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

