Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80357C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 21:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hBtz6Ng9ArKpM+af3s56+9PEKH0n/HDxcMnPXlkcvuA=; b=14i6OADKNhI5qWCThOsbT3Xai4
	S+chd0bCJp6tr44W9nd8xNzyi/knaLY6d89gWJTgxerKR1pg7MlNBV9qtElzQXfymvZvlxkFeik3W
	6eWmQxCdr2dwGIsDtY+7NUGcijiZyloMLQAl7yCLaHciCanefWVLrhDoCgxTqJrOWLqsHczKFwBIz
	a2NGeE/Y6FFCtsFq/OOUuDGa2bf2f9f1P6BuqusLIo7lrY6JGfzpZuEPByNSE2YJXV3NxoLYtBLYm
	hV1h+GsOrBLOkuZeNIi1PItAN7+cmVOjE6B8GZNxKxm9L1TrPosssLgfugqrnC7rwNA5uKodsggBO
	HUo1kz0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uJ4-000000024RE-1cdN;
	Mon, 07 Apr 2025 21:47:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rh0-00000001j3h-2eqG
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Apr 2025 18:59:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=hBtz6Ng9ArKpM+af3s56+9PEKH0n/HDxcMnPXlkcvuA=; b=iL1GwE5q/u/xwzjrpwS3eJ9xDA
	t0+pEjNn4I/dRgMiLsOVe/8Oz90LgPgXEuerpRiAR8kJC/nU6bZsU8xSJe5/hKy1SotGe4PDXVX8G
	cLWUsq3zkCXnn6kU5jzNqTwPWqC6hUXG3eMRqObm/rtCfBDKZy+Y+paJdgZIcIdRnSnqZ0nOBSC3a
	Yg7qWixEgtN5CM4QVUGU8AUMZwtqePW5Y9QQpmYu/L+JfJSU0jQL/zVdta9++P+qhOsaY+hLEpzn9
	Ak5C+Towq4uKNEgcaOhmg/R9DX5zQGz2RBDCbso3/5/BpsBzI0DBh4rp8Yz99gu+bt3TTXEDtl8V6
	fTUV8qAQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rgx-000000086gZ-3j6D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 18:59:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hBtz6Ng9ArKpM+af3s56+9PEKH0n/HDxcMnPXlkcvuA=; b=AHM7AwvqV0FmHKwQ5UK3nAs+qj
	awi//mBHqMSo2FRcyA9+f26sLvSxkzVniia8baE/vsSBybzSsISUUr9hzzmwEjAq15KpzexLzeCAb
	6O0oTjLaeqqZ74TzSZ4gnMpviTo5tAk2BSWmJ07rYT4czyzUac0tjNn19rVWqr3nx0u1bScna6FCk
	9TkPZAG63aeR94ECET0iIGMKM2nu7ocW4uNECGsgNVtKssr5Igc4aJYMSXhFo1lySkIz3hQx38JQO
	PBdH/+W8sH7B309esxeCfz4c094V4otWXu/o5wX9XZUkEMm9OmAsHZn+/LgwyPXegofBC8VvJUtfd
	uNN6TYmg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47702 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u1rgu-00069a-0n;
	Mon, 07 Apr 2025 19:59:28 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u1rgO-0013gj-5r; Mon, 07 Apr 2025 19:58:56 +0100
In-Reply-To: <Z_QgOTC1hOSkIdur@shell.armlinux.org.uk>
References: <Z_QgOTC1hOSkIdur@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Richard Cochran <richardcochran@gmail.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH net-next 2/5] net: stmmac: intel: remove eee_usecs_rate and
 hardware write
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u1rgO-0013gj-5r@rmk-PC.armlinux.org.uk>
Date: Mon, 07 Apr 2025 19:58:56 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_195932_030435_589998A2 
X-CRM114-Status: GOOD (  11.62  )
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

Remove the write to GMAC_1US_TIC_COUNTER for two reasons:

1. during initialisation or reinitialisation of the DWMAC core, the
   core is reset, which sets this register back to its default value.
   Writing it prior to stmmac_dvr_probe() has no effect.

2. Since commit 8efbdbfa9938 ("net: stmmac: Initialize
   MAC_ONEUS_TIC_COUNTER register"), GMAC4/5 core code will set
   this register based on the rate of plat->stmmac_clk. This clock
   is created by the same code which initialises plat->eee_usecs_rate,
   which is also created to run at this same rate. Since Marek's
   commit, this will set this register appropriately using the
   rate of this clock.

Therefore, dwmac-intel.c writing GMAC_1US_TIC_COUNTER serves no
useful purpose and can be removed.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index c8bb9265bbb4..54db5b778304 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -682,7 +682,6 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	plat->axi->axi_blen[2] = 16;
 
 	plat->ptp_max_adj = plat->clk_ptp_rate;
-	plat->eee_usecs_rate = plat->clk_ptp_rate;
 
 	/* Set system clock */
 	sprintf(clk_name, "%s-%s", "stmmac", pci_name(pdev));
@@ -1313,13 +1312,6 @@ static int intel_eth_pci_probe(struct pci_dev *pdev,
 	memset(&res, 0, sizeof(res));
 	res.addr = pcim_iomap_table(pdev)[0];
 
-	if (plat->eee_usecs_rate > 0) {
-		u32 tx_lpi_usec;
-
-		tx_lpi_usec = (plat->eee_usecs_rate / 1000000) - 1;
-		writel(tx_lpi_usec, res.addr + GMAC_1US_TIC_COUNTER);
-	}
-
 	ret = stmmac_config_multi_msi(pdev, plat, &res);
 	if (ret) {
 		ret = stmmac_config_single_msi(pdev, plat, &res);
-- 
2.30.2


