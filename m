Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B2F606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AJewTp5n;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=aT/0ncis;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=qZFYZBsP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ESR01hVfCK1gp7i8nW8yl8a1SOvyJZG5i7j+b3mjIrY=; b=AJewTp5nnG9CBo
	kOzWc44EilzOqOj+3Poh9NW/OfELqctyNmI6GlDUosq6HV7Z0Y4NQhkKYTzBHpAUQSg5f43j42l3T
	V6pZ3ze+dFqxAHQJm48nsijysJ0vLEMWW9rK3kH87odFXfrhwfR1lobZ4f33vgEX75bL7wjZoM2ZX
	3oluR3deGNA1UHwjBUxBSBnYpIgiweVg77+SEIU/sPcJrP45Gw/5GeylGBUWYJvkXhZMvUw8RTBLF
	AkGdtuJRbvZBYa80Ne8ikyKGfhBz9tkceYz+Rj3ZN0X6NxK+WQxqLQyDbvbf8CKzHfeSxOFIyaetC
	Qhqzrjwj+NQTR73KIZDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP153-00000009qp4-1Nu9;
	Thu, 05 Nov 2026 17:16:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP14m-00000009qiP-0uSd
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Nov 2026 17:16:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ESR01hVfCK1gp7i8nW8yl8a1SOvyJZG5i7j+b3mjIrY=; b=aT/0ncissQNy5UaxHQ76BMyJbE
	Lab/X/wCHnd2saSfuo6s5E83tpCi1Or6Y0wBZiHVx3dNXm/13IpbehaV7kQwT9x8TZxjs3eP1cUaJ
	lDRXA7fgJboN+e+Qw0pNTKRY2zfnIRQvKQKxMz10euh2SzI7Jx0s8GAczDRn0aLiZbgwj2KhnxnU8
	YvpDlV1hzeu5/lIsNKLY7a9kpSspIGG/fKLzX8Vb6wpuhqh1cpApKkypdaJCo0883IAAPa/p/xQnx
	Jqo44YtjigdCfCzhCfossJQhZVEkMQXtta83zqIQ1KEcdRTUiISECCMedxNmrugUPebzx05TRm35m
	8OhfZYkg==;
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP14j-00000003KQ2-1qxp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793898993; x=1825434993;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=ovadr4aQgfWIah4NDeZK3wouRVsN9xHwGwefizVmO4U=;
  b=qZFYZBsPSavusex8+4IqL5xCFaXFfoZIySBhBb6S0ERmfV+VLSBZYuEY
   b479RW42/os7j5/E9Mwa7YATMjt7h5Dh5DCg0/iJhWSkbjaUyWXFkD4gI
   EbDwkswXdDNUIvtYHo2IcZbf3dEdQpzlgcVqPpaUzcXzE6Z3eUge0Y6YY
   Y770CbXQc+DkirjugaVZo6UqAzCCXfhX61l32j3qzYwy62Kp4ZBu6mR5v
   A5lhmZU9ggBXHyw5cqDsaLJ6EMLXu5vz/Sio8v/wBUIBII2T0NEzSQq7W
   RrJmHbWCEFr01iDYOxeL/I55M4x1QnlBz+BeUaq+eY0kij2TXUav3i2xV
   g==;
X-CSE-ConnectionGUID: aAugRUA5RiGCENGLCXMwcQ==
X-CSE-MsgGUID: yu0RUvtOR9ydVUKch5hVfw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 19:16:30 +0200
X-CSE-ConnectionGUID: 1sizQpTBSQ6izphpk93T/A==
X-CSE-MsgGUID: CNcNhsHTS/Kt4pRyFB1dUQ==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.2])
  by ces04_data.me-crop.lan with SMTP; 05 Nov 2026 19:24:26 +0200
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Thu, 05 Nov 2026 19:16:28 +0200
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Thu, 05 Nov 2026 19:15:24 +0200
Subject: [PATCH RFC v3 03/14] i2c: core: add helper functions for transfer
 report generation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-i2c-fault-reporting-v3-3-515ad74ac4c9@mobileye.com>
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
X-CRM114-CacheID: sfid-20261105_171633_449084_32D27123 
X-CRM114-Status: GOOD (  13.82  )
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

Add three helper functions for I2C transfer report generation:

- i2c_transfer_report_init() that puts -EOPNOTSUPP in all struct fields
  (this should be used if the defailed reporting is not supported);

- i2c_transfer_report_success() that is used to generate the report in
  success case (all messages are transferred successfully);

- i2c_transfer_report_bad_msg() that is used if one of messages cannot
  be transferred and no data were actually transferred.

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 include/linux/i2c.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index bf7dc12f7264..9bee726592fc 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -601,6 +601,27 @@ struct i2c_algorithm {
 #endif
 };
 
+static inline void i2c_transfer_report_init(struct i2c_transfer_report *report)
+{
+	report->msgs_cplt = -EOPNOTSUPP;
+	report->fault_msg_idx = -EOPNOTSUPP;
+	report->bytes_cplt = -EOPNOTSUPP;
+}
+
+static inline void i2c_transfer_report_success(struct i2c_transfer_report *report, int num)
+{
+	report->msgs_cplt = num;
+	report->fault_msg_idx = num;
+	report->bytes_cplt = 0;
+}
+
+static inline void i2c_transfer_report_bad_msg(struct i2c_transfer_report *report, int i)
+{
+	report->msgs_cplt = 0;
+	report->bytes_cplt = 0;
+	report->fault_msg_idx = i;
+}
+
 /**
  * struct i2c_lock_operations - represent I2C locking operations
  * @lock_bus: Get exclusive access to an I2C bus segment

-- 
2.43.0


