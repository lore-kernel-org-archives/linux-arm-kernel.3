Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4C9EA3F3A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 11:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wwshHZNadT8HUjInGzJyUY51Bs+OpL0yMVN+dJVHkmU=; b=UoQOCKJhaskC50zSrvEDcFYzLk
	vRDSEydhQkxIY3I7Qk9F+R3TJ03ml0L100Ijl/W2072zK7refjohLlo/lGhYTN91ks5QLCQ5Y4e3Y
	fWGF2ISkyATZKz+OdCZbE4apn+0hqRDY3qakf9cfgfqs7FdMm4BLX72darSBtlmgLy5eiMsiD6fvq
	Pwidi7HGUIT9QLYpEuKw9D8chZSKXPNsBLry8xx2qeunJ2R46IJxJpM4SLzyGLf5SFqKAXxjPspVX
	sNN/dqBaW1aWVDalX/MEr30B7K+AF9FTNQVGh7uLYxND8sNRpfNHmE/zbJ4Sjw/uyFSJPOH5Ha+Pq
	ukzvPYeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vplUR-0000000GrdH-2I8N;
	Tue, 10 Feb 2026 11:01:07 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vplUO-0000000GrcF-3iq3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 11:01:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=wwshHZNadT8HUjInGzJyUY51Bs+OpL0yMVN+dJVHkmU=; b=MU7kon
	WCxEAs3u8KAZ6m5PnGDsM2e4nJbiS/mqLydPqTj/ytwLxnPZT2rL8L5QmiZ+hnXs
	r8wiD/S85ZbCm2erZ2+EARpxQVeR3hBKCimCEwrymGi99yupyoLo0X8JoVKNi8DD
	x2xpgpj8+n8Gmdh7r5tJHXuENfIs6YSkZlmsHI4LbaANXzJtVlO3f7FvPLGOGiUC
	Mz1ceIPwvoUFFqTZhJXFbiwAE0fezHv3J2e1mzJ2T1+UvW5WNOc3QSTO+aVIYNG+
	hunE3Rx8vbHbr6XcnClVdAFzKbbhecRe23lTz1SZ4071wtWdnMGkV+l+qB60pH2Z
	DSh+FbjLMK1VIBFQ==
Received: (qmail 353891 invoked from network); 10 Feb 2026 12:01:02 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Feb 2026 12:01:02 +0100
X-UD-Smtp-Session: l3s3148p1@K7TYK3ZKopkujnuT
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH 2/2] hwspinlock: remove now unused pdata from header file
Date: Tue, 10 Feb 2026 12:00:56 +0100
Message-ID: <20260210110057.10869-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260210110057.10869-1-wsa+renesas@sang-engineering.com>
References: <20260210110057.10869-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_030105_204196_EB5D4206 
X-CRM114-Status: GOOD (  12.19  )
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


