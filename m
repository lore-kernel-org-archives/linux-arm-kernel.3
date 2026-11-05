Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEB8606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kFs06yxP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Jcn46zKx;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=UPiMuGXj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=L7PfW0w9w4vPHWcoJQq9wrlaGYaPvcqfDhLDkXUySZg=; b=kFs06yxP61ec/s
	6v47fIEN6Mfsb5mSb7fwLVTlZx95oX/0U8zp3Pg01+QD119FDpGn6sjv76h3IXHOeseUtIA3ZmQin
	zEozlpc6ZNHq8UH49KPeT75pFG4qAI9T8KzDgB3/AbOEsP685xkQHTYb2BLtO+euHYSx7zx+fdNyw
	5DJwIjGSW1l1xa7ndSup957NRJNqYMhBAHxOKXuuyyts3AzgU3X5rLQW+Q9/l2At0w/pKemar3l8D
	biNrXpdkrvEqqSlt8gqhb0B9HT+T9lNLChMG2l0iBvn1vkOOMJF3sDdzl0CZoPStzIgZ3mpg+5JTC
	dPZLlCk80tIANhnP0TgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP157-00000009quH-1QIR;
	Thu, 05 Nov 2026 17:16:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP14s-00000009qkF-0Px1
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Nov 2026 17:16:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=L7PfW0w9w4vPHWcoJQq9wrlaGYaPvcqfDhLDkXUySZg=; b=Jcn46zKxvrbQKSpojnL1Q/geAz
	NY9qb44n0OgxKCOdjqpgyGFX0lwEg0AQwaIXJ1bgFU6Hm0Y1YTBXCPJ8t7funtuHyIYpwZqHN6NoF
	JX+h5cEsDGF190bt2Wp4NBTdNEy9KM4zuVHAMiWYNfE3IOQ7hZt7MiABcFjnrOtxiEQk40QweEUU4
	GQvtl7O5E+vXW9jh/OzHo58/6ZXl8zT1q5UyJR2VTAXOEHfh91G4pZ6WUYuFads6555Z5iQd8nNN+
	u5n5rI/COPdSTIaPUzRM7yV79OH7JMEBo2NDfTH5ktTHqEHKRqe7ZJ2iKSWyxU74HYiOez34kBaNQ
	vVSEyFrA==;
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP14n-00000003KTT-3QFr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:16:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793898998; x=1825434998;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=mPXDpDXk7iYLdkJnXSbOYchRVsaiItuRno2Q6Q7CGuw=;
  b=UPiMuGXjQQWOh6+fUfRj+1IZU5EyYVq+6a48ZmXdrUS+C3ZJJpa9Trmf
   fVqspp4wjRld4/uJ59zoMz72gW8FWJj6FcgHoD57urEoRkJWegdqEszHp
   SCvfpaP9hJNerJKGvg6GgpB/aGTOh/KdbZVQz6SQQ5pLNPxcN4dkWgCaE
   pAFq+MefRLYz59YT3fLA/+eHLUIGVMzAwup8OBAFFcmzdiQ/S18QAkBLV
   A+8lDMYPNdllbXlwprKEi6lRv8ZYFqPlnf7JvO4zZZQbaYhTRSzvcrVnb
   BKF2YO/9HV0+ANtc/LR3z1OnYgWGGvUogtAaUdQGFwT2EO9sSLvFyzPAl
   A==;
X-CSE-ConnectionGUID: vAvYU0/7SbSwBl3NeJfhPQ==
X-CSE-MsgGUID: Ul1owX+XQJGyMCT0bFAWWA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 19:16:36 +0200
X-CSE-ConnectionGUID: 6gkyCM6BQdqLiTZNHvDv0A==
X-CSE-MsgGUID: suYRD3d+RUKY/qNhMfdJ9A==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.2])
  by ces03_data.me-corp.lan with SMTP; 05 Nov 2026 19:24:23 +0200
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Thu, 05 Nov 2026 19:16:34 +0200
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Thu, 05 Nov 2026 19:15:29 +0200
Subject: [PATCH RFC v3 08/14] i2c: uapi: add I2C_XFER_V2 ioctl - detailed
 fault reporting
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-i2c-fault-reporting-v3-8-515ad74ac4c9@mobileye.com>
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
X-CRM114-CacheID: sfid-20261105_171637_787135_FAE31F6F 
X-CRM114-Status: GOOD (  16.54  )
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

For user-space access to I2C multi-message transfer with detailed
reporting functionality, add I2C_XFER_V2 ioctl and corresponding
struct i2c_rdwr_v2_ioctl_data.

The structure consists of struct i2c_rdwr_ioctl_data that used in the
same way as in I2C_XFER, and struct i2c_transfer_report that the
detailed transfer report is put in.

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 include/uapi/linux/i2c-dev.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/uapi/linux/i2c-dev.h b/include/uapi/linux/i2c-dev.h
index 1c4cec4ddd84..5097568a3149 100644
--- a/include/uapi/linux/i2c-dev.h
+++ b/include/uapi/linux/i2c-dev.h
@@ -11,11 +11,13 @@
 
 #include <linux/types.h>
 #include <linux/compiler.h>
+#include <linux/i2c.h>
 
 /* /dev/i2c-X ioctl commands.  The ioctl's parameter is always an
  * unsigned long, except for:
  *	- I2C_FUNCS, takes pointer to an unsigned long
  *	- I2C_RDWR, takes pointer to struct i2c_rdwr_ioctl_data
+ *	- I2C_RDWR_V2, takes pointer to struct i2c_rdwr_v2_ioctl_data
  *	- I2C_SMBUS, takes pointer to struct i2c_smbus_ioctl_data
  */
 #define I2C_RETRIES	0x0701	/* number of times a device address should
@@ -33,6 +35,7 @@
 #define I2C_FUNCS	0x0705	/* Get the adapter functionality mask */
 
 #define I2C_RDWR	0x0707	/* Combined R/W transfer (one STOP only) */
+#define I2C_RDWR_V2	0x0709  /* I2C_RDWR with detailed fault reporting */
 
 #define I2C_PEC		0x0708	/* != 0 to use PEC with SMBus */
 #define I2C_SMBUS	0x0720	/* SMBus transfer */
@@ -52,6 +55,12 @@ struct i2c_rdwr_ioctl_data {
 	__u32 nmsgs;			/* number of i2c_msgs */
 };
 
+/* This is the structure as used in the I2C_RDWR_V2 ioctl call */
+struct i2c_rdwr_v2_ioctl_data {
+	struct i2c_rdwr_ioctl_data rdwr_data;
+	struct i2c_transfer_report report;
+};
+
 #define  I2C_RDWR_IOCTL_MAX_MSGS	42
 /* Originally defined with a typo, keep it for compatibility */
 #define  I2C_RDRW_IOCTL_MAX_MSGS	I2C_RDWR_IOCTL_MAX_MSGS

-- 
2.43.0


