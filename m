Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4D1D35144
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wsX/1VG+KmMW/70MpWHcnfgt2pNqZbpfdvHVMNyqlE=; b=KeeG5jGqVbvi0wSJp3/04lAGed
	f3WFzuoVzWtTs0J14zpypAVCo5cgvX9njWLxaCHgE1bwl5XVikipi4mla7OvSmOTeDzCSFLEnWFlj
	YlvXmin9ZxLAOKGBncyEcpx9+9Z6BgCEkbltfoMBPufWNjKeBbzn/SNrC541t1sm1ljXCQz0317XB
	fsL48Q6sly1lG98yRUbo0oX4D/drjpDefQKmr9QDDYrfyKj3uZwdd8AnvoycTkavB+tMJcT1U7ZVr
	WurQRBQJIjNma/cBAoiRa4wppx3YnmcuWPunG7qy9ahq7GX+y94XZpXo0UQ55YZ9nh32sr5rt4crn
	U8E35ndw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pk1-0000000EAy2-1tMn;
	Wed, 01 Apr 2026 07:11:53 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pjx-0000000EAwB-47Oa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 07:11:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=9wsX/1VG+KmMW/70MpWHcnfgt2pNqZbpfdvHVMNyqlE=; b=RqJy0N
	0mG83qdygy77oyGfyiNUbnk7YwV6prWhRLa5N/RnlQEWoRCKy/1ZEbsQYFjE/g+F
	iezblfFMCge/gFIBM9gKZ/FJCGCg6GpufMs4IIir6pvIefO5IFdUePu418QPnkWv
	5hXLcyr3S9SzxJ5ol2du9W5Om2zRhBgYH58PybbfFqcDrnWYSa3g+DEM5y33ccFE
	eaGi9aajluw1cY60GEzUFto06hzrRUMp/1+AY0u7odSAbL+CAgHJDYHajUWWsM2g
	Hrwr2O/2hPRVLNNdaVyQL9VyIuKT+dr55yRf+c1h69UxxZ4xShEgRE3dX9vyI1Al
	nX9FJA7dQfDL5L+g==
Received: (qmail 1986555 invoked from network); 1 Apr 2026 09:11:45 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Apr 2026 09:11:45 +0200
X-UD-Smtp-Session: l3s3148p1@vHzqy2BOUtEujnuR
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH 2/2] hwspinlock: remove now unused pdata from header file
Date: Wed,  1 Apr 2026 09:11:40 +0200
Message-ID: <20260401071141.4718-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260401071141.4718-1-wsa+renesas@sang-engineering.com>
References: <20260401071141.4718-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_001150_907789_9C42D86E 
X-CRM114-Status: GOOD (  12.51  )
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

The last user turned out to be obsolete and was removed. Remove the
unused struct now, too.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 include/linux/hwspinlock.h | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
index f35b42e8c5de..74b91244fe0e 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock.h
@@ -25,34 +25,6 @@ struct hwspinlock;
 struct hwspinlock_device;
 struct hwspinlock_ops;
 
-/**
- * struct hwspinlock_pdata - platform data for hwspinlock drivers
- * @base_id: base id for this hwspinlock device
- *
- * hwspinlock devices provide system-wide hardware locks that are used
- * by remote processors that have no other way to achieve synchronization.
- *
- * To achieve that, each physical lock must have a system-wide id number
- * that is agreed upon, otherwise remote processors can't possibly assume
- * they're using the same hardware lock.
- *
- * Usually boards have a single hwspinlock device, which provides several
- * hwspinlocks, and in this case, they can be trivially numbered 0 to
- * (num-of-locks - 1).
- *
- * In case boards have several hwspinlocks devices, a different base id
- * should be used for each hwspinlock device (they can't all use 0 as
- * a starting id!).
- *
- * This platform data structure should be used to provide the base id
- * for each device (which is trivially 0 when only a single hwspinlock
- * device exists). It can be shared between different platforms, hence
- * its location.
- */
-struct hwspinlock_pdata {
-	int base_id;
-};
-
 #ifdef CONFIG_HWSPINLOCK
 
 int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
-- 
2.51.0


