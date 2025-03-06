Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7408C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 15:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R2zhQ4Pm2jNY/eOab+WCiVsh8dTyvXui2Cp/FvWzXlI=; b=18o53+iGPiw4erekGMnhNXe1hR
	wrDR/44C+zgzOG1gsnaz7yY92km1V8l+EgOZDdVDIf2p7qtRtGEpcqTI2i9d0Vk9RIKVwyY15E7Ol
	bvSImMsmsIvp9tN5zb93Fn8HmorVqY8CConlj3Ktpe4SarqLJnr9CrC2fQgdaZ+RM2VtKchY3iQO5
	MdPaYI3O9iNwcPYyhXkaEaFUEiZ26ZK560fHxtIZiurk3MaCbEW0sN2onAtQ+E2w7jkcDrZBwsu1c
	z+d0++RwfQiOwae5mXR2xwwLCuqeYAplRaxv+IT3DhSfQElFvm5oGjjn+fOkMPD3gD6cdxvKLnwZA
	Juz00Cqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqD7R-0000000BJee-042T;
	Thu, 06 Mar 2025 15:26:41 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqD4y-0000000BJCA-2AZb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 15:24:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=R2zhQ4Pm2jNY/eOab+WCiVsh8dTyvXui2Cp/FvWzXlI=; b=hwdu5oWWDsv1M1nPGXWRtmOoBa
	ZTzMnK3JxL54nbJSZPSc12uQI8Is7OP+DnjUU1HtB1gGdm45wIEF5o5Aj9OZG9GPOdpBkVCZvEIDC
	G9nTJhOKDMtc18p5uq+PficPxFkNowL/jDwSy398f+R7d2rd2x5swVQQjrUaSmUxBSZ/UxTGpk7iw
	P+jM4++UFdAkIX5aympIv4ymay6a9twZ9OWHtxyCctY4Tf4H5igv4M2TJErGD0wXpxZThv1cS2kP4
	Hu758r1IIkdEgRtQ6TxRpxZa8qGQ1pYgbiguJXz3xjyUXpAhmemv5jwWQzvln6vfO1SfDRkmtFaWI
	wgHSgPBg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41572)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tqD4n-00064v-2p;
	Thu, 06 Mar 2025 15:23:57 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tqD4j-0006tm-31;
	Thu, 06 Mar 2025 15:23:53 +0000
Date: Thu, 6 Mar 2025 15:23:53 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RFC net-next v2 0/3] net: stmmac: approach 2 to solve EEE LPI
 reset issues
Message-ID: <Z8m-CRucPxDW5zZK@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_072408_558854_96E16B7A 
X-CRM114-Status: GOOD (  12.13  )
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

This is a second approach to solving the STMMAC reset issues caused by
the lack of receive clock from the PHY where the media is in low power
mode with a PHY that supports receive clock-stop.

The first approach centred around only addressing the issue in the
resume path, but it seems to also happen when the platform glue module
is removed and re-inserted (Jon - can you check whether that's also
the case for you please?)

As this is more targetted, I've dropped the patches from this series
which move the call to phylink_resume(), so the link may still come
up too early on resume - but that's something I also intend to fix.

This is experimental - so I value test reports for this change.

As mentioned recently, the reset timeout will only occur if the PHY
receive clock is actually stopped at the moment that stmmac_reset()
is called and remains stopped for the duration of the timeout.
Network activity can wake up the link, causing the PHY to restart
its receive clock and allow reset to complete. So, careful testing
with and without these patches is necessary.

v2: add EXPORT_SYMBOL_GPL(), fix if() statement, add kerneldoc

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  3 ++
 drivers/net/phy/phylink.c                         | 54 ++++++++++++++++++++++-
 include/linux/phylink.h                           |  3 ++
 3 files changed, 59 insertions(+), 1 deletion(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

