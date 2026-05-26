Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E44CCD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 17:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GESGTyRKjIQzxSqSfucE0sI1Xh7zcNnZwvp69z7bt8E=; b=n9yB1xPVcvME8QwV6GVPfusECf
	gu5xkEU1GoXH9+GWw27oQA6xBEfi89HWPzpiomgMHz/eQEyepopOSlrtUqmqQNrZbyolUWDaQJeZ8
	9m0CbyXhB5n1EZpSEmCeIvzRwndTVePppCVqOxwh5hi67OoS4x0jjgvSsVMgIXlH3vZLYwsaPDVAT
	jlKzhfw41s//N1i86VHeJ3VlGVF6rQAD59eiaPEEWCxjKAq81sz97RSBlwiDhZ2OB0WnD0H16N79v
	BEsK7d2zpW0pfte7OyODf6V9QJUYHoCHxtbihyD0YqpO5YX6bbNj/Fa6lMxNTWX/vw4NHcaX/Tc0J
	ktweIi3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtm4-00000002Nrp-3wob;
	Tue, 26 May 2026 15:32:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtm3-00000002NrB-3v81;
	Tue, 26 May 2026 15:32:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=GESGTyRKjIQzxSqSfucE0sI1Xh7zcNnZwvp69z7bt8E=; b=Ax/2Cc2qlkjQf+UZ64PKZEMQpd
	6Uj9fw7PMF3vIRxsgC8PS6INukLQfNpICYacRafk2SDNsXNnVuNgZnsmlLyOZpH0cS3c4KtFnR/Yg
	f2H+llcqLXx4mbKfVe13Nchs7Pf5zZ9VZM5Eq2l0tWYLmOPRkwXptkHpXGTtuSsVo5RoQwnpibx0T
	xhesI9VljC4pQTdwDEU9PZHu0raLirOMYHCMS6yvRG6lBGGbjuKmUW/zm7SlVdmH5qpLhQbFhS3Ba
	D7LG43m6weD8E590bdTIhJ3AjMkP6BkZgBU3k2cpNZzeY9SN0SYmG+OWoYW/6cMhD+Fb/1XX/NN6m
	/ocCsRTg==;
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtlz-0000000Bhda-2XuV;
	Tue, 26 May 2026 15:32:54 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id 79455602E6;
	Tue, 26 May 2026 15:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1779809567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GESGTyRKjIQzxSqSfucE0sI1Xh7zcNnZwvp69z7bt8E=;
	b=wQ7Oiy7mfqRvlFuzhLyK8gMi7Se7vPyXNVzHuCYNJrFLB3grvbo8IGsXqr1GIFdvUvNtdp
	z2EMZosZPStIixvNBdkcq05+KhFpDClEa73Skw0JB8NcNAP0KsU5IiD2Cad1kYciKegETC
	4HNMs5SAnyrYNvlq/ftNz6m18xo+UT0=
Received: from frank-G5-5590 (fttx-pool-217.61.151.155.bambit.de [217.61.151.155])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 3AC81120056;
	Tue, 26 May 2026 15:32:47 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Alexander Couzens <lynxis@fe80.eu>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net v2] net: pcs: pcs-mtk-lynxi: fix bpi-r3 serdes configuration
Date: Tue, 26 May 2026 17:32:38 +0200
Message-ID: <20260526153239.30194-1-linux@fw-web.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_163252_090437_1CCE9A7D 
X-CRM114-Status: GOOD (  11.98  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Commit 8871389da151 introduces common pcs dts properties which writes
rx=normal,tx=normal polarity to register SGMSYS_QPHY_WRAP_CTRL of switch.
This is initialized with tx-bit set and so change inverts polarity
compared to before.

It looks like mt7531 has tx polarity inverted in hardware and set tx-bit
by default to restore the normal polarity.

The MT7531 datasheet quite clearly states:
Register 000050EC QPHY_WRAP_CTRL -- QPHY wrapper control
Reset value: 0x00000501

BIT 1 RX_BIT_POLARITY -- RX bit polarity control
 1'b0: normal
 1'b1: inverted

BIT 0 TX_BIT_POLARITY -- TX bit polarity control (TX default inversed
in MT7531)
 1'b0: normal
 1'b1: inverted

Till this patch the register write was only called when mediatek,pnswap
property was set which cannot be done for switch because the fw-node param
was always NULL from switch driver in the mtk_pcs_lynxi_create call.

Do not configure switch side like it's done before.

Fixes: 8871389da151 ("net: pcs: pcs-mtk-lynxi: deprecate "mediatek,pnswap"")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v2:
  - send as non-RFC
  - add datasheet information from Daniel
---
 drivers/net/pcs/pcs-mtk-lynxi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/pcs/pcs-mtk-lynxi.c b/drivers/net/pcs/pcs-mtk-lynxi.c
index c12f8087af9b..a753bd88cbc2 100644
--- a/drivers/net/pcs/pcs-mtk-lynxi.c
+++ b/drivers/net/pcs/pcs-mtk-lynxi.c
@@ -129,6 +129,9 @@ static int mtk_pcs_config_polarity(struct mtk_pcs_lynxi *mpcs,
 	unsigned int val = 0;
 	int ret;
 
+	if (!fwnode)
+		return 0;
+
 	if (fwnode_property_read_bool(fwnode, "mediatek,pnswap"))
 		default_pol = PHY_POL_INVERT;
 
-- 
2.53.0


