Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3F2FD0045
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hlmpAPsHHu7+Sm/mZ1X3OzoXMfSu/CbcNAYQryJE7xs=; b=kLqiGuX6y/dQe1FOxJdnT5pnSG
	YxNW8pJU7RytIm9JyBPiDYhRtYpsqKhb6z4FmG9iGBMMgEz5/TrwZUzQOjjYWx+ubqffl4b3j6Y3G
	XxAwXgIIblN21/S34g0e0caKoQsJ2FxopIC/emAU9xqTnM0KSAHXiMuRn18p45iNb9zonAwBwJFpI
	kzuyFdidvrrFnj0VJ/sBlTaJeFA/ya1h60dVvcO8HvOMqbry4yEZ5rmeAhr2K/uzXZ5PzKSTrmWnx
	P7EVm28g/OCz32q9wpaInGmFqYlky1wsdJVn/AFbGSgXFNbQ4v/wna2hUWdUvlANrN5HuHkZJubwC
	Zk4+shjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVME-0000000ARTO-2kPe;
	Sun, 01 Mar 2026 01:12:31 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVMD-0000000ARTB-0lo1;
	Sun, 01 Mar 2026 01:12:29 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Sandeep Nair <sandeep_n@ti.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] soc: ti: knav_dma: fix all kernel-doc warnings in knav_dma.h
Date: Sat, 28 Feb 2026 17:12:28 -0800
Message-ID: <20260301011228.3064940-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Use correct struct member names and formats to avoid kernel-doc
warnings:

Warning: include/linux/soc/ti/knav_dma.h:83 struct member 'priority' not
 described in 'knav_dma_tx_cfg'
Warning: include/linux/soc/ti/knav_dma.h:113 struct member 'err_mode' not
 described in 'knav_dma_rx_cfg'
Warning: include/linux/soc/ti/knav_dma.h:113 struct member 'desc_type' not
 described in 'knav_dma_rx_cfg'
Warning: include/linux/soc/ti/knav_dma.h:113 struct member 'fdq' not
 described in 'knav_dma_rx_cfg'
Warning: include/linux/soc/ti/knav_dma.h:127 struct member 'direction' not
 described in 'knav_dma_cfg'
Warning: include/linux/soc/ti/knav_dma.h:127 struct member 'u' not
 described in 'knav_dma_cfg'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Nishanth Menon <nm@ti.com>
Cc: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Sandeep Nair <sandeep_n@ti.com>
Cc: linux-arm-kernel@lists.infradead.org

 include/linux/soc/ti/knav_dma.h |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

--- linux-next-20260227.orig/include/linux/soc/ti/knav_dma.h
+++ linux-next-20260227/include/linux/soc/ti/knav_dma.h
@@ -75,7 +75,7 @@ enum knav_dma_desc_type {
  * struct knav_dma_tx_cfg:	Tx channel configuration
  * @filt_einfo:			Filter extended packet info
  * @filt_pswords:		Filter PS words present
- * @knav_dma_tx_priority:	Tx channel scheduling priority
+ * @priority:			Tx channel scheduling priority
  */
 struct knav_dma_tx_cfg {
 	bool				filt_einfo;
@@ -87,13 +87,13 @@ struct knav_dma_tx_cfg {
  * struct knav_dma_rx_cfg:	Rx flow configuration
  * @einfo_present:		Extended packet info present
  * @psinfo_present:		PS words present
- * @knav_dma_rx_err_mode:	Error during buffer starvation
- * @knav_dma_desc_type:	Host or Monolithic desc
+ * @err_mode:			Error during buffer starvation
+ * @desc_type:			Host or Monolithic desc
  * @psinfo_at_sop:		PS word located at start of packet
  * @sop_offset:			Start of packet offset
  * @dst_q:			Destination queue for a given flow
  * @thresh:			Rx flow size threshold
- * @fdq[]:			Free desc Queue array
+ * @fdq:			Free desc Queue array
  * @sz_thresh0:			RX packet size threshold 0
  * @sz_thresh1:			RX packet size threshold 1
  * @sz_thresh2:			RX packet size threshold 2
@@ -115,7 +115,8 @@ struct knav_dma_rx_cfg {
 
 /**
  * struct knav_dma_cfg:	Pktdma channel configuration
- * @sl_cfg:			Slave configuration
+ * @direction:			DMA transfer mode and direction
+ * @u:				union containing @tx or @rx
  * @tx:				Tx channel configuration
  * @rx:				Rx flow configuration
  */

