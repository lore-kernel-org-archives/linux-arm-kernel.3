Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A665C44524
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kKlS/TXgVj15IkrhkJDLUC0ggPp/2bFcKJ/+UmUw7qg=; b=Dd7oBUvG0Fo7gLq/Z2oA9OhCW6
	gRawuiH+XG2utLkuyFrg9Yxe1nyaAlFgx/kuXHqh0Hzfg1O/Js4ND5BZaScKvYgpgBFHn43DQFtJW
	U/+sUuykwj7hkgVXnAR+dIrDSscrBpkc+BL9/ipYjmoq27ye/nSnbbYx+IywL4FPKEFALy2J+hzqF
	RPXj4QgrbYuMB1KqTLKURKZOv6Dr+8ewhnei0ORTDpN2jfA2vTdgsSFUsj2ror6uZZblvRLc1Y36R
	BPJ49BvzwZtKGcSe4azZ3lK1WSYPvEkRGEz4KC/tvvQum7c9X9RRpipZfPqATCd5z+2o94PrH3HUh
	ryNv1yIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliOd-0000000659C-0Xab;
	Mon, 20 Jul 2026 07:26:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliN9-000000064tM-3qsI
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Jul 2026 07:25:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=kKlS/TXgVj15IkrhkJDLUC0ggPp/2bFcKJ/+UmUw7qg=; b=JX8Q6o/TlmsJYpIahaQVJdjFwD
	+5RYtUEYrPufcsNBoSXydd0A1KHSaQw04EI586z7VL96MJKlAB70uY0IgddsxWTSVO53lrNTjOPXN
	SVa1NXRV5jfCk+JETLANgb/LzUY6/ilBKlQBN3PK8g2vh7GQpfHz9zc4tTbUcDpOoXeTaEyLq8HSo
	pqIIzN2m6YarIyfbPewt8965IRUuo2NjGW5RBb6soj7WALt/YedInXFWJKMNJDjNfd5rhsD4Cne6o
	DdaCBsiShkM95qcHISFvLujpdamsBVWBgwhqsHoDIvgjF/6qcruNzVPIrZrokjLImwNw4YKeIcRp+
	smnBCaDg==;
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wliN4-0000000GL0k-0W1w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:25:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1784532284; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=kKlS/TXgVj15IkrhkJDLUC0ggPp/2bFcKJ/+UmUw7qg=;
	b=VNnts2NWtHkEzyabEqS0Au4JcPqfDLeKKcKIG5pDPdVbQxsjkoWxGFGILaBYM5O4c09iUoYZNEKvspuTTKX8Q/gjW8B2D5ci76EGG4Mh+T8y8MYsQohohQbRC4M75eOOVqpcaf1IhZlgJAeF/67Repec1cD85Ip2SZN/hD+sgRg=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=yadong.qi@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0X7QFSy7_1784532282;
Received: from L-G4162440-1116.localdomain(mailfrom:yadong.qi@linux.alibaba.com fp:SMTPD_---0X7QFSy7_1784532282 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 20 Jul 2026 15:24:44 +0800
From: Yadong Qi <yadong.qi@linux.alibaba.com>
To: james.morse@arm.com,
	ben.horgan@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	lpieralisi@kernel.org,
	guohanjun@huawei.com,
	sudeep.holla@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	rafael@kernel.org,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ying.huang@linux.alibaba.com
Cc: ptg-linux-kernel@linux.alibaba.com,
	yadong.qi@linux.alibaba.com
Subject: [RFC PATCH] arm_mpam: remove sanity check of accessibility when error interrupt is SPI on SMT platforms
Date: Mon, 20 Jul 2026 15:24:09 +0800
Message-Id: <20260720072409.2660-1-yadong.qi@linux.alibaba.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_082504_536793_171922CD 
X-CRM114-Status: GOOD (  12.73  )
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

On SMT platforms, an L2 cache MSC is typically shared between sibling
threads. Per the MPAM ACPI spec (DEN0065B), the MSC's linked device
should be set to the processor container of those siblings, so the
kernel derives msc->accessibility as just the sibling CPUs.

Per the MPAM spec (IHI0099B), when an MSC is not integrated into a PE,
SPI/LPI is the recommended error interrupt. SPIs are not per-CPU, and a
sanity check in mpam_msc_setup_error_irq() requires accessibility ==
cpu_possible_mask — assuming a shared interrupt must be routable to all
CPUs. This creates a conflict on SMT platforms: the MSC has a restricted
accessibility but a shared error interrupt, causing probe to fail with:

  msc:N is a private resource with a shared error interrupt

This RFC patch removes the check to allow MSC probe to succeed on SMT
platforms, but this is mainly intended to start a discussion. We would
appreciate advice on the right way to handle this conflict. Is this a
spec issue, or should the driver handle SPI error interrupts differently
when an MSC has a restricted accessibility mask?

Signed-off-by: Yadong Qi <yadong.qi@linux.alibaba.com>
---
 drivers/resctrl/mpam_devices.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index b69f99488111..e8b2b5e00d7c 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1964,13 +1964,6 @@ static int mpam_msc_setup_error_irq(struct mpam_msc *msc)
 	if (irq_is_percpu(irq))
 		return __setup_ppi(msc);
 
-	/* sanity check: shared interrupts can be routed anywhere? */
-	if (!cpumask_equal(&msc->accessibility, cpu_possible_mask)) {
-		pr_err_once("msc:%u is a private resource with a shared error interrupt",
-			    msc->id);
-		return -EINVAL;
-	}
-
 	return 0;
 }
 
-- 
2.43.0


