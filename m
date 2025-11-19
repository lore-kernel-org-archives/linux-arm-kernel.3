Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349B4CF31B7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 12:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3XSc9spR/u35QhdiMXphwcZbS2vDO8exVGyZtHYCnE=; b=e467PTo0dElBZ3BwiqR7XCTvAg
	REmqtYxjEkiWqSjQY7jC00gwcmHdhnDRsIhlT0w9R5KpNguqbvNtdb2Rkx01qiX+hc0ARLUWoN5Kp
	omrVfc+PFs3WvFvISsOVr5O9eNyOz3HkynlsoKPTDrVqoSbNs02PNYUQlsS6KU2ryLEFvAVx7iFAN
	4lbSCIGS4kSHtO9qIukT0WK+iUPJjNNkZzU5CexGWqN9ckWx+lFOnqU2Aq79zZfgTcTV9iiOm2Inr
	8MZSccOAnYI13xyljsVMKUs/9E3vwdtPQH1zm5kQP8yzqFwwwpj2//L/GW+psvSToRhV12JEzOeid
	1s49TUnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhGm-000000039LS-0agx;
	Wed, 19 Nov 2025 12:26:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhGe-000000039D5-1axH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 12:26:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52BD61756;
	Wed, 19 Nov 2025 04:26:28 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C85C43F740;
	Wed, 19 Nov 2025 04:26:30 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: james.morse@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	bobo.shaobowang@huawei.com,
	carl@os.amperecomputing.com,
	catalin.marinas@arm.com,
	dakr@kernel.org,
	dave.martin@arm.com,
	david@redhat.com,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gregkh@linuxfoundation.org,
	gshan@redhat.com,
	guohanjun@huawei.com,
	jeremy.linton@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lpieralisi@kernel.org,
	peternewman@google.com,
	quic_jiles@quicinc.com,
	rafael@kernel.org,
	robh@kernel.org,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	sudeep.holla@arm.com,
	tan.shaopeng@fujitsu.com,
	will@kernel.org,
	xhao@linux.alibaba.com,
	reinette.chatre@intel.com,
	Ben Horgan <ben.horgan@arm.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: [PATCH v6 34/34] MAINTAINERS: new entry for MPAM Driver
Date: Wed, 19 Nov 2025 12:23:04 +0000
Message-ID: <20251119122305.302149-35-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119122305.302149-1-ben.horgan@arm.com>
References: <20251119122305.302149-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_042636_505703_4611AAA0 
X-CRM114-Status: UNSURE (   9.49  )
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

Create a maintainer entry for the new MPAM Driver. Add myself and
James Morse as maintainers. James created the driver and I have
taken up the later versions of his series.

Cc: James Morse <james.morse@arm.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since v5:
Add Reinette and Fenghua as reviewers
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 46bd8e033042..52a3ea4946dd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17463,6 +17463,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
 F:	drivers/video/backlight/mp3309c.c
 
+MPAM DRIVER
+M:	James Morse <james.morse@arm.com>
+M:	Ben Horgan <ben.horgan@arm.com>
+R:	Reinette Chatre <reinette.chatre@intel.com>
+R:	Fenghua Yu <fenghuay@nvidia.com>
+S:	Maintained
+F:	drivers/resctrl/mpam_*
+F:	drivers/resctrl/test_mpam_*
+F:	include/linux/arm_mpam.h
+
 MPS MP2869 DRIVER
 M:	Wensheng Wang <wenswang@yeah.net>
 L:	linux-hwmon@vger.kernel.org
-- 
2.43.0


