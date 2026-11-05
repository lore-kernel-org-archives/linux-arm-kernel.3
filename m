Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8B1606D814
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PYchZO6T;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=RvKcCq3L;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=FF+ZqY1x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cdQNTg4bdoFV18ObiKumRIAb3JVyubSMmS9cG9ueoUY=; b=PYchZO6TA/S87n
	G+Ul/qaxljCaSBAO3DaZhWLRODNno5sRM8PyYNjinyBmxeTtraqkGuAOGDQXrKWJq50YBT17wgJLe
	Sw2QTfcwmQMCk8wpSsoBkXgFGJFzR8RuwD4DpavUdR9HFWXz/gi/Vz6i8Cba9WHEwBjMHr1/1vTdE
	nUkd0JiKTJMhxXVJDgFhvPLskr5TjCgI01XS9cGNi18UmUJ6NMveCe3kYURo/Yt6nrhKFxGoLLcTq
	ex9k4fVjuuKcfEjI6OhZBA1yUzFcJZNc/YNN6/r042xSwvjVIt/X4CU4Eb20XaaYvrZtLX4CH2bOc
	ycWCr94l4Th+2NjxP/Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP15f-00000009rC0-10fP;
	Thu, 05 Nov 2026 17:17:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP14w-00000009qlh-0vCm
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Nov 2026 17:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=cdQNTg4bdoFV18ObiKumRIAb3JVyubSMmS9cG9ueoUY=; b=RvKcCq3LhADHN/ZdY67kit6bco
	QtVG2y1EXY1qzz8eGB2xX786HGtOZlhVAtyOCv7uP/FKC3AOMCexm+hcQfYLTByV3FLQhamr45fAF
	bs2uouB9ArkCijPA9D8h3I0U3bzDIqy/frq7KW94377hc9FDSpZT922ye802TJypby3HryzmyypFN
	XFQNnRRytcRbmeUGh6oO79Ba9CI7jYlyJFlJTTe0uJ5iIPID9hWrxaVCwr0R+6pV6Mksne5s5vWOs
	i7zX/njpU632DMgYnyjVsZuQj/bIFeAbWmavCyFxzqvjpMcVsA09SEf+Te1cvWizFrLZnKsZWSzhF
	dSE0XJXA==;
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP14s-00000003KVm-15So
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:16:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793899009; x=1825435009;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=IUsmgBK0bIxzEAsyUzlxlzNIalo2oo4LQdwchNFudOE=;
  b=FF+ZqY1xrkrs1U0dfblIrjN0lmIV5XMDyodpNgsdq/iHGJphrhRTUgQP
   ksvhrvQ9wk6iGcEnIlKioXGttEn6z5LasNoQbHnpa2nqfCsEzGOETDyaK
   n40H8rJjblIPh6ls3lZiPGLxT9TdaA+Ab8AXV6ACCUWfW1W+arQJl25zh
   l9n7aSgOx6fvFjK/Rr39yvK+jnrJJaFw9UfYibOefeMuhceOGqWo/eTbs
   zdtGx+WnAh7x2HfXVkGnG9znvqqhnZMOOUlwIQt0qE3HjfEimiAdGFmZp
   Cazb3RmsNL8fOTsH6HtbwWqOxJeF8ubRjA9az4omXOiEK8IVWIMDSJ8+r
   Q==;
X-CSE-ConnectionGUID: P43ouyMXTvSebO0Gi6+USw==
X-CSE-MsgGUID: hxZHmuKdSbqaXgROJykcqw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 19:16:48 +0200
X-CSE-ConnectionGUID: ERBuxDu0TIipd/Tm5OO/Gw==
X-CSE-MsgGUID: FVbeRIkUQzOnFSgyIawHcg==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.2])
  by ces04_data.me-crop.lan with SMTP; 05 Nov 2026 19:24:37 +0200
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Thu, 05 Nov 2026 19:16:39 +0200
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Thu, 05 Nov 2026 19:15:34 +0200
Subject: [PATCH RFC v3 13/14] i2c: designware: use separate `i2c_algorithm`
 for AMD_NAVI_GPU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-i2c-fault-reporting-v3-13-515ad74ac4c9@mobileye.com>
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
X-CRM114-CacheID: sfid-20261105_171643_557308_19E516D6 
X-CRM114-Status: GOOD (  15.67  )
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

AMD_NAVI_GPU variant of designware I2C controller uses its own
implementation of `xfer` method. Instead of checking flags in runtime,
create a separate `i2c_algorithm` structure and put pointer to
`amd_i2c_dw_xfer_quirk` directly into it.

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 14 +++++++++++++-
 drivers/i2c/busses/i2c-designware-core.h   |  1 +
 drivers/i2c/busses/i2c-designware-master.c |  6 ++----
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index e934bcbe7660..4274bf809b3f 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -886,6 +886,15 @@ static const struct i2c_algorithm i2c_dw_algo = {
 #endif
 };
 
+static const struct i2c_algorithm i2c_dw_amd_navi_gpu_algo = {
+	.xfer = amd_i2c_dw_xfer_quirk,
+	.functionality = i2c_dw_func,
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	.reg_slave = i2c_dw_reg_slave,
+	.unreg_slave = i2c_dw_unreg_slave,
+#endif
+};
+
 static const struct i2c_adapter_quirks i2c_dw_quirks = {
 	.flags = I2C_AQ_NO_ZERO_LEN,
 };
@@ -922,7 +931,10 @@ int i2c_dw_probe(struct dw_i2c_dev *dev)
 		strscpy(adap->name, "Synopsys DesignWare I2C adapter");
 
 	adap->retries = 3;
-	adap->algo = &i2c_dw_algo;
+	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU)
+		adap->algo = &i2c_dw_amd_navi_gpu_algo;
+	else
+		adap->algo = &i2c_dw_algo;
 	adap->quirks = &i2c_dw_quirks;
 	adap->dev.parent = dev->dev;
 	i2c_set_adapdata(adap, dev);
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 025311c8662c..9f3492717e18 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -316,6 +316,7 @@ extern void i2c_dw_configure_master(struct dw_i2c_dev *dev);
 extern int i2c_dw_probe_master(struct dw_i2c_dev *dev);
 
 int i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num);
+int amd_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msgs, int num_msgs);
 
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 extern void i2c_dw_configure_slave(struct dw_i2c_dev *dev);
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 412ab0cd2a32..7670f909f88c 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -291,8 +291,9 @@ static int i2c_dw_status(struct dw_i2c_dev *dev)
  * Initiate and continue master read/write transaction with polling
  * based transfer routine afterward write messages into the Tx buffer.
  */
-static int amd_i2c_dw_xfer_quirk(struct dw_i2c_dev *dev, struct i2c_msg *msgs, int num_msgs)
+int amd_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msgs, int num_msgs)
 {
+	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
 	int msg_wrt_idx, msg_itr_lmt, buf_len, data_idx;
 	int cmd = 0, status;
 	u8 *tx_buf;
@@ -947,9 +948,6 @@ int i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 {
 	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
 
-	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU)
-		return amd_i2c_dw_xfer_quirk(dev, msgs, num);
-
 	return i2c_dw_xfer_common(dev, msgs, num);
 }
 

-- 
2.43.0


