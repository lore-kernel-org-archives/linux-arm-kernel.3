Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5432606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vj4Luo7/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=q3GQF1Pj;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=O4Gky68C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=G8OEW2oMhJH1UyxWk63Qgz4BWFzIqv2porLIH+T4v+Y=; b=vj4Luo7/tVXOXC
	3gbIwSRQP21bsn8fZEL3mLn5TZb88P/9LZhqm+pJbAYEUh0iVatPB616uBgkRdjzCBmGigvT9UgVV
	1grQgkHupX152ZNTrHk4xiY/t9WU43J3DNSG6sZGyb2OVej3kRiLAxBxJ6yOOMvfZ5iG8n6Kn4L97
	MHaimiWYDvePs+pngjiwDRZePO+SQe3NxuaD5bvvjcWtJ9Xlflxv57kXu5w5kcqxlFE0Yb1MP1URf
	Kh6ZopFj2R2j3jipYKE3UIBA9NOBBLWo87gY780ZhgK/yQZF9IVsz+Pf8wCHLHSdSkFYgfiSIbWS+
	iuIG65VdiUSCdbF9cNOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP15N-00000009qzV-3cvT;
	Thu, 05 Nov 2026 17:17:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP14s-00000009qkE-0PnC
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Nov 2026 17:16:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=G8OEW2oMhJH1UyxWk63Qgz4BWFzIqv2porLIH+T4v+Y=; b=q3GQF1Pj+jEmpLmvhVcfMXq7QT
	IMnpm2irZh00auAZbFqUK9BN2nD4DMHt+W5txKLIvpj83NFPAAyU1abmBeso8eMZ3zU4HfBPmobUn
	0lhVUBNKt0vxxp3tL5MGalFBzWkf7vcvwOKOZ8t2pyZZkr5F5OKLeAWPe1En1D6H3+3AEzCGFIRfC
	4SgRv+cHFZi4euZHAMteOE/twxSYgf0pVbo1QpjmDgRD2xkqtatnoXoguwA2OT3yGRkbEII8efgZZ
	91LyC96+ZaygpqJ6Zho0/izpCBOqmi9WmU8IRjR5qxfs113MXzPh4qf6sZZftsWsssSDKo8HJvsi4
	gS1pxjTQ==;
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP14o-00000003KQ2-234z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:16:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793898998; x=1825434998;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=u8JZnmjS3IQKnZG0ImyZQfEmDzkCLtrT3qM2bwJYsBQ=;
  b=O4Gky68CiXPJS4irfntCe7MB0K55qeTgrR0R19plXo4hapZEWPdiZsdd
   AOeum498dPygEmsDXF+WQzRBCNu/sX4dqWRvQcMzrPXa6Y83dZ14qKgPD
   9ZEC3tVwtzPQZ0XvEcH1qM0esJxsY9pxuGxq0OVWum1tCDZflHMgQFWRW
   Ew/prZrt+f113BrUEr84QhCzOJ61ILU1kSI/ZqCWPWDpIfT/UeqAeccSd
   hQ6z4DTsplSP7tc31m43xNROvQ/htvfPmwdr4HHlSOkzNak1ejxwG8yil
   CXApy/BX2ZZo96xnzKh/kqYWTbjrsLeL6ATkmXaHFfuvwQuqxoUtO6Nkf
   A==;
X-CSE-ConnectionGUID: r8XgZcLvSViWzkJ4LTFhqw==
X-CSE-MsgGUID: rfNHSSjjRAKLaUKuV6MEew==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 19:16:34 +0200
X-CSE-ConnectionGUID: TjAjZrnoQMiuCLkkx3d0oA==
X-CSE-MsgGUID: T6XPbA59Q6WGnPYNrnP5Iw==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.2])
  by ces02_data.me-corp.lan with SMTP; 05 Nov 2026 19:24:32 +0200
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Thu, 05 Nov 2026 19:16:33 +0200
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Thu, 05 Nov 2026 19:15:28 +0200
Subject: [PATCH RFC v3 07/14] i2c: core: implement i2c_transfer_v2() -
 transfer with detailed reporting
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-i2c-fault-reporting-v3-7-515ad74ac4c9@mobileye.com>
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
X-CRM114-CacheID: sfid-20261105_171638_493273_6D5982D2 
X-CRM114-Status: GOOD (  31.91  )
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

