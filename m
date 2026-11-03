Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D4A606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 22:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Saz95Duv;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aVz06JwF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XO1aKAZ4c+Vq+VoVRfgfaXaALlLR0DAwRzH6Ig8e8vY=; b=Saz95Duvn6n06Y
	cRsnoz2tPO8tgCoSUrKHhM7NYKA6DA3H8vtl/PCg0V8LpruCrpLkl3arHs5mcRWLnKXTTcSBWOuQO
	HU7ReiIBT7JPwSZBOcr7FBgjaBXUdMP1c4APGSzfTECR7JBc5J4l5aB/IzFQn4UOVal3GSl2QTiqG
	w4KduXZ0MRMHmgNY4bsRAtBuVB6fGq2sQ31X8bs7HaTD8HZnPxUaBbNw3zEc4u7xO8UZ9sOA6fDq1
	LyjK5GrkMjdunOGPplz0Ivc3ibb6ofDzhqcGm7YQOVcWAQUVTMZMrVQLLwJVsrPdm+OTpID4WWWCJ
	Yo0ndWBOhkrADBdhldqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMuS-00000003ppY-35Em;
	Tue, 03 Nov 2026 22:23:16 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMuO-00000003plu-3jNd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 22:23:15 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-14fc585291cso116450c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 14:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793744592; x=1794349392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XO1aKAZ4c+Vq+VoVRfgfaXaALlLR0DAwRzH6Ig8e8vY=;
        b=aVz06JwFZkl3WqQh3EhI/fPVeXYg4AM/I/eVH32bQVFnR9Z2l8N6SAPD+Ep6fmL7CT
         hdesUYW/9g9Se82VkFeGpoLbwe0qx0WMjYagHEvoiSP2F+zuzNFQIGh3S1XGtZZur1OR
         XzBpyRSzUnxE0e6eGBPE9d3zDNImvpSLeEQpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744592; x=1794349392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XO1aKAZ4c+Vq+VoVRfgfaXaALlLR0DAwRzH6Ig8e8vY=;
        b=J6tYEq3FdPVGASM0Dfqo2kuXCN1YDS0VyDOkxKJcB+euzzHvW38kgGHcGmtNvNhJW0
         lVLOFkywIeCuBSipkLgeoslymzW1WOKM408MI47vTddGwr56sXN8C3EOhZWQ9hq9o2lU
         Dm/o6qpv+gylkqA8HNTpos7dcV1V90gkCmyZT2f7R2/Lgj/+8vEjcL+wgcok6kHR/VYv
         6MDQ8GB/7n/mcicFOdZlnkTV1qS+UhAQyz1mmd3341Cv40nhxSQNlsR6yEAMHgYHt0ns
         ed7mqT7lrUEh5ANi2ZF66JjtFrSkI9MtY/Z3snGzomuTbXilVgUaSUSkyTfFS33/ffVP
         cBWg==
X-Forwarded-Encrypted: i=1; AKwUvByNpsgdc7p7/FB0SizWlxWfeeNyYK6wutO15mB4gKxqFUp3OApm5VuSf6QkVQhAdhTRPeKEI3g9SihdIpSd0tKm@lists.infradead.org
X-Gm-Message-State: APuU4Z89fXssTioT4g/lWoXJYBXdg8Nez96uvMSk61md9ZLno+d7Jxev
	1LNoFnZJymcQ2ZvmGOSlGCvucwpGz62K0qiWAh47ysLsNKBzFpsVF6jmGy5U4vXipg==
X-Gm-Gg: AYBFou2wAFvVxhE+60m3O0DyFluogfEAAkpWwvXxm0lAnZVtr3IT55uhM5uij1BS92U
	KP2HdGPicvu8vPhKti+CiUtcdcP/Ez72Gmv6CSwDJqyVeb71AohAfCokpJB50zbfsOTnq9TwiNc
	FJXhb0aXpMAr8kyCYTatWFAI4kVUFQz7I8P00YUvIAiby2EdpKoLTcYJhgjXlT1JPKQAnqnFvMb
	W2IRpQv2I+CPf6lThT8plPrw6nl+75AL1JE4kaZMXyi7UynlV362atR2JU/NBsIIkZgQ7kFLxUX
	tE09+mCFtR5yVLmIC+7RBMDf/+EQdlcoqBSc1ZOavJ1d57FxvJXjn1iaEX7AIzApnv4nWaR2Oq7
	fFeE2GgXJ5XLgWVFZcelDNr3xQmsL1oyhx6814s9ixcoocbn9rDdsAjAhaU1NKu5i9q+mqewi/z
	rMkY4qbvjFI3GFP1KCK/CxUObRkIuPYSxPDUQZcwrR2mF20ftXS8rGjt49Ed39aUqIcumLnu/9t
	l3fSmNG9QFq4RfdqVKg+diJCdmQ1eQwXpqI54DMivg8/gOeDed52JCHodxIgXrNVm7455nayF86
	ygXO/UUScxtX8JxauLk0phmQuIe7lVUKPQpqQl0CYvLcjFgxtJKMhULDmEnojRRWN99v
X-Received: by 2002:a05:7022:fc0b:b0:176:2095:1ac4 with SMTP id a92af1059eb24-1ac5cfe584emr17460446c88.18.1793744591842;
        Tue, 03 Nov 2026 14:23:11 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ab71:b3df:693a:fbf2])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b245c2d69asm1650085c88.11.2026.11.03.14.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 14:23:11 -0800 (PST)
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
Subject: [PATCH v2 4/5] PM: runtime: Add tests for last_busy propagation
Date: Tue,  3 Nov 2026 14:14:42 -0800
Message-ID: <20261103141442.v2.4.I8ab8b7f662fe1921c7084a47d554535597cc2702@changeid>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261103221717.3840215-1-briannorris@chromium.org>
References: <20261103221717.3840215-1-briannorris@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_142312_942683_7403865C 
X-CRM114-Status: GOOD (  14.53  )
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

