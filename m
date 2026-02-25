Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31BEEFD219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HTPnwhV+RUxTDKLH5yQG71ho4q6PA4145WMcY/HvZHM=; b=Ow5GcF0ZLar3LiK8qnW3gxivUu
	S7ciHfgaPoBbOxZYx71klIiE/AC2YD0GCMT6eOmSUdAGTPrSymHVZHbZA0ER45y2U5jpZack6TeGI
	4Wz2RzYcLYE8cUYOzxRQYYE31w0sjqJjBjNQEbsXlb2oFTgsK87Ig0YpRhRJdgr/dovAS90k0Limh
	YTafzG2PA+6Mx7txPnTDScFPFXo6rFkU4K0ou7GjQV0+Udm8BotaBzGhN7pQpYy79u9L9Xi23sU9a
	6WGWDez3pzQPTjzXaNt7OjYjdPdqJVZ8MmhO4CvxFn/agr7AcbLLlc6Wt0DceT2doHlMGip5RsOfh
	NOiXSLlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvB4v-00000003eil-01wA;
	Wed, 25 Feb 2026 09:21:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvB4r-00000003efb-0xTg
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Feb 2026 09:21:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=HTPnwhV+RUxTDKLH5yQG71ho4q6PA4145WMcY/HvZHM=; b=VOPSIwbWXiZ1GHMHnWGJs8QHTp
	eRv2E7nsDT1v8MkIZ5rDppQ4eazG8oceX5rfg1u+dglXv0FnpsakHx1/P/dRqLL+EjnCX0d18Zcwb
	sd2NkaiA6QsdxcuXU219Gb5mD62kt8/p3wxFfxr3gLCJ+nL8dGq3xXptR+OqsFr+hv9TO7y3DCwcM
	COc6kcbxyRbigqqep9GlWAZqS1tjIf+ll0UGdK0Whr5FbDW2iS4i/6ocsB4irQjJA1cOb6ImdBBZD
	+4BVKEJOL3xAKPVw6CFyvft2nksXuOmeSLET/LzLWAmrbWijtc3LSq7x7Ck/J/nMQEcRgydnX+wV9
	pnvpfuCA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvB4n-00000008ewg-0hiu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 09:21:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7EF3D44579;
	Wed, 25 Feb 2026 09:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5FA47C2BCB7;
	Wed, 25 Feb 2026 09:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772011256;
	bh=1wg2w5Y5/YzQPQzVr+3ynFChKDaTwYad7mRHpb7T0TQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ucyZelTLPocdMfhxnHrWFYcQU4O36uEVnHyFGCcZxHZ23XZ1Fs01rN/xqkDTh3n/7
	 qOb4LdDj9NauLxFtGzcM58uVv9dQ611qBAlY/x21Lk+ePHJxJgZcEizn6hx1YT7eAL
	 VnTdJLt9UVlTqt32aK+VZfI2nDVGxXb0JU9mLKEtZNOY2xJxVJn7QKu+GYwhjdPUH5
	 yd1iCXByxKS6DqlP9sgcrpgVWA9yhfjkPy0DDV0Kyv9rKz8HIPblrTl+3Q6FjXRYcU
	 UTa1KP5lMKpEHXyzt2BkrkT/FBLW2GbU7ay/n12PCk7kV2fqbloy2ksKaHSEHb1r8b
	 yL83I59QLbEZg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 543C3EFD216;
	Wed, 25 Feb 2026 09:20:56 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Wed, 25 Feb 2026 10:20:37 +0100
Subject: [PATCH v6 5/5] stmmac: s32: enable support for Multi-IRQ mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-dwmac_multi_irq-v6-5-245bf1d7110c@oss.nxp.com>
References: <20260225-dwmac_multi_irq-v6-0-245bf1d7110c@oss.nxp.com>
In-Reply-To: <20260225-dwmac_multi_irq-v6-0-245bf1d7110c@oss.nxp.com>
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
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772011254; l=4698;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=VhNXhFN3LNj9piUSrvcU0j8rDNgFhxjzRPwBQhKPqME=;
 b=tG4OPocKqVIacnzg6C8UUg/DR2vaS/X/hta0AyweSYYSjJMzjIGZkxO8P5gK8neG2nzpjZwAT
 N6pBZ5ltd6hDKEerKCfVeJH9gdRvqiShQiZCBgp+lwc+r83oWkdK9Lj
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_092101_624678_A2FDC47C 
X-CRM114-Status: GOOD (  16.04  )
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

Based on previous changes in platform driver, the vendor
glue driver can enable Multi-IRQ mode, if needed.

