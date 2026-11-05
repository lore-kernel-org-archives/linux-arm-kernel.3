Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27F3606EEBD
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vaEfeRLt;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=GC1vZfQv;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=IJPty0Vd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UjMb22YoQ0tLzZ04yXcHLaoHfX3SrH8zs5UQo00NOrQ=; b=vaEfeRLtt+Go8X
	Zpws+8nfna4VkAOL4O+zwfIn4IK1LXBD/exYJYmHSwtD7faU8cnEe/cCqc4VOZu8NulXf6S3f8arR
	Cu+Hi+EML+QOVPzfnla5US+Fqqy2TpwWuxxo4vSsWZQsuPf+wKK4fWhQjU4JLdtfuIyN4t5Evv6//
	UUg5ec3y4u8Q15WqS9uK6tciQ9DyrpzMtvqhhSIJyd7lcTCVXpvYaYg+L12qKt5/B/hY2x6BcsNZz
	JEFiJ5J/GyQXrF8koSNFvJE5oCWknaPRmTM400Akd2ivSloyhP6lYrWpk/mWOpersn+pe1Aq1cyt7
	cTZPe/PoG7STQ6EacAfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP15e-00000009rBQ-3bg3;
	Thu, 05 Nov 2026 17:17:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP14u-00000009qkP-2gjj
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Nov 2026 17:16:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=UjMb22YoQ0tLzZ04yXcHLaoHfX3SrH8zs5UQo00NOrQ=; b=GC1vZfQvBdKMnsHYWqahFhR6ke
	28uV68nACorLwuopB1Bhvs5g8gjfbIwCCF5p1lJNHW3LtsPrD9BFFO7S8aSHtxYK+pqaHyc9u+Rk0
	f7ubZFqunXdzmvH9npo6aR6esD/cbBbftsk+hpuNsUzr+Efa8uQ97/RI6UaGtTSD/GnVDb09yzJxS
	1QFnrByJf/Dx9D4LJMIn+CWNIlwapxLmXjsE9YicN41yjdsiGlBqujIw8RFGc70ENvtH+lOr59HOb
	AMfUNrXAchH7YJNeUnffSjEWuKEKMseMLExwNi++Zo0B7oCdeIViXlqk5TvcCeA+EQZoGKou2uvul
	jPAHa+Ow==;
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP14r-00000003KTT-1iQB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:16:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793899002; x=1825435002;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=HVHfXTQiDPZZw3tnNbaGhNodlorPF1IZ5YA83GihI/M=;
  b=IJPty0VdSsgMjcx3ntDQAQmZyzyq5lovdXdwHPyNXEJUUHtETR0V4ZUr
   WD8yP4ptptWuKGqEHGOtab5h3JWJPwxLBTP1m5CtVFROWeaxoEu7PZKjS
   FA+WSfPhHvKDWy79S+/RfqMZ5EuKnETrsw6c3mulHk3z/QOPXhL6BTEvo
   Qntfc4wc9iMtilGO/qjSyijYBYgrK4K4hB3w0l0ktjFk6tRUaLkAiR2Q3
   42QBwiV1Y7OJ5cx+/52C4eyTloW8BSc4PNoLgYSi4BiQWrjyYbZiTMPwk
   q/XEkSeIg5nT+vbSNz/qb5+T35X094WNcC/9X6zwsVkYC+fsVsMlBcmyU
   Q==;
X-CSE-ConnectionGUID: v7RjAzLzRZyclLiaKGMzhA==
X-CSE-MsgGUID: iEiEMNkiSkSbYnxrd251cw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 19:16:40 +0200
X-CSE-ConnectionGUID: oxqlKXw/Q1mllKPZQYc7ng==
X-CSE-MsgGUID: D83syo3ST6W5x+pdhQ871Q==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.2])
  by ces01_data.me-corp.lan with SMTP; 05 Nov 2026 19:24:42 +0200
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Thu, 05 Nov 2026 19:16:38 +0200
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Thu, 05 Nov 2026 19:15:33 +0200
Subject: [PATCH RFC v3 12/14] i2c: nomadik: add support for I2C_XFER_V2 -
 detailed fault reporting
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-i2c-fault-reporting-v3-12-515ad74ac4c9@mobileye.com>
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
X-CRM114-CacheID: sfid-20261105_171641_335609_966E341E 
X-CRM114-Status: GOOD (  26.64  )
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
or received until the fault condition occurred.

