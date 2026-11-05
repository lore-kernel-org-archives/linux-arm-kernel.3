Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CD0606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=drukYfUq;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=IBguN/aB;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=hfxOT8u5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=T7tP7R2n8WhWHJO0GCJusIxU/QUf54O8a8To4Y8YAJA=; b=drukYfUqHmYwM4
	3Fsr7E7bhpRQgyGQaXLzgtjnMuzqwrI4LBgDNa8U9EQxTB7BP9hSqwiMuE728OYVQcIBJ+mrZO/94
	E8Fn5Udl3neIziSkvw58ppcbxo8yWQs55iHShqTnUUv4dhX2XWASPrQv7syQpbMYVetp4y3dalvPf
	uGPrfPtNBNPXN6VTpNYNnnHDkJW0W9ve8RJl1cMqQSYhV4q09biJiJekqgPQMT7IhUhN4mENORZgc
	7zYv68Laz+4TpInZJuZdnEGaDm3Qiowk0HMslsS/a/67xa8bcmlQtZgudi4i96MjhiajAow7QYKx8
	9WvF0Q90J7tICE17a+Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP15f-00000009rCe-1y9y;
	Thu, 05 Nov 2026 17:17:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP14s-00000009qkJ-2095
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Nov 2026 17:16:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=T7tP7R2n8WhWHJO0GCJusIxU/QUf54O8a8To4Y8YAJA=; b=IBguN/aBTTplPMTJYQXPqlymnZ
	JBqzDxl/Q0RNr5wA3ozDw88VGVWVNzP5ygGBrTh5AiH0HFll8y7r2UOsnlm5uDYxk5UmQar0yhlCq
	7NybGQ9KpJyHi61CcUVRHidjJyPWJVcgsyzQdHvrtAX0rds1act9c3h5ffNHpxUq5ZVWFbaK5guGd
	7D9LSazMUIHtWp9UtLS4cl4nyrDrUZ+l9kblLUgkGjU2j5fAJstS5d0S0NVaeTFjff+TGwt9bVVa0
	weZo25ZRiEYUaoIqMNKevz289I1OXlnNIjwnrm7Ugl90KDmrvu5C7zuANRDWRRMZzrJfvo/MgNMJo
	0ghCkhZQ==;
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP14o-00000003KTt-34c6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:16:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793898999; x=1825434999;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=/+cabZaiN4XfIIx659yXwo3U+cCoXUx1gf9HDDu89No=;
  b=hfxOT8u5LU4nQm7/vJ3XzhaUQ4kPxWR6NC/UAtRjm9wW9PX2spY6d0x6
   f5IwGdiuOuzv6UIPChDV8RDp0PdKmDoPkXnPSOBSFb93Ng8MmhIEOwqjH
   3BQmc2U0yH2drNe+8UH67H0fNSYfk1dVgkUNS+DdBc4BZrpIipLSzXJPA
   PEJmxWM9I4CN1zVNp9Xp2FC/7lp3Rz3uvorc+/eInUdyjq4OWp0slc//R
   JXt3wNHFpFjiVZahmBkW1hUSgtJ+Op6EavkrQd63hn9VlhhT/1tSCQGeG
   yVyzSg+uwlKuQXQYzyHOfVHGHUz3DSjhyHtKgXAQLICgNRIblaP4KjUin
   Q==;
X-CSE-ConnectionGUID: v7RjAzLzRZyclLiaKGMzhA==
X-CSE-MsgGUID: Fwv+IUKEQquSRAdoxTRSHw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 19:16:38 +0200
X-CSE-ConnectionGUID: c6LJYtgqStywnTEpyIVnaw==
X-CSE-MsgGUID: W1xX3KOGTdCBR+CU05DcGg==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.2])
  by ces01_data.me-corp.lan with SMTP; 05 Nov 2026 19:24:40 +0200
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Thu, 05 Nov 2026 19:16:36 +0200
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Thu, 05 Nov 2026 19:15:31 +0200
Subject: [PATCH RFC v3 10/14] i2c: doc: add section for I2C_RDWR_V2 ioctl
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-i2c-fault-reporting-v3-10-515ad74ac4c9@mobileye.com>
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
X-CRM114-CacheID: sfid-20261105_171638_663433_66AC08C4 
X-CRM114-Status: GOOD (  28.47  )
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
successfully transferred and which message caused the fault.

Add documentation section about the new ioctl and the structures it uses.

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 Documentation/i2c/dev-interface.rst | 48 +++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/i2c/dev-interface.rst b/Documentation/i2c/dev-interface.rst
index c277a8e1202b..95e60bdb2f4d 100644
--- a/Documentation/i2c/dev-interface.rst
+++ b/Documentation/i2c/dev-interface.rst
@@ -140,6 +140,54 @@ The following IOCTLs are defined:
   The slave address and whether to use ten bit address mode has to be
   set in each message, overriding the values set with the above ioctl's.
 
+``ioctl(file, I2C_RDWR_V2, struct i2c_rdwr_v2_ioctl_data *msgset)``
+  Does the same combined read/write transaction as I2C_RDWR, but also
+  provides detailed fault report. The argument is a pointer to a::
+
+    struct i2c_rdwr_v2_ioctl_data {
+	    struct i2c_rdwr_ioctl_data rdwr_data;
+	    struct i2c_transfer_report report;
+    };
+
+  rdwr_data is the same structure as the argument for I2C_RDWR ioctl.
+  report is the structure that the transfer report is written to::
+
+    struct i2c_transfer_report {
+      __s32 fault_msg_idx;
+      __s32 msgs_cplt;
+      __s32 bytes_cplt;
+    };
+
+  msgs_cplt is the number of messages that has been sent or received
+  successfully. If there are read messages within this range, the returned
+  data is guaranteed to be valid. If a message has been read from the
+  device but the read data is lost (for example, FIFO is flushed before
+  CPU read it), this message must not be counted.  If the controller cannot
+  determine the number of completed messages, the value is -EOPNOTSUPP.
+
+  fault_msg_idx is the number of messages that caused a fault. In case of a
+  fault, it is not necessary equal to msgs_cplt. For example, if the driver
+  validates the whole batch before starting transmission, detects that it
+  cannot send it, it returns -EOPNOTSUPP error immediately, so msgs_cplt is 0,
+  while fault_msg_idx points to the message that cannot be sent. Another
+  example when these two value may be different is I2C controller that
+  flushes RX FIFO when an error is detected before CPU reads data from it.
+
+  If there is no fault, the fault_msg_idx value is equal to msgs_cplt.
+
+  bytes_cplt indicates the number of bytes sent/received in the message at
+  index msgs_cplt. If this is a read message, it is guaranteed that these
+  bytes in the message data buffer are valid. If the controller cannot
+  determine the byte count, the value should be -EOPNOTSUPP. If there was
+  no fault or no data was transferred successfully in the faulty message
+  (for example, NACK on target address or first data byte), the value should
+  be 0.
+
+  To discover whether the device supports detailed fault reporting, use
+  I2C_RDWR_V2 ioctl with nmsgs = 0. If the driver supports it, the return
+  value should be 0. If the driver supports only plain I2C_RDWR, the return
+  value should be -EOPNOTSUPP. In any case, nothing is done on wire.
+
 ``ioctl(file, I2C_SMBUS, struct i2c_smbus_ioctl_data *args)``
   If possible, use the provided ``i2c_smbus_*`` methods described below instead
   of issuing direct ioctls.

-- 
2.43.0


