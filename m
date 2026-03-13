Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67395106FD8A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ky5kbYBzHLMwiuVFJNP0IAwZEONsEvMou1UOqS+GNz4=; b=SDJuu0d4WW9owgjkpekR0+zN51
	i1+3pWn1it5pypWf4YNcjyT2+BqmlLF+DRTf3Nu7aErYlNtmeAVk7Qof2TCady9suzNwelN9iGJku
	L0W7jo/vCMaSFnHMZagTQzA6We5FxNV4TvxPv7E6a+uvtvWOLKoI4ofK7diHkWhxa1wWMAXaUDO78
	W5Hwy+wrsDhqepwOTQnrkkhTI53GQO8jRhTAUdFPrueUF6aDzxAqtS99Hr/yKugJwM2iESElyPbm+
	ss3AIBax29bWMqb0aWlfT7zUCjENqD4g0jtiUYfY3ENOGJz+O7vjI6spHknC8rtfo8FOs07O5wOZz
	ubXg+5Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wib-0000000H0AY-3Okf;
	Fri, 13 Mar 2026 07:13:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wiU-0000000H06e-47Bx
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 07:13:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=Ky5kbYBzHLMwiuVFJNP0IAwZEONsEvMou1UOqS+GNz4=; b=dVqIIWgRMC/tfeytfCZZsU803Y
	oBg9iVcoh+thIgkAGTYZIBd/YcZjJo6J15psohSElQ0Vy00fmgiZ+hagp+uPywJA4o5iQbhR/zM+R
	t6AuOekdr/aoKwTDZLDY07XvlRr9wmHx1OI6oJFTqpYHB86Mnna379XBh5torBOByF1Jx/mC4Z1vR
	bg/JH0A2QWOMyf6B2CTYq7HoeC8dO+l+VKxZ65zWSG8vYVOIAKW7BSyABGDFk8L9yhBkfLm8Rn5qm
	WyeA8gUf0d3kELAwOmwxRfD6ADh/1Rcd9gv68JOhcBdduZiGZ9fVqVUJXp0l9F4SN7uDEi3mau+C5
	2wiiBovw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wiR-00000002jqC-0SNw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 07:13:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E56D44450D;
	Fri, 13 Mar 2026 07:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1D72C19421;
	Fri, 13 Mar 2026 07:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773386022;
	bh=40Cz4hesa3A7f6nuxyb4PMpfao9zv7QlEkjCMHd2dk0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bkLIe6u77B371GN9hRTU8YONJd+tsnZCkXYvDvBudpkraH1ZKEyz7W+7XzGEN6DP2
	 4zqoZ1PrQnBPw6+lZCynlqRCHuNGXwbW/TTA+6bKNJPtbPoTwzMQzrkv9c9kv9KuI9
	 owyu5KYQSELf7mYCxORWaBp2RlJG5E7vZlp2kw2SuqmLYzf+Kd6P+Onhau1cscaNhj
	 NP0hJQWVC1qL2mrKOiuBaPIVesfAKpP2KmB2dPjvIjdSVXwS0S2jxsyI3aAjJ21/d6
	 S8XfJ1KPKsL9NREaCpa4HCtLykbes8bzraaGrPOfZZx+jq1fgLTLjaj/kdTqFBzzHG
	 xBV/zVfi0oDmg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4776106FD91;
	Fri, 13 Mar 2026 07:13:42 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Fri, 13 Mar 2026 08:13:32 +0100
Subject: [PATCH net-next v12 1/4] net: stmmac: platform: read channels irq
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-dwmac_multi_irq-v12-1-b5c9d0aa13d6@oss.nxp.com>
References: <20260313-dwmac_multi_irq-v12-0-b5c9d0aa13d6@oss.nxp.com>
In-Reply-To: <20260313-dwmac_multi_irq-v12-0-b5c9d0aa13d6@oss.nxp.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, rmk+kernel@armlinux.org.uk, 
 vladimir.oltean@nxp.com, boon.khai.ng@altera.com, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773386021; l=2728;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=U5+X0LRT0aJVW/rwNRk17jxj0WPmT49gK8hZ1ZKJZvk=;
 b=+qvu9tbUVfssBr/Kelwmaz/57s0Cx+ZtNQ8YrnxuIKlBytk+lLO00OmH8ueH3m6xfHNOEaw//
 8RGGjOUYwH/DmJQRw1nqfddvC7Bb5DXoOdCy3OBiI9Ne3TC6UIw9yqb
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_071347_592211_59EFE857 
X-CRM114-Status: GOOD (  15.60  )
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
Reply-To: jan.petrous@oss.nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

Read IRQ resources for all rx/tx channels, to allow Multi-IRQ mode
for platform glue drivers.

Reviewed-by: Matthias Brugger <mbrugger@suse.com>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 57 +++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 3b514a702612..59aac0afc609 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -695,9 +695,47 @@ struct clk *stmmac_pltfr_find_clk(struct plat_stmmacenet_data *plat_dat,
 }
 EXPORT_SYMBOL_GPL(stmmac_pltfr_find_clk);
 
+/**
+ * stmmac_pltfr_get_irq_array - Read per-channel IRQs from platform device
+ * @pdev: platform device
+ * @fmt: IRQ name format string (e.g., "tx-queue-%d")
+ * @irqs: array to store IRQ numbers
+ * @num: maximum number of IRQs to read
+ *
+ * Return: 0 on success, -EPROBE_DEFER if IRQ is deferred, -EINVAL on error.
+ * Missing IRQs are set to 0 and iteration stops at first missing IRQ.
+ */
+static int stmmac_pltfr_get_irq_array(struct platform_device *pdev,
+				      const char *fmt, int *irqs, size_t num)
+{
+	char name[16];
+	int i;
+
+	for (i = 0; i < num; i++) {
+		if (snprintf(name, sizeof(name), fmt, i) >= sizeof(name))
+			return -EINVAL;
+
+		irqs[i] = platform_get_irq_byname_optional(pdev, name);
+		if (irqs[i] == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+
+		if (irqs[i] <= 0) {
+			dev_dbg(&pdev->dev, "IRQ %s not found\n", name);
+
+			/* Stop silently on first unset irq */
+			irqs[i] = 0;
+			break;
+		}
+	}
+
+	return 0;
+}
+
 int stmmac_get_platform_resources(struct platform_device *pdev,
 				  struct stmmac_resources *stmmac_res)
 {
+	int ret;
+
 	memset(stmmac_res, 0, sizeof(*stmmac_res));
 
 	/* Get IRQ information early to have an ability to ask for deferred
@@ -733,7 +771,24 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
 
 	stmmac_res->addr = devm_platform_ioremap_resource(pdev, 0);
 
-	return PTR_ERR_OR_ZERO(stmmac_res->addr);
+	if (IS_ERR(stmmac_res->addr))
+		return PTR_ERR(stmmac_res->addr);
+
+	/* TX channels irq */
+	ret = stmmac_pltfr_get_irq_array(pdev, "tx-queue-%d",
+					 stmmac_res->tx_irq,
+					 MTL_MAX_TX_QUEUES);
+	if (ret)
+		return ret;
+
+	/* RX channels irq */
+	ret = stmmac_pltfr_get_irq_array(pdev, "rx-queue-%d",
+					 stmmac_res->rx_irq,
+					 MTL_MAX_RX_QUEUES);
+	if (ret)
+		return ret;
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(stmmac_get_platform_resources);
 

-- 
2.47.0