This commit introduces support of this feature in i2c-nomadik driver.

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 37 +++++++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index f68d4cf7c0e7..9f43ab792ae2 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -198,6 +198,7 @@ struct i2c_nmk_client {
  * @stop: stop condition.
  * @xfer_wq: xfer done wait queue.
  * @result: controller propogated result.
+ * @bytes_cplt: number of bytes completed in the message that caused a fault.
  */
 struct nmk_i2c_dev {
 	struct i2c_vendor_data		*vendor;
@@ -218,6 +219,7 @@ struct nmk_i2c_dev {
 	int				stop;
 	struct wait_queue_head		xfer_wq;
 	int				result;
+	int				bytes_cplt;
 };
 
 /* controller's abort causes */
@@ -530,6 +532,8 @@ static int read_i2c(struct nmk_i2c_dev *priv, u16 flags)
 	int status = 0;
 	bool xfer_done;
 
+	priv->cli.xfer_bytes = 0;
+
 	mcr = load_i2c_mcr_reg(priv, flags);
 	writel(mcr, priv->virtbase + I2C_MCR);
 
@@ -655,6 +659,7 @@ static int nmk_i2c_xfer_one(struct nmk_i2c_dev *priv, u16 flags)
 	int status;
 
 	priv->i2c_sr = 0;
+	priv->bytes_cplt = 0;
 	if (flags & I2C_M_RD) {
 		/* read operation */
 		priv->cli.operation = I2C_READ;
@@ -690,6 +695,16 @@ static int nmk_i2c_xfer_one(struct nmk_i2c_dev *priv, u16 flags)
 			status = priv->result;
 		}
 
+		if (flags & I2C_M_RD) {
+			/* For READ messages, return the number of bytes read from FIFO */
+			priv->bytes_cplt = priv->cli.xfer_bytes;
+		} else {
+			/* For WRITE messages, return the number of bytes sent on bus */
+			priv->bytes_cplt = FIELD_GET(I2C_SR_LENGTH, priv->i2c_sr);
+			/* LENGTH value includes the last byte that has not been sent or ACKed */
+			if (priv->bytes_cplt > 0)
+				priv->bytes_cplt--;
+		}
 		init_hw(priv);
 
 		status = status ? status : priv->result;
@@ -699,10 +714,11 @@ static int nmk_i2c_xfer_one(struct nmk_i2c_dev *priv, u16 flags)
 }
 
 /**
- * nmk_i2c_xfer() - I2C transfer function used by kernel framework
+ * nmk_i2c_xfer_v2() - I2C transfer function used by kernel framework
  * @i2c_adap: Adapter pointer to the controller
  * @msgs: Pointer to data to be written.
  * @num_msgs: Number of messages to be executed
+ * @report: Pointer to transfer report to be written.
  *
  * This is the function called by the generic kernel i2c_transfer()
  * or i2c_smbus...() API calls. Note that this code is protected by the
@@ -745,8 +761,9 @@ static int nmk_i2c_xfer_one(struct nmk_i2c_dev *priv, u16 flags)
  * please use the i2c_smbus_read_i2c_block_data()
  * or i2c_smbus_write_i2c_block_data() API
  */
-static int nmk_i2c_xfer(struct i2c_adapter *i2c_adap,
-		struct i2c_msg msgs[], int num_msgs)
+static int nmk_i2c_xfer_v2(struct i2c_adapter *i2c_adap,
+		struct i2c_msg msgs[], int num_msgs,
+		struct i2c_transfer_report *report)
 {
 	int status = 0;
 	int i;
@@ -756,6 +773,8 @@ static int nmk_i2c_xfer(struct i2c_adapter *i2c_adap,
 	if (i)
 		return i;
 
+	priv->bytes_cplt = 0;
+
 	/* setup the i2c controller */
 	setup_i2c_controller(priv);
 
@@ -774,10 +793,15 @@ static int nmk_i2c_xfer(struct i2c_adapter *i2c_adap,
 	pm_runtime_put_sync(&priv->adev->dev);
 
 	/* return the no. messages processed */
-	if (status)
+	if (status) {
+		report->msgs_cplt = i;
+		report->bytes_cplt = priv->bytes_cplt;
+		report->fault_msg_idx = i;
 		return status;
-	else
+	} else {
+		i2c_transfer_report_success(report, num_msgs);
 		return num_msgs;
+	}
 }
 
 /**
@@ -1029,7 +1053,8 @@ static unsigned int nmk_i2c_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm nmk_i2c_algo = {
-	.xfer = nmk_i2c_xfer,
+	.xfer = i2c_xfer_to_xfer_v2,
+	.xfer_v2 = nmk_i2c_xfer_v2,
 	.functionality = nmk_i2c_functionality
 };
 

-- 
2.43.0


