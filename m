Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCF5606A337
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QextgP0C;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=WZjpSqXh;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=GDY9Vyv3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3ejUO5dgCxvIR9M4L8cvZr21qR/Y4UMx3BP79hFiBBI=; b=QextgP0CuYbAfd
	XwIChzHE8mmNjmnaAS4x1mQW6oPWLWqjN/zHY4RJx1MrxETdyj9MYqoK3eVZegcbXIhNWnGuLuu1r
	E95VHio9hi0T+XxlFnuvDmA3LyLepfDKvje2FiByW2+lhq2JjBGR0MpnSeT6AmBDwnT376vYcvCYY
	eTz+8HpMC+B25hZ8V8lLT5XrkJadtysNpekHJOa3IMZLXEgiOxrsGv4hMHmsVZVEbLXbiroq6uSxh
	Vbab5PvJYVVC6nU8nVqyvSXoaNjKlJDs+AUiNh0ik5EAzDBTsxQRx2fGfGxYQtpIyPzHt6VKEY/+W
	FLq7RJJJVqXhnvbFwKfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP15k-00000009rHe-2daS;
	Thu, 05 Nov 2026 17:17:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP14y-00000009qmc-07Mh
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Nov 2026 17:16:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3ejUO5dgCxvIR9M4L8cvZr21qR/Y4UMx3BP79hFiBBI=; b=WZjpSqXhw7ux3NqhzYTX1NS1I6
	088CYNzfy0HLWhn2YBR8YVbklbCTGmNGWqZKLVqkzmO9lIVLZasyP/D0OipdMWjDKB9S+KkcSGIEv
	CxmUqWVsWCXDZe+2SUuefkucJlUPnme1Zxm58Oie5HAzaWNR7MQuqYmjqM1Vd9vpPibyano5+h3/X
	oAd3ZXy+Dd3jvLEwm1aFqGU2/8QdT64AeGODDe1NNEa+6p8CRl357O0sA2/2M3NieX8XjzzUklgXA
	nWS2ku4tOb//4LSdgvOUrI5YZB4WluIRk5kbLVVtncfUyQhpfqSyIHuuEd3gdFiNgVbcUEqv7+9NJ
	QjhVFO9w==;
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP14v-00000003KVm-2DAb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793899012; x=1825435012;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=LzSOF9qOvK0rxMa1yZEO1cw4rlT2REtrhPeWhFHiadI=;
  b=GDY9Vyv3QFVzgpGYstrFKVNPRJB3BDLViTvoVc11Z3VxywcT1vdfeRmL
   y/vS8ziQTybjTXMxBnGWRN9dAtPXTUlxHpp6g5aDj7lsM+/PdG34wySSk
   /o67SmJV2pSAYU23aIyT8OAxNbOQs6M/miLGlxhpmQfTWHWwcBkKwiVi+
   V1SvKuV23sGQdFMWbhKfLSkC7IChiPSEzGe/mnMJA7B1thm6aUtg3+UHo
   zlBw2IXVA8jr+qi5G8P88TPGAuTYQ1gzsPtttsl/TVi4ohqXS8DDht9EG
   NdGtjCQH5LN1Q3qt1fex9wr5Q/2fgx7fYMdsVTEzC//WQM0sADFArIyEJ
   Q==;
