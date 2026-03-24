Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CBFE9A754
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aK2tPqCkus3zmIQkMrJkBfabg401fTA5smptamXvQuo=; b=YH6dRJLlFcnPWmH8gjeY0hH5uv
	2GdJ26Z8pakcNEZeBeTcSUMn9qjpNM5Jzr6RPIahBJseXYh7leTxcOagXcQVcguPmwT/gsyKU8g18
	xssQueIt7Usswd5CQiTKilXaiubYwOmpay31+n5czatqVMy6uJ5mbUrO/aq/rCSVIwXcx+AkFNbLm
	tDAxGy1qD+OfeSMyQPVc7Svhqh0xhYhDG3vCOcSt63TEVg3P4Stck+Wqkf0oV9YzgkR3SkUwEDwhz
	GLd156BSDsfoTBxUld58ZH8TnOqOGjDq4zWKUjdunET8Wt/rJOfYQl01CfRZguvhQm+gieGsm2xMt
	+aPc493w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yOP-000000018Ik-1ltS;
	Tue, 24 Mar 2026 09:49:45 +0000
Received: from pandora.armlinux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yOM-000000018Hk-2mmX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:49:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aK2tPqCkus3zmIQkMrJkBfabg401fTA5smptamXvQuo=; b=zfbU6UaUkaSej+InccJO3A4k17
	ea29hnoELaOyWAevHboVokXOg2LICrSevzz5m8UTE8ssev6xSYhxho1vQtFiSWA4hPqtV0TIQd/6O
	0Vy+tnTDH81LNcof0OMXUXJty1RlfxBU6MMfudAYkLKt2JVC4xf5QQcCKByP0EP+/ylXiLIe885b4
	Ro06MKR7OzVcZGdqfxspkwSqRbTJgRboz5uk4+gZJIdsrdwiEeCIgWO2coSyTqUv4rmCoF1DM/GPu
	8g8r23LmJW63dE1Lgx2K1NnzVAnV+b/QUolc72U6h9myxM0w8OjOFEYl2RDf3IfyCfELCm06PaGdf
	KHdOHllg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51472)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w4yOC-000000001i2-2W9y;
	Tue, 24 Mar 2026 09:49:32 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w4yOA-000000004y0-2N2V;
	Tue, 24 Mar 2026 09:49:30 +0000
Date: Tue, 24 Mar 2026 09:49:30 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	thomas.petazzoni@bootlin.com,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	Mun Yew Tham <mun.yew.tham@altera.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next 3/5] net: stmmac: dwmac-socfpga: Use the correct
 type for interface modes
Message-ID: <acJeKpJWEjkZc1Bv@shell.armlinux.org.uk>
References: <20260324092102.687082-1-maxime.chevallier@bootlin.com>
 <20260324092102.687082-4-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324092102.687082-4-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_024942_706400_869816B4 
X-CRM114-Status: UNSURE (   7.91  )
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

On Tue, Mar 24, 2026 at 10:20:58AM +0100, Maxime Chevallier wrote:
> The internal helper socfpga_get_plat_phymode() returns an int where we
> actually return a PHY_INTERFACE_MODE_xxx, use the correct type for this.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

