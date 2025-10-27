Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3556BCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 11:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hgddpgXXdpWRrOCO4kQaM3CnBjKkRhnDW13T+vqMRLM=; b=j9AxiXfIXv6GypV//NBLAejBLj
	jImSXel9/PhOgxhGudHS0S+YfatOClUFEbEVkjmQ928tdjwFf+pcCGtKBPK+aVhFY6tFZBCqnbs23
	dC1uCfWjDOo8izDm4l8kAppXiInciPNsKlFW0pU+GgNG1ZaV0FSV1mFo9KWfgn6Z7RTGdoqYyUwoZ
	hdN5BGbRFaJx3XgJ7jwp5i3Difdwo3ZaMZHv6NsrJ3hlwSo4CPzbkbUeyWeMkVXc8AUn5hZ4ixQ0T
	HV0qDAsXMHJ8EpFbmsRT+HM2VobF1eiF2Qygkf59IcI+EaqJi/WFYVDiAq6xjhFb188xz1xPi8/dc
	XmqFoGXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLJC-0000000Dl9j-39LI;
	Mon, 27 Oct 2025 11:22:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLJ9-0000000Dl9P-3cH7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 11:22:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hgddpgXXdpWRrOCO4kQaM3CnBjKkRhnDW13T+vqMRLM=; b=OQbvNXOgYgjq3OEgqECQuxj/rU
	Gd0YDsGDJu2bW1LKLAs1bG1BF0SymVgBxcwV4WY8J9GTGfjELv/Vvz4Vz8KuBVTU2/peQC5gjWgQ9
	DeDh6hiWz4CnAnH2WdGDyCoLFzFdjDRs33CldLJmuA1D63ywul7e4M7sNjIGWAZT0jZGF2RrzgIzC
	S6wKx4jgg4D/5gT2AV6nURlldDThPwr2VKhAcLviUB9PVYvtSfnec+K10fo6NoYZsc67zVB7JeUC2
	n3sEthjKkS7kGsapk5fTCxMjkL1x9DF7qEtc7BHSEelek9I2Ptk6qQAsFPTiuTPfvLs7eFFVxN+QJ
	PbdL5Hzw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35864)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vDLJ6-000000001jm-3RHy;
	Mon, 27 Oct 2025 11:22:36 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vDLJ5-000000005Xs-0wS5;
	Mon, 27 Oct 2025 11:22:35 +0000
Date: Mon, 27 Oct 2025 11:22:35 +0000
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
Message-ID: <aP9V-zosjg7rY5vZ@shell.armlinux.org.uk>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
 <20251027072749.GA7811@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027072749.GA7811@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_042239_899798_3F454373 
X-CRM114-Status: GOOD (  11.57  )
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

I'll add to my comments earlier, because it may help you work out
what's going on.

RGSMIIS will be set when the LNKSTS bit (bit 19) of 0xf8 changes
state. RGSMIIS is only cleared by reading this register. So, something
else to test would be to do a dummy read of this register and see
whether the interrupt storm still has the RGSMIIS bit set.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