X-CSE-ConnectionGUID: P43ouyMXTvSebO0Gi6+USw==
X-CSE-MsgGUID: ptByoI6GQ16+RmzswWUetw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 19:16:48 +0200
X-CSE-ConnectionGUID: QAFhFBd2RJW+19s/oMTWzQ==
X-CSE-MsgGUID: PtCd1kh2Q6CuwnPUYDGYMA==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.3])
  by ces04_data.me-crop.lan with SMTP; 05 Nov 2026 19:24:38 +0200
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Thu, 05 Nov 2026 19:16:40 +0200
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Thu, 05 Nov 2026 19:15:35 +0200
Subject: [PATCH RFC v3 14/14] i2c: designware: add support for I2C_XFER_V2
 - detailed fault reporting
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-i2c-fault-reporting-v3-14-515ad74ac4c9@mobileye.com>
References: <20261105-i2c-fault-reporting-v3-0-515ad74ac4c9@mobileye.com>
In-Reply-To: <20261105-i2c-fault-reporting-v3-0-515ad74ac4c9@mobileye.com>
To: Andi Shyti <andi.shyti@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Dmitry Guzman <Dmitry.Guzman@mobileye.com>, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_171645_492683_29224666 
X-CRM114-Status: GOOD (  40.60  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I2C_XFER_V2 is a new API that allows I2C clients to get the detailed
report in case of transmission failure. Previously, the only information
returned by I2C bus controller was the error code; there was no way to
find out how many messages or bytes in a certain message have been sent
or received until the fault condition occurred, or to receive the data
read before the fault.

This patch introduces support for this feature in i2c-designware driver.
For AMD_NAVI_GPU model that has its own `xfer` callback function, this
feature is currently not implemented.

The driver uses FLUSH_CNT field of ABORT_SOURCE register to detect
how many command/data bytes written to FIFO were not actually sent.

Also, if the detailed fault report is required, the driver checks
status after each read/write from/to FIFO. If ABORT flag is set, the
driver cannot detect what happened first - FIFO read/write or
communication abort, so it assumes that abort happened first, otherwise
it either falsely reports one extra byte sent or returns the byte read
from FIFO flushed after abort as a valid read byte. So, in unfortunate
conditions, the fault report may be too pessimistic by one byte.

This check increases amount of time spent in interrupt handler, so if
client doesn't need detailed fault report, this check should be avoided.
Because of this, both `xfer` and `xfer_v2` callbacks are implemented in
struct i2c_algorithm: the former does not generate detailed fault
report, while the latter does.

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 drivers/i2c/busses/i2c-designware-common.c |   1 +
 drivers/i2c/busses/i2c-designware-core.h   |  12 +++
 drivers/i2c/busses/i2c-designware-master.c | 139 +++++++++++++++++++++++++++--
 3 files changed, 147 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 4274bf809b3f..42fc5989c917 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -879,6 +879,7 @@ static irqreturn_t i2c_dw_isr(int this_irq, void *dev_id)
 
 static const struct i2c_algorithm i2c_dw_algo = {
 	.xfer = i2c_dw_xfer,
+	.xfer_v2 = i2c_dw_xfer_v2,
 	.functionality = i2c_dw_func,
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	.reg_slave = i2c_dw_reg_slave,
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 9f3492717e18..67684df05ba5 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -117,6 +117,8 @@
 						 DW_IC_TX_ABRT_10ADDR2_NOACK | \
 						 DW_IC_TX_ABRT_GCALL_NOACK)
 
+#define DW_IC_TX_ABRT_SOURCE_FLUSH_CNT_MASK	GENMASK(31, 23)
+
 struct clk;
 struct device;
 struct reset_control;
@@ -170,6 +172,7 @@ struct reset_control;
  * @release_lock: function to release a hardware lock on the bus
  * @semaphore_idx: Index of table with semaphore type attached to the bus. It's
  *	-1 if there is no semaphore.
+ * @tx_flushed: Number of bytes flushed from TX FIFO
  * @shared_with_punit: true if this bus is shared with the SoC's PUNIT
  * @set_sda_hold_time: callback to retrieve IP specific SDA hold timing
  * @mode: operation mode - DW_IC_MASTER or DW_IC_SLAVE
@@ -180,6 +183,9 @@ struct reset_control;
  *	to generate the high period and low period of SCL line.
  * @emptyfifo_hold_master: true if the controller acting as master holds
  *	the clock when the Tx FIFO is empty instead of emitting a stop.
+ * @need_precise_report: true if client needs precise fault report
+ * @bytes_written: number of bytes written to FIFO. Used only for precise
+	fault report.
  *
  * HCNT and LCNT parameters can be used if the platform knows more accurate
  * values than the one computed based only on the input clock frequency.
@@ -232,6 +238,7 @@ struct dw_i2c_dev {
 	int			(*acquire_lock)(void);
 	void			(*release_lock)(void);
 	int			semaphore_idx;
+	unsigned int		tx_flushed;
 	bool			shared_with_punit;
 	int			(*set_sda_hold_time)(struct dw_i2c_dev *dev);
 	int			mode;
@@ -239,6 +246,8 @@ struct dw_i2c_dev {
 	u32			bus_capacitance_pF;
 	bool			clk_freq_optimized;
 	bool			emptyfifo_hold_master;
+	bool			need_precise_report;
+	u32			bytes_written;
 };
 
 #define ACCESS_INTR_MASK			BIT(0)
@@ -318,6 +327,9 @@ extern int i2c_dw_probe_master(struct dw_i2c_dev *dev);
 int i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num);
 int amd_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msgs, int num_msgs);
 
+int i2c_dw_xfer_v2(struct i2c_adapter *adap, struct i2c_msg *msgs, int num,
+		   struct i2c_transfer_report *report);
+
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 extern void i2c_dw_configure_slave(struct dw_i2c_dev *dev);
 irqreturn_t i2c_dw_isr_slave(struct dw_i2c_dev *dev);
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 7670f909f88c..e0591d93cb57 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -11,6 +11,7 @@
 
 #define DEFAULT_SYMBOL_NAMESPACE	"I2C_DW"
 
