Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E138606D801
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xhEqtfzk;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=RgKOMqyM;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=D0PUQsSG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3tEx8KGrhtebJsZtllQQJuzn9Yar2KAyiVOpIFGqfZk=; b=xhEqtfzkR75+Yf
	KiABa1oUN9kaY985Qbq8snx4yGLPg4nOEcKBjZ27IqPHLrxJYZdugdCWttKr585Db2M3boWHHgMlR
	qe+qVTpkyOxLNkvUv9+ynN6BYnNHUBYz3Eceh0/eFvStq9TXMYMgp22bzweOyE1l7lUSzzzm7mL64
	hVNDaaTakC/ysKQhKJICMbAMQGC3M95TkE5EYQeg8fVlUhoGFT3XZ/ZWns35LdfWtpwF8YqetITq3
	cRHi1IOtevWrapFvrdNxX43tB9v1lxWali7njqMBNxgsuLHGmSQ1rV1l2YHko/fHJBhj79eCvhn9x
	zsgwp7GwsmeL+Oqd+r+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP15U-00000009r3S-1J7V;
	Thu, 05 Nov 2026 17:17:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP14u-00000009qkO-1yqZ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Nov 2026 17:16:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3tEx8KGrhtebJsZtllQQJuzn9Yar2KAyiVOpIFGqfZk=; b=RgKOMqyMIpgxz+wUu7VGUk60gG
	LitOiFEBr75uhdHEVk1k2Hm1oGxvhJ2RwH12yUe+s5TwIcsvV686az6DF2y4eiKwYeaPrXmQds+hj
	HlQJ+Dowch4ShRbxd5tDma9x0klDN8iXmiPptVl2EogbuSACIL5lGhVbPxB29VsO/gwC+QZ8Mu+VN
	Hf5qTTM7iQqoLXPZxJo+xXDoNRo7V5IGoOU95UwbLEbgv6MrF9zbw0xtMlC4oyRPSNHrMSilXi+R2
	kdvznls92ET3NMZq3ihoZ6dSXxPQeTO9zpMNSMsrGxSgwqT7zu5R/PZHBYEqwCFp0h9vjddciCULb
	2sHEsEPg==;
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP14p-00000003KQT-3YOW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:16:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793898999; x=1825434999;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=yJp8z0fUd0WqLNVGCeBa6CZScwSIESwkwvm1zwqw608=;
  b=D0PUQsSGENGR5HVpR+R2Elrpd5z2oGjdndHPv9vqyrNLveHQh+gOyXYL
   B/bCw1EPBpOCzdW+hL/Ett79dvOpQ2QmH7wLFsuSR0gI6LMDx42Dq5naI
   frTGey2bBcHS6+gYab8l73Y8sjMtEwNsLJBr48rZxE0npCQC3nFsafLdX
   6i/uHcwRnPCbvJDzmlRDSrielHcOyS4KHBuqu0ZPpkoZA7GAGz9P2F+ls
   LbWsK+ptsALy3FDFzxCkjYKBHUPwUS6T2XdcI9EfsdfWwpfdHHklzqLgF
   J0fwhfoNcdS4D8Fh9ov0VPlzV7lYPUdaAUIwtm4OQP52yxi7/lPXakCN1
   A==;
X-CSE-ConnectionGUID: r8XgZcLvSViWzkJ4LTFhqw==
X-CSE-MsgGUID: 084N8sKPR5yY80xSsjuRPw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 19:16:36 +0200
X-CSE-ConnectionGUID: 6jLmpjNcQq+h2cqnXk79nA==
X-CSE-MsgGUID: N/kq3xEZT/yWi+7MgDNLXw==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.3])
  by ces02_data.me-corp.lan with SMTP; 05 Nov 2026 19:24:34 +0200
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Thu, 05 Nov 2026 19:16:35 +0200
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Thu, 05 Nov 2026 19:15:30 +0200
Subject: [PATCH RFC v3 09/14] i2c: core: implement I2C_RDWR_V2 ioctl -
 transfer with detailed report
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-i2c-fault-reporting-v3-9-515ad74ac4c9@mobileye.com>
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
X-CRM114-CacheID: sfid-20261105_171639_821052_A0CC8CE3 
X-CRM114-Status: GOOD (  26.50  )
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

I2C_RDWR_V2 is a new ioctl for I2C controller devices. It has the same
functionality as I2C_RDWR, with additional feature - in case of a fault
during transfer, it provides information how many messages and bytes were
successfully transferred and which message caused the fault. If there is
any read data, it also may be used.

This feature is available on drivers that implement i2c_xfer_v2() method
in their i2c_algorithm.

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 drivers/i2c/i2c-dev.c | 123 ++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 104 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index d219eb89f978..14fe1dd7eecf 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -240,11 +240,19 @@ static int i2cdev_check_addr(struct i2c_adapter *adapter, unsigned int addr)
 	return result;
 }
 
