Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A261CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 23:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXSwX5jjkSLNliyM1NMwqcwfmmI5JkAaKqy5NKFRsCg=; b=w++sOmWn3Crc5KVN2QFP5XkHVj
	4ZH9mnU5xo07fb51Mm06ceL9xk99NE2F4O4p7VE0aCN6alJocHl6JoMrjqmH/PwmEk+RBH7A9dQYF
	hiouDBCKJPIqzKXWs0H+t543bIjl8nYzoM3I49WIw7IzMewkqdbudhq62IX6vmzKN8WTxBBXUbL0r
	Ngalk14XP015zzLWAGzP5DrQEFtQTmNVPd2R6K1Qh28NqggtoJ+cxVhQAwxfqlbBL5bOZKV1Cm1sE
	ky0lyQeIoh+0ir3eznRjgJcJM2b3P/p7QfDNepOkMjz+3MxRd0sdwXLmXiyXF9Oy7ENJSUetWYlPv
	nP219FFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCmLg-0000000CfOB-3g3e;
	Fri, 02 Oct 2026 23:07:28 +0000
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCmLe-0000000CfMB-2Ala
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 23:07:27 +0000
Received: by mail-dy2-x0f.google.com with SMTP id 5a478bee46e88-34b3e517e6dso82725eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 16:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790982446; x=1791587246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LXSwX5jjkSLNliyM1NMwqcwfmmI5JkAaKqy5NKFRsCg=;
        b=Q9NfymFAo1u4bZRsIHXESqBJ7HeR8t8ap8LNzHN0dxrScxHKHAwrvLoyOMPtyXOhj6
         f8cqpnO7eZpsgoPX/uNIVhBjmEJI93J91zG27nWDnFzL9hY0o0OAkwRwkuZhOrkZyQo+
         dDL2rYJ+OTrJ1/lCS1GFSW+4q7rukNKqU71U0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790982446; x=1791587246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LXSwX5jjkSLNliyM1NMwqcwfmmI5JkAaKqy5NKFRsCg=;
        b=iq3cexQ3bMiQGZuJdwVM+RTSm6jIPauUzloKiiNmSZs0QVnpOURpHznRbuqfuyF/kE
         +HLItMtl9A2ftnlrAgPufDfbnr0vNzlzqq9yIbuQvvVxTchV5HzhKUHEyVSgHU79+DYV
         VPhk/MK0xr0kEYBVHOnpaR5DheD96jWl2SmOPgGQGTiBcvjUkBdq7i+PUA0itjW9ecaP
         i+nAtBbwArNfb9QmecDl4tFHlKI+VzEvChl7UxG6BWu2wnlws9sECuNyDFBXtke45UG6
         licCaSD253UHY+Yro824Urj/Uh2HQ2B48X3wB1EdkT6NnXG7cR5Gpd7g8BpowB9WCwJw
         V1gw==
X-Forwarded-Encrypted: i=1; AKwUvBw5tEWpjVnMej6Brn/K4elUNSvewp+qLz2nfJbs3DSam708A0RsLtfLFlQOrsgCl+7iZKu2H5AuJ66R8F7f4Zwc@lists.infradead.org
X-Gm-Message-State: AFuF++lpVTvoGZST/5CqfmMBDc9BH4hEvY9gjmXk7fO6OlF02sK1+GCm
	D4Ol/TjpIgDzRBPnJeYYgwB2tyBdA7igbyx9K4bB2+1o7R3sHcXVVBRWB1vs7wdL6w==
X-Gm-Gg: AYBFou3aMVns4uLiZPNkr3mhqrBg3Zwq4NDS1Z/cyp2pdHosgykki3M/AJjnkYr0eu4
	g5WVRuzB0Hly9WLAhWgmM+mqgBialJLSsrQWrY+16TR4+K8LgLyb8ke7keAvAs6i5hsRttUNuzY
	lBWCxHbV17Xu70EAcnkpXaa3ypRfXDhEbKMtaVTUiSUvVRYt2X8NDgnwyQfJF/bvlRUV68n2jWQ
	eg1CN39l2wfKuPXHiAX14TxMyRnEt5vqs/NwoKsdpO+7+J7GGqjyi9EziITw4L8Pk5DpUj7BwZk
	ut64peP9NpzR3Zn5FfSBNesdAQHn1DZ9KUjZLY7YnxnDLabHF55B0Q5jmW8jmTVUj27yf9uspAZ
	KbrprI676uhpnvshB0sClJnBTd3IsndktdIv4HF/576wyfBtolDRlrt+aKtjsOegF5d3rQ+Olpj
	YGCvhUT/ECisOHmmS+7xeHRS/CBgQFVl6mND4LhrXH/8SubPEfBEDWx7bfkmntu3hcHWmr9BLC9
	21DVhOIl3EnkgN2PtcQjVzTE1Bg5+H/1nJRoY+Rq7ZpChN+
X-Received: by 2002:a05:701b:450b:10b0:148:cfd2:1e4 with SMTP id a92af1059eb24-14f7e8aad17mr4136592c88.16.1790982445807;
        Fri, 02 Oct 2026 16:07:25 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:b0dc:e72e:e96b:3323])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-151f7bd2884sm704829c88.0.2026.10.02.16.07.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 16:07:25 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-kernel@vger.kernel.org,
	Fabrice Gasnier <fabrice.gasnier@st.com>,
	linux-arm-kernel@lists.infradead.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 3/5] PM: runtime: Propagate last_busy from dependent to dependency
Date: Fri,  2 Oct 2026 16:03:07 -0700
Message-ID: <20261002160309.3.I40c0bc917fa0b13111251844e9a54feb1d9cd7d2@changeid>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20261002230714.507921-1-briannorris@chromium.org>
References: <20261002230714.507921-1-briannorris@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_160726_577088_56C973F1 
X-CRM114-Status: GOOD (  20.97  )
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
suggested these problems "should be solved in the runtime PM core".

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

Link: https://lore.kernel.org/all/CAPDyKFp=KTf8=zGBSzPYqhjnZpY8xwvjCeM1e-WTKT1QLSxaDA@mail.gmail.com/
Cc: Ulf Hansson <ulfh@kernel.org>
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/base/power/runtime.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 9eed1f79429d..ee7253d154e2 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -318,6 +318,21 @@ static int rpm_get_suppliers(struct device *dev)
 	return 0;
 }
 
+/*
+ * Propagate last_busy timestamp from one device to another. This can, for
+ * example, prevent overactive suspend when a dependency's usage is primarily
+ * driven by one of its dependents.
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
@@ -348,6 +363,7 @@ static void __rpm_put_suppliers(struct device *dev, bool try_to_suspend)
 		if (!device_link_test(link, DL_FLAG_PM_RUNTIME))
 			continue;
 
+		rpm_propagate_last_busy(dev, link->supplier);
 		pm_runtime_release_supplier(link);
 		if (try_to_suspend)
 			pm_request_idle(link->supplier);
@@ -710,6 +726,8 @@ static int rpm_suspend(struct device *dev, int rpmflags)
 
 	if (dev->parent) {
 		parent = dev->parent;
+		if (!parent->power.ignore_children)
+			rpm_propagate_last_busy(dev, parent);
 		atomic_add_unless(&parent->power.child_count, -1, 0);
 	}
 	wake_up_all(&dev->power.wait_queue);
@@ -1369,8 +1387,10 @@ int __pm_runtime_set_status(struct device *dev, unsigned int status)
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
2.56.0.rc1.315.gc6ed9934b7-goog