+#include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/errno.h>
@@ -33,6 +34,14 @@
 #define AMD_TIMEOUT_MAX_US	250
 #define AMD_MASTERCFG_MASK	GENMASK(15, 0)
 
+static bool i2c_dw_check_abort_flag(struct dw_i2c_dev *dev)
+{
+	u32 stat;
+
+	regmap_read(dev->map, DW_IC_RAW_INTR_STAT, &stat);
+	return (!!(stat & DW_IC_INTR_TX_ABRT));
+}
+
 static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 {
 	unsigned int comp_param1;
@@ -198,6 +207,8 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
 
 	i2c_dw_set_mode(dev, DW_IC_MASTER);
 
+	dev->rx_buf_len = 0;
+
 	/* If the slave address is ten bit address, enable 10BITADDR */
 	if (msgs[dev->msg_write_idx].flags & I2C_M_TEN) {
 		ic_con = DW_IC_CON_10BITADDR_MASTER;
@@ -459,6 +470,21 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
 					     cmd | *buf++);
 			}
 			tx_limit--; buf_len--;
+
+			/* If precise fault reporting is required, check if the transfer
+			 * is aborted after writing each byte.
+			 * Otherwise, if it is aborted during filling FIFO, there is no way
+			 * to know how many bytes was written to FIFO after transfer abort
+			 * and thus are not counted in FLUSH_CNT.
+			 * If we are checking abort flag after each byte, we can lose only 1 byte.
+			 */
+			if (dev->need_precise_report) {
+				if (i2c_dw_check_abort_flag(dev)) {
+					dev_warn_ratelimited(dev->dev, "Transfer aborted during FIFO writing. Report may be imprecise.");
+					break;
+				}
+				dev->bytes_written++;
+			}
 		}
 
 		dev->tx_buf = buf;
@@ -563,6 +589,13 @@ i2c_dw_read(struct dw_i2c_dev *dev)
 
 		for (; len > 0 && rx_valid > 0; len--, rx_valid--) {
 			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
+			if (dev->need_precise_report) {
+				if (i2c_dw_check_abort_flag(dev)) {
+					dev_warn_ratelimited(dev->dev, "Transfer aborted during FIFO reading. Data byte may be lost");
+					/* It is unknown if the read byte is valid. Drop it. */
+					break;
+				}
+			}
 			tmp &= DW_IC_DATA_CMD_DAT;
 			/* Ensure length byte is a valid value */
 			if (flags & I2C_M_RECV_LEN) {
@@ -589,8 +622,10 @@ i2c_dw_read(struct dw_i2c_dev *dev)
 			dev->rx_buf_len = len;
 			dev->rx_buf = buf;
 			return;
-		} else
+		} else {
 			dev->status &= ~STATUS_READ_IN_PROGRESS;
+			dev->rx_buf_len = 0;
+		}
 	}
 }
 
@@ -786,6 +821,8 @@ __i2c_dw_xfer_one_part(struct dw_i2c_dev *dev, struct i2c_msg *msgs, size_t num)
 	dev->status = 0;
 	dev->abort_source = 0;
 	dev->rx_outstanding = 0;
+	dev->bytes_written = 0;
+	dev->tx_flushed = 0;
 
 	ret = i2c_dw_wait_bus_not_busy(dev);
 	if (ret < 0)
