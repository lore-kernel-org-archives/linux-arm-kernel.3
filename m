Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D89606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JhYjPSTd;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ly5jTBeH;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=ZJ5d4wPs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UBdjNu6Hf5V0V9uMBNBVG0ug+WBnwMvQ4aA39umfh6M=; b=JhYjPSTdi8hL2d
	ZqaHQ09IYxYeXcDdV31ghM9jyzkyQMoq4hU2ZcsPMnqrFwM7tUgd+UBZHTmzh6CRaY9o0/FqkP6hv
	RjwrjK6FMSyhQm3FfycEA6OQYbpnY+cqnk7zfq9hkGyRo29LfKIQEhU5X0PMz+JkWaEXMD3OuIW0d
	CoGZUT4w8i/okaLu1o37sCQKeEfNO02w0pCSEy2qYFVC6Iy/KOeDrE9dQkju2aXMxdMNl74+f4e2+
	mf2Xp52jVVBHGcDSAQ6HioluQgi19PGFrAMtSm6z0aGaMeHxpiXli9j1Aa7Qhqk3lPz2FZoJxR+nP
	7Yk6m9qr/4S17c/5YE8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP154-00000009qqD-0FEV;
	Thu, 05 Nov 2026 17:16:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP14k-00000009qi9-2sRR
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Nov 2026 17:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=UBdjNu6Hf5V0V9uMBNBVG0ug+WBnwMvQ4aA39umfh6M=; b=ly5jTBeHPxqM43V28mBGgI9hff
	3bzMQ7BV8Q1R+F5P4yBy7+FvawI1dvo/Xpak08ShAvfgFMVnuMX4a0QLZcGJMfwDZITGc6sSC7+Ab
	wH+mLzbUqZDX1q24Agzp//Ej7ESCh/89tv/S1pN/aHb9n8QCBhU8V14srFatWRAZPlnsNRRLaPLcV
	iHQXFLeHvB8NST3dXUCAMBy1vTp61+GwLMKgRIkgAE2gIen2b1wvQk4RyM0lTozCZwzVwAnt8DH6p
	ZwTbzQsEfqgD3YPEBe4PMC289wvFSqIpRnucHlVuxl/UXy+YOsgIe84SRvrJWjt+Rlbk9x2mT7LGE
	V+SyopGQ==;
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP14i-00000003KQT-0Qdo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:16:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793898991; x=1825434991;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=XrcwCM187WI161c394wQbmjLIFf8yO5479299ymnpRc=;
  b=ZJ5d4wPsj66HJK4Ni9+oNBTnKVd6IPCeNKT+pZZ/fSGX69U8gx6uY153
   u1flGRaNOahOfade9PECSeAiUQoAZFoOPbbYfT/nprRQqXNQdF+UIv1Vm
   F25/Fa5JMPFgNtnVdV9DQUtWQHScoOPiXdVlqDAltMuZpOzB0XZ+Cv/Ax
   ncr7bQ6NcukWPYmsDOSDlz5uThm3arr9+6JzOnTX+YESybix4TUXNgxLW
   rBN56C5iMkrJ3fIQIhOJtsgNjmSUYf7Q5TGj0rhU2KzNIo6OhmAV/cyFS
   eefXvN7fWYS6dd1T4e52UwZ+MEyGmjid+97uJ20dCrhVqCgedXKzoTS8d
   g==;
X-CSE-ConnectionGUID: r8XgZcLvSViWzkJ4LTFhqw==
X-CSE-MsgGUID: xYR+R2zrRP+G4P+fDyAyHQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 19:16:29 +0200
X-CSE-ConnectionGUID: LRKzbrL+S7mAH4sHc4Vfeg==
X-CSE-MsgGUID: SpM9P5F7TjeQBtLpi6p6bg==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.2])
  by ces02_data.me-corp.lan with SMTP; 05 Nov 2026 19:24:27 +0200
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Thu, 05 Nov 2026 19:16:27 +0200
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Thu, 05 Nov 2026 19:15:23 +0200
Subject: [PATCH RFC v3 02/14] i2c: core: add xfer_v2() to i2c_algorithm
 structure
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-i2c-fault-reporting-v3-2-515ad74ac4c9@mobileye.com>
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
X-CRM114-CacheID: sfid-20261105_171632_078617_49740F54 
X-CRM114-Status: GOOD (  16.39  )
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

In struct i2c_algorithm, add xfer_v2() - a new method that is
similar to xfer() but accepts in addition pointer to struct
i2c_transfer_report and puts the detailed transfer report into it.

With this method, it case of a fault, it is possible to get not only
the error code, but also the number of messages and bytes transferred
before the fault. If there were read messages before the fault, the read
data may also be used by the client.

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 include/linux/i2c.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 6a847fc88d25..bf7dc12f7264 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -537,6 +537,8 @@ i2c_register_board_info(int busnum, struct i2c_board_info const *info,
  *   into I2C transfers instead.
  * @smbus_xfer_atomic: Same as @smbus_xfer. Yet, only using atomic context
  *   so e.g. PMICs can be accessed very late before shutdown. Optional.
+ * @xfer_v2: Same as @xfer, but provides detailed report in case of a fault.
+ *   Optional. If it is present, @xfer must be also present.
  * @functionality: Return the flags that this algorithm/adapter pair supports
  *   from the ``I2C_FUNC_*`` flags.
  * @reg_target: Register given client to local target mode of this adapter
@@ -582,6 +584,8 @@ struct i2c_algorithm {
 				 unsigned short flags, char read_write,
 				 u8 command, int size, union i2c_smbus_data *data);
 
+	int (*xfer_v2)(struct i2c_adapter *adap, struct i2c_msg *msgs,
+		       int num, struct i2c_transfer_report *report);
 	/* To determine what the adapter supports */
 	u32 (*functionality)(struct i2c_adapter *adap);
 

-- 
2.43.0


