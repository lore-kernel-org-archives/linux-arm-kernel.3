Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B2D10BA445
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 08:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vnbkI7QqhHof8COZEVwEqUY1RoVpTXdFmiC6hgd168k=; b=NvGRjhNgYnzIPPSkOvUiaWSYgx
	CslIxFysupCNo9yVAcMbV4y9hY0Roxw8huR3swQoNV9s3RIw+6Z0jtAjXwiBi8F9UlRBNQNWixC1U
	xaoIdL89SFNXeRwTLnC8Df9HVyTmpqE1JKSSS2wnrCht2vaAZY3Cfvnj/LernJzBI5cKnzi1J4L30
	43bZvBOqbAH7wjqF+nZKArgIImLJWmzLT+aLEnBWU1/1wNGtJl2yC+KeoZEVHkf5b3MY+UKtoGxye
	pk1hC9Jx28nxT1JtDg9yKYTy4C7Vafi6ucHzZQSa55qTMVm3SntscV4X+I0jsbzIuX7Ft9tv5vqW9
	r+SVtvVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62n6-00000006zVX-1GNm;
	Fri, 27 Mar 2026 08:43:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62n5-00000006zVB-2dWZ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 08:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=vnbkI7QqhHof8COZEVwEqUY1RoVpTXdFmiC6hgd168k=; b=Stp6h3YIEUDJyQgtmjGcwBQ4Dd
	UJq0Yk6HOGWhesOdrxrBu+Hn4+qGxgbwjZDlaohLtWud/XvY4F2286TCCX/3bKabsFPclhVEvR1sG
	E7F7SsbJ39V2fmT5aaEpO93Kgdkl+vgE6HSGndRx5Kv3DTCzvtNYR4udiW8Wt77JqKiMvTQ+1wIT/
	TqA8p1G4iVkNrxdCjcOj/LSYk2IxpNHQ355+WtvZk9fZ0JaQgmmOX6bDGnkGuwgfxG8iI0h9QVRij
	41C78Uqp6pqpfSld8uS8qIvNlOV45OlIcR7efZgSqI+x7MFVqf0vB9Cry+g4s0iS9tvG24kIttf2h
	VFI1nLyQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62n2-00000009zjo-2HA0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 08:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vnbkI7QqhHof8COZEVwEqUY1RoVpTXdFmiC6hgd168k=; b=cEOLJASO84Rdkyvc/rN7DjrbDS
	UP/XVDUa6GUF6xll3G/IL+NOEMb9wOJs93H/m7T3vb+CT31CO03Q3x42mrOQfqANWuYMJ9Rl2WBmv
	MBtCLIKUGAYCeiM7EZ+jBrmubFQqWCiSeh0UeAGJRQ5r7ic03BnPayxYTqGyfVurRJaI9CCGIQoRb
	YhHr8wXEIgeH7GGlGdwOVTVuixD6ykRt9HsiCSPsHUcY39i8uQCYfnWC1qUnbLc+Y/O/yEP8EJl0E
	cHIK/Oy9IR63/dC+lM9SDxPNBCYk0uSQbCelePHta0fG3U26oMYOP6c1Ph2VVbjjjw4QRF9R2orwp
	dEsaxkHQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50030 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w62mu-000000005oP-48Ij;
	Fri, 27 Mar 2026 08:43:29 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w62mu-0000000E3Bq-15wa;
	Fri, 27 Mar 2026 08:43:28 +0000
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
Subject: [PATCH net-next v2 01/15] net: stmmac: qcom-ethqos: remove
 ethqos_configure()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w62mu-0000000E3Bq-15wa@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Mar 2026 08:43:28 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_084336_689405_D0F166C2 
X-CRM114-Status: UNSURE (   8.69  )
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

ethqos_configure() does nothing more than indirect via
ethqos->configure_func, and is only called from ethqos_fix_mac_speed()
just below. Move the indirect call into ethqos_fix_mac_speed().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 3ccf20fdf52a..502f2b184a87 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -623,18 +623,12 @@ static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos,
 	ethqos_pcs_set_inband(priv, interface == PHY_INTERFACE_MODE_SGMII);
 }
 
-static void ethqos_configure(struct qcom_ethqos *ethqos,
-			     phy_interface_t interface, int speed)
-{
-	return ethqos->configure_func(ethqos, interface, speed);
-}
-
 static void ethqos_fix_mac_speed(void *priv, phy_interface_t interface,
 				 int speed, unsigned int mode)
 {
 	struct qcom_ethqos *ethqos = priv;
 
-	ethqos_configure(ethqos, interface, speed);
+	ethqos->configure_func(ethqos, interface, speed);
 }
 
 static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
-- 
2.47.3