@@ -797,6 +834,9 @@ __i2c_dw_xfer_one_part(struct dw_i2c_dev *dev, struct i2c_msg *msgs, size_t num)
 	/* Wait for tx to complete */
 	ret = i2c_dw_wait_transfer(dev);
 	if (ret) {
+		if (dev->need_precise_report)
+			regmap_read(dev->map, DW_IC_TXFLR, &dev->tx_flushed);
+
 		dev_err(dev->dev, "controller timed out\n");
 		/* i2c_dw_init() implicitly disables the adapter */
 		i2c_recover_bus(&dev->adapter);
@@ -888,13 +928,72 @@ i2c_dw_msg_is_valid(struct dw_i2c_dev *dev, const struct i2c_msg *msgs, size_t i
 	return true;
 }
 
+static int i2c_dw_fault_report(struct dw_i2c_dev *dev, struct i2c_transfer_report *report)
+{
+	unsigned int idx;
+
+	/*
+	 * Get the number of bytes that were put into TX FIFO but were not sent on wire.
+	 * If abort IRQ was received, this number is stored in abort_source register.
+	 * Otherwise, if ic_dw_wait_transfer() returned timeout, use TXFLR register value
+	 * read before the controller was reset.
+	 */
+	if (dev->abort_source)
+		dev->tx_flushed = FIELD_GET(DW_IC_TX_ABRT_SOURCE_FLUSH_CNT_MASK, dev->abort_source);
+
+	if (dev->tx_flushed <= dev->bytes_written)
+		dev->bytes_written -= dev->tx_flushed;
+	else
+		dev->bytes_written = 0;
+
+	/*
+	 * The last byte that the transmission was interrupted on is not counted as flushed.
+	 * We should not report it as transferred successfully, so decrement the counter.
+	 */
+	if (dev->bytes_written)
+		dev->bytes_written--;
+
+	for (idx = 0; idx < dev->msg_write_idx; idx++) {
+		if (dev->msgs[idx].len <= dev->bytes_written)
+			dev->bytes_written -= dev->msgs[idx].len;
+		else
+			break;
+	}
+
+	report->fault_msg_idx = idx;
+	for (int i = dev->msg_read_idx; i <= idx && i < dev->msgs_num; i++) {
+		if (dev->msgs[i].flags & I2C_M_RD) {
+			report->msgs_cplt = i;
+			if (!(dev->rx_buf_len))
+				report->bytes_cplt = 0;
+			else
+				report->bytes_cplt = dev->rx_buf - dev->msgs[i].buf;
+			if ((i < idx) || (report->bytes_cplt < dev->bytes_written))
+				dev_warn_ratelimited(dev->dev, "Read data lost due to FIFO flush");
+			break;
+		}
+	}
+
+	if (report->msgs_cplt < 0) {
+		report->msgs_cplt = idx;
+		report->bytes_cplt = dev->bytes_written;
+	}
+
+	return idx;
+}
+
 static int
-i2c_dw_xfer_common(struct dw_i2c_dev *dev, struct i2c_msg msgs[], int num)
+i2c_dw_xfer_common_v2(struct dw_i2c_dev *dev, struct i2c_msg *msgs, int num,
+		      struct i2c_transfer_report *report)
 {
+	int msgs_in_prev_parts = 0;
 	struct i2c_msg *msgs_part;
-	size_t cnt;
+	size_t cnt = 0;
 	int ret;
 
+	dev->need_precise_report = !!report;
+	dev->msg_read_idx = 0;
+
 	dev_dbg(dev->dev, "msgs: %d\n", num);
 
 	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dev->dev, pm);
@@ -910,6 +1009,8 @@ i2c_dw_xfer_common(struct dw_i2c_dev *dev, struct i2c_msg msgs[], int num)
 	 * we do one transaction for each part up to the STOP.
 	 */
 	for (msgs_part = msgs; msgs_part < msgs + num; msgs_part += cnt) {
+		/* Count previously transferred messages */
+		msgs_in_prev_parts += cnt;
 		/*
 		 * Count the messages in a transaction, up to a STOP or
 		 * the end of the msgs. The last if below guarantees that
@@ -918,6 +1019,16 @@ i2c_dw_xfer_common(struct dw_i2c_dev *dev, struct i2c_msg msgs[], int num)
 		 */
 		for (cnt = 1; ; cnt++) {
 			if (!i2c_dw_msg_is_valid(dev, msgs_part, cnt - 1)) {
+				if (report) {
+					i2c_transfer_report_bad_msg(report,
+								    msgs_in_prev_parts + cnt - 1);
+					report->msgs_cplt = msgs_in_prev_parts;
+					/*
+					 * Reset report pointer to avoid
+					 * calling i2c_dw_fault_report() later.
+					 */
+					report = NULL;
+				}
 				ret = -EOPNOTSUPP;
 				break;
 			}
@@ -939,16 +1050,34 @@ i2c_dw_xfer_common(struct dw_i2c_dev *dev, struct i2c_msg msgs[], int num)
 
 	i2c_dw_release_lock(dev);
 
-	if (ret < 0)
+	if (ret < 0) {
+		if (report) {
+			i2c_dw_fault_report(dev, report);
+			report->msgs_cplt += msgs_in_prev_parts;
+			report->fault_msg_idx += msgs_in_prev_parts;
+		}
 		return ret;
+	}
+
+	if (report)
+		i2c_transfer_report_success(report, num);
+
 	return num;
 }
 
+int i2c_dw_xfer_v2(struct i2c_adapter *adap, struct i2c_msg *msgs, int num,
+		   struct i2c_transfer_report *report)
+{
+	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
+
+	return i2c_dw_xfer_common_v2(dev, msgs, num, report);
+}
+
 int i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 {
 	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
 
-	return i2c_dw_xfer_common(dev, msgs, num);
+	return i2c_dw_xfer_common_v2(dev, msgs, num, NULL);
 }
 
 void i2c_dw_configure_master(struct dw_i2c_dev *dev)

-- 
2.43.0


