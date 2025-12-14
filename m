Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C3ED5B16C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 19:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8Qe15nyDaQI5NHkqinXh2nmZ7n1Fr8qfZ26+gvZFymo=; b=M1sURmnNIWrIIMgzcUWTeybpO6
	h9+pokv1VYrS5bfOaOP9GAw0vsoFKLhkhAF3kCUp8+SpQehamesiMQw46bBYAW4OdArhm7DtOiqdI
	+RvBHrmgQqw2Nj66GO86RU6XTYaJKJ/HDjaN3JN5UTJsSXTIGRitW/mnLHUM6wPn/1HQ6pD+4EYQE
	WXiFqVVPEMcv6frp3diKaURHOKYseT8vRDOlPADxLM8Tv1NNgBTEx16LyJgn0ewUzzt9F5GmLTPNL
	Z3AHb58Amm9bycvYID70NUQi+wvVm9YBu9ycgQQw3OBOo/eebQUTKw2GmuLibp2J46tLos1fVYd1a
	wDEpMKPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUrbR-00000002gIh-4B7D;
	Sun, 14 Dec 2025 19:17:57 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUrbP-00000002gIS-1Xfq;
	Sun, 14 Dec 2025 19:17:55 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] xilinx_hwicap: fifo_icap.c: fix all kernel-doc warnings
Date: Sun, 14 Dec 2025 11:17:50 -0800
Message-ID: <20251214191750.2173225-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
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

Modify comments in fifo_icap.c to prevent all kernel-doc warnings:

Warning: fifo_icap.c:51 This comment starts with '/**', but isn't a
 kernel-doc comment.
 * HwIcap Device Interrupt Status/Enable Registers
Warning: fifo_icap.c:106 No description found for return value
 of 'fifo_icap_fifo_read'
Warning: fifo_icap.c:160 No description found for return value
 of 'fifo_icap_get_status'
Warning: fifo_icap.c:171 No description found for return value
 of 'fifo_icap_busy'
Warning: fifo_icap.c:184 No description found for return value
 of 'fifo_icap_write_fifo_vacancy'
Warning: fifo_icap.c:196 No description found for return value
 of 'fifo_icap_read_fifo_occupancy'
Warning: fifo_icap.c:207 bad line:
Warning: fifo_icap.c:214 No description found for return value
 of 'fifo_icap_set_configuration'
Warning: fifo_icap.c:290 function parameter 'frame_buffer' not described
 in 'fifo_icap_get_configuration'
Warning: fifo_icap.c:290 function parameter 'num_words' not described
 in 'fifo_icap_get_configuration'
Warning: fifo_icap.c:290 No description found for return value
 of 'fifo_icap_get_configuration'
Warning: fifo_icap.c:357 expecting prototype for buffer_icap_reset().
 Prototype was for fifo_icap_reset() instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Simek <michal.simek@amd.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/char/xilinx_hwicap/fifo_icap.c |   27 ++++++++++++++++-------
 1 file changed, 19 insertions(+), 8 deletions(-)

--- linux-next-20251128.orig/drivers/char/xilinx_hwicap/fifo_icap.c
+++ linux-next-20251128/drivers/char/xilinx_hwicap/fifo_icap.c
@@ -48,7 +48,7 @@
 
 #define XHI_GIER_GIE_MASK 0x80000000 /* Global Interrupt enable Mask */
 
-/**
+/*
  * HwIcap Device Interrupt Status/Enable Registers
  *
  * Interrupt Status Register (IPISR) : This register holds the
@@ -102,6 +102,8 @@ static inline void fifo_icap_fifo_write(
  * @drvdata: a pointer to the drvdata.
  *
  * This function will silently fail if the fifo is empty.
+ *
+ * Returns: 32-bit data from the Read FIFO
  **/
 static inline u32 fifo_icap_fifo_read(struct hwicap_drvdata *drvdata)
 {
@@ -156,6 +158,8 @@ static inline void fifo_icap_start_readb
  * D2 - Always 1
  * D1 - Always 1
  * D0 - Done bit
+ *
+ * Returns: the 32-bit ICAP status register
  **/
 u32 fifo_icap_get_status(struct hwicap_drvdata *drvdata)
 {
@@ -165,8 +169,11 @@ u32 fifo_icap_get_status(struct hwicap_d
 }
 
 /**
- * fifo_icap_busy - Return true if the ICAP is still processing a transaction.
+ * fifo_icap_busy - Check the ICAP busy status.
  * @drvdata: a pointer to the drvdata.
+ *
+ * Returns: %true if the ICAP is still processing a transaction,
+ *	otherwise %false
  **/
 static inline u32 fifo_icap_busy(struct hwicap_drvdata *drvdata)
 {
@@ -178,7 +185,7 @@ static inline u32 fifo_icap_busy(struct
  * fifo_icap_write_fifo_vacancy - Query the write fifo available space.
  * @drvdata: a pointer to the drvdata.
  *
- * Return the number of words that can be safely pushed into the write fifo.
+ * Returns: the number of words that can be safely pushed into the write fifo.
  **/
 static inline u32 fifo_icap_write_fifo_vacancy(
 		struct hwicap_drvdata *drvdata)
@@ -190,7 +197,7 @@ static inline u32 fifo_icap_write_fifo_v
  * fifo_icap_read_fifo_occupancy - Query the read fifo available data.
  * @drvdata: a pointer to the drvdata.
  *
- * Return the number of words that can be safely read from the read fifo.
+ * Returns: the number of words that can be safely read from the read fifo.
  **/
 static inline u32 fifo_icap_read_fifo_occupancy(
 		struct hwicap_drvdata *drvdata)
@@ -205,10 +212,12 @@ static inline u32 fifo_icap_read_fifo_oc
  *		ICAP device.
  * @num_words: the number of words (32 bit) to write to the ICAP
  *		device.
-
+ *
  * This function writes the given user data to the Write FIFO in
  * polled mode and starts the transfer of the data to
  * the ICAP device.
+ *
+ * Returns: %0 on success or %-errno on failure.
  **/
 int fifo_icap_set_configuration(struct hwicap_drvdata *drvdata,
 		u32 *frame_buffer, u32 num_words)
@@ -280,11 +289,13 @@ int fifo_icap_set_configuration(struct h
 /**
  * fifo_icap_get_configuration - Read configuration data from the device.
  * @drvdata: a pointer to the drvdata.
- * @data: Address of the data representing the partial bitstream
- * @size: the size of the partial bitstream in 32 bit words.
+ * @frame_buffer: Address of the data representing the partial bitstream
+ * @num_words: the size of the partial bitstream in 32 bit words.
  *
  * This function reads the specified number of words from the ICAP device in
  * the polled mode.
+ *
+ * Returns: %0 on success or %-errno on failure.
  */
 int fifo_icap_get_configuration(struct hwicap_drvdata *drvdata,
 		u32 *frame_buffer, u32 num_words)
@@ -347,7 +358,7 @@ int fifo_icap_get_configuration(struct h
 }
 
 /**
- * buffer_icap_reset - Reset the logic of the icap device.
+ * fifo_icap_reset - Reset the logic of the icap device.
  * @drvdata: a pointer to the drvdata.
  *
  * This function forces the software reset of the complete HWICAP device.

