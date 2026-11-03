Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E014A606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 22:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z9S+Gx5C;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PCEGkfrn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jbi/k6dB+LyAzak7dxYir2R3Vy4OMdTuQduaHbYugqY=; b=z9S+Gx5CguYjXE
	Y5Z3gWPNFmwrDeotHp3qCgzo8+DPPPm3ZUpIDEofvHD7UYVfb7Sxme14h+TXsD8//5E5miBYjuoqt
	0sL5QmMCp8udsj20qus0h/LU1PVD5mjg3DeLywmBaAHQicnaFt93rTxRpLCWJ4M7j3zoqUrU/jKSR
	58clK2siKbVwnM6fyhp/UxL0Qa+Qk2MxmCaUb5PklbC0VC03UMLv8NecVmhbN3ccce2AzWKoXJ3+E
	V2vtVTAbl+CmIVGq5fhuIIPrrVbTEovEzLQ1XpQRWt9u0U/iB9TeXI8LlDX1tOUsZKM5F7IB6nSZV
	MEdR9Af+GyNDVC5T3k1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMuP-00000003pmx-2SoE;
	Tue, 03 Nov 2026 22:23:13 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMuM-00000003pjx-12zR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 22:23:11 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-369f33df08eso42132eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 14:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793744589; x=1794349389; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jbi/k6dB+LyAzak7dxYir2R3Vy4OMdTuQduaHbYugqY=;
        b=PCEGkfrnU/blQr3fEFW5vtVf/JF1R35oY9IEOQYEzAQ//bTfK3Txz1Los3sLZoOXUo
         Bn+OdHLZCBFrYtszPPH8ykIgx90Y+RIjl2pUUnqDwKstFsFmOOwdntntyjeOWyI/Bw7d
         hnBcZRNbqpzVLrKtEiWGhg8wEfC+dY6mc39rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744589; x=1794349389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jbi/k6dB+LyAzak7dxYir2R3Vy4OMdTuQduaHbYugqY=;
        b=H9GTwa816z9oJklWscMeq6vu9DS2wneScntgGotJTa4cvQVYBjGEt7mAIbEZMZJv2y
         x+ZbhzKN5QLnq9GQHSze4mXL4gzFskVbtHdJPHLHRqQ2MHJyNvTmA9NLxNlSOgReH71L
         5fcqtbavYSxS7xYxlVm6O2Kfd9i47mT8bu4vgmeCtNDLszHxj6EKudMz4wTLhO7ahYpQ
         q5ButEPNktyHtN3rIQu8XONF/9Ua0qGBAXTYWJlWPIgXoQ5OPTe/TXO2wgvAjkcL6MwL
         u1+Wg8x+UiIt8ACgRZaFAmYOz7PkvDwca/RgSRZhVrv0oRjXeRjEeb3mU/+EMg9FWvMe
         xxSg==
X-Forwarded-Encrypted: i=1; AKwUvBxBVqyRfiXjN1S7k4yAHCbDYtY8PFRVrmNEosMZIkJWP2xAUM+BbheW5WT65Swao/sg9K6RfFV/r+0u/1iPo76E@lists.infradead.org
X-Gm-Message-State: APuU4Z8aN+2xB8G3K8FUv1bbdwevcgzTbJU4UWxFkvk95akQjG/qlu4s
	8vmNfvJ/KELV3ktETkT7J0XUzkGkGueQ/YZauJ+uqS/4Y9oXJJaKHvJHWgPLKLytB0CnHI0f9+X
	e+Y0=
X-Gm-Gg: AYBFou1NIuRANqh5PmnLwSsQUEb08h0RYAzgGi16+wZJH90/iuDNs9FHOzqR/H2NWGU
	U7BtZ8dCPMN/qz57/YKo0Oki47DzclyXwzwTMb9zyRtMXgetrcJLQX+TcEDtj11r6S3ZzCfoHl0
	Reikq0Emv+b2VPV84R8odCn7V8YDhCpfhFqJXgAt8d1yXwaZYwjl5enoTP8msWZbXORrXChwjtO
	pA1oQ5XAp1Je7D1QYGmBV1WCJGUft3V7d2no548C1MzQqurqfzlMY6M9vAbj/GmvBCplUGMrJyi
	rUt069hKBNuMcB2lhHjP046E2+jbclJUCrpdRqlJWCLN+s4Ll0mMvsTHbIklOVZB9QB+dOphIzt
	0JZ/IICGetZpJLKue796kH4HNic147b6pH6m3p2lGBoNgWL4z1Qt+iMYZyKPXW5J3QUlatG+S7E
	XZ+Ho2psgt3R8LZzFNunuXSUeOE+Uq95Nb9Yv4kfXnuuPjfnoq5ZIGiseOAri8roy8EwdFXCh5K
	ZCSalvmrkvdJXxddKkzuNsBtB99A/s3AgRLpbKToPPeuCrDl6kQAbcYOLSRV21CyYORbM5d9MU4
	YFiJhFz5RArsoUoyDmXhBEz40Op34SKdF78kC/tNzswCrpg1vGl/GIDmhdyGOQ5aJULY
