Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A390C10BA445
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 08:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+oKk1glFvRnbc/UMN8ZC2piQnooM+bFB+k+lvNtiCCc=; b=WHiQ/ugW8Yt8OCfnO03rrqZak2
	h1zAxhCcn0D5KbYg/DfF2+gpP2tDAAf/TIqH+XUOSHU5+S5k+XaIwmEoC/VxOmianzsvOhYHg+2qz
	IjCjXHj0jU5woS61lPx1On0czv9qJTw5RyU6R/knUsuvvBoIArPCRVQES3E9ieWEdT0Gm+g9smrJr
	OfQayy6SRMtksPbwqh16VNu2NpHz0FQP85HIezZWf+AyEHdHy6eQtuprjPtTAnWvSC6j1sklP+Sqm
	6SbfIoDO067QKQskok4Z58MHpj2NLsC3NnH9YLnCHo3w+6uPdB+pOgdA4qZ5+Aozcqm3Xpa1qwtDB
	hL8nVFiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62nz-0000000703v-2GIk;
	Fri, 27 Mar 2026 08:44:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62ns-00000006zxr-3veF
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 08:44:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=+oKk1glFvRnbc/UMN8ZC2piQnooM+bFB+k+lvNtiCCc=; b=KnVbZdbd2AFm5+8V8K6nwmr20L
	IPyCYLKDiHthpPbye09fe2Qb+kA4oozctgysrIkC7c1K6Tg2oUxXZv3A1A3ywuaThjX46DHvWhkhE
	qXJA/7pn+wAtyKWrCsJNFMHJGyLe4yqzWa0oTBRvkQbPO1zLiKtNgVS7sOEq4Y36GfKDIHB5Qdg81
	2O+VUegSDH6HS4rsC3NPrWEK3fz9Qo9wBLC5hX+Q+nwVZY9306BAa95BiJTQvQkS0WiGoiHfZr17f
	hPalmkJpV96jLE5JIu5aAfO1hRQgFbRExcI+owSniAzw4wXqQOz0LOybfOHnSN0ysCeTlADrpnjwO
	kxdW06uA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62np-00000009zuw-1SLe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 08:44:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+oKk1glFvRnbc/UMN8ZC2piQnooM+bFB+k+lvNtiCCc=; b=vI2I3vZ1ZEZEwtFgHF4puWIXmT
	Iaeuo+e/i53+VWsunTm3Vfv9CKzhDmqcHaFIGMqcU6rH0q2TYZbT6CWgyqKDFLve04qfVMyYIqlq3
	j4jlQDKoPfRPMVqKfMw+OorFDFCi8WFIh7BaFDrjXyUOeesKAfgxpQticZ5RurcU2n9oQNL/SHcKe
	HN0pgIQNykcGWPuw0x+nOUQwKNjgQjwaJkhITAEsE/VzTR7ECn4s4WepdT8mCOB109jL/XktzT4RX
	9sebStcMNYYTI26g03smPVkHgEL9rfiKThfBXvYEUSTYqLA5v2dPVPgbGUe9NAK4qEVBKNbCua4Gr
	hhfinNBA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60942 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w62ng-000000005qz-1HBr;
	Fri, 27 Mar 2026 08:44:16 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w62ne-0000000E3Ck-1Haf;
	Fri, 27 Mar 2026 08:44:14 +0000
In-Reply-To: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
References: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 10/15] net: stmmac: qcom-ethqos: move
 RGMII_CONFIG2_RX_PROG_SWAP
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w62ne-0000000E3Ck-1Haf@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Mar 2026 08:44:14 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_084425_467947_53AF59E3 
X-CRM114-Status: UNSURE (   9.40  )
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

Move RGMII_CONFIG2_RX_PROG_SWAP out of the switch. 1G speed always
sets this field. 100M and 10M sets it for has_emac_ge_3 devices,
otherwise it is cleared.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 21 ++++++-------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 13f4df0a90d7..b4c61cb24e1d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -437,11 +437,15 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 		      RGMII_IO_MACRO_CONFIG2);
 
-	switch (speed) {
-	case SPEED_1000:
+	if (speed == SPEED_1000 || ethqos->has_emac_ge_3)
 		rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
 			      RGMII_IO_MACRO_CONFIG2);
+	else
+		rgmii_clrmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
+			      RGMII_IO_MACRO_CONFIG2);
 
+	switch (speed) {
+	case SPEED_1000:
 		/* PRG_RCLK_DLY = TCXO period * TCXO_CYCLES_CNT / 2 * RX delay ns,
 		 * in practice this becomes PRG_RCLK_DLY = 52 * 4 / 2 * RX delay ns
 		 */
@@ -463,13 +467,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		break;
 
 	case SPEED_100:
-		if (ethqos->has_emac_ge_3)
-			rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
-				      RGMII_IO_MACRO_CONFIG2);
-		else
-			rgmii_clrmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
-				      RGMII_IO_MACRO_CONFIG2);
-
 		/* Write 0x5 to PRG_RCLK_DLY_CODE */
 		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
 			      FIELD_PREP(SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
@@ -483,12 +480,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		break;
 
 	case SPEED_10:
-		if (ethqos->has_emac_ge_3)
-			rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
-				      RGMII_IO_MACRO_CONFIG2);
-		else
-			rgmii_clrmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
-				      RGMII_IO_MACRO_CONFIG2);
 		/* Write 0x5 to PRG_RCLK_DLY_CODE */
 		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
 			      FIELD_PREP(SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
-- 
2.47.3


