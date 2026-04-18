Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8E1F436B1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Apr 2026 05:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LdrA3t6CKBZ6X0V7Cw36ls6aaMYWbmXBN3bXm4X4X7k=; b=g0jJfUPtmkXASft1DihKuYsuN/
	zZM9vkYHOOQALOf0EADWjAPvw3/b7CWs9WUydYnymayO+EWAawoYQABfMCcKWYOsXYej2ry5ST/d8
	EQI6yaTEWZg1ZwaJMIKWvB37+eicSSSkR7Xui6J5vFdguZPnainjq6xYhlvSEqcIt7IeHy2QUbYnk
	ILCQKkUAlNtgEuSfDAAoHTxbwHDnYEJdcs61SImbzjnw/hXO2iJQByaO/Rl+RKbXdTV0HPmO861rK
	sV3x9H68RXxEqpl0D1eh03bI2DjaMpN187lMepg5VEDyQesi2DsJ5rIunPx6IBFA34NSHuK8TtLTq
	Yh6ZPSQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDyHs-00000004lBU-3oHN;
	Sat, 18 Apr 2026 05:32:12 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDyHp-00000004lAj-2oe0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Apr 2026 05:32:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1776490318;
	bh=LdrA3t6CKBZ6X0V7Cw36ls6aaMYWbmXBN3bXm4X4X7k=;
	h=From:To:Cc:Subject:Date;
	b=Q5LRrIG01ub5uM1CVFpaP7FAg6Rw1AZCWKlHX11rD2ZZxNj+jLFB0I5ZBCD1cwD9x
	 Jxg3qR3RlQD16yS9oXvu16amL+LHhwVF9YoknDO4A4MSpQEWncly/7NWmMteAx+g5W
	 M/SZeSOGcXGYHMeHccMaGhsv15WHw9S/MgEblABs=
Received: from LAPTOP-P7BTVCHO.localdomain ([139.226.117.101])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 7F7AB6F5; Sat, 18 Apr 2026 13:31:55 +0800
X-QQ-mid: xmsmtpt1776490315tkgb75b7n
Message-ID: <tencent_F6E384A40D990A279B460A0CDE1927FDF509@qq.com>
X-QQ-XMAILINFO: MjYvZRNXAeJ25d95iAtKQZf3C0ExXzZ1i0gnEKyxm1V6xRD0sB01FGsAFyfH9g
	 KzUNLG3t03F/3P9HzZdQxabE26gbbh3uPlZoeYruRowKZz0rOQ3dRQmLkliVLYQAvI8qbmEi4GJg
	 vZeR0J+o74er4xVgNWdLyVC9X52YT/F8ZKH/CQOa+SQw36fwY+Nv4LtlHJFNxtdoTzWvay8yk0mZ
	 B9Y55K8qVbpSJp5lTWWfR9tWzmPSC8lYmnEdRRXDlc+NZnzhkGgrpLhNsvciKQzuWgdkpFrAiDpz
	 b6Z3VwTrLGGmsA0k8OifW6XutuqudsvaqNvyl4kGr0hrjgZm/ALVlRN2Naxgn1fTHjpXH5wqeEel
	 cwQ/aoao3S2zBOXE1knBfyUbrrXotcBddI45AZSsGUnCAWPVtxd6KjscnGdPYZCWnOPSiYGEGODl
	 F9Aq8d82+5y65TsSt+PyA1hYEHaydEwnVMV1MSkhxz7o0LXW+WExELZFvpQ196FPR+2Yu+y6h/eJ
	 utwA9IwOVqP8p1LVGS6OAkeo+CwNwN/KorAccULi73wvS5l9v9uvReOuAiVWTH9AzIqr5/XP4acl
	 A08N1ukRIg+pXvKI5rh0zAAxftpLbkiIKV+9Nz5skxi67yNtysqmokATKAH/DjurWMrr53wzrnyB
	 ZHr8lC1QH/kO6dADlAsW2oGY9McUnKUNBuFThQymG3V9xTL30zj9pr4O3pzYMDebQFcK/hRGMX+B
	 fvnLa49at/Yo2eyUBzZyhKIbDE1OnSBm3Wala/q/9+fw7A+yqfnCNmxIllB654Dga14rwGyj5OQZ
	 cjv4q7KHv8ZZYljSnQ5DwvoE2BYTDTc9sy2WNo+QbOEgZBDt7e9ZCbglqgATxnW2Kj68IAeboEmf
	 endak0IcMcczHLBCgyi4ZI+qv9PHFJFKO0XgspwEnJPi59bWVvfU1O5hMS9hr5UeFUJcRt+eLLo7
	 5mNeeSkrl0QB6hBfO+ooRVQxSUOa8Xy6S7ACYmlscApaTLDhTA8fdIdFAfl+VaN+RnLYCmYC4D5I
	 ww68xyJibIMpsJ3c0m6Sw5ggUNA95WRN/xqWatHeIORhohTMfqVHuaRDm0lS/AZN99S/vPjE7lzm
	 Dwe+/gq9Tqe3l5mUSbzvV+4wRpEBGHy0T7UVz7K5YY5802VVgxSVmk5KIdeaTZFmpBgdSk
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: leo.jiang1224@foxmail.com
To: will@kernel.org
Cc: robin.murphy@arm.com,
	joro@8bytes.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	LoserJL <leo.jiang1224@foxmail.com>
Subject: [PATCH] iommu/arm-smmu-v3: Stop queue allocation retry at PAGE_SIZE
Date: Sat, 18 Apr 2026 13:31:43 +0800
X-OQ-MSGID: <20260418053143.27878-1-leo.jiang1224@foxmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_223210_070281_1F72E2C8 
X-CRM114-Status: UNSURE (   8.95  )
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

From: LoserJL <leo.jiang1224@foxmail.com>

In arm_smmu_init_one_queue(), the loop reduces max_n_shift if
dmam_alloc_coherent() fails. However, since dmam_alloc_coherent()
allocates at least PAGE_SIZE, retrying with a smaller size after
a PAGE_SIZE failure is logically redundant.

Moreover, if a sub-page retry were to succeed due to concurrent memory
release, the hardware would be configured with a smaller queue depth
despite a full page being allocated. This leads to inefficient memory
usage and unnecessary hardware performance limitation.

Terminate the loop once qsz reaches PAGE_SIZE to ensure logical
consistency and optimal hardware configuration.

Signed-off-by: LoserJL <leo.jiang1224@foxmail.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index e8d7dbe495f0..e0ec118ff560 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4418,7 +4418,14 @@ int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
 		qsz = ((1 << q->llq.max_n_shift) * dwords) << 3;
 		q->base = dmam_alloc_coherent(smmu->dev, qsz, &q->base_dma,
 					      GFP_KERNEL);
-		if (q->base || qsz < PAGE_SIZE)
+		/*
+		 * If allocation succeeds, we're done. If it fails, only retry
+		 * if the requested size is still larger than a page. Since
+		 * dmam_alloc_coherent() allocates at least PAGE_SIZE, retrying
+		 * with a sub-page size is logically redundant and could lead
+		 * to sub-optimal hardware configuration.
+		 */
+		if (q->base || qsz <= PAGE_SIZE)
 			break;
 
 		q->llq.max_n_shift--;
-- 
2.43.0


