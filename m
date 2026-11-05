Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DD3606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jV/WMTWH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ZS+Dm8yk;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=T7L3i531
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dOYfdxhTQE6miHpeR1fvtBzuyo960p8PFto6/UVXRJs=; b=jV/WMTWHf6AZPu
	/gTX13lZOy4USkW83mlwUfZ8yQ01Ykd3Z+qk9mZk8casq0kZs74FY8StZN0YwhDTBG9Ck6qbTEWuF
	rkChHhvLdaNbxV0eXSrjy0tnOF/C3ADl4Lrbx5OV73+dy0PLWtUIn0jYvINwj9pVKU+Z35PX4fiiV
	YjaqTRnsEcXX9jvBxq8FG7syPgFGtdfa76MnCepgKr+jACWuwAsNLW0epOGaCirfNRYY8rEl3woej
	9Z+Y4xMs3UmTKR3Fl83tG2XktacRjxxJ+hMAnF/F5awXGLBziD3CSjy/ogDvwi9eADJL/fv3i2MOb
	Isbt1RrteqK9TwfXoObQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP154-00000009qqs-235H;
	Thu, 05 Nov 2026 17:16:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP14k-00000009qhl-0S12
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Nov 2026 17:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=dOYfdxhTQE6miHpeR1fvtBzuyo960p8PFto6/UVXRJs=; b=ZS+Dm8yklIq8VNKXpztHX6SwK5
	en+XHMUGraIpJbt5F3lfuecwsvgtgKQPen+LhGfE7mHK2ea0rS/FMU6u+owvdx8EEkjgA++ptfDwK
	3Xcb8QVKNjptz9KeBM9E3EoEoUMcmvK2LhSfbVi8Sqi/r2e/kA1EfLIkRRZqUZXNxYHL2DxexL3jo
	121QMOQLhM29qMkM2kfXOzqjkf47AxLlQ+YivBacQSA5Togw7AiXGNJwhOxE61qIjKSGqe4p7+T0a
	IXBA1cOvNVaIGBVikA2m1lwv1oSm0DqgMl+6YHf1tQnsvrKkKlG7RKDBwIinDqcFIi6ul/wuZ6Eib
	iAw0a0oQ==;
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP14h-00000003KQ2-1bye
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:16:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793898991; x=1825434991;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=YpjmhVlx+holnUU9APQW5il/uttLbURlUiMfTjZsTJE=;
  b=T7L3i531IF668yCJlBhzTokWjJLvhGLFyiym0QmxBOcNGd9bl//Pq+sz
   4YXFYpT0zcHNInJNELpVvNBz0a23Uz+2H49ta3gABlmiM7rIYKUeX1/G6
   XNouEdEcFaMLWGgsXk53u3AOU5fb1q2oJOEyya7dtRjNQXg9OSZuJDUZc
   MpZkAV8pHq75DcXg2TvyatyBvK8zV2igMlXsTmUpjwrTkm1pIwDJWyyFT
   mHsGuUb1QJvcfKLUQcWDbMy7nwjU4VabvBE9x+D6jLdW1tzZx7YQabJoq
   ucStnVruSzb47jJ3MpwWTu1doF6JG6FT2cuElDk6x/9utNvlTvV/IBFJ2
   w==;
X-CSE-ConnectionGUID: CrtBYAN5RNmswzOgJFzNkw==
X-CSE-MsgGUID: ghPx1/aSQdSBXigntR2kIQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 19:16:27 +0200
X-CSE-ConnectionGUID: rsPO3BM3QemOm3ocJOoFRA==
X-CSE-MsgGUID: U0ErBUmjQrq6FBx4m/ejqA==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.3])
  by ces03_data.me-corp.lan with SMTP; 05 Nov 2026 19:24:16 +0200
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Thu, 05 Nov 2026 19:16:26 +0200
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Thu, 05 Nov 2026 19:15:22 +0200
Subject: [PATCH RFC v3 01/14] i2c: uapi: add i2c_transfer_report structure
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-i2c-fault-reporting-v3-1-515ad74ac4c9@mobileye.com>
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
X-CRM114-CacheID: sfid-20261105_171631_521697_EDD07DFC 
X-CRM114-Status: GOOD (  16.99  )
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

Add i2c_transfer_report structure declaration for detailed transfer
reporting in case of a fault.

The structure has three fields:

- fault_msg_idx - index of message that caused fault;
- msgs_cplt - number of messages transferred successfully;
- bytes_cplt - number of bytes transferred in the last message if it was
  completed partially.

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 include/uapi/linux/i2c.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/uapi/linux/i2c.h b/include/uapi/linux/i2c.h
index 2a226657d9f8..5e8e7d3536c8 100644
--- a/include/uapi/linux/i2c.h
+++ b/include/uapi/linux/i2c.h
@@ -135,6 +135,27 @@ struct i2c_msg {
 					 I2C_FUNC_SMBUS_READ_BLOCK_DATA | \
 					 I2C_FUNC_SMBUS_BLOCK_PROC_CALL)
 
+/* Detailed transfer report */
+
+struct i2c_transfer_report {
+	__s32 fault_msg_idx;		/* In case of a fault, index of the message that caused
+					 * the fault. If the bus driver cannot determine it, it
+					 * puts a negative error code. If there is no fault, the
+					 * value is equal to number of messages transferred.
+					 */
+	__s32 msgs_cplt;		/* Number of messages that are known to be transferred
+					 * successfully. If the bus driver cannot determine it, it
+					 * puts a negative error code. If there is no fault, the
+					 * value is equal to number of messages transferred.
+					 */
+	__s32 bytes_cplt;		/* In case of a fault, number of bytes in the message at
+					 * index `msgs_cplt` that are known to be transferred
+					 * successfully. If the bus driver cannot determine the
+					 * number of bytes, it puts a negative error value.
+					 * If there is no fault, the value is 0.
+					 */
+};
+
 /*
  * Data for SMBus Messages
  */

-- 
2.43.0


