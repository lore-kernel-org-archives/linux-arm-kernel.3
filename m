Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAF0C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 11:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjUE4buMZD2GCrpVE3Modbxx/7T5nUWJycsT2BbzFws=; b=rscudllHoCUGcoRwylQcy+zhEv
	8dWVsuGi4fRB/qu50C4AjdYf2siLXQl7RR99TXmp0jceZuf4lkafyfKmMovrQ+yTtErCv/cXdSaq8
	xgws2tBCo6jLfp4RqVLhiD0X20ayrbrQ257Zkjfa6h0x/Ex5zJXgXFn2b2vk40L/H/5BkgESfWoeP
	RxnMGaalBayHGjGH7EaE2xKGmhjlN+qRljLwuq3E9RPuWlP1wWiwrccvWJzgfveg1kXbGLty1TTrE
	7PljPqZFZobob29QsDbTi5E4T/0wIU76QCN91u6fKP8hSu/udYn8ILTXtS/mc89kMYFoCdV/cHQIE
	hZFVitDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdpOR-0000000AWz8-3Xx6;
	Fri, 31 Jan 2025 11:41:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdp9B-0000000ATpp-3JhR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 11:25:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11B401007;
	Fri, 31 Jan 2025 03:25:43 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E128E3F63F;
	Fri, 31 Jan 2025 03:25:16 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 31 Jan 2025 11:24:11 +0000
Subject: [PATCH v2 11/18] firmware: arm_ffa: Upgrade FF-A version to v1.2
 in the driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-ffa_updates-v2-11-544ba4e35387@arm.com>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1372; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=eazUrEHzI9tgu7HGeZo00Su8OKcdX3GAHEGm8aY/0lo=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMQduI8J2ZBF/yjeq/uoVdCw7wEPbFdQjDr/
 m5zy7spEcyJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzEAAKCRAAQbq8MX7i
 mDfZD/0bKrdYu/vpeuu6kBgWsDBaaRfdKZ59GwkwC87iz0SXQYmWpu6tZWe71+TmJJhtx4HLwiX
 ElAQDv7+MvEjboXR2IcTgzMiAYg30ysRk5QYo4/M+QU25gM/APQhWoI/kZpuV65LI52532Jk/8C
 2kWXvhJCwc6ZzKTZQVzlsvlUyZgOyQ1puX6p+JQYwRoVI2fug485dj9tHWsCrdgJ8kSDpPwAdrG
 j8SGnd0R8P9dPMy7OcQJz4fugW7aGzu8qqxDdBbzt75STbAZ2Tt+J7hOMU3q1xNgv16a2krB1Id
 MqkhdnzRljShO0oT7wpu0mPf9Iu1r9wukiIXtG7meCKv0SW+KGCkYYum8T9khTkpQejpUFem0DL
 uIZqhC9mZ92OYJhWSjRor6TsraeyfE30pWlg4PQUlCvIrc2rI6e1j0Qdx9bnS+j6S10c0MXdccU
 uWKGNMYx8T5l1ONQv2h0Y3hhAqbGhe5vC9Rp3J36pHDIFG2L7j36MqiFMxFidZR580SAE01szIS
 AtVEWIV2TaXDf0qYft8LaW5yrJ3591gWzXS80pc3jtJFKVXKRx4I8Ld9tIY3WSs1mDwGaIdxcC3
 U1ksvimT3Or4xYoRsbg22O4PmajhypXQ/6rBuY2OWK40AFMfrKRXDUfculbF4NGkazus2CrN6Om
 0OkIWNOtbWb4zjA==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_032517_874936_CF9944C2 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

The basic and mandatory features of FF-A v1.2 are all supported now.
The driver supported version can be bumped from v1.1 to v1.2

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 2 +-
 include/linux/arm_ffa.h           | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index cbe0fe5f22bd8c60f3070f5e45d8722e3c9c23c8..8188c8dd3ed6ceb9e9966148b42ef2f88baa6dd3 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -44,7 +44,7 @@
 
 #include "common.h"
 
-#define FFA_DRIVER_VERSION	FFA_VERSION_1_1
+#define FFA_DRIVER_VERSION	FFA_VERSION_1_2
 #define FFA_MIN_VERSION		FFA_VERSION_1_0
 
 #define SENDER_ID_MASK		GENMASK(31, 16)
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index bd78deeff284e2f46d42cfc7af218f4a0f3d1478..4fcbdc70cbc985eabb90733329c974384d229053 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -112,6 +112,7 @@
 	 FIELD_PREP(FFA_MINOR_VERSION_MASK, (minor)))
 #define FFA_VERSION_1_0		FFA_PACK_VERSION_INFO(1, 0)
 #define FFA_VERSION_1_1		FFA_PACK_VERSION_INFO(1, 1)
+#define FFA_VERSION_1_2		FFA_PACK_VERSION_INFO(1, 2)
 
 /**
  * FF-A specification mentions explicitly about '4K pages'. This should

-- 
2.34.1


