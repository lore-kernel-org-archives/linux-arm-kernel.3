Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9564FC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 16:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cLexOwpra+KhMNJ9Ul//pg1dp70XjarN9VD3z17dQ5c=; b=fd2DOB3nrgEetkjRkys8fyb1Ix
	cq0xb7LSSZIvNv0elWJh/Jkzn9d7iVqBtkjgyX4kczsH5/ATO8RqXNRXHVIf5TiWf+SrbkNVMGlVe
	BrN2wfK3hfmJNckbhUKtDA6ZmGkbqk8l3IRUW1kYWrRFaF61S7iW+6bChtZG5yiod8hzvI2/jnxxZ
	vRi/ZG60K644G/GkCOYMZDca57RhGIk0dv83xvRDzwq8UMuhZAPQWuWX2RXmWilvD3nyfeypc6BPe
	Cp21EQX172LNWFvPWAoQA8/6l4ZwySKqL2Qhk9NzFNJX4FfUNtckeh90grIVk1GcZM2YyMaZtG6y6
	c05J5bkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3eA-00000005Cep-34DI;
	Mon, 17 Feb 2025 16:07:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3Di-000000055XP-1jIN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 15:39:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A6F01063;
	Mon, 17 Feb 2025 07:40:01 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 765B53F6A8;
	Mon, 17 Feb 2025 07:39:41 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Mon, 17 Feb 2025 15:38:54 +0000
Subject: [PATCH v3 13/19] firmware: arm_ffa: Remove unnecessary declaration
 of ffa_partitions_cleanup()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-ffa_updates-v3-13-bd1d9de615e7@arm.com>
References: <20250217-ffa_updates-v3-0-bd1d9de615e7@arm.com>
In-Reply-To: <20250217-ffa_updates-v3-0-bd1d9de615e7@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1988; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=aidoWnRBdKS/bzj9yzmy9eXwgGR2HXGsyDF1QbYB0U0=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBns1gv6fDyFE6SRIJTmRZSK7AGzajqpMcsbZ1Mf
 is3SarX/ISJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ7NYLwAKCRAAQbq8MX7i
 mGnKD/9nTGkCjRYMkNvtTNTZ+ba+EFDlgHhfCUjpG1zmPMjavtH3ijDKfC9w9dt9Nu9p4L5bn+c
 vjNaZ3Zui8C5Ui6FJjDyRaUm2O77nu73bYwuaD6t/mXHDwCh2hN1shp4KHrBtzR9u3lP3RhpkvR
 8gyGvDLNZfsRn+MyR9ClEqn4gWCaMnQLdlsWOnlQsYn2ss0vYYh4f5GLzPRINldNr13B4OpVaL3
 cD4vLjg8PHUNxv/No8Hy/InZvjwKMlpoOrCPxav/psSaQmbNKS/fmyXIkdxZfpZRe0tBKSEVsH5
 ZNqjbVjvUPV/h5Z+MczXV3hFoeNXJ5+3t7GFIQ5eyPi607V+LXSk7FuMTO4iIGnTDo5LxM5almQ
 blkjh/bIhVzvudwKKaxoLW0rihZ0cX3fW2DWf2jh1BaDMatQ5Kkhf3/Q9GIAqzw7LfsiDG5z9h/
 lGOWelMNCGy8YfjqkRLLbreFvaHFDqrMotSOBr6qQn5NZhriUDI9a/smuUllOZytYj8Ssyx7dEb
 LQLQhixX5ofSIDos2BbQaMnXxxW+XiyQ4y+K0Pvot+88jcjR9BEES0MApcRJDt4Euh22Cokfp8q
 BIY7vHs01M0rnP99lBSAFAMAlAJLs43BsbS/fXsidFQpQQNe0xKOnAu6XCGs29HM+hpAquJjkRE
 sgK1MQ/qfLcMVkw==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_073942_543448_A357CD7E 
X-CRM114-Status: GOOD (  10.86  )
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

Tested-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index ad2f6b410e4431bb133fa0f05dd3eec802f5ee07..43e033edd6c7cd16322c204e882a84cfe45abbba 100644
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
@@ -1509,22 +1524,6 @@ static int ffa_setup_partitions(void)
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


