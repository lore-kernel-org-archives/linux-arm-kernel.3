Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CD5C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 03:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/Fq73FGJYAZIJn0FOck3VJIWpNVFvsQRg/dMdGOB0P0=; b=n5mq1ns+EEbGFBKvb6iiobuY0V
	oKtvwPpmegBBIKIgepW6hlU2uB8hE6QkafmzVP9pzg9WbwLg4CTlUJHEPqPoBlreyRu8GdIWhIVph
	7wg2UbaRoPjElQW/sGK8ufHRd/jLCqXGcPQqB1OtPLIyk23xRElQ4ZPX3BtUIn5S+t72eJcdyM9vi
	m9P0lUdPbZoJZMmyvMb21TN5GxixRfPQJwJ7ObOrbKO2i+887jfJcNrIupSj5VCw+o+9u1Vf+6OqL
	qUdVFvCnFeWnKRFsGHwYzLgZQBO1QkEIQDow9M78ziUvIlFKXRdF+r7TaNtRI3ZbaM2yEm+VvUbA9
	GvgCoblQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1zbz-00000002chD-1yzk;
	Tue, 08 Apr 2025 03:26:55 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1zOv-00000002bJQ-1eG4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 03:13:27 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4ZWrl41h9Zz27hgl;
	Tue,  8 Apr 2025 11:13:52 +0800 (CST)
Received: from dggpemf500008.china.huawei.com (unknown [7.185.36.156])
	by mail.maildlp.com (Postfix) with ESMTPS id 0B99014022E;
	Tue,  8 Apr 2025 11:13:12 +0800 (CST)
Received: from huawei.com (10.189.179.16) by dggpemf500008.china.huawei.com
 (7.185.36.156) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 8 Apr
 2025 11:13:11 +0800
From: Xiquan Zhang <zhangxiquan@hisilicon.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <corbet@lwn.net>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] Documentation (arm64):Advanced SIMD and floating point support condition
Date: Tue, 8 Apr 2025 11:13:09 +0800
Message-ID: <20250408031309.2095-1-zhangxiquan@hisilicon.com>
X-Mailer: git-send-email 2.45.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.189.179.16]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemf500008.china.huawei.com (7.185.36.156)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_201325_597159_6915B55D 
X-CRM114-Status: UNSURE (   8.31  )
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

From: zhangyu <zhangyu550@huawei.com>

Because the kernel code cannot be started from el1
according to the booting.rst.
It is found that CPTR_EL2.FPEN is not configured.
After the configuration, the problem is solved.

Signed-off-by: zhangyu <zhangyu550@huawei.com>
Signed-off-by: zhangxiquan <zhangxiquan@hisilicon.com>
---
 Documentation/arch/arm64/booting.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index dee7b6de864f..ccefc42b51bc 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -309,6 +309,7 @@ Before jumping into the kernel, the following conditions must be met:
   - If EL2 is present and the kernel is entered at EL1:

     - CPTR_EL2.TFP (bit 10) must be initialised to 0b0.
+    - CPTR_EL2.FPEN (bit 21:20) must be initialised to 0b11.

   For CPUs with the Scalable Vector Extension (FEAT_SVE) present:

--
2.45.1.windows.1


