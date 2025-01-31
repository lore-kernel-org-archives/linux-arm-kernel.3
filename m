Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A3CC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 11:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8xmEFdYZQa3+MY7J1esdtNzTvF3Kk2N8sR/+VinCJU=; b=PgrBNCNtbivV/lnAC25zLZMJrL
	HjTl9M1KtCS4cSRnACfEKkTI5PmVymugG0ggXNpUWuzOKXXCAeCx5NXEkyjpUZViWb8QO3RmNgyyy
	GV9lFOy+iz/+wvFQRve3V3l+XtLcdYc2nc8tkPtD9HIWejnNILN07ZiDAOoNYzHkaSyrCGC1Jw9Kn
	5AhtNYh9EHJvE7ClzYqt26RIevNOxbgU9StDdYRvV1wHWg6cnNQctP5Kth6/OPKj/W/S/GRvDNiC0
	+x1GIhGPFkY/iqTM9SWV/vf/b9NWcX3sR/7RzOhcBEY2gHIkJQah2T7fTV0kbQ6RUJ8eLlZrJIopq
	VzB9r+FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdpR0-0000000AX9l-0mKD;
	Fri, 31 Jan 2025 11:43:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdp9D-0000000ATpp-482i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 11:25:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E16E1007;
	Fri, 31 Jan 2025 03:25:45 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED9323F63F;
	Fri, 31 Jan 2025 03:25:18 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 31 Jan 2025 11:24:13 +0000
Subject: [PATCH v2 13/18] firmware: arm_ffa: Remove unnecessary declaration
 of ffa_partitions_cleanup()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-ffa_updates-v2-13-544ba4e35387@arm.com>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1937; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=fdT5EChbtqfXYexU74FFsCYTiVeLlZGaxmgomF4gd0M=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMQOBs1P5wJN9+NbxEdLzIG52z4IW22B9MUv
 TXuIbZDDPOJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzEAAKCRAAQbq8MX7i
 mJarEACZJglyJgDihrqANB0ymj1onxs9WJ4eVEY2KAllE930ajGcPPGYTxKEsfjQsn8DVyHCHUj
 OC9kdjXrtn+ZQuXMHUuV72ihaNfP+Rd//rYL3OSWD771lf5un8VKpdoecInkqqbhLajYFv5O9K7
 DKfTLwzWaJVMQhjcWH+xSDSVdDy5ulYk2sktDZ2IrjU98UrIxhWblZbBp1sGbsVeXDjnmaNSm1/
 Pw+ST8ED565dtE+jNxTqRsg53iYtnJYGNB7XDU+S+M7f4DkqoRmQACxYJdfh+THIl6czly3p4v7
 KgsSwGlkyUyi2v5eys2q3uisA+rYPvmEo0qoziTfZfRPaBf2M1Y8NHGaS1K2LqtWBAKcRGxsf+S
 mDC4hNzCnas3s5C7OtxMswcS21Hxu1yw0d/m/ryiNujDEfz/NpzlBJTSTZ+g1Xm33/vrwp0KN9V
 iT1tmyK6VLlR++K9/74u+mCzisxVLdYGhtSbDLwHSnMVns/LSchSz+PWsjHDAPbMUJ+wvpRfjrQ
 SmtaFUpBFRQ1mRbO2lZ9xYO00ODSFZ+Lt0i0tQ46RZpr75uQ/pKGu5YI6Gapgelkzcnhj+Q1+Zr
 YxCzvEspw/liL+1HZmiX5Cj5H2M26BgNoH/7ViGKYY9cvWUJ4WTY9FvtRt+hfcNYg7io61g5uHY
 T80AgWMSqkUAhog==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_032520_066783_0FEB66CA 
X-CRM114-Status: GOOD (  10.67  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

In order to keep the uniformity, just move the ffa_partitions_cleanup()
before it's first usage and drop the unnecessary forward declaration.

No functional change.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 1a0f2d1d7a2220e341d4e78240e799a2919fca30..7282aeb3ee498b09010aa2867ef94bf3e0248008 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -114,7 +114,6 @@ struct ffa_drv_info {
 };
 
 static struct ffa_drv_info *drv_info;
-static void ffa_partitions_cleanup(void);
 
 /*
  * The driver must be able to support all the versions from the earliest
@@ -1452,6 +1451,22 @@ static int ffa_xa_add_partition_info(int vm_id)
 	return ret;
 }
 
+static void ffa_partitions_cleanup(void)
+{
+	struct ffa_dev_part_info *info;
+	unsigned long idx;
+
+	/* Clean up/free all registered devices */
+	ffa_devices_unregister();
+
+	xa_for_each(&drv_info->partition_info, idx, info) {
+		xa_erase(&drv_info->partition_info, idx);
+		kfree(info);
+	}
+
+	xa_destroy(&drv_info->partition_info);
+}
+
 static int ffa_setup_partitions(void)
 {
 	int count, idx, ret;
@@ -1510,22 +1525,6 @@ static int ffa_setup_partitions(void)
 	return ret;
 }
 
-static void ffa_partitions_cleanup(void)
-{
-	struct ffa_dev_part_info *info;
-	unsigned long idx;
-
-	/* Clean up/free all registered devices */
-	ffa_devices_unregister();
-
-	xa_for_each(&drv_info->partition_info, idx, info) {
-		xa_erase(&drv_info->partition_info, idx);
-		kfree(info);
-	}
-
-	xa_destroy(&drv_info->partition_info);
-}
-
 /* FFA FEATURE IDs */
 #define FFA_FEAT_NOTIFICATION_PENDING_INT	(1)
 #define FFA_FEAT_SCHEDULE_RECEIVER_INT		(2)

-- 
2.34.1