X-Received: by 2002:a05:693c:20c3:10b0:36a:12c4:8bd6 with SMTP id 5a478bee46e88-36a423ea9ccmr21662751eec.22.1793744589175;
        Tue, 03 Nov 2026 14:23:09 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ab71:b3df:693a:fbf2])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-36ca3958746sm1046926eec.22.2026.11.03.14.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 14:23:08 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@st.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 3/5] PM: runtime: Propagate last_busy from dependent to dependency
Date: Tue,  3 Nov 2026 14:14:41 -0800
Message-ID: <20261103141442.v2.3.I40c0bc917fa0b13111251844e9a54feb1d9cd7d2@changeid>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261103221717.3840215-1-briannorris@chromium.org>
References: <20261103221717.3840215-1-briannorris@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_142310_303700_1319D304 
X-CRM114-Status: GOOD (  20.87  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When a child device suspends, it does not update the last_busy timestamp
for its parent. If that parent configured autosuspend and didn't
otherwise maintain its last_busy timestamp, it may now be immediately
eligible to suspend. This is probably not expected -- the parent should
wait for its autosuspend delay before suspending.

The effect of this behavior is that a parent device may suspend sooner
than its autosuspend delay, simply because its usage was accounted by
its children, and not by direct references to the parent device.

This was noticed in several cases, and some have implemented
workarounds, such as in commit c537d3457542 ("iio: adc: stm32-adc: fix
runtime autosuspend delay when slow polling"). At the same time, Ulf
suggested these problems "should be solved in the runtime PM core" [1].

Instead of working around the problem in drivers, we propagate last_busy
timestamps from a dependent device to its dependencies any time it may
allow a dependency to suspend -- i.e., when releasing a refcount for its
parent or suppliers. We take care to only propagate the timestamp if it
is larger than the existing busy timestamp.

Note that this works best if the dependent device is using autosuspend
(and therefore updates its last_busy timestamps appropriately), but even
for a non-autosuspend child, this is still somewhat useful --
non-autosuspend devices still automatically update their last_busy every
time they resume.

Link: https://lore.kernel.org/all/CAPDyKFp=KTf8=zGBSzPYqhjnZpY8xwvjCeM1e-WTKT1QLSxaDA@mail.gmail.com/ [1]
Signed-off-by: Brian Norris <briannorris@chromium.org>
---
Cc: Ulf Hansson <ulfh@kernel.org>

Changes in v2:
 * Update comments to explain when/why rpm_propagate_last_busy()
   performs the update

 drivers/base/power/runtime.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 2a117d6a776f..dd306cbabcd3 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -318,6 +318,22 @@ static int rpm_get_suppliers(struct device *dev)
 	return 0;
 }
 
+/*
+ * Propagate last_busy timestamp from one device to another, typically when a
+ * device (@dev) releases a reference count on a dependency (@target) and might
+ * allow it to (auto)suspend. This can, for example, prevent overactive suspend
+ * when a dependency's usage is primarily driven by one of its dependents.
+ */
+static void rpm_propagate_last_busy(struct device *dev, struct device *target)
+{
+	s64 busy = atomic64_read(&dev->power.last_busy);
+	s64 target_busy = atomic64_read(&target->power.last_busy);
+
+	while (target_busy < busy)
+		if (atomic64_try_cmpxchg(&target->power.last_busy, &target_busy, busy))
+			return;
+}
+
 /**
  * pm_runtime_release_supplier - Drop references to device link's supplier.
  * @link: Target device link.
@@ -348,6 +364,7 @@ static void __rpm_put_suppliers(struct device *dev, bool try_to_suspend)
 		if (!device_link_test(link, DL_FLAG_PM_RUNTIME))
 			continue;
 
+		rpm_propagate_last_busy(dev, link->supplier);
 		pm_runtime_release_supplier(link);
 		if (try_to_suspend)
 			pm_request_idle(link->supplier);
@@ -710,6 +727,8 @@ static int rpm_suspend(struct device *dev, int rpmflags)
 
 	if (dev->parent) {
 		parent = dev->parent;
+		if (!parent->power.ignore_children)
+			rpm_propagate_last_busy(dev, parent);
 		atomic_add_unless(&parent->power.child_count, -1, 0);
 	}
 	wake_up_all(&dev->power.wait_queue);
@@ -1368,8 +1387,10 @@ int __pm_runtime_set_status(struct device *dev, unsigned int status)
 		goto out_set;
 
 	if (status == RPM_SUSPENDED) {
-		atomic_add_unless(&parent->power.child_count, -1, 0);
 		notify_parent = !parent->power.ignore_children;
+		if (notify_parent)
+			rpm_propagate_last_busy(dev, parent);
+		atomic_add_unless(&parent->power.child_count, -1, 0);
 	} else {
 		spin_lock_nested(&parent->power.lock, SINGLE_DEPTH_NESTING);
 
-- 
2.56.0.398.g882cbad275-goog


