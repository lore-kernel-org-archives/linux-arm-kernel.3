Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08EFCA6015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 21:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PlHDZtEGkx24GnRkaHDFHIgAi2YtRwGCar/50QP9w5E=; b=tNN0FiJjT+CCOoCFYz6aFhvHHK
	4f4R5pDJqAofQ58nQ7JcyRbcpuzbInoQ4AIcmPFm9EiqkMRj6k6iOl6Aa/K2rDzMP7mXoBLiTYtBH
	1/FyJ3UkGEMCMOwV1wyzoTwHkUQbaKG4BjB8XNs6p4y4j39eacg18wwvhCZbb2vgwH9PioUSzTseY
	2T4RmtrApbebsrzPd55vIpuBt6MnY0YW7ZdykcUI8qMj9OSAaqFyVnJ/ELHgzTZLkrt3fXtXuU+KW
	wMiWwNzXx9ltf+2Y/JZiH28cZgdCI8clm8BVlXFuF18DcJa5/SA0ao/o1+S3kl5OTornHyCXKzD9Q
	3w2Wp3Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEvfs-000000054YK-4AfB;
	Thu, 08 Oct 2026 21:29:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEvfq-000000054X1-2dSz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 21:29:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2FF41477;
	Thu,  8 Oct 2026 14:29:04 -0700 (PDT)
Received: from e127648.arm.com (unknown [10.57.87.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 955DA3F763;
	Thu,  8 Oct 2026 14:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791494948; bh=CgKD3MtDE1Q86Ohgi+DZhWSgQ31h5N+rd/8QiAIURJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q/51aEMM92pvNqWw/ZaswA1vjgpK3GZaWf5rt0cFuQXvmOhNQ1aASAD7/BTFnSXlM
	 oTR/S3MXW2uZfu0VN7zG3palrPPKsKuhnUePgc+OuejgmJ44FEeg58fdJI2A2qOL/v
	 Qd9vZ/ojKBlZhfjLNDwbdibGJgSs4bJ6W2kM8utE=
From: Christian Loehle <christian.loehle@arm.com>
To: rafael@kernel.org
Cc: zhenglifeng1@huawei.com,
	zhongqiu.han@oss.qualcomm.com,
	viresh.kumar@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mario Limonciello <mario.limonciello@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	Perry Yuan <perry.yuan@amd.com>,
	Vanshidhar Konda <vanshikonda@os.amperecomputing.com>,
	Shubhang Kaushik <sh@gentwo.org>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ionela Voinescu <ionela.voinescu@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	jonathanh@nvidia.com,
	zhanjie9@hisilicon.com,
	Christian Loehle <christian.loehle@arm.com>
Subject: [PATCH 2/2] MAINTAINERS: ACPI: Add a separate CPPC entry
Date: Thu,  8 Oct 2026 22:28:32 +0100
Message-Id: <20261008212832.354382-3-christian.loehle@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008212832.354382-1-christian.loehle@arm.com>
References: <20261008212832.354382-1-christian.loehle@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_142910_713269_34EB69A8 
X-CRM114-Status: UNSURE (   7.29  )
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

CPPC is a distinct part of ACPI, with its own CPU performance control
semantics and register access mechanisms. Add a dedicated MAINTAINERS
entry to help direct changes to maintainers familiar with those details
and the various platforms implementing CPPC.

List Rafael and myself as maintainers for the implementation, public
header and sysfs documentation.

Signed-off-by: Christian Loehle <christian.loehle@arm.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3064942ef05c..88e3bcfeedb9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -327,6 +327,17 @@ F:	drivers/acpi/acpica/
 F:	include/acpi/
 F:	tools/power/acpi/
 
+ACPI CPPC
+M:	"Rafael J. Wysocki" <rafael@kernel.org>
+M:	Christian Loehle <christian.loehle@arm.com>
+L:	linux-acpi@vger.kernel.org
+L:	linux-pm@vger.kernel.org
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
+F:	Documentation/admin-guide/acpi/cppc_sysfs.rst
+F:	drivers/acpi/cppc_acpi.c
+F:	include/acpi/cppc_acpi.h
+
 ACPI FOR ARM64 (ACPI/arm64)
 M:	Lorenzo Pieralisi <lpieralisi@kernel.org>
 M:	Hanjun Guo <guohanjun@huawei.com>