This is a regression test for the problem fixed in "PM: runtime:
Propagate last_busy from dependent to dependency".

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 * Use device_move() instead of manual re-parenting
 * fsleep() instead of msleep()

 drivers/base/power/runtime-test.c | 99 +++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/drivers/base/power/runtime-test.c b/drivers/base/power/runtime-test.c
index 24865ce844fc..00ca3b10543a 100644
--- a/drivers/base/power/runtime-test.c
+++ b/drivers/base/power/runtime-test.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/cleanup.h>
+#include <linux/delay.h>
 #include <linux/pm_runtime.h>
 #include <linux/workqueue.h>
 #include <kunit/device.h>
@@ -285,6 +286,102 @@ static void pm_runtime_supplier_suspend_test(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(norpm_supplier));
 }
 
+static void pm_runtime_parent_last_used_test(struct kunit *test)
+{
+	struct device *parent = kunit_device_register(test, DEVICE_NAME "_parent");
+	struct device *dev = kunit_device_register(test, DEVICE_NAME);
+	u64 expiry1, expiry2;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
+
+	KUNIT_ASSERT_EQ(test, 0, device_move(dev, parent, DPM_ORDER_NONE));
+
+	pm_runtime_set_active(parent);
+	pm_runtime_set_active(dev);
+	pm_runtime_use_autosuspend(parent);
+	pm_runtime_use_autosuspend(dev);
+
+	pm_runtime_set_autosuspend_delay(dev, 0);
+	/* Effectively infinite delay (prevent finishing autosuspend during this test). */
+	pm_runtime_set_autosuspend_delay(parent, 200000);
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_mark_last_busy(parent);
+
+	pm_runtime_get_noresume(dev);
+
+	pm_runtime_enable(parent);
+	pm_runtime_enable(dev);
+
+	expiry1 = pm_runtime_autosuspend_expiration(parent);
+	KUNIT_EXPECT_NE(test, 0, expiry1);
+
+	/* Make absolutely sure the clock advances. */
+	fsleep(1000);
+
+	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync_autosuspend(dev));
+
+	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
+
+	/* Flush, in case any request was pending. */
+	flush_workqueue(pm_wq);
+	KUNIT_EXPECT_FALSE(test, pm_runtime_suspended(parent));
+
+	expiry2 = pm_runtime_autosuspend_expiration(parent);
+	KUNIT_EXPECT_NE(test, 0, expiry2);
+	/* The child's last_busy time should have bumped up the parent's expiration. */
+	KUNIT_EXPECT_GT(test, expiry2, expiry1);
+}
+
+static void pm_runtime_supplier_last_used_test(struct kunit *test)
+{
+	struct device *supplier = kunit_device_register(test, DEVICE_NAME "_supplier");
+	struct device *dev = kunit_device_register(test, DEVICE_NAME);
+	u64 expiry1, expiry2;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, supplier);
+
+	KUNIT_ASSERT_NOT_NULL(test, device_link_add(dev, supplier, DL_FLAG_PM_RUNTIME));
+
+	pm_runtime_set_active(supplier);
+	pm_runtime_set_active(dev);
+	pm_runtime_use_autosuspend(supplier);
+	pm_runtime_use_autosuspend(dev);
+
+	pm_runtime_set_autosuspend_delay(dev, 0);
+	/* Effectively infinite delay (prevent finishing autosuspend during this test). */
+	pm_runtime_set_autosuspend_delay(supplier, 200000);
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_mark_last_busy(supplier);
+
+	pm_runtime_get_noresume(dev);
+
+	pm_runtime_enable(supplier);
+	pm_runtime_enable(dev);
+
+	expiry1 = pm_runtime_autosuspend_expiration(supplier);
+	KUNIT_EXPECT_NE(test, 0, expiry1);
+
+	/* Make absolutely sure the clock advances. */
+	fsleep(1000);
+
+	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync_autosuspend(dev));
+
+	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
+
+	/* Flush, in case any request was pending. */
+	flush_workqueue(pm_wq);
+	KUNIT_EXPECT_FALSE(test, pm_runtime_suspended(supplier));
+
+	expiry2 = pm_runtime_autosuspend_expiration(supplier);
+	KUNIT_EXPECT_NE(test, 0, expiry2);
+	/* The consumer's last_busy time should have bumped up the supplier's expiration. */
+	KUNIT_EXPECT_GT(test, expiry2, expiry1);
+}
+
 static struct kunit_case pm_runtime_test_cases[] = {
 	KUNIT_CASE(pm_runtime_depth_test),
 	KUNIT_CASE(pm_runtime_already_suspended_test),
@@ -293,6 +390,8 @@ static struct kunit_case pm_runtime_test_cases[] = {
 	KUNIT_CASE(pm_runtime_error_test),
 	KUNIT_CASE(pm_runtime_probe_active_test),
 	KUNIT_CASE(pm_runtime_supplier_suspend_test),
+	KUNIT_CASE(pm_runtime_parent_last_used_test),
+	KUNIT_CASE(pm_runtime_supplier_last_used_test),
 	{}
 };
 
-- 
2.56.0.398.g882cbad275-goog