In __i2c_transfer() and i2c_transfer(), add one more parameter - pointer
to transfer report. In __i2c_transfer(), if the pointer is not NULL,
use algo->xfer_v2() callback instead of algo->xfer() in order to get the
detailed transfer report. If the adapter does not have xfer_v2(), return
-EOPNOTSUPP.

If the adapter has any quirks that make impossible to transfer requested
message or messages, put the index of the first such message to the
transfer report structure.

If the report is not NULL, algo->xfer_v2() returned an error and there
are any read messages, trace the read data using `trace_i2c_reply(). If
the last read message is incomplete (transfer was interrupted in the
middle of a read message), trace the read portion of data also.

Rename __i2c_transfer() to __i2c_transfer_v2() and i2c_transfer() to
i2c_transfer_v2().

For backward compatibility, add __i2c_transfer() and i2c_transfer() that
call __i2c_transfer_v2() and i2c_transfer_v2() respectively with null
report pointer.

Remove comment "REVISIT the fault reporting model here is weak".

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 drivers/i2c/i2c-core-base.c | 115 ++++++++++++++++++++++++++++++++------------
 include/linux/i2c.h         |   8 +++
 2 files changed, 93 insertions(+), 30 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 23ff02a1e532..e8449f55f045 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2288,22 +2288,37 @@ static struct i2c_msg *i2c_check_for_quirks(struct i2c_adapter *adap,
 }
 
 /**
- * __i2c_transfer - unlocked flavor of i2c_transfer
+ * __i2c_transfer_v2 - unlocked flavor of i2c_transfer_v2
  * @adap: Handle to I2C bus
  * @msgs: One or more messages to execute before STOP is issued to
  *	terminate the operation; each message begins with a START.
  * @num: Number of messages to be executed.
+ * @report: The buffer for detailed transfer report (may be NULL).
  *
  * Returns negative errno, else the number of messages executed.
+ * Writes the detailed transfer report to the structure pointed by @report.
  *
  * Adapter lock must be held when calling this function. No debug logging
  * takes place.
  */
-int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
+int __i2c_transfer_v2(struct i2c_adapter *adap, struct i2c_msg *msgs, int num,
+		      struct i2c_transfer_report *report)
 {
 	unsigned long orig_jiffies;
 	int ret, try;
 
+	if (report) {
+		/* Initialize the report structure with -EOPNOTSUPP in all fields.
+		 * This differentiates from the case when the adapter supports
+		 * fault reporting and returns -EOPNOTSUPP because it cannot transfer
+		 * a certain message.
+		 */
+		i2c_transfer_report_init(report);
+
+		if (!adap->algo->xfer_v2)
+			return -EOPNOTSUPP;
+	}
+
 	if (!adap->algo->master_xfer) {
 		dev_dbg(&adap->dev, "I2C level transfers not supported\n");
 		return -EOPNOTSUPP;
@@ -2316,8 +2331,16 @@ int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 	if (ret)
 		return ret;
 
-	if (adap->quirks && i2c_check_for_quirks(adap, msgs, num))
-		return -EOPNOTSUPP;
+	if (adap->quirks) {
+		struct i2c_msg *bad_msg;
+
+		bad_msg = i2c_check_for_quirks(adap, msgs, num);
+		if (bad_msg) {
+			if (report)
+				i2c_transfer_report_bad_msg(report, bad_msg - msgs);
+			return -EOPNOTSUPP;
+		}
+	}
 
 	/*
 	 * i2c_trace_msg_key gets enabled when tracepoint i2c_transfer gets
@@ -2336,10 +2359,14 @@ int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 	/* Retry automatically on arbitration loss */
 	orig_jiffies = jiffies;
 	for (ret = 0, try = 0; try <= adap->retries; try++) {
-		if (i2c_in_atomic_xfer_mode() && adap->algo->master_xfer_atomic)
+		if (i2c_in_atomic_xfer_mode() && adap->algo->master_xfer_atomic) {
 			ret = adap->algo->master_xfer_atomic(adap, msgs, num);
-		else
-			ret = adap->algo->master_xfer(adap, msgs, num);
+		} else {
+			if (report)
+				ret = adap->algo->xfer_v2(adap, msgs, num, report);
+			else
+				ret = adap->algo->master_xfer(adap, msgs, num);
+		}
 
 		if (ret != -EAGAIN)
 			break;
@@ -2348,58 +2375,86 @@ int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 	}
 
 	if (static_branch_unlikely(&i2c_trace_msg_key)) {
-		int i;
-		for (i = 0; i < ret; i++)
+		int i, n;
+
+		if (report)
+			n = report->msgs_cplt;
+		else
+			n = ret;
+		for (i = 0; i < n; i++)
 			if (msgs[i].flags & I2C_M_RD)
 				trace_i2c_reply(adap, &msgs[i], msgs[i].len, i);
+		if (report && report->bytes_cplt > 0 && msgs[n].flags & I2C_M_RD)
+			trace_i2c_reply(adap, &msgs[n], report->bytes_cplt, n);
 		trace_i2c_result(adap, num, ret);
 	}
 
 	return ret;
 }
+EXPORT_SYMBOL(__i2c_transfer_v2);
+
+/**
+ * __i2c_transfer - unlocked flavor of i2c_transfer
+ * @adap: Handle to I2C bus
+ * @msgs: One or more messages to execute before STOP is issued to
+ *	terminate the operation; each message begins with a START.
+ * @num: Number of messages to be executed.
+ *
+ * Returns negative errno, else the number of messages executed.
+ *
+ * Adapter lock must be held when calling this function. No debug logging
+ * takes place.
+ */
+int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
+{
+	return __i2c_transfer_v2(adap, msgs, num, NULL);
+}
 EXPORT_SYMBOL(__i2c_transfer);
 
 /**
- * i2c_transfer - execute a single or combined I2C message
+ * i2c_transfer_v2 - execute combined I2C message with detailed report
  * @adap: Handle to I2C bus
  * @msgs: One or more messages to execute before STOP is issued to
  *	terminate the operation; each message begins with a START.
  * @num: Number of messages to be executed.
+ * @report: The buffer for detailed transfer report (may be NULL).
  *
  * Returns negative errno, else the number of messages executed.
+ * Writes the detailed transfer report to the structure pointed by @report.
  *
- * Note that there is no requirement that each message be sent to
- * the same slave address, although that is the most common model.
  */
-int i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
+int i2c_transfer_v2(struct i2c_adapter *adap, struct i2c_msg *msgs, int num,
+		    struct i2c_transfer_report *report)
 {
 	int ret;
 
-	/* REVISIT the fault reporting model here is weak:
-	 *
-	 *  - When we get an error after receiving N bytes from a slave,
-	 *    there is no way to report "N".
-	 *
-	 *  - When we get a NAK after transmitting N bytes to a slave,
-	 *    there is no way to report "N" ... or to let the master
-	 *    continue executing the rest of this combined message, if
-	 *    that's the appropriate response.
-	 *
-	 *  - When for example "num" is two and we successfully complete
-	 *    the first message but get an error part way through the
-	 *    second, it's unclear whether that should be reported as
-	 *    one (discarding status on the second message) or errno
-	 *    (discarding status on the first one).
-	 */
 	ret = __i2c_lock_bus_helper(adap);
 	if (ret)
 		return ret;
 
-	ret = __i2c_transfer(adap, msgs, num);
+	ret = __i2c_transfer_v2(adap, msgs, num, report);
 	i2c_unlock_bus(adap, I2C_LOCK_SEGMENT);
 
 	return ret;
 }
+EXPORT_SYMBOL(i2c_transfer_v2);
+
+/**
+ * i2c_transfer_v2 - execute a single or combined I2C message
+ * @adap: Handle to I2C bus
+ * @msgs: One or more messages to execute before STOP is issued to
+ *	terminate the operation; each message begins with a START.
+ * @num: Number of messages to be executed.
+ *
+ * Returns negative errno, else the number of messages executed.
+ *
+ * Note that there is no requirement that each message be sent to
+ * the same slave address, although that is the most common model.
+ */
+int i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
+{
+	return i2c_transfer_v2(adap, msgs, num, NULL);
+}
 EXPORT_SYMBOL(i2c_transfer);
 
 int i2c_xfer_to_xfer_v2(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 6a4df8562ab4..ec5f5d6792a8 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -131,6 +131,14 @@ int i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num);
 /* Unlocked flavor */
 int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num);
 
+/* Transfer with detailed transfer reporting.
+ */
+int i2c_transfer_v2(struct i2c_adapter *adap, struct i2c_msg *msgs, int num,
+		    struct i2c_transfer_report *report);
+/* Unlocked flavor */
+int __i2c_transfer_v2(struct i2c_adapter *adap, struct i2c_msg *msgs, int num,
+		      struct i2c_transfer_report *report);
+
 /* This is the very generalized SMBus access routine. You probably do not
    want to use this, though; one of the functions below may be much easier,
    and probably just as fast.

-- 
2.43.0


