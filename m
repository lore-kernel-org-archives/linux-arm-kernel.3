Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6BB10BA44F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 08:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y+QwO7U0FtX/kHNAKLW/1mrbuXdiLJEA4Ql/DjltfJI=; b=phBT5gCet//0Rn8lZNYsKTup4y
	iChHJKXb38o1t7gS7oj/gyvnjnDe4uUX1y4/RhtwPv2eHxad8bb6kSe5OUg6pw5PWPKjQoei626j/
	Ty6+FjhXd0m9EHl6WNu4HqJFt7saYUXAl+BmPZEAJbtduRR+KkQGg+i+KINwL0ai9VgvPDij84hwS
	lOkNlo7m+n+62QHFs24xvUzBSeEZFFq2bSUXh9RE4WlGJbyu8OQ8rHaANNF9eJKMpFNfCdg4dmhPq
	0RcHQutvvZBe+XYJ2/TknnPO03HE5IadGBLPfanQ7RV5F0nAbEGYh95ySNpjCyJQyQGpbat4VAiGr
	izLENjZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62nf-00000006znl-4ArN;
	Fri, 27 Mar 2026 08:44:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62nd-00000006zl4-0Hcr
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 08:44:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=Y+QwO7U0FtX/kHNAKLW/1mrbuXdiLJEA4Ql/DjltfJI=; b=YM5daB0F1LbOyw/72dRIbwyAar
	38p9gtkRoWnFgsiva7htrPh4b3/J8l64S5YRJke2bmH4D3lCwlZmbPxqujWvDyQrWSTpwf8w6yodp
	G/LwImTJw3hwexQY6MF07epyuLbbq+wkAcIwXgP9mO/o7cVO6gEltgu2WKC0nZYLMnaI7KQeHYiBl
	Y2SEbzNGar4nrfVFsJMLKE/5Cpo72MPfg18alKzx97aB6ksUSxjvVsgzOG7exqH4h+Zn9WNG4Jvwr
	iXvJp0kjBeDy6plTdOc+NoTfU5CEZyeib5R5VB2YeoT9sOTcbfsg+/TpbdH5buHivg1BhVhzOs++t
	qkoWxKZw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62na-00000009zqa-0LuO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 08:44:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Y+QwO7U0FtX/kHNAKLW/1mrbuXdiLJEA4Ql/DjltfJI=; b=LutfkeXINnPefEmjRme6clGasl
	dHmoctI4P7lnfNBz6DzU6xdywee9GLnlsS5Dp6uok4MUtMn6Prce4vi7UQ4JGOSqD4MI25VozbbFL
	dvg2nPRyiPA2Cftz1UuiNorTLvCd1Sey7kPSDLpaJG1POpLeUJFylUqgRATAyf1zcZ0eAydGR2mai
	zXg0YLP5TQEi/cf4c7HYKMdLX4tQhoHRKJqoKbFzN4Ic2J0vuVQPdfQvalplhSie92wSfR8hN6ZGt
	yky94NAxaoOJ7Oe/Fpnw0HncIUiGIPB6CbCl21S0F4FxyNhoRj9PnIw7+f5Np1AOwv9fO8LG6ZvsI
	v+Pzkktg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53554 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w62nR-000000005q9-0qHq;
	Fri, 27 Mar 2026 08:44:01 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w62nO-0000000E3CR-445p;
	Fri, 27 Mar 2026 08:43:59 +0000
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
Subject: [PATCH net-next v2 07/15] net: stmmac: qcom-ethqos: move two more
 RGMII_IO_MACRO_CONFIG2 out
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w62nO-0000000E3CR-445p@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Mar 2026 08:43:58 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_084410_339666_2EB93DAE 
X-CRM114-Status: UNSURE (   9.12  )
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

RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL is always cleared, and
RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN is always updated with the phase
shift in each path through the switch, so these are independent of
the speed. Move them out.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c         | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e9d8c8a7146a..ab6554f58214 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -420,13 +420,13 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 			      RGMII_IO_MACRO_CONFIG);
 	}
 
+	rgmii_clrmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
+		      RGMII_IO_MACRO_CONFIG2);
+	rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN, phase_shift,
+		      RGMII_IO_MACRO_CONFIG2);
+
 	switch (speed) {
 	case SPEED_1000:
-		rgmii_clrmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
-			      RGMII_IO_MACRO_CONFIG2);
-
-		rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
-			      phase_shift, RGMII_IO_MACRO_CONFIG2);
 		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 			      RGMII_IO_MACRO_CONFIG2);
 		rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
@@ -453,10 +453,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		break;
 
 	case SPEED_100:
-		rgmii_clrmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
-			      RGMII_IO_MACRO_CONFIG2);
-		rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
-			      phase_shift, RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG_MAX_SPD_PRG_2,
 			      FIELD_PREP(RGMII_CONFIG_MAX_SPD_PRG_2, 1),
 			      RGMII_IO_MACRO_CONFIG);
@@ -483,10 +479,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		break;
 
 	case SPEED_10:
-		rgmii_clrmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
-			      RGMII_IO_MACRO_CONFIG2);
-		rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
-			      phase_shift, RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG_MAX_SPD_PRG_9,
 			      FIELD_PREP(RGMII_CONFIG_MAX_SPD_PRG_9, 19),
 			      RGMII_IO_MACRO_CONFIG);
-- 
2.47.3


