Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEC1606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gQE2loUf;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=LpALpXCW;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=XWFXN0I+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aMCwmK7IAjaOgwDNgsQ6uSYvpqNKNWbffcoWB8epJZc=; b=gQE2loUfAs2duj
	bmxktJMqcnYfysROeCiAY3rX4qnmDofB+/GR4WXY+xh5xRfw6NCWcfrr+VJAthwgUKKBaUZ1mSJ3l
	kbahTX/vRy8d47z/rCgW/clEopRcA1R+CFlVQRs6vdD6G8354nsdRvTIVFGOTrwNa6qGFSIotq1gn
	2qdsDq3zNgpDzKpAHtZP8Qxhl1tWp1fwOYazln9OuExxrS2zYPCkc0VG+JcICsuW1jRkiE+JIICol
	sQ6LStzhoYWIH0xLvELcUE3Hl73toqr/N4TeijrpFCa+ypmbCd9/b/SH2GCDov29kxcgEpwEGFfus
	hjNSiQryYrx9VcyYeaLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP155-00000009qsg-27ww;
	Thu, 05 Nov 2026 17:16:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP14q-00000009qk8-28Zu
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Nov 2026 17:16:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=aMCwmK7IAjaOgwDNgsQ6uSYvpqNKNWbffcoWB8epJZc=; b=LpALpXCWpojbq/7/xkM2KFGLwT
	nlw+UNiX44XYpQ32GYORZ5/nelt9MTft9nZ40W7vD8Pqqq8gO9fAY3DvPUdqeS81pGN8M5KUrZLcA
	4/WhZW3BrvCYfELnd7EZrFQaKQO/s3yIKw8dw8uQ27UmpNpuLycI+OGsDKWsoziIxRfD3DYEd9GEZ
	qsA2vhM4aDYopOO26sxvHSedX183hDP0Yw3kjs+BBJ9jCOKxieVeoHxZFUCz5IxzuJKRAYmGunJbK
	v2u/fCo1+GvwEfFLbvCODlsmc5zHf9xa25/ZmisTQJX/a5WDBu8ItdRN20r6Maepp5yDwniBEmcc3
	TXuw00xQ==;
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP14m-00000003KQT-3a4s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793898996; x=1825434996;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=psyr/lUeMakXQMnhGy1IvLcaYp+5UjtFhzPF6MAmIho=;
  b=XWFXN0I+6cjV0DT608c8Gzc60qafoxk9UiZp7U3PjFJUtQEL4S6mzFoD
   N6/C1xOaHOV67igrZu5wNTcF1zWSXIPuVcV03HgfoYD48bGj4WxiWnqRh
   rOwtFLf2WmgjiqYpudC0LJx4LARxnk4gnjpC+hYLOp8JFdv5JyJIXYh3g
   FcMJHNrWMu88utL6qFG8VqH92fbQvWClS9CfJt9VE4c1SHOjtNViH7OJw
   vd9zLmiG5XjqQVGf1dg9o1/ozeukDYCWMlSJKlCxsg9ciW14d9OLONeDb
   l6xuWXAyNKGPQncIky78Jv3gAW0ygKYUiWD7Ndc4o/A+sGFDrJaWIVD/n
   A==;
X-CSE-ConnectionGUID: aAugRUA5RiGCENGLCXMwcQ==
X-CSE-MsgGUID: hh+p/Mw7R0qw0Wjp/o9w0g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 19:16:33 +0200
X-CSE-ConnectionGUID: 4YFVb3OeR8aGzqWiMOi1DQ==
X-CSE-MsgGUID: d+iiAsL0TGqIfNLPZBxwjQ==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.3])
  by ces04_data.me-crop.lan with SMTP; 05 Nov 2026 19:24:29 +0200
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Thu, 05 Nov 2026 19:16:32 +0200
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Thu, 05 Nov 2026 19:15:27 +0200
Subject: [PATCH RFC v3 06/14] i2c: core: make i2c_check_for_quirks() return
 pointer to the message
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-i2c-fault-reporting-v3-6-515ad74ac4c9@mobileye.com>
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
X-CRM114-CacheID: sfid-20261105_171636_834773_0B4B757E 
X-CRM114-Status: GOOD (  17.81  )
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

i2c_check_for_quirks() checks if there are messages in msgs array that
cannot be transferred by the adapter. If there is such a message, it
returns -EOPNOTSUPP.

The error code in the return value is not needed because __i2c_transfer()
does not use it and explicitly returns -EOPNOTSUPP if
i2c_check_for_quirks() return value is not zero. So, instead of returning
the error code, return the pointer to the first message that cannot be
transferred by the controller, to provide the possibility to pass the
message index to the client.

This is preparation for implementation of detailed transfer reporting.

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 drivers/i2c/i2c-core-base.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 3dd7ef02c562..23ff02a1e532 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2223,15 +2223,17 @@ module_exit(i2c_exit);
 /* Check if val is exceeding the quirk IFF quirk is non 0 */
 #define i2c_quirk_exceeded(val, quirk) ((quirk) && ((val) > (quirk)))
 
-static int i2c_quirk_error(struct i2c_adapter *adap, struct i2c_msg *msg, char *err_msg)
+static struct i2c_msg *i2c_quirk_error(struct i2c_adapter *adap,
+				       struct i2c_msg *msg, char *err_msg)
 {
 	dev_err_ratelimited(&adap->dev, "adapter quirk: %s (addr 0x%04x, size %u, %s)\n",
 			    err_msg, msg->addr, msg->len,
 			    str_read_write(msg->flags & I2C_M_RD));
-	return -EOPNOTSUPP;
+	return msg;
 }
 
-static int i2c_check_for_quirks(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
+static struct i2c_msg *i2c_check_for_quirks(struct i2c_adapter *adap,
+					    struct i2c_msg *msgs, int num)
 {
 	const struct i2c_adapter_quirks *q = adap->quirks;
 	int max_num = q->max_num_msgs, i;
@@ -2282,7 +2284,7 @@ static int i2c_check_for_quirks(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		}
 	}
 
-	return 0;
+	return NULL;
 }
 
 /**

-- 
2.43.0


