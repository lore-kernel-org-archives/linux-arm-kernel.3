Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFCE606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V4BCTi6Y;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=gBxNEymw;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=Vei4QkfF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uDhem8OD0nqC2nbr0UAiAW1wMCT7+FUVptxLNsvSNiA=; b=V4BCTi6Ya9DWI3
	rkMlc7o9+lCkf5Log2QJ7OaYJ+3x5uUdh+aE7ya+9Okj4wydgfabY+NAiLIAMLGUFqyRKz6F3ZGiG
	VFK1zvzXC4hdusxFy5qI0u9fXzK0A7XDMfy5bAF94YYH5RY8S3K3bp/hrpoRIxeBCVGTIFEuilI4w
	peCCFUhfikxJzZtB9C89yEFimm9Vei6YEcbXIHXFl5r2RnNzRPuJok3ADy9D0Utbvl+JxBIW6hyhE
	L6MMRkZ/XZ/sqoGQLCsJzsYYT1D/gM/Gqf3ZA4waEEbYUjklhfRAVF4L4yZgfPW9mkns2u5q7+0ni
	HW3WiMRyj/iz7iqwjmjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP154-00000009qrm-49wY;
	Thu, 05 Nov 2026 17:16:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP14n-00000009qig-28f8
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Nov 2026 17:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=uDhem8OD0nqC2nbr0UAiAW1wMCT7+FUVptxLNsvSNiA=; b=gBxNEymwAZfohpZ/6ikgZYgAbi
	rcBMb/AX+2PN8/GVK+TeOsxEsNby9qeIdCZIUAqXYJKagM/AR3juhfbIl4os0K+mi6WvqhoVUBAuZ
	md8X7ItQ/+wQ7Ie1t4UfrmsiHVZpr/sQtoa1AK4BNACl941qfG400cgmMNLVSc5FHWHlpVhnjns/D
	NyixEabV3U2DNIn3BCHXAc1j++h+R8DWxa4nerrhr7oGXWhkqYw5/nFTqS7FvZnBE9eGwzT/IrmRS
	CY6KcPLbMVzH7ret7Wlj9cdKanJrCuR1vI+oQHaAF2ee8D87lyZvZkNNs1gEK0SlkAKyb3q2QvnZ8
	0LgnYdyA==;
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP14k-00000003KQT-034u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:16:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793898993; x=1825434993;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=ETDjIESv+Zh7NTQ8c2Qtz2fyj1TajF676spchz2GAvc=;
  b=Vei4QkfFS+/sKoL3kW+mhmTq4MKAzE+SnqNvB3cQ34h8jNbh4qGEGGuu
   QVIIL29paYrguHPNlW881l+gvss3ub9X5cvhDEeAt5AwAKO6E2LZp6rVG
   03ENWEbwA1O3MWoz43lCHWBGpUxfgkvBKboO1fE0+Je7e3KxipSH/ST7w
   CRnWEmYyKYNcmL0gFaOxpU+POntLypm3arJ+mhGp6UOdhefNn7U7BSCJj
   4wCVPsFvtimCejY/leefL4dleAvwGdncEQH81dDGVHqiqihFav5Y6QYcp
   wKalRruXEr+5eRDqzbnH7XUXHFBeQLFxjgDSwRdfiR+3k994JRN07UISB
   g==;
X-CSE-ConnectionGUID: aAugRUA5RiGCENGLCXMwcQ==
X-CSE-MsgGUID: D+LmKQP9Rs+yoHkc+Cu1gA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 19:16:31 +0200
X-CSE-ConnectionGUID: vY74y+VITTSdvpVlDZKUGg==
X-CSE-MsgGUID: Op8jweWdRbGKTxuBCJeIdQ==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.3])
  by ces04_data.me-crop.lan with SMTP; 05 Nov 2026 19:24:27 +0200
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Thu, 05 Nov 2026 19:16:29 +0200
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Thu, 05 Nov 2026 19:15:25 +0200
Subject: [PATCH RFC v3 04/14] i2c: core: add i2c_xfer_to_xfer_v2() helper
 function
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-i2c-fault-reporting-v3-4-515ad74ac4c9@mobileye.com>
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
X-CRM114-CacheID: sfid-20261105_171633_998809_B901A6F9 
X-CRM114-Status: GOOD (  13.55  )
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

If an I2C bus driver implements i2c_xfer_v2() callback for multi-message
transfer with detailed reporting in its struct i2c_algorithm, it still
must have old xfer() callback for backward compatibility because this
callback sometimes is checked or called directly, without using
i2c_transfer().

To avoid code duplication for drivers that do not need different code
for transfer with and without detailed reporting enabled, provide a
helper function i2c_xfer_to_xfer_v2() that calls xfer_v2() with pointer
to a dummy struct i2c_transfer_report that will be dropped after using.

It should be used in xfer field of struct i2c_algorithm.

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 drivers/i2c/i2c-core-base.c | 8 ++++++++
 include/linux/i2c.h         | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 165ec14260c8..12b49c01baed 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2400,6 +2400,14 @@ int i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 }
 EXPORT_SYMBOL(i2c_transfer);
 
+int i2c_xfer_to_xfer_v2(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
+{
+	struct i2c_transfer_report dummy_report;
+
+	return adap->algo->xfer_v2(adap, msgs, num, &dummy_report);
+}
+EXPORT_SYMBOL(i2c_xfer_to_xfer_v2);
+
 /**
  * i2c_transfer_buffer_flags - issue a single I2C message transferring data
  *			       to/from a buffer
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 9bee726592fc..6a4df8562ab4 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -601,6 +601,8 @@ struct i2c_algorithm {
 #endif
 };
 
+int i2c_xfer_to_xfer_v2(struct i2c_adapter *adap, struct i2c_msg *msgs, int num);
+
 static inline void i2c_transfer_report_init(struct i2c_transfer_report *report)
 {
 	report->msgs_cplt = -EOPNOTSUPP;

-- 
2.43.0