To get enabled Multi-IRQ mode for dwmac-s32, the driver checks:

  1) property of 'snps,mtl-xx-config' subnode
     defines 'snps,xx-queues-to-use' bigger then one, ie:

     ethernet@4033c000 {
         compatible = "nxp,s32g2-dwmac";
         ...
         snps,mtl-rx-config = <&mtl_rx_setup>;
         ...

         mtl_rx_setup: rx-queues-config {
             snps,rx-queues-to-use = <2>;
         };

  2) queue based IRQs are set, ie:

     ethernet@4033c000 {
         compatible = "nxp,s32g2-dwmac";
         ...
         interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
                      /* CHN 0: tx, rx */
                      <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
                      <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
                      /* CHN 1: tx, rx */
                      <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
                      <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
         interrupt-names = "macirq",
                           "tx-queue-0", "rx-queue-0",
                           "tx-queue-1", "rx-queue-1";

If those prerequisites are met, the driver switch to Multi-IRQ mode,
using per-queue IRQs for rx/tx data pathr:

[    1.387045] s32-dwmac 4033c000.ethernet: Multi-IRQ mode (per queue IRQs) selected

Now the driver owns all queues IRQs:

root@s32g399aevb3:~# grep eth /proc/interrupts
 29:    0    0    0    0    0    0    0    0    GICv3  89 Level   eth0:mac
 30:    0    0    0    0    0    0    0    0    GICv3  91 Level   eth0:rx-0
 31:    0    0    0    0    0    0    0    0    GICv3  93 Level   eth0:rx-1
 32:    0    0    0    0    0    0    0    0    GICv3  95 Level   eth0:rx-2
 33:    0    0    0    0    0    0    0    0    GICv3  97 Level   eth0:rx-3
 34:    0    0    0    0    0    0    0    0    GICv3  99 Level   eth0:rx-4
 35:    0    0    0    0    0    0    0    0    GICv3  90 Level   eth0:tx-0
 36:    0    0    0    0    0    0    0    0    GICv3  92 Level   eth0:tx-1
 37:    0    0    0    0    0    0    0    0    GICv3  94 Level   eth0:tx-2
 38:    0    0    0    0    0    0    0    0    GICv3  96 Level   eth0:tx-3
 39:    0    0    0    0    0    0    0    0    GICv3  98 Level   eth0:tx-4

Otherwise, if one of the prerequisite don't met, the driver
continue with MAC IRQ mode:

[    1.387045] s32-dwmac 4033c000.ethernet: MAC IRQ mode selected

And only MAC IRQ will be attached:

root@s32g399aevb3:~# grep eth /proc/interrupts
 29:    0    0    0    0    0    0    0    0    GICv3  89 Level   eth0:mac

What represents the original MAC IRQ mode and is fully backward
compatible.

Reviewed-by: Matthias Brugger <mbrugger@suse.com>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c | 36 ++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
index af594a096676..03e014c10d3f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
@@ -2,7 +2,7 @@
 /*
  * NXP S32G/R GMAC glue layer
  *
- * Copyright 2019-2024 NXP
+ * Copyright 2019-2026 NXP
  *
  */
 
@@ -110,6 +110,37 @@ static void s32_gmac_exit(struct device *dev, void *priv)
 	clk_disable_unprepare(gmac->rx_clk);
 }
 
+static void s32_gmac_validate_multi_irq(struct device *dev,
+					struct plat_stmmacenet_data *plat,
+					struct stmmac_resources *res)
+{
+	int i;
+
+	/* RX IRQs */
+	STMMAC_FOREACH_MTL_QUEUE(i, plat->rx_queues_to_use) {
+		if (res->rx_irq[i] <= 0) {
+			dev_dbg(dev, "Missing RX queue %d interrupt\n", i);
+			goto no_multi_irq;
+		}
+	}
+
+	/* TX IRQs */
+	STMMAC_FOREACH_MTL_QUEUE(i, plat->tx_queues_to_use) {
+		if (res->tx_irq[i] <= 0) {
+			dev_dbg(dev, "Missing TX queue %d interrupt\n", i);
+			goto no_multi_irq;
+		}
+	}
+
+	plat->flags |= STMMAC_FLAG_MULTI_MSI_EN;
+	dev_info(dev, "Multi-IRQ mode (per queue IRQs) selected\n");
+	return;
+
+no_multi_irq:
+	plat->flags &= ~STMMAC_FLAG_MULTI_MSI_EN;
+	dev_info(dev, "MAC IRQ mode selected\n");
+}
+
 static int s32_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat;
@@ -165,6 +196,9 @@ static int s32_dwmac_probe(struct platform_device *pdev)
 	plat->core_type = DWMAC_CORE_GMAC4;
 	plat->pmt = 1;
 	plat->flags |= STMMAC_FLAG_SPH_DISABLE;
+
+	s32_gmac_validate_multi_irq(dev, plat, &res);
+
 	plat->rx_fifo_size = 20480;
 	plat->tx_fifo_size = 20480;
 

-- 
2.47.0



