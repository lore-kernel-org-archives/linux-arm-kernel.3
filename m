Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5BBFCE08C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 14:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6DWopARxsGIHgofAKkc6YLXAgIfhg6Gttew4mrTxnMo=; b=lG40mwGO6Aqx48FHjGQDu/vx5+
	PRo13gkxlaDUU5Jixt6b80DGaWeexPUHKOz5bkMYq13IeyHBCqbDCvCb4ANxtw/NasufOFPdnfERK
	RmaTGvHe4n3sIvxpO0wKjpT9pDCIygtVFN7fkYLle8LttFS6hw3S6VpZ+GXZVLEwGUsOEul9Q+XrE
	RnwRxHvZPKZ1i3Xw0QtUTlohKD+R9Ll6G1fpQlTtbZcGf+8K3x6hhCCY3TSruGVoHWFGzZ/z4P4VL
	DSVmZqP3hISjtcYQCJSbYBP2F8hwZPiMveIG6Iy3TtdY9/0sl/8n++s1yhdl6tg7Jy6O7w5W1PyjQ
	Yo+3tFTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvc7u-00000006IHz-0fDN;
	Thu, 26 Feb 2026 14:14:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvc7s-00000006IHe-1Tmq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 14:14:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0B23497;
	Thu, 26 Feb 2026 06:13:49 -0800 (PST)
Received: from e142892.manchester.arm.com (e142892.arm.com [10.33.8.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 715353F73B;
	Thu, 26 Feb 2026 06:13:55 -0800 (PST)
From: Mike Leach <mike.leach@arm.com>
To: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com
Subject: [PATCH v2] MAINTAINERS: Change e-mail address for reviewer
Date: Thu, 26 Feb 2026 14:13:53 +0000
Message-ID: <20260226141354.638962-1-mike.leach@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_061400_436771_899E10B4 
X-CRM114-Status: UNSURE (   9.47  )
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

From: Mike Leach <mike.leach@linaro.org>

My e-mail address for linux work is changing to mike.leach@arm.com
from 1st Jan 2026. Update MAINTAINERS file accordingly

Updated .mailmap file accordingly.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Mike Leach <mike.leach@arm.com>

---
Changes since v1:
Add sign off in new email & change .mailmap (Suzuki)
---
 .mailmap    | 1 +
 MAINTAINERS | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.mailmap b/.mailmap
index c124a1306d26..064c00568d20 100644
--- a/.mailmap
+++ b/.mailmap
@@ -566,6 +566,7 @@ Michel Lespinasse <michel@lespinasse.org> <walken@google.com>
 Michel Lespinasse <michel@lespinasse.org> <walken@zoy.org>
 Mickaël Salaün <mic@digikod.net> <mic@linux.microsoft.com>
 Miguel Ojeda <ojeda@kernel.org> <miguel.ojeda.sandonis@gmail.com>
+Mike Leach <mike.leach@arm.com> <mike.leach@linaro.org>
 Mike Rapoport <rppt@kernel.org> <mike@compulab.co.il>
 Mike Rapoport <rppt@kernel.org> <mike.rapoport@gmail.com>
 Mike Rapoport <rppt@kernel.org> <rppt@linux.ibm.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 4d879f6a7b51..257d2fcb9651 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2719,7 +2719,7 @@ N:	digicolor
 
 ARM/CORESIGHT FRAMEWORK AND DRIVERS
 M:	Suzuki K Poulose <suzuki.poulose@arm.com>
-R:	Mike Leach <mike.leach@linaro.org>
+R:	Mike Leach <mike.leach@arm.com>
 R:	James Clark <james.clark@linaro.org>
 L:	coresight@lists.linaro.org (moderated for non-subscribers)
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
@@ -20725,7 +20725,7 @@ PERFORMANCE EVENTS TOOLING ARM64
 R:	John Garry <john.g.garry@oracle.com>
 R:	Will Deacon <will@kernel.org>
 R:	James Clark <james.clark@linaro.org>
-R:	Mike Leach <mike.leach@linaro.org>
+R:	Mike Leach <mike.leach@arm.com>
 R:	Leo Yan <leo.yan@linux.dev>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
-- 
2.43.0


