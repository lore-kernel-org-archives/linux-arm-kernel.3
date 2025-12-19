Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C63DD78783
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 14:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FxRRySUQAmQQGS37Z35MmmKWhPZZY2M1tezZ/ckkK0Y=; b=ey14P5bF+JP39FzGAA0btff3/i
	kw0W2SjFty0LsW1x4W35bspO6sjxiaGckea+IOuGHVdzsZ9ORqCvyjo+gsAiuOqibYRF6sMgmTsBg
	mCP1Ja3sjQ7Ohu5F+pECwD4BpUJDhPzehR36UZCePXYWDunSXi9v/nYxtPpgYpf7rOUZNu0WrKNQ0
	l+2bQFuMxFsJ8Hx/cB5XB4bVaZSAPK8si+snxBEmkS9tkfcsTXHmUkDczTMUpCy3cQBC9oQEiYDzj
	v2HXGnrMxzXliiUPfPo3Rb+aYXECx9TGHjwnBDvi16bQoMHFJEyGA1QygBuFCDQgPHAc0Y3VlgqUz
	eIipJ7dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbnu-0000000ASDw-2pSY;
	Fri, 19 Dec 2025 14:50:02 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbnq-0000000ASAa-3n99
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 14:50:01 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=FxRRySUQAmQQGS37Z35MmmKWhPZZY2M1tezZ/ckkK0Y=;
	b=cuXI98sCVP2g5k/pY2YI6OFXvVTZwb5i9qBNyu4Pc857dpkQbiY32UTM+NaI/FDw9HoaLoQyg
	lBGJQkLWdHEY3fV6fZduB0xX+UGhEvXbOnEMlVCOmPLsSKhmz+FIpMQDL4aBvaa1830orUb8vai
	al5qC5KxcswKQmcqk9GCtvM=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dXr3b2JtGz1T4G3;
	Fri, 19 Dec 2025 22:47:23 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 975F520109;
	Fri, 19 Dec 2025 22:49:38 +0800 (CST)
Received: from localhost.localdomain (10.50.87.83) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 19 Dec 2025 22:49:38 +0800
From: Hanjun Guo <guohanjun@huawei.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Sudeep Holla
	<sudeep.holla@arm.com>
CC: "Rafael J . Wysocki" <rafael@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Hanjun Guo <guohanjun@huawei.com>
Subject: [PATCH] MAINTAINERS: Update the maintainers for ARM64 ACPI
Date: Fri, 19 Dec 2025 22:49:06 +0800
Message-ID: <20251219144906.348353-1-guohanjun@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.87.83]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_064959_497698_EB829C06 
X-CRM114-Status: UNSURE (   9.78  )
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

ARM64 ACPI patches go via ARM64 tree, but the listed maintainers
for ARM64 ACPI don't include Catalin and Will, and there is no
F: line under the ARM64 architecture entry, so emails will not
route to Catalin and Will in an automatic way.

Adding Catalin and Will to the maintainers entry for ARM64 ACPI
to fix the problem, it will make life easy for merging ARM64 ACPI
patches.

Adding new maintainer entries for ARM64 ACPI doesn't mean the review
work will balance to the new maintainer, patches still need to be
acked by currently listed folks (Lorenzo, Hanjun, Sudeep) before
merging them.

Link: https://lore.kernel.org/linux-acpi/aS2ZTfS9YVO98Exe@willie-the-truck/
Signed-off-by: Hanjun Guo <guohanjun@huawei.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..6050d94a50ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -335,6 +335,8 @@ ACPI FOR ARM64 (ACPI/arm64)
 M:	Lorenzo Pieralisi <lpieralisi@kernel.org>
 M:	Hanjun Guo <guohanjun@huawei.com>
 M:	Sudeep Holla <sudeep.holla@arm.com>
+M:	Catalin Marinas <catalin.marinas@arm.com>
+M:	Will Deacon <will@kernel.org>
 L:	linux-acpi@vger.kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-- 
2.25.1


