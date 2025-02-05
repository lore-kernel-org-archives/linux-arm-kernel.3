Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FDFC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 13:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AhrWt9WVjAY60HpUOIFuu7OGOJj5bUlRo1gopxgG8/c=; b=nn2V/HKY5M6jbtTGeUE7jyaSA1
	YLm//P2muaFilSSTPZacNGRgAj6obWMECM3M/P3ezv7GwJ1QRSd+RLlXMZ9Ujg4kj5zcPTktTNlTN
	uOLrLxS2GGBbD7I7w8fgsW66JJ6sjdDmr/NVKGuAdrUIUFbnrpE0S7m726vSo1p7Tv73t60GqqmEl
	D0SZxnbTevz+pR8Oi6mJ0XcLcsGMfR9CRDJPuifp4zjpkrDA1zATbzAl3zXYpnC6hvGvkOh4VU7/w
	1ibTgbUPJb5vnbJNfikRar7CHWaUKu+eZAbgzK3/OuNYFDx4zpkqQ7LEIj27O3ouc8Em4zuCerEO6
	EoOcjwew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tffev-00000003QIw-2w41;
	Wed, 05 Feb 2025 13:41:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tffdZ-00000003Q79-1R6u
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Feb 2025 13:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=AhrWt9WVjAY60HpUOIFuu7OGOJj5bUlRo1gopxgG8/c=; b=My15evvKejhFSPM0/eVCk6ZxMm
	TmqqwkzgaVOamEJO7DZ+9yAqLpl/Yo5h2VEHFuQH4NUfyYZGQ9XJTk0L1zI7S9JxSQDS0PljSg0js
	ScGE2EY7py3EgQ7VRNz/+9vmrSCSIamAVkq02mD/k27dT8cMAz8szxs7NofilrCyfxVe4prpjCQ1N
	SySAvmGwxVVBd9sfO8DSqi25g3dQHYR7oEsKsf+qbLjF6ADSfNzDliYhmmK1Fa9SimJgaea5gSzAX
	GUmGoilOtB3fMYNJnf/TgJFF8gswm9T24Arv49fJ3yxOalLeH/iY/E//KDNYk5lS8Z2pUtFtX6kxn
	2C/RK6tw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tffdW-0000000GeQm-20fA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 13:40:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AhrWt9WVjAY60HpUOIFuu7OGOJj5bUlRo1gopxgG8/c=; b=BOk0lF2YVhlaqQFGfND5bJ1miN
	lMcrV0ucGIrdkLxzGhCm4Qeu8dXj9VHSaz1FCz5iUedR4fB/mCFsFxY+MFb4AnBxu2I7/Vzp1U3hP
	Sswzi7H1Y4Rmkw3SxyYLppbe9x/agDbEZfRz6StgTAy3vHTCERNJmJpcR6dnzYaSPEMbjF6Z4gaxt
	1VBtYk50pL5GBu4J9TvlYOC8d5aFPw/7JmHO8WGCFTLe7R5u6/IZIawTBk67AHPRZfMNWJB/pcQUg
	izyQkLzsJGm7yj9ctfV4De3YW3sKw0V+NvOIAbsfLG+hJ2UE0BS59vIiQItRHfFjdAHPM3zrxG8vd
	XlR6Kz2Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47364 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tffdM-00079s-2H;
	Wed, 05 Feb 2025 13:40:04 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tffd3-003ZHV-6C; Wed, 05 Feb 2025 13:39:45 +0000
In-Reply-To: <Z6NqGnM2yL7Ayo-T@shell.armlinux.org.uk>
References: <Z6NqGnM2yL7Ayo-T@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 01/14] net: stmmac: delete software timer before
 disabling LPI
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tffd3-003ZHV-6C@rmk-PC.armlinux.org.uk>
Date: Wed, 05 Feb 2025 13:39:45 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_134014_616249_02E2EB87 
X-CRM114-Status: GOOD (  10.65  )
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

Delete the software timer to ensure that the timer doesn't fire while
we are modifying the LPI register state, potentially re-enabling LPI.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d04543e5697b..9b44f4a8b7af 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -447,8 +447,8 @@ static void stmmac_try_to_start_sw_lpi(struct stmmac_priv *priv)
  */
 static void stmmac_stop_sw_lpi(struct stmmac_priv *priv)
 {
-	stmmac_reset_eee_mode(priv, priv->hw);
 	del_timer_sync(&priv->eee_ctrl_timer);
+	stmmac_reset_eee_mode(priv, priv->hw);
 	priv->tx_path_in_lpi_mode = false;
 }
 
@@ -492,8 +492,8 @@ static void stmmac_eee_init(struct stmmac_priv *priv, bool active)
 		if (priv->eee_enabled) {
 			netdev_dbg(priv->dev, "disable EEE\n");
 			priv->eee_sw_timer_en = false;
-			stmmac_disable_hw_lpi_timer(priv);
 			del_timer_sync(&priv->eee_ctrl_timer);
+			stmmac_disable_hw_lpi_timer(priv);
 			stmmac_set_eee_timer(priv, priv->hw, 0,
 					     STMMAC_DEFAULT_TWT_LS);
 			if (priv->hw->xpcs)
-- 
2.30.2


