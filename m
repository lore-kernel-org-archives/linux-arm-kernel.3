Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB17C02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 13:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HapMKEDwluimEXPuPk+qD/5tw9RztvwWMl7+HqoD6wo=; b=aCqz8sDmqm+tiHz3w1jccFJuUG
	P6yk/ETDd9IGVrdTX34c53M0/o6NuH8yabS3A4QoXOkE1C2rh12/3lYUuw8To/o/d5leTDNPsKGLN
	yK5Ja/uo5JxA3bfMHlnsgfvWq8b786Xi8JWpq2TKPoa6eSBsfDaxUEWssgmpLCcEGOnUAtyvyiZ7O
	77jS0jPB96tO+BxcqCgP9y8Jt6YRqULWWB3J7o46yUSsfjzuImr7mPL8qXKD0MiBaGwiAGhvlwFAo
	+cIVo6ycnqd9y7JZCEdB3cjsdNJQDbsob6HxYvvz+BRU07qaPxQGdsgfUUAJLxe9905UH9Mn2QLl/
	ihygjSaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tffpd-00000003Ry1-01LV;
	Wed, 05 Feb 2025 13:52:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tffeB-00000003QBe-3Jad
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Feb 2025 13:40:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=HapMKEDwluimEXPuPk+qD/5tw9RztvwWMl7+HqoD6wo=; b=g0g1GqihkBmN05l3hjBHb+JsHH
	ZTy6t9SHE1+w7IMxNBjrHfsPOdSfMDDT/SlW5l3IWwmFY7ibsCIsEQ+Exoj3LC6WR8NZK5JbH4cP3
	eRxwS6n8r0hzK00AeTJKzzGveCFOKmOvaJUh0mkRKjUv1O85c36JCCiA8Bl3A55FcpKrENbfHPjqQ
	/vOdyo+9MH4bgXW2K7AVWWxJLDR/6mZ/F19iux/kCyKz3M1Qc8E4F/iho5SrE4vDN+5ei+qzm4Vk/
	L+wCNOzw6rJ+UGJfWJU2MubHrqiuGBtI/scBlayNZD2BcrrFfQFduXy6+ZSaJVdxJUAScXk2naamQ
	NWcphZcw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tffe8-0000000GeVx-3saW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 13:40:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HapMKEDwluimEXPuPk+qD/5tw9RztvwWMl7+HqoD6wo=; b=howcuFCqo4EhehmK5FI0Xffgiw
	YTu67hn3iXNCeCrxvLDyS9q8igh6mdsaVlnoqKKnLniiplKLSAZ/qlzUyYVGdMKEUpjVxb9zonIav
	xCLnfWFKrHV+V5l3wbRG9uKHUaoTrQglXxHoPvUHkNHPPpRNzUVitT0xfTLKoPAx/Ckm5E0zUgtmS
	AOSQb07EsstsijXH1k5JkhRmxfiJts1wAtj+8Jf41G9OuS9GzjNNMVzJTUvAmeE+1PDzyQdDY154/
	hAgIjsUqAPFtMxKHdZGUkWjeGpMEa2nBXgrWVkDl5zTlzaw7+W1RRX+JL1iTg7OBW7lLVyhPflQGd
	09XNH7sg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51742 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tffe1-0007Bv-22;
	Wed, 05 Feb 2025 13:40:45 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tffdi-003ZIH-5h; Wed, 05 Feb 2025 13:40:26 +0000
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
Subject: [PATCH net-next 09/14] net: stmmac: remove unnecessary LPI disable
 when enabling LPI
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tffdi-003ZIH-5h@rmk-PC.armlinux.org.uk>
Date: Wed, 05 Feb 2025 13:40:26 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_134053_220127_9687ADEB 
X-CRM114-Status: UNSURE (   8.93  )
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

Remove the unnecessary LPI disable when enabling LPI - as noted in
previous commits, there will never be two consecutive calls to
stmmac_mac_enable_tx_lpi() without an intervening
stmmac_mac_disable_tx_lpi.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3cb5645673cb..921c4badd5fb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -390,11 +390,6 @@ static inline u32 stmmac_rx_dirty(struct stmmac_priv *priv, u32 queue)
 	return dirty;
 }
 
-static void stmmac_disable_hw_lpi_timer(struct stmmac_priv *priv)
-{
-	stmmac_set_eee_lpi_timer(priv, priv->hw, 0);
-}
-
 static void stmmac_enable_hw_lpi_timer(struct stmmac_priv *priv)
 {
 	stmmac_set_eee_lpi_timer(priv, priv->hw, priv->tx_lpi_timer);
@@ -1082,14 +1077,10 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 
 	if (priv->plat->has_gmac4 && priv->tx_lpi_timer <= STMMAC_ET_MAX) {
 		/* Use hardware LPI mode */
-		del_timer_sync(&priv->eee_ctrl_timer);
-		priv->tx_path_in_lpi_mode = false;
-		priv->eee_sw_timer_en = false;
 		stmmac_enable_hw_lpi_timer(priv);
 	} else {
 		/* Use software LPI mode */
 		priv->eee_sw_timer_en = true;
-		stmmac_disable_hw_lpi_timer(priv);
 		stmmac_restart_sw_lpi_timer(priv);
 	}
 
-- 
2.30.2


