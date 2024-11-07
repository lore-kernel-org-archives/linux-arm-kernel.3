Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BFDD5D687
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 20:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3W4q7g9ut2Q8rLD2mKG7lk4sy0uJn/7tWya/6N2/E8=; b=fcS2lQZqHBtZQeQLBhD0x5mfoI
	NgW2LqXSE5STfQ/xshnJqJB3aHzF1Z75btMG48tLlMDfBJnKfT7AKKk+GFONcK0dZy3A/ln0+46bF
	zouSS1AhiGO/k/wM4CCTDBXZAJNY9VMrAdUoLmQdBuo0Lxk5VqflLjChqO6kFB4gIa/aOVVEnWJe9
	NJbdK88hZE2YiHbbopoocDQMEwMjYFQY6+vD5kCYyJz59UW11X12VjtGAWidmRcfvXCHNvztlyjOp
	22UTnv0t3TU4UUVKZo1I8yKLvVGFEB2p8r/h8YTtgpPLEOAF9DI32SBSezus3xxC/gdD6Q1NAP4hd
	oK91YRYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t98jw-00000008CRH-496X;
	Thu, 07 Nov 2024 20:04:24 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t98UQ-000000088fs-105T;
	Thu, 07 Nov 2024 19:48:23 +0000
Received: from umang.jain (unknown [IPv6:2405:201:2015:f873:c173:4b:4a04:3a21])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7B4DFA44;
	Thu,  7 Nov 2024 20:48:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731008892;
	bh=f0YywPWanEM24s0q52GKso9Nv195uicG46KTsPUxLW8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZyAD5dPwUsqoCX0oK08eQBVUxzuucLvpE56CEQAcS1Bg2BQ5gySzMC4cKZgAS41Px
	 0VteNgF5hMwh7EEv6c37NDD6FUPMz8ha9H6yXOXyWJxiO9r9N9TDBOv4EbXHM1ob54
	 vurRy453/TxYeVJO2wOYSU6LAEe/j+XR/1GEGuOo=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 3/3] staging: vchiq_debugfs: Use forward declarations
Date: Fri,  8 Nov 2024 01:18:06 +0530
Message-ID: <20241107194806.90408-4-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241107194806.90408-1-umang.jain@ideasonboard.com>
References: <20241107194806.90408-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_114822_436280_05B07AA1 
X-CRM114-Status: UNSURE (   9.25  )
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

Use forward declarations for struct vchiq_state and vchiq_instance.
We can then drop the vchiq_core.h header from vchiq_debugfs.h.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.h  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.h
index fabffd81b1ec..b29e6693c949 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.h
@@ -4,7 +4,8 @@
 #ifndef VCHIQ_DEBUGFS_H
 #define VCHIQ_DEBUGFS_H
 
-#include "vchiq_core.h"
+struct vchiq_state;
+struct vchiq_instance;
 
 struct vchiq_debugfs_node {
 	struct dentry *dentry;
-- 
2.45.2


