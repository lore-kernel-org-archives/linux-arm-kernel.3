Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D168C02196
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 13:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ilRCh6+tBajH2EHe/j7VXA163CYcQs54iiHX9cjVYLY=; b=VqH7wmO39VuXU9rZ5VagRLT587
	NkCMiijpG5LxefXTNu0Hz5dNvW9vowq+dwB8kDyYVVt5GXQNkBAmGJ3FOADWNPYc7oqMtwAFF2Epn
	Rc+tE8/SzIyeJXNH8fqmYDgY9sSvjW8ZRctNuQUJaN2u1j4JbD+Ms2n6yBLaUsMgMUSkJ1RsxAR+G
	N0+w9Ma34Pho3jsX6dhqAxAejhDN75skx91Adj5cDdZL44kBHdYVB94wxeWyw7FTaAYR/Fjwmqsvh
	ITwAlYnyuN1q5WkpTFy08AhfiWgS0yUdU/b83wqrlfi/N8olaDiADni1SkpBuozgV88NZVQAMaU0P
	+NI1xdzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tffkH-00000003RAq-3mQb;
	Wed, 05 Feb 2025 13:47:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tffdp-00000003Q8O-3NS9
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Feb 2025 13:40:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=ilRCh6+tBajH2EHe/j7VXA163CYcQs54iiHX9cjVYLY=; b=kaj4TtPRDSj47diL93J0LNGwrC
	lIjPiL1n6Vuv4H/He7uDGB/rH8g+FcN7zS9LPJlvMeW0kx6UFUE1MSlAiLru9T5EsnElKvomboPJk
	eQGOqgDx0HQx+sVoz65NCvGke9CFG4Nj7jO4qqeYc+nw3sIRvcl759vd2JOYQGs1ATWAbppVQ+/eU
	cNcgOHNSOCT6HLN3o3JWSUkYYXViOHuPvRYTkeXQtJrPpqpEf3dv4jYfJVriWn0LOVEEBKf0XXN57
	DH5n6Q83HMX+aKdKw0ko04Sr7ds2RtH+IB5KSrVnr9d937PcQ+6/FXpQQFkvwYR4CtL6urcWchgiJ
	yXg8quAA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tffdn-0000000GeTX-0S5y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 13:40:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ilRCh6+tBajH2EHe/j7VXA163CYcQs54iiHX9cjVYLY=; b=MES8Zqi5z2HKfEJWWHPTdMDsx4
	mGKWiRq+No2Gr8dpLRFR3NWGSiUmZQn/RH9uusChGv0viuEw/XsVX68cL/WjQm5iOrsCoImVY1G1W
	mZPpKVMTb5LLYmlG/4SRqdklsllXVBvGttuPleA1XkenH3eiXd6nCXgRhBnc1GZpCsubBbDSOPixT
	MXjhPlT8QL8GixIyqb4TB+rlTpgAgmvDuJv6+zKF6nR+nz2OI7E6HFOmsVm1byZYcesX7hC2e6XAO
	bD/9ipXL6V/jS1tYrDmCwznXz+Fc+XShEixCRQzVD2qkHtmMas+EvHbS2epdcRPEpt7i3lZ5xuH3H
	t9kEk7Zw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50866 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tffdh-0007At-14;
	Wed, 05 Feb 2025 13:40:25 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tffdN-003ZHt-Mq; Wed, 05 Feb 2025 13:40:05 +0000
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
Subject: [PATCH net-next 05/14] net: stmmac: remove priv->dma_cap.eee test in
 tx_lpi methods
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tffdN-003ZHt-Mq@rmk-PC.armlinux.org.uk>
Date: Wed, 05 Feb 2025 13:40:05 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_134031_294749_F8FD03E0 
X-CRM114-Status: GOOD (  10.70  )
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

The tests for priv->dma_cap.eee in stmmac_mac_{en,dis}able_tx_lpi()
is useless as these methods will only be called when using phylink
managed EEE, and that will only be enabled if the LPI capabilities
in phylink_config have been populated during initialisation. This
only occurs when priv->dma_cap.eee was true.

As priv->dma_cap.eee remains constant during the lifetime of the driver
instance, there is no need to re-check it in these methods.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 8f2624de592d..ce527d4ae11f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1044,12 +1044,6 @@ static void stmmac_mac_disable_tx_lpi(struct phylink_config *config)
 
 	priv->eee_active = false;
 
-	/* Check if MAC core supports the EEE feature. */
-	if (!priv->dma_cap.eee) {
-		priv->eee_enabled = false;
-		return;
-	}
-
 	mutex_lock(&priv->lock);
 
 	/* Check if it needs to be deactivated */
@@ -1079,12 +1073,6 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 	priv->tx_lpi_timer = timer;
 	priv->eee_active = true;
 
-	/* Check if MAC core supports the EEE feature. */
-	if (!priv->dma_cap.eee) {
-		priv->eee_enabled = false;
-		return 0;
-	}
-
 	mutex_lock(&priv->lock);
 
 	if (priv->eee_active && !priv->eee_enabled) {
-- 
2.30.2


