Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F12C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 09:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GLIba+q4BDE9qdzTgPLlPQOlp5Vu1/gYQkbg2o8SPf4=; b=UTUQhAucyIzV4MEnfyTo7fuKfw
	aheINbfjfP/fuSpMpOUKwuT2o5TnRK8OMwcwjVf3JBdQ+bJaoGOBlixyiex+WKZKukVQ5cZJGKBeh
	PxkMMLjWKxdDdgx7pjNAdnWAbXMxI10Vfx1ZrEvjHb8G7UqFDOCSfYsUVLE/3+NqsPw7V7v161UVD
	VqGV2C1+Ap4Vq1sT8uSQ38gLBHzc7NsvJs5A0wy7XveQALNnoc89s2MpS6mfSCjjQCCeCOzOYRwJ5
	knHJO8HXxsr82gX8fkV6SH4BeyPbzJxSdhj+trNV7NzqENI+fTW3hrw/rcd3UoFyw/Ptvbz4g7b8C
	IE/G+Hgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsICw-00000007vZq-23qm;
	Wed, 12 Mar 2025 09:16:58 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIBH-00000007vM1-0A9b;
	Wed, 12 Mar 2025 09:15:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GLIba+q4BDE9qdzTgPLlPQOlp5Vu1/gYQkbg2o8SPf4=; b=F6P8O9yMyitUkFBMj+62u1Wxx1
	8tFlx/t5XL1sRU3psd0hU/hHxFYJJ3qA6cgX6fDUir0PJq0sN38pxNZlkOD9gBDQ42J+X36nhC6pg
	eBwJv5WTwJ+FyAKjSVpPua8pcVcCMlAgTKNjuvr2JrVdikixn/gR8Fwp/IHDYeCzT40KqXW1y8Z4d
	d6gdNon8uIGCgflq0cbdeTWJmKceAsN+ngdhOoTOziNmf7bHkdM8ynDjB/gXvEFHxAVqSFOHEXmTK
	4d950rgkvRVZMtdhHwYQYW2BvttkhHrF+vRiXzKGYcIhpBirIaMRNj0RzaNjl00e5FPMhAPtQ6nd8
	1y6QEqdQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39976)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tsIB1-0005A4-2C;
	Wed, 12 Mar 2025 09:14:59 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tsIAv-0004PY-1F;
	Wed, 12 Mar 2025 09:14:53 +0000
Date: Wed, 12 Mar 2025 09:14:53 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next v2 0/9] net: stmmac: remove unnecessary
 of_get_phy_mode() calls
Message-ID: <Z9FQjQZb0IMaQJ9H@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_021515_079065_5281F756 
X-CRM114-Status: UNSURE (   9.50  )
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

This series removes unnecessary of_get_phy_mode() calls from the stmmac
glue drivers. stmmac_probe_config_dt() / devm_stmmac_probe_config_dt()
already gets the interface mode using device_get_phy_mode() and stores
it in plat_dat->phy_interface.

Therefore, glue drivers using of_get_phy_mode() are just duplicating
the work that has already been done.

This series adjusts the glue drivers to remove their usage of
of_get_phy_mode().

Changes in v2:
- correct subject for patch 3
- fix build error in patch 3
- add attributations

 drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c | 21 +++++++++------------
 drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c | 12 ++++--------
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c    |  8 +-------
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c |  6 +-----
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c |  4 +---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c      |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c     | 12 ++++--------
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c   |  8 +-------
 drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c   |  6 +-----
 9 files changed, 23 insertions(+), 56 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

