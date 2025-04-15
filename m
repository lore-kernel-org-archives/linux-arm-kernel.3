Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C90C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 12:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DJelH3MXeuw+QhgIUBgXCxj63HuDy6jNjoA6xLDiFtY=; b=Bk6RKaAHuJolXxhfXiyEf9wTSI
	LWPwXaSbXakGDyrSf1LaJZcBadng6L7BZvlWvhVwV0yFDlK/aSP+OhpEsti2ho1QcCIlvOZ1j+sgA
	wjIinCgm0rpV8HjzC3araCXX6H1aLDgnf4xgnrSRlkynEF/cGZRNlsSz15OMuuNmsEDe+Ci9Io4K4
	LieGqDCfA36aUHxMmKjdwiirH45OM32tv2XVjM0pfQIThzGIdOwzqtmqBaKXbOZcoYUvewF9MU798
	Bza0TN14Hl9bc1JLdvj0CdEOSF9c4R2qCyhoxsb2ldpfnEr2b2eb4rimQa5yavV+z0K+kT0+WoEPJ
	x7Z7HMvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fqL-00000005pZ0-3RzR;
	Tue, 15 Apr 2025 12:56:49 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4flO-00000005otP-0GMt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 12:51:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DJelH3MXeuw+QhgIUBgXCxj63HuDy6jNjoA6xLDiFtY=; b=IpoMe21jYVhJpimOHsXYMa1CF3
	XHXMrm+vLy33Vb6lHekeOYPP6VH4bJFr6txvj63QglTwI3Ifq8dsNqSRMEGKMJDLa7RbrL4mI3yTA
	HPACRuylJqGHTUqb8RhlgqFJHdp71mSwAqNAVAJvqgUarnRE8qsqWO3XHGXWpQPUmHpYusLCFt/IF
	50BMTwR9Z6cVxXYm+HAKLaXDZchnTG9Rgtr47xJWtFESmQcTDUrIj0ppZd3+L9W3a4zACdP5u6/md
	3/Oj+K+j/wmYjZQgytD9qvBISGett6JnZKTTQse9f1tEDeCKv8EM8X+1kKloCGmJ1V4wb59mHgxkC
	RgkxXHIA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59424)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u4flE-0008AB-2Y;
	Tue, 15 Apr 2025 13:51:32 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u4fl9-0000Nk-1L;
	Tue, 15 Apr 2025 13:51:27 +0100
Date: Tue, 15 Apr 2025 13:51:27 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH net-next 0/3] net: stmmac: sunxi cleanups
Message-ID: <Z_5WT_jOBgubjWQg@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_055142_100393_0BD55BCD 
X-CRM114-Status: UNSURE (   9.25  )
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

Hi,

This series cleans up the sunxi (sun7i) code in two ways:

1. it converts to use the new set_clk_tx_rate() method, even though
   we don't use clk_tx_i. In doing so, I reformat the function to
   read better, but with no changes to the code.

2. convert from stmmac_dvr_probe() to stmmac_pltfr_probe(), and then
   to its devm variant, which allows code simplification.

 drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c | 58 +++++++++--------------
 1 file changed, 22 insertions(+), 36 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

