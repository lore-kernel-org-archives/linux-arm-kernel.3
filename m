Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21556C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 13:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yYQf1mecmlHO0caeBZNJ28mBlVuNkUQyN5Eca7Iu/Do=; b=5EQgjuFlmuGa/vGKf56ybuWopz
	49Dqfu0SIpnPC9OMkFclyFDjTIJkO6/N1XVcu6k/4mIZESaQwYsS50/CXajrMBYSkkSjG0A7cyVFV
	7+XlX7JA3D6hBwAFJmtj6Hs9od+wvKXVLAhRu//Q+XoIbVXIfZsfmXaKq7uq5QvYO2bbFdk+2oPSU
	V/1JUkC3OpgCPvQJFZOWlVJObsuikkcSBOrSJxCuYkwH+HTaQuFYuBhc/Pqp+niKX/99jpV99zCKt
	SSIa0J3BpuxrEBZskrLhIP+RkM3VBtOL4Z8hdPKrxI92xmIl2qX5b23V8aMucuvNmah/5O5n2IOaa
	KKWLlx9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzyQp-00000006ILD-3KNl;
	Wed, 02 Apr 2025 13:47:03 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzyP3-00000006I0m-0bn6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 13:45:15 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZSQxx275yz6M4lj;
	Wed,  2 Apr 2025 21:41:25 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 2C6391406AD;
	Wed,  2 Apr 2025 21:45:04 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.48.153.182) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 2 Apr 2025 15:44:59 +0200
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <kvmarm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<oliver.upton@linux.dev>
CC: <maz@kernel.org>, <mark.rutland@arm.com>, <lpieralisi@kernel.org>,
	<sudeep.holla@arm.com>, <catalin.marinas@arm.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] smccc/kvm_guest: Remove the accidental semicolon
Date: Wed, 2 Apr 2025 14:44:01 +0100
Message-ID: <20250402134401.146156-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.153.182]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_064513_326009_8A17DB16 
X-CRM114-Status: GOOD (  10.29  )
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

Fixes cocci reported warning:Unneeded semicolon

Fixes: 86edf6bdcf05 ("smccc/kvm_guest: Enable errata based on implementation CPUs")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504020941.VEeL6nVJ-lkp@intel.com/
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 drivers/firmware/smccc/kvm_guest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/smccc/kvm_guest.c b/drivers/firmware/smccc/kvm_guest.c
index 5767aed25cdc..ffe9f3c013df 100644
--- a/drivers/firmware/smccc/kvm_guest.c
+++ b/drivers/firmware/smccc/kvm_guest.c
@@ -103,7 +103,7 @@ void  __init kvm_arm_target_impl_cpu_init(void)
 		target[i].midr = res.a1;
 		target[i].revidr = res.a2;
 		target[i].aidr = res.a3;
-	};
+	}
 
 	if (!cpu_errata_set_target_impl(max_cpus, target)) {
 		pr_warn("Failed to set target implementation CPUs\n");
-- 
2.47.0