-static noinline int i2cdev_ioctl_rdwr(struct i2c_client *client,
-		unsigned nmsgs, struct i2c_msg *msgs)
+static noinline int i2cdev_ioctl_rdwr_v2(struct i2c_client *client,
+					 unsigned int nmsgs, struct i2c_msg *msgs,
+					 struct i2c_transfer_report __user *user_report)
 {
+	struct i2c_transfer_report report;
 	u8 __user **data_ptrs;
-	int i, res;
+	int i, res, msgs_done;
+
+	i2c_transfer_report_init(&report);
+
+	if (user_report)
+		if (copy_to_user(user_report, &report, sizeof(report)))
+			return -EFAULT;
 
 	/* Adapter must support I2C transfers */
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
@@ -259,6 +267,7 @@ static noinline int i2cdev_ioctl_rdwr(struct i2c_client *client,
 		/* Limit the size of the message to a sane amount */
 		if (msgs[i].len > 8192) {
 			res = -EINVAL;
+			i2c_transfer_report_bad_msg(&report, i);
 			break;
 		}
 
@@ -266,6 +275,7 @@ static noinline int i2cdev_ioctl_rdwr(struct i2c_client *client,
 		msgs[i].buf = memdup_user(data_ptrs[i], msgs[i].len);
 		if (IS_ERR(msgs[i].buf)) {
 			res = PTR_ERR(msgs[i].buf);
+			i2c_transfer_report_bad_msg(&report, i);
 			break;
 		}
 		/* memdup_user allocates with GFP_KERNEL, so DMA is ok */
@@ -287,6 +297,7 @@ static noinline int i2cdev_ioctl_rdwr(struct i2c_client *client,
 			    msgs[i].len < 1 || msgs[i].buf[0] < 1 ||
 			    msgs[i].len < msgs[i].buf[0] +
 					     I2C_SMBUS_BLOCK_MAX) {
+				i2c_transfer_report_bad_msg(&report, i);
 				i++;
 				res = -EINVAL;
 				break;
@@ -300,12 +311,44 @@ static noinline int i2cdev_ioctl_rdwr(struct i2c_client *client,
 		for (j = 0; j < i; ++j)
 			kfree(msgs[j].buf);
 		kfree(data_ptrs);
+		if (user_report && copy_to_user(user_report, &report, sizeof(report)))
+			res = -EFAULT;
 		return res;
 	}
 
-	res = i2c_transfer(client->adapter, msgs, nmsgs);
+	if (user_report) {
+		res = i2c_transfer_v2(client->adapter, msgs, nmsgs, &report);
+		msgs_done = report.msgs_cplt;
+	} else {
+		res = i2c_transfer(client->adapter, msgs, nmsgs);
+		if (res < 0)
+			msgs_done = 0;
+		else
+			msgs_done = nmsgs;
+	}
+
+	if (user_report && copy_to_user(user_report, &report, sizeof(report)))
+		res = -EFAULT;
+
+	if (msgs_done > (int)nmsgs) {
+		//fixme - use dev_err?
+		pr_err("Bad i2c_transfer_report: msgs_cplt = %i, bytes_cplt = %i, nmsgs = %i\n",
+		       report.msgs_cplt, report.bytes_cplt, nmsgs);
+		msgs_done = nmsgs;
+	}
+
+	if (report.bytes_cplt > 0) {
+		if (msgs_done < nmsgs && msgs_done >= 0) {
+			msgs[msgs_done].len = report.bytes_cplt;
+			msgs_done++;
+		} else {
+			pr_err("Bad i2c_transfer_report: msgs_cplt = %i, bytes_cplt = %i, nmsgs = %i\n",
+				report.msgs_cplt, report.bytes_cplt, nmsgs);
+		}
+	}
+
 	while (i-- > 0) {
-		if (res >= 0 && (msgs[i].flags & I2C_M_RD)) {
+		if (msgs[i].flags & I2C_M_RD && i < msgs_done) {
 			if (copy_to_user(data_ptrs[i], msgs[i].buf,
 					 msgs[i].len))
 				res = -EFAULT;
@@ -439,18 +482,39 @@ static long i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		funcs = i2c_get_functionality(client->adapter);
 		return put_user(funcs, (unsigned long __user *)arg);
 
-	case I2C_RDWR: {
+	case I2C_RDWR:
+	case I2C_RDWR_V2:
+	{
+		struct i2c_rdwr_ioctl_data __user *user_arg;
+		struct i2c_transfer_report __user *user_rep;
 		struct i2c_rdwr_ioctl_data rdwr_arg;
 		struct i2c_msg *rdwr_pa;
 		int res;
 
-		if (copy_from_user(&rdwr_arg,
-				   (struct i2c_rdwr_ioctl_data __user *)arg,
-				   sizeof(rdwr_arg)))
+		if (cmd == I2C_RDWR_V2) {
+			user_arg = &((struct i2c_rdwr_v2_ioctl_data __user *)arg)->rdwr_data;
+			user_rep = &((struct i2c_rdwr_v2_ioctl_data __user *)arg)->report;
+		} else {
+			user_arg = (struct i2c_rdwr_ioctl_data __user *)arg;
+			user_rep = NULL;
+		}
+
+		if (copy_from_user(&rdwr_arg, user_arg, sizeof(rdwr_arg)))
 			return -EFAULT;
 
-		if (!rdwr_arg.msgs || rdwr_arg.nmsgs == 0)
-			return -EINVAL;
+		if (!rdwr_arg.msgs || rdwr_arg.nmsgs == 0) {
+			/*
+			 * I2C_RDWR_V2 ioctl with nmsgs == 0 is used for
+			 * discovering of the controller capability to return
+			 * detailed fault reports.
+			 */
+			if (cmd == I2C_RDWR)
+				return -EINVAL;
+			if (client->adapter->algo->xfer_v2)
+				return 0;
+			else
+				return -EOPNOTSUPP;
+		}
 
 		/*
 		 * Put an arbitrary limit on the number of messages that can
@@ -464,7 +528,7 @@ static long i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (IS_ERR(rdwr_pa))
 			return PTR_ERR(rdwr_pa);
 
-		res = i2cdev_ioctl_rdwr(client, rdwr_arg.nmsgs, rdwr_pa);
+		res = i2cdev_ioctl_rdwr_v2(client, rdwr_arg.nmsgs, rdwr_pa, user_rep);
 		kfree(rdwr_pa);
 		return res;
 	}
@@ -531,6 +595,11 @@ struct i2c_rdwr_ioctl_data32 {
 	u32 nmsgs;
 };
 
+struct i2c_rdwr_v2_ioctl_data32 {
+	struct i2c_rdwr_ioctl_data32 rdwr_data;
+	struct i2c_transfer_report report;
+};
+
 static long compat_i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
 	struct i2c_client *client = file->private_data;
@@ -539,19 +608,35 @@ static long compat_i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned lo
 	case I2C_FUNCS:
 		funcs = i2c_get_functionality(client->adapter);
 		return put_user(funcs, (compat_ulong_t __user *)arg);
-	case I2C_RDWR: {
+	case I2C_RDWR:
+	case I2C_RDWR_V2:
+	{
+		struct i2c_rdwr_ioctl_data32 __user *user_arg;
+		struct i2c_transfer_report __user *user_rep;
 		struct i2c_rdwr_ioctl_data32 rdwr_arg;
 		struct i2c_msg32 __user *p;
 		struct i2c_msg *rdwr_pa;
 		int i, res;
 
-		if (copy_from_user(&rdwr_arg,
-				   (struct i2c_rdwr_ioctl_data32 __user *)arg,
-				   sizeof(rdwr_arg)))
+		if (cmd == I2C_RDWR_V2) {
+			user_arg = &((struct i2c_rdwr_v2_ioctl_data32 __user *)arg)->rdwr_data;
+			user_rep = &((struct i2c_rdwr_v2_ioctl_data32 __user *)arg)->report;
+		} else {
+			user_arg = (struct i2c_rdwr_ioctl_data32 __user *)arg;
+			user_rep = NULL;
+		}
+
+		if (copy_from_user(&rdwr_arg, user_arg, sizeof(rdwr_arg)))
 			return -EFAULT;
 
-		if (!rdwr_arg.msgs || rdwr_arg.nmsgs == 0)
-			return -EINVAL;
+		if (!rdwr_arg.msgs || rdwr_arg.nmsgs == 0) {
+			if (cmd == I2C_RDWR)
+				return -EINVAL;
+			if (client->adapter->algo->xfer_v2)
+				return 0;
+			else
+				return -EOPNOTSUPP;
+		}
 
 		if (rdwr_arg.nmsgs > I2C_RDWR_IOCTL_MAX_MSGS)
 			return -EINVAL;
@@ -575,7 +660,7 @@ static long compat_i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned lo
 			};
 		}
 
-		res = i2cdev_ioctl_rdwr(client, rdwr_arg.nmsgs, rdwr_pa);
+		res = i2cdev_ioctl_rdwr_v2(client, rdwr_arg.nmsgs, rdwr_pa, user_rep);
 		kfree(rdwr_pa);
 		return res;
 	}

-- 
2.43.0


